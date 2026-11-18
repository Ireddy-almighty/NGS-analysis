#!/bin/bash
#SBATCH --job-name=fastqc
#SBATCH --partition=pibu_el8
#SBATCH --account=class-26980-ws-2026
#SBATCH --reservation=class-26980-ws-2026
#SBATCH --cpus-per-task=2
#SBATCH --mem=4G
#SBATCH --time=02:00:00
#SBATCH --output=fastqc.out

SAMPLE=1004_DRG

module load FastQC/0.11.9-Java-11

cd ~/course/dataPreProcess
fastqc --threads 2 -o raw_fastqc raw_data/${SAMPLE}_R1.fastq.gz raw_data/${SAMPLE}_R2.fastq.gz