#!/usr/bin/env ipython

################################################
# ipython script to sort genomes into ##########
# complete and WGS status ######################
################################################

import os
import shutils
from plumbum import local

!pwd

#read in that genome_summary file

for path,names,files in os.walk(os.getcwd()):
    for file in files:
        print file

