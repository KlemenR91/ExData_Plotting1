#Read, clean & subset data
my.data <- read.table(file="household_power_consumption.txt", header=TRUE,sep=";",stringsAsFactors=FALSE, na.strings = "?")
my.data$Date <- paste(my.data$Date,my.data$Time)
my.data <- cbind(my.data,strptime(my.data$Date, format="%d/%m/%Y %H:%M"))
my.data$Date <- NULL
my.data$Time <- NULL
colnames(my.data)[8] <- "Date"
my.data <- subset(my.data, Date >= "2007-02-01" & Date <= "2007-02-03" )

png("plot1.png",width=480,height=480)
hist(my.data$Global_active_power,xlab="Global active power (kilowatts)", ylab = "Frequency", col="red")
dev.off()