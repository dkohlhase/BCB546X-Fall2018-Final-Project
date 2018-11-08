setwd("~/Documents/BCB546x/Final Project/raw_data")

dataFiles <- lapply(Sys.glob("AmesUSInbreds_AllZeaGBSv1.0_imputed_20130508_chr*.hmp.txt"), read.delim)  

#for i in dataFiles{
#  }


chr_1 <- read.delim("AmesUSInbreds_AllZeaGBSv1.0_imputed_20130508_chr1.hmp.txt")
chr_1_cut <- chr_1[1:4, 12:4487]
  
chr_9 <- read.delim("AmesUSInbreds_AllZeaGBSv1.0_imputed_20130508_chr9.hmp.txt")
View(head(chr_9, n=5))