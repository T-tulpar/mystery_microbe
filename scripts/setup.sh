#!/bin/bash
echo "Starting process..."
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")" # Defining address

conda env create -f "$PROJECT_ROOT/conda_env.yml" # Creating environment

mkdir -p "$PROJECT_ROOT/data"

cd "$PROJECT_ROOT/data" || exit
fasterq-dump SRR2584863 --split-files --threads 2 # Downloading data

echo "Forward reads: $(( $(wc -l < SRR2584863_1.fastq) / 4 ))"
echo "Reverse reads: $(( $(wc -l < SRR2584863_2.fastq) / 4 ))"

# Trimming
mkdir -p "$PROJECT_ROOT/data/trimmed"

cd "$PROJECT_ROOT/data/trimmed"

fastp \
    -i "$PROJECT_ROOT/data/SRR2584863_1.fastq" \
    -I "$PROJECT_ROOT/data/SRR2584863_2.fastq" \
    -o trimmed_R1.fastq \
    -O trimmed_R2.fastq \
    --qualified_quality_phred 20 \
    --length_required 100 \
    --detect_adapter_for_pe \
    --thread 2 \
    --html fastp_report.html \
    --json fastp_report.json

# Take 1000 random reads for Blast

mkdir -p "$PROJECT_ROOT/results/blast"
cd "$PROJECT_ROOT/results/blast"

seqkit sample -n 1000 -s 42 ../trimmed/trimmed_R1.fastq > subset_1000.fastq
seqkit fq2fa subset_1000.fastq > subset_1000.fasta

