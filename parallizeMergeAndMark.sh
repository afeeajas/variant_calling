
indir="/nofish/luqmana1/MowiSeqData/Clean/"
count=0
sleeptime="207m"
SCRIDRI="/nofish/afeesa/scripts"

sleep 60m

for j in $indir*
do
 	j=$(basename $j)
	screen -dmS "Running_${j}" sh $SCRIDRI/mergeAndMarkBAM.sh ${j}
        count=$((count+1))
        echo ${j}
	((count%5)) || sleep $sleeptime
done

echo 'All jobs submitted'
