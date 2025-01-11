#!/bin/bash
cd /nofish/luqmana1/MowiSeqData/Clean
#a=0
#X="3h"
for file in *
do
    cd $file
    samples=$(ls -1 | sed 's/\_[1:2].fq/ /g' | awk '{if($2==".gz") print $1}') #| sort | uniq | awk 'FNR >=1 && FNR <=1') 
    echo $samples
    mkdir trimedFiltfiles
    OutDir="trimedFiltfiles/"
    echo ' '
      for i in $samples
       do
       echo "java -d64 -jar /nofish/ellenw/bin/Trimmomatic-0.39/trimmomatic-0.39.jar PE -phred33" > out.txt
       cat out.txt | awk -v N=$i '{print "nohup",$0,N"_1.fq.gz",N"_2.fq.gz","trimedFiltfiles/"N"_1_TrifiltPE.fq.gz","trimedFiltfiles/"N"_1_TrifiltUP.fq.gz","trimedFiltfiles/"N"_2_TrifiltPE.fq.gz","trimedFiltfiles/"N"_2_TrifiltUP.fq.gz","-threads 5 LEADING:15 TRAILING:15 SLIDINGWINDOW:4:15 MINLEN:36 &"}' > trimfiltfiles.sh
       sh trimfiltfiles.sh
       #cat trimfiltfiles.sh
       rm out.txt trimfiltfiles.sh
       done
    cd ..
 #a=$((a+1))
 #echo "Counter is $a, so i will sleep for $X"
 #((a%2))|| sleep $X
 sleep 28m
done
