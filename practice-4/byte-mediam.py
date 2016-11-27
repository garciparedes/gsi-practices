#!/usr/bin/env python

#
# Description: Calculates Aritmetical Median of argv[1] file.
#
# Author:   Sergio Garcia Prado
#           garciparedes.me
#

import sys

with open(sys.argv[1], "rb") as f:
    byteArr = map(ord, f.read())
    f.close()
    size = len(byteArr)

    # Median
    sum = 0
    for byte in byteArr:
        sum += byte
    median = float(sum)/size
    print median
