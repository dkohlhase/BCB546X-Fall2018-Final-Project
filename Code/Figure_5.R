# set working directory to folder where MAF data from TASSEL is stored
setwd("./Data/TASSEL")

#read in all files that fit the pattern "Chr*_MAF.csv" into a list of dataframes
dataFiles <- lapply(Sys.glob("Chr*_MAF.csv"), read.csv)

#give these files names so we can refer to them in the for statement below
names(dataFiles) <- c("10", "1", "2", "3", "4", "5", "6", "7", "8", "9")

#for all i dataframes in list dataFiles, rename them as chr[[i]]
for(i in names(dataFiles)){
  d.frame <-
    assign(paste("chr", i, sep=""), dataFiles[[i]])
}

# bind all dataframes together
allchr <- rbind(chr1, chr2, chr3, chr4, chr5, chr6, chr7, chr8, chr9, chr10)

#graph data in histogram: % SNPs vs MAF
library(ggplot2)
ggplot(allchr, aes(x=Minor.Allele.Frequency)) + geom_histogram(bins=40,color="cyan3", fill="cyan3") + 
  ggtitle("Minor Allele Frequency Across SNPs") +
  scale_y_continuous(expand = c(0,0), labels = function(x) paste(x/10000)) +
  scale_x_continuous(expand = c(0,0), breaks=seq(0.00,0.50,0.02)) +
  ylab("% SNPs") +
  xlab("Minor Allele Frequency") +
  theme_bw() + #this removes grey background from graph
  theme( 
    panel.grid.major.x = element_blank() , #remove major verticle grid lines
    panel.grid.minor.x = element_blank() , #remove minor verticle grid lines
    panel.grid.minor.y = element_blank() , #remove minor horizontal grid lines
    panel.grid.major.y = element_line( size=.1, color="black" ) , #set the horizontal major grid lines so they don't disappear
    axis.text.x = element_text(angle = 90, hjust = 1) , # x axis labels set to 90 degrees
    plot.title = element_text(hjust = 0.5) #center the title of the graph
  )