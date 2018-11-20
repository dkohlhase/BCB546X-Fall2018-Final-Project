setwd("../TASSEL")

Chr1MAF <- read.csv("Chr1_MAF.csv")
chr1maf <- Chr1MAF[1:15]

Chr2MAF <- read.csv("Chr2_MAF.csv")
chr2maf <- Chr2MAF[1:15]

Chr3MAF <- read.csv("Chr3_MAF.csv")
chr3maf <- Chr3MAF[1:15]

Chr4MAF <- read.csv("Chr4_MAF.csv")
chr4maf <- Chr4MAF[1:15]

Chr5MAF <- read.csv("Chr5_MAF.csv")
chr5maf <- Chr5MAF[1:15]

Chr6MAF <- read.csv("Chr6_MAF.csv")
chr6maf <- Chr6MAF[1:15]

Chr7MAF <- read.csv("Chr7_MAF.csv")
chr7maf <- Chr7MAF[1:15]

Chr8MAF <- read.csv("Chr8_MAF.csv")
chr8maf <- Chr8MAF[1:15]

Chr9MAF <- read.csv("Chr9_MAF.csv")
chr9maf <- Chr9MAF[1:15]

Chr10MAF <- read.csv("Chr10_MAF.csv")
chr10maf <- Chr10MAF[1:15]

allchr <- rbind(chr1maf,chr2maf,chr3maf,chr4maf,chr5maf,chr6maf,chr7maf,chr8maf,chr9maf,chr10maf)

library(ggplot2)
ggplot(allchr, aes(x=Minor.Allele.Frequency)) + geom_histogram(bins=50,color="black", fill="grey") + 
  ggtitle("Minor Allele Frequency Across SNPs") +
  theme(plot.title = element_text(hjust = 0.5)) +
  ylab("Number of SNPs")