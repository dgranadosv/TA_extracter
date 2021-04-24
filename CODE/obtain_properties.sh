# This routine obtains properties for clustering the TAs
# These properties are: Helicity and hydrophobicity
# For doing that, we will do some pre-processing and then a series
# Rscripts
# Modify the files to have the sequences in a single-line
# Iterate through all the sequences that made it to the last stage, hence, non-redundant
for FILE in ../DATA/non_redundant_sequences/*.txt
do 
# First, I define a name prefix to make things clearer	 SEQID=`awk -F\/ '{print $2}' "$FILE"  | awk -F. '{print $1}'` 
SEQID=`awk -F\> '{print $2}' "$FILE"  | awk -F\| '{print $1}'` 
# Then, time to extract the sequences a put that in a single line, to that read using an Rscript
# Useful line below, but not used because is redundant
# head -n 1 sample.txt | awk -F\> '{print $2}' | awk -F\| '{print $1}'
SEQUENCE=`awk '/>/,EOF' "$FILE" | tail -n +2 |  awk '{ printf "%s", $0 }'` 
# Create a single sequence, csv, using the counter to make unique files
echo $SEQID,$SEQUENCE > ../DATA/non_redundant_sequences/"$SEQID"_one-liner.txt
done
mkdir ../DATA/one-liners/
mv ../DATA/non_redundant_sequences/*_one-liner* ../DATA/one-liners/
# Concatenate the single CSVs, into a large file that contains all the sequences
cat ../DATA/one-liners/*_one-liner* > ../RESULTS/named_sequences.csv
