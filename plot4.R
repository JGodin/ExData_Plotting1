 
setwd("~/Desktop/EDA/Project1")
 
fullData<-read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

library(lubridate)

fullData$Date<-dmy(fullData$Date)

subData<-subset(fullData, julian(Date)>=julian(as.Date("2007-02-01")) 
      & julian(Date)<=julian(as.Date("2007-02-02")))

subData$DateTime<-ymd_hms(paste(subData$Date, subData$Time))
										
png(file="plot3.png")

par(mfrow=c(2, 2), mar=c(4, 4, 2, 1), oma=c(0, 0, 0, 0))

plot(subData$DateTime, as.numeric(subData$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)" )

plot(subData$DateTime, as.numeric(subData$Voltage), type="l", ylab="Voltage", xlab="datetime")

plot(subData$DateTime, subData$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(subData$DateTime, subData$Sub_metering_2, col="red")
lines(subData$DateTime, subData$Sub_metering_3, col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

plot(subData$DateTime, as.numeric(subData$Global_reactive_power), type="l", xlab="datetime", ylab="Global_reative_power")

dev.off()




