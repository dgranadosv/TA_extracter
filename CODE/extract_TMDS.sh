# Extract TMs from the list of sequences
for FILE in ../DATA/non_redundant_sequences/*.txt
do
SEQID=`echo $FILE | awk -F\/ '{print $4}' | awk -F. '{print $1}'` 
TM_BEGIN=`grep "TMh" ../DATA/ids_third_filter/"$SEQID"/out.dat | awk '{print $4}'`
TM_END=`grep "TMh" ../DATA/ids_third_filter/"$SEQID"/out.dat | awk '{print $5}'`
TMD=`awk -F\, '{print $2}' ../DATA/one-liners/"$SEQID"_one-liner.txt | cut -c "$TM_BEGIN"-"$TM_END"`
TMD=`awk -F\, '{print $2}' ../DATA/one-liners/"$SEQID"_one-liner.txt | cut -c "$TM_BEGIN"-"$TM_END"`
echo $SEQID,$TMD > $SEQID.tmd
done
mkdir ../DATA/TMDS
mv *tmd ../DATA/TMDS
cat ../DATA/TMDS/*.tmd > ../RESULTS/all_TMDS.csv
