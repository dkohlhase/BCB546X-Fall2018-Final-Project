# Replication of "Comprehensive Genotyping of the USA National Maize Inbred Seed Bank" - Romay *et al.* 2013
BCB546x Fall 2018

Analysis and Replication by Iowa Captives: Daniel Kohlhase, Alejandro Ledesma, Anderson Verzegnazzi, Cassie Winn



## Background of paper

This paper was published not long after the development of the then new sequencing procedure, Genotyping by Sequencing (GBS). GBS enables characterization of germplasm collections on a genome-wide scale and can be applied to species with high-diversity and large genomes, such as maize. Plant introduction stations around the world, such as the USDA-ARS North Central Regional Plant Introduction Station (NCRPIS) in Ames, Iowa, preserve distinct inbred lines and curate and manage these germplasm collections. Many studies have been conducted to genotypically characterize such collections, however small sample sizes may not allow the identification of all important or significant QTLs for complex traits. In this study done by Romay *et al.*, GBS was used to analyze 4,351 maize samples from 2,815 maize accessions with 681,2457 SNP markers across the genome.

This paper had five objectives:

1. Compare GBS sequencing technology with other available options
2. Explore the potential of GBS to help with curation and use of germplasm
3. Evaluate genetic diversity and population structure both across the genome and between groups of germplasm
4. Investigate the history of recombination and LD through the different breeding groups
5. Explore the potential of the collection as a resource to study the genetic architecture of quantitative traits.

## Replication of Analyses & Results
### Figure 1 - Distribution of SNPs Across the Genome



### Figure 2 - Identical by State Distribution Across GBS Samples



### Figure 3 - B73 Network Diagram


### Figure 5 - Minor Allele Frequency Distribution and Percentage of SNPS Shared Between Maize Populations
In figure 5 of the paper, they show both minor allele frequency distribution across all pairs of lines and the percentage of SNPs shared between maize subpopulations. In the paper they describe that: "MAF were calculated using the ‘Geno Summary by Site’
analysis tool in TASSEL (version 4.0). Taxa and site
filter tools from that program were also used. To remove
possible sequencing errors, only alleles detected in at
least two individuals in a particular group were considered
to be present for the allelic diversity calculations."


![](./fig5.png)

We attempted to replicate this analysis and were partially successful. We were able to calculate minor allele frequency using TASSEL (version 5.0). The raw imputed genotypic data was uploaded to TASSEL, and using the function 'Geno Summary by Site' we were given MAF for each SNP on each chromosome. This data was then exported as a .csv file from TASSEL and can be found in the /Data/TASSEL folder of this repository. From there, the data was read into R, where we compiled the files into one and used ggplot to graph %SNPs vs Minor Allele Frequency.  

### Genome-Wide Association Studies


