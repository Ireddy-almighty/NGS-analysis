#!/bin/bash
#SBATCH --job-name=mapping
#SBATCH --partition=pibu_el8
#SBATCH --account=class-26980-ws-2026
#SBATCH --reservation=class-26980-ws-2026
#SBATCH --cpus-per-task=4
#SBATCH --mem=12G
#SBATCH --time=03:00:00
#SBATCH --array=0-2
#SBATCH --output=mapping_%a.out

module load BWA/0.7.17-GCC-10.3.0
module load SAMtools/1.13-GCC-10.3.0

# the three dogs: task 0 is WE0025, task 1 is WE0028, task 2 is WE0029
DOGS=(WE0025 WE0028 WE0029)
DOG=${DOGS[$SLURM_ARRAY_TASK_ID]}

cd ~/course/variantCalling

bwa mem -t 4 \
    -R "@RG\tID:${DOG}\tSM:${DOG}\tLB:${DOG}_LIB\tPL:ILLUMINA" \
    refIdx/dog_chr5.fa \
    fastq_data/${DOG}_chr5_R1.fastq.gz \
    fastq_data/${DOG}_chr5_R2.fastq.gz \
  | samtools sort -@ 4 -m 1G -o mapping/${DOG}.sorted.bam -

samtools index mapping/${DOG}.sorted.bam