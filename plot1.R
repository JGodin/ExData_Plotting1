 
setwd("~/Desktop/EDA/Project1")
 
fullData<-read.csv("household_power_consumption.txt", header=TRUE, sep=";", na.strings="?")
fullData[1:10, ]

library(lubridate)

fullData$Date<-dmy(fullData$Date)

subData<-subset(fullData, julian(Date)>=julian(as.Date("2007-02-01")) 
      & julian(Date)<=julian(as.Date("2007-02-02")))
								
			

