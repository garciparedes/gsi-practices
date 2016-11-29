#!/usr/bin/env python

#
# Description: Calculates Shannon Entropy of argv[1] file.
#
# Author:   Sergio Garcia Prado
#           garciparedes.me
#

import sys
import math
import pandas

with open(sys.argv[1], "rb") as f:
    byteArr = map(ord, f.read())
    f.close()
    fileSize = len(byteArr)

    #Obtain frequency table
    freqList = pandas.Series(byteArr).value_counts(normalize = True)

    # Shannon entropy
    ent = 0.0
    for freq in freqList:
        ent = ent + freq * math.log(freq, 2)
    ent = -ent
    print ent
