# Identify Unknown Microbe

### Dataset Information
* **Accession:** `SRR2584863`
* **Organism:** Unknown (Under Investigation)
* **Platform:** Illumina HiSeq 2500
* **Layout:** Paired-end, $2 \times 150$ bp
* **Reads:** ~1.6M read pairs
* **Size:** ~288 MB
* **Source:** NCBI SRA

---

### Environment & Tools
To ensure reproducibility, this project utilizes the following versions:

| Tool | Version |
| :--- | :--- |
| **FastQC** | `v0.12.1` |
| **blastn** | `2.16.0+` |

---

### Quick Start
For setup:

`bash scripts/setup.sh`

To run the BLAST analysis, run:

`bash scripts/blast.sh`

To assembly the genome with SPAdes:

bash scripts/assembly.sh`


### Followed Guide
"https://bioskillslab.dev/"
