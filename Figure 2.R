setwd("../Romay_et_al_2013")
IBSdata <- read.csv("IBS_Pairs.csv", header = TRUE)
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