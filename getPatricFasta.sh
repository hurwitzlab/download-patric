#!/bin/bash

#PBS -W group_list=bhurwitz
#PBS -q standard
#PBS -l select=1:ncpus=2:mem=3gb
#PBS -l walltime=72:00:00
#PBS -l cput=72:00:00
#PBS -M scottdaniel@email.arizona.edu
#PBS -m ea
#PBS -o pbs_logs/
#PBS -e pbs_logs/

export DIR="/gsfs1/rsgrps/bhurwitz/hurwitzlab/data/reference/patric_bacteria"

if [[ -d $DIR ]]
    then mkdir -p $DIR && cd $DIR
    else cd $DIR
fi

time wget -nc -nd -r --no-parent -A '*.fna' ftp://ftp.patricbrc.org/patric2/patric3/genomes/

