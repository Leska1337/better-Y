#!/usr/bin/env python3
# raw ext4 -> sparse using ONLY RAW + DONT_CARE chunks (no FILL), because the
# MT6572-era SP Flash Tool does not handle FILL chunks (S_DA_SDMMC_WRITE_FAILED).
# DONT_CARE is emitted only where blocks are BOTH free in the filesystem AND
# all-zero in the raw image.
import struct, subprocess, sys

raw, out = sys.argv[1], sys.argv[2]
MIN_SKIP = 32  # blocks; shorter free runs stay RAW

d = subprocess.run(["dumpe2fs", raw], capture_output=True, text=True).stdout
total = None
blk_sz = 4096
for line in d.splitlines():
    if line.startswith("Block count:"):
        total = int(line.split(":")[1])
    elif line.startswith("Block size:"):
        blk_sz = int(line.split(":")[1])

isfree = bytearray(total)
for line in d.splitlines():
    s = line.strip()
    # only the per-group lines are indented; the superblock summary is not
    if not s.startswith("Free blocks:") or line[0] not in " \t":
        continue
    body = s.split(":", 1)[1].strip()
    for part in body.split(","):
        part = part.strip()
        if not part:
            continue
        if "-" in part:
            a, b = part.split("-")
            for x in range(int(a), int(b) + 1):
                isfree[x] = 1
        else:
            isfree[int(part)] = 1

zero = b"\0" * blk_sz
f = open(raw, "rb")
o = open(out, "wb")
o.write(struct.pack("<IHHHHIIII", 0xED26FF3A, 1, 0, 28, 12, blk_sz, total, 0, 0))

chunks = 0
skipped = 0
i = 0
pending = 0  # start block of the RAW run being accumulated


def emit_raw(start, end):
    global chunks
    if end <= start:
        return
    n = end - start
    o.write(struct.pack("<HHII", 0xCAC1, 0, n, 12 + n * blk_sz))
    f.seek(start * blk_sz)
    left = n * blk_sz
    while left:
        b = f.read(min(left, 8 << 20))
        o.write(b)
        left -= len(b)
    chunks += 1


while i < total:
    if not isfree[i]:
        i += 1
        continue
    j = i
    while j < total and isfree[j]:
        j += 1
    if j - i >= MIN_SKIP:
        f.seek(i * blk_sz)
        k = i
        while k < j and f.read(blk_sz) == zero:
            k += 1
        if k == j:
            emit_raw(pending, i)
            o.write(struct.pack("<HHII", 0xCAC3, 0, j - i, 12))
            chunks += 1
            skipped += j - i
            pending = j
    i = j
emit_raw(pending, total)

o.seek(28 - 8)
o.write(struct.pack("<II", chunks, 0))
o.close()
f.close()
print("blocks=%d chunks=%d dont_care_blocks=%d" % (total, chunks, skipped))
