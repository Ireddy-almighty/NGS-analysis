#!/bin/bash
#SBATCH --job-name=indexRef
#SBATCH --partition=pibu_el8
#SBATCH --account=class-26980-ws-2026
#SBATCH --reservation=class-26980-ws-2026
#SBATCH --cpus-per-task=1
#SBATCH --mem=4G
#SBATCH --time=01:00:00
#SBATCH --output=indexRef.out

module load BWA/0.7.17-GCC-10.3.0
module load SAMtools/1.13-GCC-10.3.0
module load GATK/4.2.6.1-GCCcore-10.3.0-Java-11

cd ~/course/variantCalling/refIdx
bwa index dog_chr5.fa
samtools faidx dog_chr5.fa
gatk CreateSequenceDictionary -R dog_chr5.fa -O dog_chr5.dict