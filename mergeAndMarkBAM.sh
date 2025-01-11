
indir="/nofish/luqmana1/MowiSeqData/Clean/"
bamfpath="/nofish/afeesa/aligned_reads/"
m="_sorted.bam"
outpath="/nofish/afeesa/results/mergedBamfile"
arg_dir="/nofish/afeesa/results/par_dir/"
picard="/nofish/ellenw/bin/picard.jar"
tmp="/nofish/afeesa/results/tmp"

j=$1
bamFiles=$(ls $indir${j} |grep ".gz" | sed 's/_[0-9].fq.gz/ /g' | awk -v j=$j -v k=$bamfpath -v m=$m '{print k $0 m}' | sed 's/ //g' | uniq |  awk '{print "-I",$0}')
j=$(basename $j)
echo $bamFiles > $arg_dir$j.par
echo '-O' $outpath/$j'_sorted_dup.bam' '-M' $outpath'/marked_dup_'$j'_metrics.txt' >> $arg_dir$j.par

java -jar $picard MarkDuplicates --arguments_file $arg_dir$j.par --TMP_DIR $tmp
samtools index $outpath/$j'_sorted_dup.bam'
echo $j
rm $arg_dir$j.par



