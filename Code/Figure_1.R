# Setup Environment ----------------------------------------------------------------------------------------------------------------------------------
# Each block of code checks if the package is installed on the device.
# If the package is not installed then the command automatically installs it.
# After making sure the package is installed, the package is loaded.
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
# USER WILL NEED TO CUSTOMIZE THE FOLLOWING FOLDER PATH TO WHEREVER THE USER DOWNLOADED AND STORED THE GENOTYPE FILES
whole <- fread("../../AmesUSInbreds_AllZeaGBSv1-2/AmesUSInbreds_AllZeaGBSv1.0_BPEC_20130508.hmp.txt", select = 3:4) # imports just column 3 and 4 of the genotype file
head(whole, n = 10) # preview the first 10 lines of the file that was just imported
#table(whole$alleles) # can look at the number of SNPs on each chromosome
whole_sort <- whole[order(chrom),]  # sorts the 'whole' dataframe by the 'chrom' column


# Order SNPs Across Whole Genome ---------------------------------------------------------------------------------------------------------------------
# This section of code replaces the positions of chromosomes 2-10 with numbers that build from
# the previous chromosome to make one continous sequence of numbers across the genome.
chr_1 <- whole_sort[chrom == 1] # subset 'whole' dataframe by only taking rows containing chromosome 1
tail(chr_1$pos, n=1)  # looks at the position of the last SNP on chromosome 1

chr_2 <- whole_sort[chrom == 2] # subset 'whole' dataframe by only taking rows containing chromosome 2
headTail(chr_2, top = 2, bottom = 2) # looks at the first and last 2 rows of the subsetted dataframe
chr_2$pos <- chr_2[,2] + tail(chr_1$pos, n=1) # adds the position of the last SNP on chromosome 1 to each position on chromosome 2 and replaces the old position witht the new (higher) position
headTail(chr_2, top = 2, bottom = 2) # looks at the first and last 2 rows of the subsetted dataframe to validate the updated position
tail(chr_2$pos, n=1)  # looks at the position of the last SNP on chromosome 2

# The remaining blocks of code within this section follow the same processes described for
# chromosome 2. The numbers will change to reflect the updated position of the last SNP for
# the immediate previous chromsome.

chr_3 <- whole_sort[chrom == 3]
headTail(chr_3, top = 2, bottom = 2)
chr_3$pos <- chr_3[,2] + tail(chr_2$pos, n=1)
headTail(chr_3, top = 2, bottom = 2)
tail(chr_3$pos, n=1)

chr_4 <- whole_sort[chrom == 4]
headTail(chr_4, top = 2, bottom = 2)
chr_4$pos <- chr_4[,2] + tail(chr_3$pos, n=1)
headTail(chr_4, top = 2, bottom = 2)
tail(chr_4$pos, n=1)

chr_5 <- whole_sort[chrom == 5]
headTail(chr_5, top = 2, bottom = 2)
chr_5$pos <- chr_5[,2] + tail(chr_4$pos, n=1)
headTail(chr_5, top = 2, bottom = 2)
tail(chr_5$pos, n=1)

chr_6 <- whole_sort[chrom == 6]
headTail(chr_6, top = 2, bottom = 2)
chr_6$pos <- chr_6[,2] + tail(chr_5$pos, n=1)
headTail(chr_6, top = 2, bottom = 2)
tail(chr_6$pos, n=1)

chr_7 <- whole_sort[chrom == 7]
headTail(chr_7, top = 2, bottom = 2)
chr_7$pos <- chr_7[,2] + tail(chr_6$pos, n=1)
headTail(chr_7, top = 2, bottom = 2)
tail(chr_7$pos, n=1)

chr_8 <- whole_sort[chrom == 8]
headTail(chr_8, top = 2, bottom = 2)
chr_8$pos <- chr_8[,2] + tail(chr_7$pos, n=1)
headTail(chr_8, top = 2, bottom = 2)
tail(chr_8$pos, n=1)

chr_9 <- whole_sort[chrom == 9]
headTail(chr_9, top = 2, bottom = 2)
chr_9$pos <- chr_9[,2] + tail(chr_8$pos, n=1)
headTail(chr_9, top = 2, bottom = 2)
tail(chr_9$pos, n=1)

chr_10 <- whole_sort[chrom == 10]
headTail(chr_10, top = 2, bottom = 2)
chr_10$pos <- chr_10[,2] + tail(chr_9$pos, n=1)
headTail(chr_10, top = 2, bottom = 2)
tail(chr_10$pos, n=1)

whole_prime <- rbind(chr_1,chr_2,chr_3,chr_4,chr_5,chr_6,chr_7,chr_8,chr_9,chr_10)  # binds the rows from all the subsetted dataframes with updated positions
headTail(whole_prime) # preview the first and last 4 rows of the newly generated dataframe 'whole_prime' to validate updated positions

# Create Bins ----------------------------------------------------------------------------------------------------------------------------------------
df <- whole_prime %>% 
  mutate(Dist_Bin = cut(as.numeric(pos), breaks = 2100))  # creates a new column called 'Dist_Bin' and populates it with 2100 bin IDs that breakup the positions

# Prepare File for Plotting --------------------------------------------------------------------------------------------------------------------------
df$chrom <- as.character(df$chrom)  # change the structure of 'chrom' from integer to character for graph formating
str(df) # double check the structure of 'chrom'

# Plot Figure in color ----------------------------------------------------------------------------------------------------------------------------------------
ggplot(data = df) + # prepares to generate a plot using data from the 'df' dataframe
  geom_hline(yintercept = c(seq(0,1500,100)), color = "lightgrey", size = 0.5) +  # draws grey horizontal lines for every 100 SNPs up to 1500 SNPs
  geom_hline(yintercept = c(seq(0,1500,500)), color = "grey", size = 1) + # draws thicker grey horizontal lines for 500, 1000, and 1500 SNPs
  geom_bar(mapping = aes(x = Dist_Bin, col = chrom), stat = "count") +  # generates a bar chart plotting the number of SNPs in each bin across the genome and colors the bars by chromsome number
  ggtitle(label = "Distribution of SNPs across genome") + # labels the title of the graph
  xlab(label = "Position (Mb)") + # labels the x-axis
  ylab(label = "Number of SNPs") +  # labels the y-axis
  theme(
    plot.title = element_text(hjust = 0.5),  # centers the graph title
    axis.text.x = element_blank(),  # removes the illegible bin ID to help clean up the graph
    axis.ticks.x = element_blank(),  # removes the ticks on the x-axis to help clean up the graph
    legend.position="none"  # removes the unecessary legend to help clean up the graph (will add chromosome number to x-axis post graph production)
  )
ggsave(filename = "../Figures/Iowa_Captives/Fig1.png", device = "png", width = 6, height = 3)  # saves the graph in the 'Iowa_Captives' folder in the 'Figures' folder in the repository