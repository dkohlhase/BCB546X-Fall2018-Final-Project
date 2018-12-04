##Figure 2 using IBS data matrix created in TASSEL by loading in genotypic data
#and using relatedness "kinship" function with "Normalized_IBS" option and exporting as .csv

#read in the .csv
m1 <- read.csv("IBSdata_Normalized_Tassel.csv", header=TRUE)

#use melt() function to re-organize the matrix into a dataframe with 3 columns: line1, line2, and IBS
library(reshape2)
IBS <- setNames(melt(m1), c('line1', 'line2', 'IBS'))

#this matrix includes IBS of lines with themselves, so remove any values greater than 1.0 to eliminate those
IBS2 <- IBS[!(IBS$IBS > 1.0),]

library(tidyr)
library(dplyr)

#combine columns 1 and 2 into one column separated by an underscore: "line1_line2"
IBSdata <- unite_(IBS2, "line1_line2", c("line1","line2"))

#check the number of rows in the dataframe
nrow(IBSdata)

#if this equals the nrow above then this ensures that all pairs are unique
length(unique(IBSdata$line1_line2))

#Plot figure 2 (part A)
library(ggplot2)
ggplot(IBSdata, aes(x=IBS)) + geom_histogram(bins = 31, color="black", fill="grey") + 
  ggtitle("Distribution of IBS Relationships") +
  theme_bw() + #remove the grey background from the graph
  theme(plot.title = element_text(hjust = 0.5), #center the title of graph
        panel.grid.major.x = element_blank() , #remove major verticle grid lines
        panel.grid.minor.x = element_blank() , #remove minor verticle grid lines
        panel.grid.minor.y = element_blank() , #remove minor horizontal grid lines
        panel.grid.major.y = element_blank()) + #remove major horizontal grid lines
  ylab("Number of Pairs") #label y axis

#Subset of Figure A
IBSdata_Filter <- IBSdata[ which(IBSdata$IBS >=0.95), ] #look more closely at values > 0.95
library(ggplot2)
ggplot(IBSdata_Filter, aes(x=IBS)) + geom_histogram(bins=6, color="black", fill="grey") + 
  ggtitle("Distribution of IBS Relationships") +
  theme_bw() + #remove grey background from IBS relationships
  theme(plot.title = element_text(hjust = 0.5),
        panel.grid.major.x = element_blank() , #remove major verticle grid lines
        panel.grid.minor.x = element_blank() , #remove minor verticle grid lines
        panel.grid.minor.y = element_blank() , #remove minor horizontal grid lines
        panel.grid.major.y = element_blank()) + #remove major horizontal grid lines
  ylab("Number of Pairs") #label y axis

#--------------------------------------------------------------------------------------------------------------
#Below is code used to create figure 2 using only IBS data provided in additional materials for the paper
#IBS values of each line with it's 10 closest lines

setwd("../Data/additional_materials")
IBSdata <- read.csv("IBS_Pairs.csv", header = TRUE)

IBS2 <- IBSdata[!(IBSdata$IBS > 1.0),]

#check the number of rows in the dataframe
nrow(IBSdata)

#this ensures that all pairs are unique
length(unique(IBSdata$Pairs))

#Figure A
library(ggplot2)
ggplot(IBSdata, aes(x=IBS)) + geom_histogram(bins = 31, color="black", fill="grey") + 
  ggtitle("Distribution of IBS Relationships for Closely Related Lines") +
  theme_bw() + #remove the grey background from the graph
  theme(plot.title = element_text(hjust = 0.5), #center the title of graph
        panel.grid.major.x = element_blank() , #remove major verticle grid lines
        panel.grid.minor.x = element_blank() , #remove minor verticle grid lines
        panel.grid.minor.y = element_blank() , #remove minor horizontal grid lines
        panel.grid.major.y = element_blank()) + #remove major horizontal grid lines
  ylab("Number of Pairs") #label y axis

#Subset of Figure A
IBSdata_Filter <- IBSdata[ which(IBSdata$IBS >=0.95), ] #look more closely at values > 0.95
library(ggplot2)
ggplot(IBSdata_Filter, aes(x=IBS)) + geom_histogram(bins=6, color="black", fill="grey") + 
  ggtitle("Distribution of IBS Relationships for Closely Related Lines") +
  theme_bw() + #remove grey background from IBS relationships
  theme(plot.title = element_text(hjust = 0.5),
        panel.grid.major.x = element_blank() , #remove major verticle grid lines
        panel.grid.minor.x = element_blank() , #remove minor verticle grid lines
        panel.grid.minor.y = element_blank() , #remove minor horizontal grid lines
        panel.grid.major.y = element_blank()) + #remove major horizontal grid lines
  ylab("Number of Pairs") #label y axis