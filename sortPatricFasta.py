#!/usr/bin/env python

################################################
# python script to sort genomes into ##########
# complete and WGS status ######################
################################################

import os
import shutil
from plumbum import local

#yay ipython magic!
#nope this DOESNT WORK
#STUPID IPYTHON
#thing=!pwd 
#print(thing) 

#change directory to where genomes are
local.cwd.chdir(os.environ.get('DIR'))

#thing=!pwd
#print(thing)

#set out dirs
outcomplete = os.environ.get('COMPLETE')
outwgs = os.environ.get('WGS')

#doing this the lazy way without argparse because this is a one-off
#script that I will likely never ever use again

genome_info = open(os.environ.get('LIST'))

#read in that genome_summary file

#dictionary to hold genome id to whether its complete or wgs
id_to_status = {}

for line in genome_info:
    line=line.rstrip('\n')
    cols=line.split('\t')
    id=cols[0]
    status=cols[4]
    id_to_status.update({id:status})

#walk through files and move them into the correct dir
for file in os.listdir(os.getcwd()):
       #so we only mess with actual fna files 
        if str(file).endswith('fna'):
           #strip fna for id matching 
            id=file.replace('.fna','')

            try:
                status = id_to_status[id]
            except KeyError, e:
                print '%s does not exist in id_to_status dictionary.' % (id)
                print 'Must move manually.'

            if (status=='WGS'):
    #            print 'This would move %s to WGS dir' % (id)
                try:
                    shutil.move(id+'.fna',outwgs)
                except IOError, e:
                    print 'Had trouble moving %s to %s.' % (id,outwgs)
            elif (status=='Complete'):
    #            print 'This would move %s to COMPLETE dir' % (id)
                try:
                    shutil.move(id+'.fna',outcomplete)
                except IOError, e:
                    print 'Had trouble moving %s to %s.' % (id,outcomplete)
            else:
                continue

