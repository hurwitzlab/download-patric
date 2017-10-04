#!/bin/bash

#PBS -W group_list=bhurwitz
#PBS -q standard
#PBS -l place=free:shared
#PBS -l select=1:ncpus=2:mem=3gb
#PBS -l walltime=72:00:00
#PBS -l cput=72:00:00
#PBS -M scottdaniel@email.arizona.edu
#PBS -m ea
#PBS -o pbs_logs/
#PBS -j oe

export WD=$PBS_O_WORKDIR

export DIR="/rsgrps/bhurwitz/hurwitzlab/data/reference/patric_bacteria"

export LIST="/rsgrps/bhurwitz/hurwitzlab/data/reference/patric_metadata/genome_summary"

if [ ! -d $DIR ]; then 
    echo "Cant find $DIR"
fi

export COMPLETE="$DIR"/complete
export WGS="$DIR"/wgs

mkdir -p $COMPLETE 
mkdir -p $WGS

cd $DIR

$WD/sortPatricFasta.py 

