#!/bin/bash
#SBATCH --job-name=fastp
#SBATCH --partition=pibu_el8
#SBATCH --account=class-26980-ws-2026
#SBATCH --reservation=class-26980-ws-2026
#SBATCH --cpus-per-task=4
#SBATCH --mem=8G
#SBATCH --time=02:00:00
#SBATCH --output=fastp.out

SAMPLE=1003_DRG

module load fastp/0.23.4-GCC-10.3.0

cd ~/course/dataPreProcess
fastp \
    -i raw_data/${SAMPLE}_R1.fastq.gz \
    -I raw_data/${SAMPLE}_R2.fastq.gz \
    -o clean_fastq/${SAMPLE}_R1.clean.fastq.gz \
    -O clean_fastq/${SAMPLE}_R2.clean.fastq.gz \
    --detect_adapter_for_pe \
    --trim_poly_g \
    -q 15 \
    -l 36 \
    -w 4 \
    -h clean_fastq/${SAMPLE}_fastp.html \
    -j clean_fastq/${SAMPLE}_fastp.json