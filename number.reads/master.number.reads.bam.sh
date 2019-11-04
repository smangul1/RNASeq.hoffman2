ls *bam | awk -F ".bam" '{print $1}' >samples.txt

while read line
do

echo "~/project/anaconda2/bin/python ~/code/miscellaneous.scripts/number.unique.reads.bam/number.reads.bam.py ${line}.bam ${line}.txt">run.${line}.sh

#qsub -cwd -V -N  nr -l h_data=8G,highp,time=10:00:00 run.${line}.sh

done<samples.txt


~/code/miscellaneous.scripts/submit_QSUB_array.sh  4 10


