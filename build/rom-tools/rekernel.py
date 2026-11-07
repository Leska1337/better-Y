#!/usr/bin/env python3
"""Put another build's kernel under the staged 3.1.2 set, for a Y1 whose wheel the 3.1.2 kernel
does not drive (Type B).

  python3 rekernel.py <kernel-firmware.zip> <system.raw.img>

Run inside the directory rom.ps1 / rom.sh stage the 3.1.2 images in. From the kernel archive
(a Rockbox build of the matching type) come the parts tied to the hardware and the kernel:
preloader, lk, recovery whole, the kernel of boot.img and the modules in /system/lib/modules.
Everything the user sees stays 3.1.2: the boot ramdisk, logo.bin, the boot animation and the rest
of system. Rockbox's own boot ramdisk is not taken: it turns ro.secure off and adb on, and the
mod does the latter itself.

Generic.kl is rewritten for the Rockbox kernels' scancodes (wheel 103/108, prev/next 105/106) so
the launcher gets the same codes as on the 3.1.2 kernel; 163/165 keep their media meaning for
Bluetooth and HID keyboards, which fall back to the same file.

Wi-Fi modules (wlan*.ko) are not carried over: the 3.1.2 base has no Wi-Fi of its own.
"""
import hashlib, os, re, struct, subprocess, sys, zipfile
import bootlib as B

KERNEL_FILES = ("preloader_g368_nyx.bin", "lk.bin", "recovery.img")
KEYS = (("103", "DPAD_LEFT"), ("108", "DPAD_RIGHT"), ("105", "MEDIA_PREVIOUS"), ("106", "MEDIA_NEXT"))
KL = "/usr/keylayout/Generic.kl"


def die(msg):
    sys.stderr.write("rekernel: %s\n" % msg)
    raise SystemExit(1)


def md5(d):
    return hashlib.md5(d).hexdigest()


def debugfs(img, req, write=False):
    args = ["debugfs"] + (["-w"] if write else []) + ["-R", req, img]
    r = subprocess.run(args, stdout=subprocess.PIPE, stderr=subprocess.PIPE)
    return r.stdout.decode("utf-8", "replace")


def run_script(img, lines):
    open("rekernel.debugfs", "w").write("\n".join(lines) + "\n")
    subprocess.run(["debugfs", "-w", "-f", "rekernel.debugfs", img],
                   stdout=subprocess.DEVNULL, stderr=subprocess.DEVNULL, check=True)
    os.remove("rekernel.debugfs")


def ls(img, d):
    """{name: (mode, uid, gid)} of the regular files in d; symlinks and dirs are left out."""
    out = {}
    for line in debugfs(img, "ls -p " + d).splitlines():
        f = line.split("/")
        if len(f) > 6 and f[2].startswith("10"):
            out[f[5]] = (f[2], f[3], f[4])
    return out


def dump(img, path, to):
    if os.path.exists(to):
        os.remove(to)
    debugfs(img, "dump %s %s" % (path, to))
    if not os.path.isfile(to):
        die("cannot read %s out of %s" % (path, img))
    return open(to, "rb").read()


def raw_system(z, to):
    """The kernel archive's system.img as a raw ext4 image padded to its block count."""
    open(to, "wb").write(z.read("system.img"))
    with open(to, "rb") as f:
        head = f.read(4)
    if head == b"\x3a\xff\x26\xed":
        subprocess.run(["simg2img", to, to + ".raw"], check=True)
        os.replace(to + ".raw", to)
    with open(to, "rb") as f:
        f.seek(1024)
        sb = f.read(1024)
    if sb[56:58] != b"\x53\xef":
        die("not ext4: system.img of the kernel archive")
    size = struct.unpack("<I", sb[4:8])[0] * (1024 << struct.unpack("<I", sb[24:28])[0])
    if os.path.getsize(to) < size:
        with open(to, "ab") as f:
            f.truncate(size)


def main(argv):
    if len(argv) != 2:
        die("usage: rekernel.py <kernel-firmware.zip> <system.raw.img>")
    zpath, system = argv
    z = zipfile.ZipFile(zpath)

    for n in KERNEL_FILES:
        open(n, "wb").write(z.read(n))
        print("      %-24s from %s" % (n, os.path.basename(zpath)))

    # boot.img: the kernel archive's kernel, the 3.1.2 header and ramdisk, padded to the
    # partition as the stock image is
    base = open("boot.img", "rb").read()
    img = B.read_boot(base)
    src = B.read_boot(z.read("boot.img"))
    # kernel, ramdisk and second load addresses, tags address, page size
    addr = lambda h: [struct.unpack("<10I", h[8:48])[i] for i in (1, 3, 5, 6, 7)]
    if addr(img["hdr"]) != addr(src["hdr"]):
        die("the two boot images load at different addresses")
    for a, b_ in ((img, "3.1.2"), (src, "kernel archive")):
        if B.mtk_unwrap(a["kernel"])[0] != b"KERNEL":
            die("no MediaTek KERNEL header in the %s boot.img" % b_)
    ramdisk = img["ramdisk"]
    img["kernel"] = src["kernel"]
    img["second"] = b""
    n = B.write_boot(img, "boot.img", pad_to=len(base))
    if n > len(base):
        die("boot.img came out larger than its partition (%d > %d)" % (n, len(base)))
    print("      boot.img                 kernel from %s, ramdisk 3.1.2" % os.path.basename(zpath))

    # /system/lib/modules: every module 3.1.2 has, replaced by the one built for this kernel
    raw_system(z, "kernel_system.img")
    have = ls(system, "/lib/modules")
    theirs = ls("kernel_system.img", "/lib/modules")
    missing = sorted(set(have) - set(theirs))
    if missing:
        die("the kernel archive has no %s" % ", ".join(missing))
    script = ["cd /lib/modules"]
    mods = {}
    for i, name in enumerate(sorted(have)):
        local = "rekernel_%d.ko" % i
        mods[name] = dump("kernel_system.img", "/lib/modules/" + name, local)
        mode, uid, gid = have[name]
        script += ["rm " + name, "write %s %s" % (local, name),
                   "sif %s mode 0%s" % (name, mode), "sif %s uid %s" % (name, uid),
                   "sif %s gid %s" % (name, gid)]
    os.remove("kernel_system.img")

    kl = dump(system, KL, "rekernel.kl").decode("ascii")
    for code, key in KEYS:
        kl, hits = re.subn(r"(?m)^(key\s+%s\s+)\S+" % code, r"\g<1>" + key, kl)
        if hits != 1:
            die("Generic.kl has %d lines for scancode %s" % (hits, code))
    open("rekernel.kl", "w", newline="").write(kl)
    kmode, kuid, kgid = ls(system, "/usr/keylayout")["Generic.kl"]
    script += ["cd /usr/keylayout", "rm Generic.kl", "write rekernel.kl Generic.kl",
               "sif Generic.kl mode 0" + kmode, "sif Generic.kl uid " + kuid,
               "sif Generic.kl gid " + kgid]
    run_script(system, script)
    print("      system.img               %d modules from %s, Generic.kl for its scancodes"
          % (len(mods), os.path.basename(zpath)))

    # read every piece back and compare it with its source
    for name, data in mods.items():
        if md5(dump(system, "/lib/modules/" + name, "rekernel_check")) != md5(data):
            die("module %s in the image differs from the kernel archive's" % name)
        if ls(system, "/lib/modules")[name] != have[name]:
            die("module %s came out with other mode or owner" % name)
    if dump(system, KL, "rekernel_check").decode("ascii") != kl:
        die("Generic.kl in the image differs from the one written")
    os.remove("rekernel_check")
    for i in range(len(mods)):
        os.remove("rekernel_%d.ko" % i)
    os.remove("rekernel.kl")
    out = B.read_boot(open("boot.img", "rb").read())
    if out["kernel"] != src["kernel"] or out["ramdisk"] != ramdisk:
        die("boot.img came out with another kernel or ramdisk")
    for n in KERNEL_FILES:
        if md5(open(n, "rb").read()) != md5(z.read(n)):
            die("%s differs from the kernel archive's" % n)
    print("      verified: kernel, ramdisk, %d modules, Generic.kl, %s" % (len(mods), ", ".join(KERNEL_FILES)))


if __name__ == "__main__":
    main(sys.argv[1:])
