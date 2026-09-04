#!/usr/bin/env python3
"""Read/write MediaTek-wrapped Android boot images and their newc cpio ramdisks.

The MT6572 boot.img is a stock ANDROID! image whose kernel and ramdisk each carry
a 512-byte MediaTek header (magic 88 16 88 58, payload size, then a name such as
KERNEL / ROOTFS) in front of the actual data.
"""
import gzip, io, struct

MTK_MAGIC = b"\x88\x16\x88\x58"


def read_boot(src):
    """src is the path to a boot image, or the image itself as bytes."""
    b = src if isinstance(src, (bytes, bytearray)) else open(src, "rb").read()
    assert b[:8] == b"ANDROID!", "not a boot image"
    ks, ka, rs, ra, ss, sa, tags, ps, u1, u2 = struct.unpack("<10I", b[8:48])
    hdr = b[:ps]
    def pad(n):
        return ((n + ps - 1) // ps) * ps
    koff = ps
    roff = koff + pad(ks)
    soff = roff + pad(rs)
    return {
        "hdr": bytearray(hdr), "pagesize": ps,
        "kernel": b[koff:koff + ks],
        "ramdisk": b[roff:roff + rs],
        "second": b[soff:soff + ss],
        "tail": b[soff + pad(ss):],
    }


def write_boot(img, path, pad_to=None):
    ps = img["pagesize"]
    hdr = bytearray(img["hdr"])
    struct.pack_into("<I", hdr, 8, len(img["kernel"]))
    struct.pack_into("<I", hdr, 16, len(img["ramdisk"]))
    struct.pack_into("<I", hdr, 24, len(img["second"]))
    def pad(d):
        n = (-len(d)) % ps
        return d + b"\0" * n
    out = pad(bytes(hdr)) + pad(img["kernel"]) + pad(img["ramdisk"]) + pad(img["second"])
    if pad_to and len(out) < pad_to:
        out += b"\0" * (pad_to - len(out))
    open(path, "wb").write(out)
    return len(out)


def mtk_unwrap(data):
    assert data[:4] == MTK_MAGIC, "no MediaTek header"
    size = struct.unpack("<I", data[4:8])[0]
    name = data[8:40].rstrip(b"\0")
    return name, data[512:512 + size]


def mtk_wrap(name, payload):
    h = bytearray(b"\xff" * 512)
    h[0:4] = MTK_MAGIC
    struct.pack_into("<I", h, 4, len(payload))
    h[8:40] = name.ljust(32, b"\0")
    return bytes(h) + payload


def gunzip(d):
    return gzip.GzipFile(fileobj=io.BytesIO(d)).read()


def gzip_bytes(d, mtime=0):
    buf = io.BytesIO()
    with gzip.GzipFile(fileobj=buf, mode="wb", compresslevel=9, mtime=mtime) as f:
        f.write(d)
    return buf.getvalue()


# ---- newc cpio ----
FIELDS = ["ino", "mode", "uid", "gid", "nlink", "mtime", "filesize",
          "devmajor", "devminor", "rdevmajor", "rdevminor", "namesize", "check"]


def cpio_read(data):
    """-> (entries, trailer). The trailer's own header fields are kept so a
    re-encoded ramdisk is byte-identical to the factory one."""
    out = []
    trailer = None
    i = 0
    while True:
        assert data[i:i + 6] == b"070701", "bad cpio magic at %d" % i
        vals = {}
        for k, n in zip(FIELDS, range(13)):
            vals[k] = int(data[i + 6 + n * 8:i + 6 + n * 8 + 8], 16)
        ns = vals["namesize"]
        name = data[i + 110:i + 110 + ns - 1].decode()
        j = i + 110 + ns
        j += (-j) % 4
        fs = vals["filesize"]
        body = data[j:j + fs]
        j += fs
        j += (-j) % 4
        i = j
        if name == "TRAILER!!!":
            trailer = vals
            break
        vals["name"] = name
        vals["data"] = body
        out.append(vals)
    return out, trailer


def cpio_write(entries, trailer=None):
    out = bytearray()
    def emit(v, name, body):
        # lowercase hex, as the factory ramdisk writes it
        h = b"070701" + b"".join(
            ("%08x" % v[k]).encode() for k in FIELDS[:11]
        ) + ("%08x" % (len(name) + 1)).encode() + b"00000000"
        out.extend(h)
        out.extend(name.encode() + b"\0")
        out.extend(b"\0" * ((-len(out)) % 4))
        out.extend(body)
        out.extend(b"\0" * ((-len(out)) % 4))
    for e in entries:
        v = dict(e)
        v["filesize"] = len(e["data"])
        emit(v, e["name"], e["data"])
    if trailer is None:
        trailer = {k: 0 for k in FIELDS}
        trailer["nlink"] = 1
    emit(trailer, "TRAILER!!!", b"")
    out.extend(b"\0" * ((-len(out)) % 512))
    return bytes(out)
