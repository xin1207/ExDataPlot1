rm(list=ls())

#reading data into R:

powerconsumption <- read.table('D:/Xiao Xin/My Folder/Coursera/Data Science/04 Exploratory Data Analysis/Assignment 1/household_power_consumption.txt',sep=";",nrows= 2075260, header=TRUE, quote= "", strip.white=TRUE, stringsAsFactors = FALSE, na.strings= "?")

# Subsetting the full data to obtain the data related to two days:

sub_powerconsumption <- subset(powerconsumption, (powerconsumption$Date == "1/2/2007" | powerconsumption$Date== "2/2/2007"))

# Changing the class of Date variable from character to Date: 

sub_powerconsumption$Date <- as.Date(sub_powerconsumption$Date, format = "%d/%m/%Y")

# Creating the plot1:

png("plot1.png", width = 480, height = 480)

hist(sub_powerconsumption$Global_active_power, main="Global Active Power",col='red',ylab= "Frequency", xlab="Global Active Power(kilowatts)")
dev.off()
