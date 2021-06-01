minimap2 -ax asm10 -t 5 --MD -Y -L --secondary=no test1.simu_ref2.fasta ccs.fasta | samtools view -Sb - | samtools sort - -o hifi.sort.bam
samtools index hifi.sort.bam
