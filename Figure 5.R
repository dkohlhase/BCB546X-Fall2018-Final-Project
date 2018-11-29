setwd("../TASSEL")

dataFiles <- lapply(Sys.glob("Chr*_MAF.csv"), read.csv)
names(dataFiles) <- c("10", "1", "2", "3", "4", "5", "6", "7", "8", "9")

for(i in names(dataFiles)){
  d.frame <-
    assign(paste("chr", i, sep=""), dataFiles[[i]])
}

allchr <- rbind(chr1, chr2, chr3, chr4, chr5, chr6, chr7, chr8, chr9, chr10)
allchr_filter <- allchr[1:15]

library(ggplot2)
ggplot(allchr_filter, aes(x=Minor.Allele.Frequency)) + geom_histogram(bins=50,color="turquoise", fill="turquoise") + 
  ggtitle("Minor Allele Frequency Across SNPs") +
  theme(plot.title = element_text(hjust = 0.5)) +
  ylab("Number of SNPs")

