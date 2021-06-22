# GrandSTR

Estimation of repeat counts of short tandem repeats(STR) from long-read sequencing data. Get genotypes for known STR.


## Dependencies

Python packages:
- python: 3.6 or higher
- pysam: 0.16.0 or higher
- sklearn: 0.24.1 or higher
- hmmlearn: 0.2.5 or higher
- edlib: 1.2.6 or higher, we need edlib.so file for python bindings.

Dependencies for install:
- cython: 0.29.21 or higher

Third party softwares:
- trf: 4.09.1


## Install

create symbolic link to TRF source codes: 

```bash
ln -s <TRF-4.09.1_dir>/src ./TRF-4.09.1_src
```


To build align.so, GrandSTR_lib.so, utils_lib.so, deal_str.so, trf_lib.so, run:

```bash
python setup.py build_ext -i
```


## Usage & Examples

### Input files
- Input bam file is alignment file of read sequences aligned to reference sequences, which is typically generated by minimap2 (versoin 2.17) with parameters "-ax asm10 --MD -Y -L --secondary=no" for hifi reads, or "-ax map-ont --MD -Y -L --secondary=no" for ONT reads. For example:
```bash
minimap2 -t 16 -ax asm10 --MD -Y -L --secondary=no hg19.fasta hifi.fastq 2> align.log | samtools view -Sb - | samtools sort - -o hifi.sorted.bam
```

- Input pa file is comma seperated information file, including coordinates of STR regions in reference, and repeat unit sequence. The required columns include STR name, chromosome, start coordinate, end coordinate, and repeat unit sequence. The left columns are optional. For example:
```
STR000009,1,691243,691307,CACCC,0,,downstream,LOC100288069
```

- Input fasta file is reference genome fasta file. 

### Commands
- For small amount of input STRs provided in pa file, add "-em 0" parameter to GrandSTR program. For example:
```bash
cd test/
samtools index hifi.sorted.bam
samtools faidx hg19.fasta
../GrandSTR test1.pa out1 -rf hg19.fasta -bf hifi.sorted.bam -em 0 -rt hifi
```

- For large amount of input STRs provided in pa file, add "-em 1" parameter to GrandSTR program. For example:
```bash
cd test/
samtools index hifi.sorted.bam
../GrandSTR test1.pa out1 -rf hg19.fasta -bf hifi.sorted.bam -em 1 -rt hifi
```
