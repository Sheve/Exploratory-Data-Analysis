# This script creates plot 2 - time series of Global Active power for the period 1.2.2007-2.2.2007

# Downloading and subsetting the data
url="https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url,destfile="household_power_consumption.zip",method="curl")
unzip("household_power_consumption.zip")
file="household_power_consumption.txt"
data=read.csv(file,sep=";",comment.char="\"",colClasses=c("character","character",rep("numeric",7)),na.strings="?")
data_subset=data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]

# Plotting into png file
png(file="plot2.png",width=480,height=480)
plot(as.POSIXct(paste(data_subset$Date, data_subset$Time), format= "%d/%m/%Y %H:%M:%S"),data_subset$Global_active_power,ylab="Global Active Power (kilowatts)",xlab="", type="l")
dev.off()