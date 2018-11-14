# Setup Environment + Import Data --------------------------------------------------------
if (!require("tidyverse")) install.packages("tidyverse")
library(tidyverse)
if (!require("ggplot2")) install.packages("ggplot2")
library(ggplot2)
if (!require("gtools")) install.packages("gtools")
library(gtools)
if (!require("reshape2")) install.packages("reshape2")
library(reshape2)

setwd("Kohlhase_Academic/Iowa_State/PhD_Courses/BCB_546X/Final_Project/AmesUSInbreds_AllZeaGBSv1/")

chr_10 <- read.delim("AmesUSInbreds_AllZeaGBSv1.0_imputed_20130508_chr10.hmp.txt")
View(head(chr_10, n=3))
chr_10_cut <- chr_10[,c(1,3,4)]
colnames(chr_10_cut)[1] <- "SNP_ID"

loop_df <- chr_10[,c(1:4,12:4487)]
View(head(loop_df, n = 3))

if (!require("data.table")) install.packages("data.table")
library(data.table)
setwd("../AmesUSInbreds_AllZeaGBSv1-2/")
whole <- fread("AmesUSInbreds_AllZeaGBSv1.0_BPEC_20130508.hmp.txt", drop = 5:4487)
head(whole)
table(whole$alleles)



# for each row in loop_df
#   if loop_df$allele = []
# 
# 
# 

# Setup Environment + Import Data --------------------------------------------------------

# last SNP pos on chrom 10 = 150,146,726
df10 <- subset(whole, chrom == "10")
#df2 <- subset(df1,  Chromosome != "NA")
#df3 <- subset(df2, Chromosome != "multiple")

df <- whole %>% 
  mutate(Dist_Bin = cut(as.numeric(pos), breaks = 1500))

df10 <- subset(df, Chromosome != "unknown")
#df2 <- subset(df1,  Chromosome != "NA")
#df3 <- subset(df2, Chromosome != "multiple")

df$chrom <- as.character(df$chrom)
str(df)
table(df$chrom)

ggplot(data = df) +
  geom_bar(mapping = aes(x = Dist_Bin, col = chrom), stat = "count") +
  ggtitle(label = "Distribution of SNPs across chromosomes") +
  xlab(label = "Position (Mb)") +
  ylab(label = "Number of SNPs") +
  theme(
    plot.title = element_text(hjust = 0.5),
    axis.text.x = element_blank(),
    axis.ticks.x = element_blank()
  )
#ggsave(filename = "Distribution of SNPs across chromosomes.png", device = "png")