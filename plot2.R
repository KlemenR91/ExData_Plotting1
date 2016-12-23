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

png("plot2.png",width=480,height=480)
with(my.data, plot(x=Date,y=Global_active_power,type="l",ylab="Global active power (kilowatts)",xlab=""))
dev.off()