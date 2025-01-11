#!/bin/bash

INDIR="/nofish/luqmana1/MowiSeqData/Clean"
SCRIDRI="/nofish/afeesa/scripts"
cd $INDIR
count=0
sleeptime="3h"

for j in *
do
 	screen -dmS "Running_${j}" sh $SCRIDRI/paralel_alignments.sh ${j}
        count=$((count+1))
        echo ${j}
	((count%2)) || sleep $sleeptime
done
