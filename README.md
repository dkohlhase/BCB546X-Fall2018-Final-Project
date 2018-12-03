# BCB546X Final Project

This is the repository of the final project for the Iowa Captives. Inside are the data files we used to replicate certain analyses from the paper "Comprehensive genotyping of the USA national maize inbred seed bank" by Romay *et al.* (2013), code we used to analyze these data and produce figures, output files, the slideshow for the class presentation, and a markdown file to describe the paper, our approach and our results.

## Data

### raw genotypic data
Raw genotypic data for Romay *et al.* (2013) is stored in a CyVerse Data Commons (http://datacommons.cyverse.org/browse/iplant/home/shared/panzea/genotypes/GBS/v10). In order to access the data, you will need to create a  CyVerse account if you do not already have one. In all of our analyses we used the imputed genotypic data. This data could not be uploaded to our repository, as the files are too large for github.

### phenotypic_data
The phenotypic data folder contains phenotypic data associated with the paper that was downloaded from panzea.org (https://www.panzea.org/phenotypes). This data can also be found in the CyVerse Data Commons in /iplant/home/shared/panzea/phenotypes/.

### additional_materials
This folder contains the "Additional Material" and data for the paper that are available in the publication at (https://genomebiology.biomedcentral.com/articles/10.1186/gb-2013-14-6-r55).

### TASSEL
The TASSEL folder contains data in .csv file formats that was created by analysis done in TASSEL version 5. The code for figure 5, minor allele frequency distribution, uses the data in this folder. 

## Code

All scripts are titled by the analysis and figure from the paper they correspond to. A more detailed description of the analyses can be found in the markdown file, Romay et al - 2013.md
