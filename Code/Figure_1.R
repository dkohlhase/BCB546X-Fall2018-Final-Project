# Setup Environment ----------------------------------------------------------------------------------------------------------------------------------
if (!require("tidyverse")) install.packages("tidyverse")
library(tidyverse)
if (!require("ggplot2")) install.packages("ggplot2")
library(ggplot2)
if (!require("gtools")) install.packages("gtools")
library(gtools)
if (!require("reshape2")) install.packages("reshape2")
library(reshape2)
if (!require("data.table")) install.packages("data.table")
library(data.table)
if (!require("psych")) install.packages("psych")
library(psych)

# Import Data ----------------------------------------------------------------------------------------------------------------------------------------
setwd("../")  # moves from the 'Code' directory up to the whole repository directory and sets as the working directory
# USER WILL NEED TO CUSTOMIZE THE FOLLOWING FOLDER PATH TO WHEREVER THE USER DOWNLOADED AND STORED THE GENOTYPE FILES
whole <- fread("../AmesUSInbreds_AllZeaGBSv1-2/AmesUSInbreds_AllZeaGBSv1.0_BPEC_20130508.hmp.txt", drop = 5:4487) 
head(whole, n = 10)
#table(whole$alleles)
whole_sort <- whole[order(chrom),]


# Order SNPs Across Whole Genome ---------------------------------------------------------------------------------------------------------------------
chr_1 <- whole_sort[chrom == 1]
tail(chr_1$pos, n=1)

chr_2 <- whole_sort[chrom == 2]
headTail(chr_2, top = 2, bottom = 2)
chr_2$pos <- chr_2[,4] + tail(chr_1$pos, n=1)
headTail(chr_2, top = 2, bottom = 2)
tail(chr_2$pos, n=1)

chr_3 <- whole_sort[chrom == 3]
headTail(chr_3, top = 2, bottom = 2)
chr_3$pos <- chr_3[,4] + tail(chr_2$pos, n=1)
headTail(chr_3, top = 2, bottom = 2)
tail(chr_3$pos, n=1)

chr_4 <- whole_sort[chrom == 4]
headTail(chr_4, top = 2, bottom = 2)
chr_4$pos <- chr_4[,4] + tail(chr_3$pos, n=1)
headTail(chr_4, top = 2, bottom = 2)
tail(chr_4$pos, n=1)

chr_5 <- whole_sort[chrom == 5]
headTail(chr_5, top = 2, bottom = 2)
chr_5$pos <- chr_5[,4] + tail(chr_4$pos, n=1)
headTail(chr_5, top = 2, bottom = 2)
tail(chr_5$pos, n=1)

chr_6 <- whole_sort[chrom == 6]
headTail(chr_6, top = 2, bottom = 2)
chr_6$pos <- chr_6[,4] + tail(chr_5$pos, n=1)
headTail(chr_6, top = 2, bottom = 2)
tail(chr_6$pos, n=1)

chr_7 <- whole_sort[chrom == 7]
headTail(chr_7, top = 2, bottom = 2)
chr_7$pos <- chr_7[,4] + tail(chr_6$pos, n=1)
headTail(chr_7, top = 2, bottom = 2)
tail(chr_7$pos, n=1)

chr_8 <- whole_sort[chrom == 8]
headTail(chr_8, top = 2, bottom = 2)
chr_8$pos <- chr_8[,4] + tail(chr_7$pos, n=1)
headTail(chr_8, top = 2, bottom = 2)
tail(chr_8$pos, n=1)

chr_9 <- whole_sort[chrom == 9]
headTail(chr_9, top = 2, bottom = 2)
chr_9$pos <- chr_9[,4] + tail(chr_8$pos, n=1)
headTail(chr_9, top = 2, bottom = 2)
tail(chr_9$pos, n=1)

chr_10 <- whole_sort[chrom == 10]
headTail(chr_10, top = 2, bottom = 2)
chr_10$pos <- chr_10[,4] + tail(chr_9$pos, n=1)
headTail(chr_10, top = 2, bottom = 2)
tail(chr_10$pos, n=1)

whole_prime <- rbind(chr_1,chr_2,chr_3,chr_4,chr_5,chr_6,chr_7,chr_8,chr_9,chr_10)
headTail(whole_prime)

# Create Bins ----------------------------------------------------------------------------------------------------------------------------------------
df <- whole_prime %>% 
  mutate(Dist_Bin = cut(as.numeric(pos), breaks = 2100))

# Prepare File for Plotting --------------------------------------------------------------------------------------------------------------------------
df$chrom <- as.character(df$chrom)
str(df)

# Plot Figure ----------------------------------------------------------------------------------------------------------------------------------------
ggplot(data = df) +
  geom_bar(mapping = aes(x = Dist_Bin, col = chrom), stat = "count") +
  ggtitle(label = "Distribution of SNPs across genome") +
  xlab(label = "Position (Mb)") +
  ylab(label = "Number of SNPs") +
  theme(
    plot.title = element_text(hjust = 0.5),
    axis.text.x = element_blank(),
    axis.ticks.x = element_blank(),
    legend.position="none"
  )
ggsave(filename = "Figures/Iowa_Captives/Fig1.png", device = "png", width = 6, height = 3)