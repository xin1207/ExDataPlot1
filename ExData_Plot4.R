rm(list=ls())

#reading data into R:

powerconsumption <- read.table('D:/Xiao Xin/My Folder/Coursera/Data Science/04 Exploratory Data Analysis/Assignment 1/household_power_consumption.txt',sep=";",nrows= 2075260, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")

# Subsetting the full data to obtain the data related to two days:

sub_powerconsumption <- subset(powerconsumption, (powerconsumption$Date == "1/2/2007" | powerconsumption$Date== "2/2/2007"))

# Changing the class of Date variable from character to Date: 

sub_powerconsumption$Date <- as.Date(sub_powerconsumption$Date, format = "%d/%m/%Y")

# Combining the Date and Time variable and creating a new column in dataset named "DateTime":

sub_powerconsumption$DateTime <- as.POSIXct(paste(sub_powerconsumption$Date, sub_powerconsumption$Time))

# Creating the plot4:

png("plot4.png", width = 480, height = 480)
par(mfcol=c(2,2))

plot(sub_powerconsumption$DateTime, sub_powerconsumption$Global_active_power, type="l", ylab= "Global Active Power", xlab="")
plot(sub_powerconsumption$DateTime, sub_powerconsumption$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")

lines(sub_powerconsumption$DateTime, sub_powerconsumption$Sub_metering_2, type="l", col="red")
lines(sub_powerconsumption$DateTime, sub_powerconsumption$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

plot(sub_powerconsumption$DateTime,sub_powerconsumption$Voltage,type="l",ylab="Voltage",xlab="datetime")
plot(sub_powerconsumption$DateTime,sub_powerconsumption$Global_reactive_power,type='l',xlab="datetime",ylab="Global_reactive_power")
dev.off()