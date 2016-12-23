#Library
library(dplyr)

#Read, clean & subset data
my.data <- read.table(file="household_power_consumption.txt", header=TRUE,sep=";",stringsAsFactors=FALSE, na.strings = "?")
my.data$Date <- paste(my.data$Date,my.data$Time)
my.data <- cbind(my.data,strptime(my.data$Date, format="%d/%m/%Y %H:%M"))
my.data$Date <- NULL
my.data$Time <- NULL
colnames(my.data)[8] <- "Date"
my.data <- subset(my.data, Date >= "2007-02-01" & Date <= "2007-02-03" )

#write to png
png("plot4.png",width=480,height=480)
par(mfcol=c(2,2))

#1st
with(my.data, plot(x=Date,y=Global_active_power,type="l",ylab="Global active power (kilowatts)",xlab=""))

#2nd
with(my.data, plot(x=Date,y=Sub_metering_1,type="l",ylab="Energy sub metering",xlab=""))
lines(y=my.data$Sub_metering_2, x=my.data$Date, col="red")
lines(y=my.data$Sub_metering_3, x=my.data$Date, col="blue")
legend("topright",lty=1, bty="n" ,legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),col = c("black", "red", "blue"))

#3rd
with(my.data, plot(x=Date,y=Voltage,type="l",ylab="Voltage",xlab="datetime"))

#4th
with(my.data, plot(x=Date,y=Global_reactive_power,type="l",xlab="datetime"))

dev.off()