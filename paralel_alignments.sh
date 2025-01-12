#!/bin/bash
export TMPDIR=/nofish/afeesa/aligned_reads/MLA/tmp/
REF="/nofish/afeesa/data/GCF_905237065.1_Ssal_v3.1_genomic.fna"
OUTDIR="/nofish/afeesa/aligned_reads"
INDIR="/nofish/luqmana1/MowiSeqData/Clean"
bwa="/nofish/ellenw/bin/bwa-mem2-2.0pre2_x64-linux/bwa-mem2"
tmp="/nofish/afeesa/aligned_reads/MLA/tmp/"

cd $INDIR
cd $1"/trimedFiltfiles"
header=$(ls -1 | sed 's/\./ /g' | awk '{if($2=="fq") print $1}'| grep -v "_TrifiltUP"| sed -E 's/\_[1-2]_TrifiltPE/ /g' | sort | uniq) # | awk 'FNR >=1  && FNR <=1')
echo $header 
echo ' '
	for i in $header 
        do 
	echo "$i" 
	R1="${i}_1_TrifiltPE.fq.gz"
	R2="${i}_2_TrifiltPE.fq.gz" 
	echo ' '
	echo "$R1"
	echo ' '
	echo "$R2"
	#$bwa index $REF
	$bwa mem -M -t 30 -R '@RG\tID:'$1'\tSM:'$1'\tPL:BGI' ${REF} $R1 $R2 | samtools view -Sb - | samtools sort -@ 50 -m 20G -O bam -T $tmp -o -> ${OUTDIR}/${i}_sorted.bam
        done


