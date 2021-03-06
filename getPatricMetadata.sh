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

export WD=$PBS_O_WORKDIR

export DIR="/rsgrps/bhurwitz/hurwitzlab/data/reference/patric_metadata"

if [ ! -d "$DIR" ]; then
    mkdir -p $DIR
fi

cd $DIR

time wget -o "$WD/pbs_logs/$PBS_JOBNAME-wget.log" \
    -nc -nd --no-parent \
    ftp://ftp.patricbrc.org/patric2/current_release/RELEASE_NOTES/genome*
