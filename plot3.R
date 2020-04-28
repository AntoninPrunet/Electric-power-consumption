if (!file.exists("household_power_consumption.txt")) {
      download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "Household Power Consumption")
      unzip("Household Power Consumption")
}
Sys.setlocale("LC_TIME", "C")
library(data.table)
library(lubridate)
library(dplyr)
x<-fread("household_power_consumption.txt")
x$Date<-dmy(x$Date)
x<-filter(x,Date=="2007-02-01"|Date=="2007-02-02")
x$Global_active_power<-as.numeric(x$Global_active_power)

x<-mutate(x,t=hms(Time)+Date)
png("plot3.png",width=480, height=480)
with(x,plot(t,Sub_metering_1,type="l",xlab="",ylab="Energy sub metering"))
with(x,points(t,Sub_metering_2,type="l",col="red"))
with(x,points(t,Sub_metering_3,type="l",col="blue"))
legend("topright",col=c("black","blue","red"),
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=1)
dev.off()