library(xlsx)
setwd("../Romay_et_al_2013")
IBSdata <- read.csv("Additional_File_2.csv", header = TRUE)

x <- data.frame("Pairs"=NA, "IBS"=NA)
