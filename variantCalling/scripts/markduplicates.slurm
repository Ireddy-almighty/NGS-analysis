#!/bin/bash
#SBATCH --job-name=markDup
#SBATCH --partition=pibu_el8
#SBATCH --account=class-26980-ws-2026
#SBATCH --reservation=class-26980-ws-2026
#SBATCH --mem=8G
#SBATCH --time=02:00:00
#SBATCH --array=0-2
#SBATCH --output=markDup_%a.out

module load GATK/4.2.6.1-GCCcore-10.3.0-Java-11
module load SAMtools/1.13-GCC-10.3.0

DOGS=(WE0025 WE0028 WE0029)
DOG=${DOGS[$SLURM_ARRAY_TASK_ID]}

cd ~/course/variantCalling/markduplicates
gatk --java-options "-Xmx6g" MarkDuplicates \
    -I ../mapping/${DOG}.sorted.bam \
    -O ${DOG}.dedup.bam \
    -M ${DOG}.dup_metrics.txt

samtools index ${DOG}.dedup.bam