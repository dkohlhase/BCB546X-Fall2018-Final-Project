setwd("../Romay_et_al_2013")
IBSdata <- read.csv("IBS_Pairs.csv", header = TRUE)
#this data set was made in excel from additional file 2, need to find a way to create data set in R
# or, calculate IBS as proportion of markers (across all 10 chromosomes) identical by state for all pairs of lines (4,351) 


nrow(IBSdata)

length(unique(IBSdata$Pairs))
#this ensures that all pairs are unique


#Figure A
library(ggplot2)
ggplot(IBSdata, aes(x=IBS)) + geom_histogram(bins = 20, color="black", fill="grey") + 
  ggtitle("Distribution of IBS Relationships Among Pairs of Closely Related Lines") +
  theme(plot.title = element_text(hjust = 0.5)) +
  ylab("Number of Pairs")

#Subset of Figure A
IBSdata_Filter <- IBSdata[ which(IBSdata$IBS >=0.95), ]
library(ggplot2)
ggplot(IBSdata_Filter, aes(x=IBS)) + geom_histogram(bins=5, color="black", fill="grey") + 
  ggtitle("Distribution of IBS Relationships Among Pairs of Closely Related Lines") +
  theme(plot.title = element_text(hjust = 0.5)) +
  ylab("Number of Pairs")



#-------------------------------------------------------
##Figure 2 update with all IBS data

m1 <- read.csv("", header=TRUE)
library(reshape2)
IBS <- setNames(melt(m1), c('line1', 'line2', 'IBS'))

library(dplyr)
IBSdata <- unite_(IBS, "line1_line2", c("line1","line2"))

nrow(IBSdata)

length(unique(IBSdata$line1_line2))
#this ensures that all pairs are unique


#Figure A
library(ggplot2)
ggplot(IBSdata, aes(x=IBS)) + geom_histogram(bins = 20, color="black", fill="grey") + 
  ggtitle("Distribution of IBS Relationships Among Pairs of Closely Related Lines") +
  theme(plot.title = element_text(hjust = 0.5)) +
  ylab("Number of Pairs")

#Subset of Figure A
IBSdata_Filter <- IBSdata[ which(IBSdata$IBS >=0.95), ]
library(ggplot2)
ggplot(IBSdata_Filter, aes(x=IBS)) + geom_histogram(bins=5, color="black", fill="grey") + 
  ggtitle("Distribution of IBS Relationships Among Pairs of Closely Related Lines") +
  theme(plot.title = element_text(hjust = 0.5)) +
  ylab("Number of Pairs")