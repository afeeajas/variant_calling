cd /nofish/afeesa/results/mergedBamfile
#samples=$(ls *_dup.bam |sed 's/_sorted_dup.bam/ /g' | awk $1 '{print $1}' | sort | uniq)
#samples=$(cat /nofish/afeesa/results/ssa01/notdone)
#samples="1028101125"
samples=("2017GNOS1BN_2_6331_B01" "80004592")
#samples=$(ls -1 *_dup.bam |sed 's/_sorted_dup.bam/ /g' | awk $1 '{print $1}' | sort | uniq)
count=0
sleeptime="65m"
SCRIDRI="/nofish/afeesa/scripts"

# for j in $samples
for j in ${samples[@]}
do
 	screen -dmS "Running_${j}" sh $SCRIDRI/gatkHapCall.sh ${j}
        count=$((count+1))
        echo ${j}
	((count%2)) || sleep $sleeptime
done
