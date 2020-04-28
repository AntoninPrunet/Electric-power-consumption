if (!file.exists("household_power_consumption.txt")) {
      download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "Household Power Consumption")
      unzip("Household Power Consumption")
}
library(data.table)
library(lubridate)
library(dplyr)
x<-fread("household_power_consumption.txt")
x$Date<-dmy(x$Date)
x<-filter(x,Date=="2007-02-01"|Date=="2007-02-02")
x$Global_active_power<-as.numeric(x$Global_active_power)
png("plot1.png",width=480, height=480)
hist(x$Global_active_power,main="Global Active Power",
     col="red",xlab="Global Active Power (kilowatts)",
     ylim=c(0,1200))
dev.off()
