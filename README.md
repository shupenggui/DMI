# DMI1.1
Decomposable Multi-structure Identification Algorithm for large-scale Gene Regulatory Network (GRN) inference and DMI method with higher efficiency and running information output now.

## Description
This is a demo for DMI method including the core part. DMI method tries to solve the Gene Regulatory Network recovery problem with multiple structural regularization and constraints. 

1. prepare data for DMI input and add the input file path to "DMI_demo.m"

2. run "DMI_demo.m" to calculation

3. get network recovery result "AXX.mat" under your path.

## FORMATS FOR INPUT FILES
The DMI method requires three input files: one gene expression data file and two background network files. 

1. Gene expression data file (GEDF): this file contains a T-by-N matrix, where T is the number of time points in the experiment and N is the number of genes. 

2. Background network file (BNF): Binary matrix is required for BNF. Both groundtruth network (grdt) and background network (bg) are required in this form. All network matrix representation are formed the regulator genes corresponding to the row indexes and the target genes corresponding to the column indexes. The formal goldstandard tsv file of GeneNetWeawer software is also welcome. Please run GRDTInput.m to transform it.

## FORMATS FOR OUTPUT FILES
Network result "AXX.mat" under your path is formed with the regulator genes corresponding to the row indexes and the target genes corresponding to the column indexes.

## SYSTEM REQUIREMENTS
Currently the code has been tested using 64-bit MATLAB 2016a on a Mac machine with 16GB memory. If you encounter any memory error, our suggestion is to 1) increase the system memory to 16GB; 2) switch to a 64-bit operating system as well as a 64-bit version of MATLAB. 
