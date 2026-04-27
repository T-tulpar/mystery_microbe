#!/bin/bash

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"
CPU_CORES=$(nproc) # for determining the usable thread number

#if [ "$CPU_CORES" -gt 1 ]; then
#    THREADS=$((CPU_CORES - 2))
#else
#    THREADS=1

echo "Starting Genome Assembly..."

mkdir -p "$PROJECT_ROOT/results/assembly"

echo "Building the genome (this may take a while)..."

time conda run -n microbe-id spades.py \
    -1 "$PROJECT_ROOT/data/trimmed/trimmed_R1.fastq" \
    -2 "$PROJECT_ROOT/data/trimmed/trimmed_R2.fastq" \
    -o "$PROJECT_ROOT/results/assembly/" \
    --threads 8 \
    --memory 6

echo "✅ Assembly complete! Results saved to results/assembly/"