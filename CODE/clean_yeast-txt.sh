# Clean yeast.txt 
# keep the columns and valuable information 
sed -e '1,/OLN/d' ../DATA/yeast.txt | sed -e '1,/Gene designations/d' | sed -e '1,/-/d' | sed -e '1,/--/!d' | head -n -2 > ../DATA/yeast_clean.dat
# Get uniprot IDs from file
awk '{print substr($0,96,6)}' ../DATA/yeast_clean.dat > ../DATA/ids.dat
