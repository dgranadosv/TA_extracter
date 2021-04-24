# Take the TA database and apply cd-hit 
for folder in ../DATA/ids_third_filter/*
do
# Change the seq.fas file to a format is liked by cd-hit	
id=`echo $folder | awk -F"/" '{print $4}'`
sed "1s/.*/>"$id"||/" $folder/seq.fas > $folder/seq_ed.fas
done
# Concatenate the fastas for running cd-hit
cat ../DATA/ids_third_filter/*/seq_ed.fas > ../DATA/concat.fas
# Running cd-hit, with redundancy value of 0.9
cd-hit -i ../DATA/concat.fas -o ../DATA/non_redundant.fas -c 0.9
# Create a new list of non-redundant sequences
mkdir ../DATA/non_redundant_sequences
mv ../DATA/non_redundant.fas ../DATA/non_redundant_sequences
# Split the sequences into individual files
# Code snippet taken from here: https://unix.stackexchange.com/questions/320867/splitting-a-single-file-into-multiple-files-based-on-matching-strings-in-linux
awk '/^>/{f=substr($0,match($0,/>[0-9]{4}/),8)".nr.txt"}{print>>f}' ../DATA/non_redundant_sequences/non_redundant.fas
# Renaming the files, just for the sake of my sanity 
# Removing >, then |
rename 's/\>//g' *nr.txt; rename 's/\|//g' *nr.txt
mv *.nr.txt ../DATA/non_redundant_sequences/ 
rename 's/nr.txt/txt/g' ../DATA/non_redundant_sequences/*
echo "Sequences are ready for further analysis :)"
