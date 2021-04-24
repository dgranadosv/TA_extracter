# Iterate through all the text files and extract the sequence from the
# uniprot files 
#mkdir ../DATA/ids_first_filter
#for folder in ../DATA/ids/*
#do
#awk '/SQ/,EOF' "$folder"/*.txt | head -n -1 | tail -n +1 | sed '0,/SQ/s//>SQ/' | tr -d ' ' > "$folder"/seq.fas
#~/Desktop/tmhmm-2.0c/bin/tmhmm "$folder"/seq.fas > "$folder"/out.dat
#mv TMH* "$folder"
# Filtering sequences that only have one TA
#number_of_TAs=`grep "TMhelix" "$folder"/out.dat | wc -l`
#if [ $number_of_TAs -eq 1 ]
#then 
#cp -r "$folder" '../DATA/ids_first_filter/'
#fi
#done
# Filtering those proteins who have a far from the Cterminal 
#mkdir ../DATA/ids_second_filter
#for folder in ../DATA/ids_first_filter/*
#do
#len=`grep "Length" "$folder"/out.dat | awk '{print $4}'`
#end=`grep "TMhelix" "$folder"/out.dat | awk '{print $5}'`
#res=`expr $len - $end` 
#if [ $res -le 30 ]
#then
#cp -r "$folder" ../DATA/ids_second_filter
#fi
#done
# Run signalp to find signal sequences in the filtered proteins
mkdir ../DATA/ids_third_filter
for folder in ../DATA/ids_second_filter/*
do
signalp -fasta "$folder"/seq.fas -verbose false
mv seq_summary.signalp5 "$folder"
pred=`grep "SQ" $folder/seq_summary.signalp5 | awk '{print $2}'`
if [ "$pred" == "OTHER" ]
then
cp -r $folder ../DATA/ids_third_filter
fi
done
# [ Note, a good idea to explore later could be using shell parameters expansions: 
# https://stackoverflow.com/questions/20796200/ow-to-loop-over-files-in-directory-and-change-path-and-add-suffix-to-filename ]
#
