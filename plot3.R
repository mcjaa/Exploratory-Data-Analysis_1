
rm(list=ls())
library(data.table)
housePower<- read.table("housePower.txt", sep=";", header = T,  na.strings="?")
head(housePower,3)
str(housePower)

housePower$Date <- as.Date(housePower$Date, "%d/%m/%Y")

housePower<-subset(housePower, Date>=as.Date("2007-02-01") & Date<=as.Date("2007-02-02") )


## Combine Date and Time column
dateTime <- paste(housePower$Date, housePower$Time)
dateTime <- setNames(dateTime, "DateTime")
housePower <- cbind(dateTime, housePower)
housePower$dateTime <- as.POSIXct(dateTime)

## Construct the plot and save it to a PNG file
## with a width of 480 pixels and a height of 480 pixels.

png("plot3.png", width=480, height=480)

# Plot 3
plot(housePower[, "dateTime"], housePower[, "Sub_metering_1"], type="l", xlab="", ylab="Energy sub metering")
lines(housePower[, "dateTime"], housePower[, "Sub_metering_2"],col="red")
lines(housePower[, "dateTime"], housePower[, "Sub_metering_3"],col="blue")
legend("topright"
       , col=c("black","red","blue")
       , c("Sub_metering_1  ","Sub_metering_2  ", "Sub_metering_3  ")
       ,lty=c(1,1), lwd=c(1,1))

dev.off()
