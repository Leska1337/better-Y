#!/usr/bin/env python3
"""Build a better-Y boot image from the FACTORY boot.img of Y1 firmware 3.1.2.

  python3 mkboot.py <boot.img | firmware.zip>              -> boot_Y1_3.1.2_ipp_adb.img
  python3 mkboot.py --installer <boot.img | firmware.zip>  -> boot_Y1_3.1.2_ipp_installer.img
  python3 mkboot.py --both      <boot.img | firmware.zip>  -> both of them
  python3 mkboot.py -o my.img   <boot.img | firmware.zip>  -> that name instead

The source is the factory boot image: either the file itself, or any firmware
zip holding one (the stock 3.1.2 archive, or the boot.img read off a device).
Nothing but python3 is needed, on any platform.

  adb image        the factory kernel and ramdisk with `adb` added to
                   persist.sys.usb.config, so the player answers `adb devices`
                   and a build installs with `adb install -r <apk>`.
  installer image  the above plus a boot-time script that copies
                   /data/local/tmp/ipp.apk over the launcher in /system/app --
                   the development loop, where a build replaces the system copy
                   instead of shadowing it from /data.

The kernel and every ramdisk entry come from the factory image; the edits are
the property line, and for the installer the extra property, the init.rc block
and the script itself.
"""
import struct, sys, zipfile
import bootlib as B

INSTALLER = """#!/system/bin/sh
SOURCE=/data/local/tmp/ipp.apk
TARGET=/system/app/com.innioasis.y1_3.1.2.apk
TEMP=/system/app/com.innioasis.y1_3.1.2.apk.new
LOG=/data/local/tmp/ipp_install.log

echo START > $LOG
if [ ! -f $SOURCE ]; then
    echo SOURCE_MISSING >> $LOG
    exit 10
fi

/system/bin/toolbox rm -f $TEMP
/system/bin/toolbox cat $SOURCE > $TEMP
if [ $? -ne 0 ]; then
    echo COPY_FAILED >> $LOG
    /system/bin/toolbox rm -f $TEMP
    exit 12
fi

/system/bin/toolbox chmod 0644 $TEMP
/system/bin/toolbox chown 0.0 $TEMP
/system/bin/toolbox mv $TEMP $TARGET
if [ $? -ne 0 ]; then
    echo REPLACE_FAILED >> $LOG
    /system/bin/toolbox rm -f $TEMP
    exit 13
fi

/system/bin/toolbox sync
/system/bin/toolbox ls -l $TARGET >> $LOG 2>&1
echo SUCCESS >> $LOG
exit 0
"""

INIT_BLOCK = """
# better-Y installer
on boot
    mount ext4 /emmc@android /system remount wait
    exec /system/bin/sh /ipp_installer.sh
    mount ext4 /emmc@android /system noatime ro remount wait
"""


def source_bytes(path):
    """The factory boot image, read from the file or out of a firmware zip."""
    try:
        with open(path, "rb") as f:
            head = f.read(8)
            if head == b"ANDROID!":
                return head + f.read()
    except IOError as e:
        die("cannot read %s: %s" % (path, e.strerror))
    if not zipfile.is_zipfile(path):
        die("%s is neither a boot image (it does not start with ANDROID!) "
            "nor a firmware zip" % path)
    with zipfile.ZipFile(path) as z:
        names = [n for n in z.namelist() if n.rsplit("/", 1)[-1] == "boot.img"]
        if not names:
            die("no boot.img inside %s" % path)
        return z.read(names[0])


def load(src):
    img = B.read_boot(src)
    name, payload = B.mtk_unwrap(img["ramdisk"])
    entries, trailer = B.cpio_read(B.gunzip(payload))
    return img, img["ramdisk"][:512], entries, trailer


def find(entries, name):
    for e in entries:
        if e["name"] == name:
            return e
    raise KeyError(name)


def enable_adb(entries):
    e = find(entries, "default.prop")
    t = e["data"].decode()
    if "persist.sys.usb.config=mass_storage,adb\n" in t:
        die("this image already has adb enabled - it is not the factory boot.img")
    if "persist.sys.usb.config=mass_storage\n" not in t:
        die("default.prop does not carry persist.sys.usb.config=mass_storage; "
            "this is not the Y1 3.1.2 factory boot.img")
    e["data"] = t.replace("persist.sys.usb.config=mass_storage\n",
                          "persist.sys.usb.config=mass_storage,adb\n").encode()


def add_installer(entries):
    e = find(entries, "default.prop")
    t = e["data"].decode()
    if not t.endswith("\n"):
        t += "\n"
    e["data"] = (t + "ro.ipp.installer=1\n").encode()

    rc = find(entries, "init.rc")
    t = rc["data"].decode()
    if not t.endswith("\n"):
        t += "\n"
    rc["data"] = (t + INIT_BLOCK).encode()

    proto = find(entries, "init.rc")
    entries.append({
        "ino": max(x["ino"] for x in entries) + 1,
        "mode": 0o100750, "uid": 0, "gid": 0, "nlink": 1,
        "mtime": proto["mtime"], "filesize": 0,
        "devmajor": proto["devmajor"], "devminor": proto["devminor"],
        "rdevmajor": 0, "rdevminor": 0, "namesize": 0, "check": 0,
        "name": "ipp_installer.sh", "data": INSTALLER.encode(),
    })


def build(src, out, installer):
    img, mtk_hdr, entries, trailer = load(src)
    enable_adb(entries)
    if installer:
        add_installer(entries)
    payload = B.gzip_bytes(B.cpio_write(entries, trailer))
    hdr = bytearray(mtk_hdr)
    struct.pack_into("<I", hdr, 4, len(payload))
    img["ramdisk"] = bytes(hdr) + payload
    n = B.write_boot(img, out)
    print("%s  %d bytes  ramdisk %d  entries %d" % (out, n, len(img["ramdisk"]), len(entries)))
    verify(out, installer)


def verify(out, installer):
    """Read the finished image back and check the edits are in it."""
    entries = load(open(out, "rb").read())[2]
    prop = find(entries, "default.prop")["data"].decode()
    if "persist.sys.usb.config=mass_storage,adb\n" not in prop:
        die("%s came out without the adb property" % out)
    if installer:
        if "ro.ipp.installer=1\n" not in prop:
            die("%s came out without ro.ipp.installer" % out)
        find(entries, "ipp_installer.sh")
    print("      verified: adb on%s" % (", installer script in place" if installer else ""))


def die(msg):
    sys.stderr.write("mkboot: %s\n" % msg)
    raise SystemExit(1)


def main(argv):
    installer = both = False
    out = src = None
    rest = []
    i = 0
    while i < len(argv):
        a = argv[i]
        if a == "--installer":
            installer = True
        elif a == "--both":
            both = True
        elif a == "-o":
            i += 1
            if i == len(argv):
                die("-o needs a filename")
            out = argv[i]
        elif a in ("-h", "--help"):
            print(__doc__.strip())
            return
        elif a.startswith("-"):
            die("unknown option %s" % a)
        else:
            rest.append(a)
        i += 1
    if len(rest) != 1:
        die("one source is needed: the factory boot.img, or a firmware zip "
            "holding it. Try --help.")
    src = source_bytes(rest[0])
    if both and out:
        die("-o names one file, so it cannot be used with --both")
    if both:
        build(src, "boot_Y1_3.1.2_ipp_adb.img", False)
        build(src, "boot_Y1_3.1.2_ipp_installer.img", True)
    else:
        name = "boot_Y1_3.1.2_ipp_installer.img" if installer else "boot_Y1_3.1.2_ipp_adb.img"
        build(src, out or name, installer)


if __name__ == "__main__":
    main(sys.argv[1:])
