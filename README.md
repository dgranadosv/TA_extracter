# TA_extracterV0.1

This repository was created as class a project for CMSE 410/890 at Michigan State University. 
This package is called TA_extracter, as it identifies Tail-anchored proteins, a class of transmembrane proteins.  The identification is solely done in the Saccharomyces cerevisae proteome. It uses a single data file called yeast.txt, that contains the proteome information. 

 In order to run the code,
execute the main-script.sh (bash 'main-script.sh'), which is going to execute multiple subscripts contained in the CODE folder,
This program assumes that you have the following applications in your machine
  * TMHMM
  * SignalP
  * R, with the folowing libraries:
    * Peptides
    * MASS
    * Vioplot
    * Wget
    *cd-hit

After runing the multiple subscripts, several datafiles will be created in the DATA and RESULTS folder. I decided to add the filea in RESULTS to this repository for documentation, although they will be generated running the code

Note: This code is a non-optimal  implementation and several improvement is still needed to make it a functional tool, but it is shared
for purely educational purposes

