# hg19.fasta is human reference genome sequence file
#ln -s <path_to_hg19>/hg19.fasta ./hg19.fasta
bash ../simu2.sh hg19.fasta known_str2.txt 0 hifi 0 01234 0
cd simu_0;
rm hifi.sort.bam hifi.sort.bam.bai ccs.fasta.gz
rm test1.simu_ref2.fasta test1.simu_ref.fasta test1.simu_ref2.fasta.fai
cd ..

python ../cmp_result2.py simu_0/out2.STR_infos simu_0/test1.simu_infos simu_0/cmp_str grandstr
Rscript ../scatter.R simu_0/cmp_str.cmp_pairs simu_0/cmp_str reads reference

python ../cmp_result2.py simu_0/repeathmm.result.xls simu_0/test1.simu_infos simu_0/cmp_hmm repeathmm
Rscript ../scatter.R simu_0/cmp_hmm.cmp_pairs simu_0/cmp_hmm reads reference

