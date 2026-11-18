#!/bin/bash
hostname
date
sleep 30
date
sbatch --partition=pibu_el8 --account=class-26980-ws-2026 --reservation=class-26980-ws-2026 -t 00:05:00 first_job.sh