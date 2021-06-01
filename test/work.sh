
samtools index hifi.sort.bam 
python ../GrandSTR.py input.pa output -bf hifi.sort.bam -rf input.fasta -em 1

