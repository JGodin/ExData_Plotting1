 
setwd("~/Desktop/EDA/Project1")
 
fullData<-read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")

library(lubridate)

fullData$Date<-dmy(fullData$Date)

subData<-subset(fullData, julian(Date)>=julian(as.Date("2007-02-01")) 
      & julian(Date)<=julian(as.Date("2007-02-02")))

subData$DateTime<-ymd_hms(paste(subData$Date, subData$Time))
										
png(file="plot2.png")

plot(subData$DateTime, as.numeric(subData$Global_active_power), type="l", xlab="", ylab="Global Active Power (kilowatts)" )

dev.off()


?plot
