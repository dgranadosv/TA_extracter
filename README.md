# TA_extracterV0.1

This repository was created as a project for CMSE 410/890 at Michigan State University. 
This package is called, TA_extracter, as it purpose is extracting Tail-anchored proteins, a class of transmembrane proteins from the Saccharomyces cerevisae proteome. It uses a single data file yeast.txt, that contains the proteome information of Saccharomyces. 

 In order to run,
 Run the main-script.sh (bash 'main-script.sh'), which is going to execute multiple subscripts,
This program assumes that you have the following applications in your machine
  * TMHMM
  * SignalP
  * R, with the folowing libraries:
    * Peptides
    * MASS
    * Vioplot
    * Wget
    *cd-hit

After runing the multiple subscripts, there are several datafiles created in the DATA folder, and as well, several files created in the RESULTS folder. I decided to add those file in this repository for documentation, although they could be generated running the code. 

Note: This code is a non-optimal  implementation and several improvement is still needed to make it a functional tool, but it is shared
for purely education purposes

