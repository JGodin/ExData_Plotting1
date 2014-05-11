 
setwd("~/Desktop/EDA/Project1")
 
fullData<-read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

library(lubridate)

fullData$Date<-dmy(fullData$Date)

subData<-subset(fullData, julian(Date)>=julian(as.Date("2007-02-01")) 
      & julian(Date)<=julian(as.Date("2007-02-02")))

subData$DateTime<-ymd_hms(paste(subData$Date, subData$Time))
										
png(file="plot2.png")
plot(subData$DateTime, subData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(subData$DateTime, subData$Sub_metering_2, col="red")
lines(subData$DateTime, subData$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()





