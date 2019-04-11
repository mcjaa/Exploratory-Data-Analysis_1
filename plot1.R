getwd()
setwd("D:\\Coursera\\data")

rm(list=ls())
library(data.table)
housePower<- read.table("housePower.txt", sep=";", header = T,  na.strings="?")
head(housePower,3)
str(housePower)

housePower$Date <- as.Date(housePower$Date, "%d/%m/%Y")

housePower<-subset(housePower, Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02") )


## Construct the plot and save it to a PNG file
## with a width of 480 pixels and a height of 480 pixels.

png("plot1.png", width=480, height=480)

## Plot 1
hist(housePower[, "Global_active_power"], main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

dev.off()
