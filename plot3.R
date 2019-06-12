# RRosenberg Exploratory Data Analysis Week 1 assignment 12/06/2019

# Set datapath equal to location of file household_power_consumption.txt
datapath<-"exdata_data_household_power_consumption/household_power_consumption.txt"

# Define column classes
classes <- c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric")

# Read in data relating to dates 2007-02-01 and 2007-02-02
power.data<-read.csv(datapath,header=TRUE,sep=";", colClasses=classes, na.strings=c("?"))[read.csv(datapath,header=TRUE,sep=";", colClasses=classes, na.strings=c("?"))$Date %in% c("1/2/2007","2/2/2007"),]

#Add new variable that combines Date and Time strings and converts to date and time variables
library(dplyr)


power.data<-mutate(power.data, datentime=paste( Date, Time))
power.data<-mutate(power.data, new.date = as.Date(strptime(datentime, format="%d/%m/%Y %H:%M:%S")))
power.data<-mutate(power.data, new.time = as.POSIXct(datentime, format="%d/%m/%Y %H:%M:%S"))

# Now to create plot3.png

png("plot3.png", width = 480, height = 480) 

with(power.data, plot(new.time, Sub_metering_1,type="l", col="black", ylab="Energy sub metering", xlab=""))
with(power.data, lines(new.time, Sub_metering_2,type="l", col="red"))
with(power.data, lines(new.time, Sub_metering_3,type="l", col="blue"))
legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()







