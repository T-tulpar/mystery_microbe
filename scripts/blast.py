from Bio.Blast import NCBIWWW, NCBIXML
from Bio import SeqIO

# Read first 5 sequences
records = list(SeqIO.parse("../results/blast/subset_1000.fasta", "fasta"))[:5]

for record in records:
    print(f"BLASTing {record.id}...")
    result = NCBIWWW.qblast("blastn", "nt", str(record.seq))
    blast_records = NCBIXML.parse(result)
    blast_record = next(blast_records)

    if blast_record.alignments:
        top_hit = blast_record.alignments[0]
        print(f"  Top hit: {top_hit.title[:100]}")
        print(f"  E-value: {top_hit.hsps[0].expect}")
        print(f"  Identity: {top_hit.hsps[0].identities}/{top_hit.hsps[0].align_length}")
    print()
