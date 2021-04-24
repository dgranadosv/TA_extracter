# Download uniprot entries that match the ids provided
while read id
do 
wget http://www.uniprot.org/uniprot/$id.txt
#Make a folder for each uniprot file, and then transfer the corresponding file to each folder
mkdir -p ../DATA/ids/$id
mv $id.txt ../DATA/ids/$id
done < ../DATA/ids.dat
