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

export DIR="/rsgrps/bhurwitz/hurwitzlab/data/reference/patric_bacteria/testgenomes"

export LIST="/rsgrps/bhurwitz/hurwitzlab/data/reference/patric_metadata/genome_summary"

if [ ! -d $DIR ]; then 
    mkdir -p $DIR
fi

export COMPLETE="$DIR"/complete
export WGS="$DIR"/wgs

mkdir -p $COMPLETE 
mkdir -p $WGS

cd $DIR

#kinda pseudo-code
#TODO: fix me
$WD/sortPatricFasta.py --in $DIR --outComplete $COMPLETE --outWGS $WGS --list $LIST

#time wget -o "$WD/pbs_logs/$PBS_JOBNAME-wget.log" \
#    -nc -nd -r --no-parent \
#    -A '*.fna' ftp://ftp.patricbrc.org/patric2/patric3/genomes/
#
