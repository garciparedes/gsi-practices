#!/usr/bin/env python
import sys

with open(sys.argv[1], "rb") as f:
    size, suma, byte = int(), int(), f.read(1)
    while byte != b"":
        size += 1
        suma += int(byte.encode('hex'), 16)
        byte = f.read(1)
    print float(suma)/float(size)
