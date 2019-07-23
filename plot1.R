# PLOT 1

# We start by downloading the data we need for the analysis

# download the file
if (!file.exists("data")){
  dir.create("data")
}
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file( url, destfile = ".//data//data.zip" )
dateDownloaded <- date()
unzip(".//data//data.zip", exdir = ".//data") #using the name of the file & not the pathname will throw an error

# check if the file has been downloaded
list.files(".//data")

#Reading, naming and subsetting power consumption data
power <- read.table(".//data//household_power_consumption.txt",skip=1,sep=";")
names(power) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subpower <- subset(power,power$Date=="1/2/2007" | power$Date =="2/2/2007")

#calling the basic plot function
hist(as.numeric(as.character(subpower$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

# annotating graph
title(main="Global Active Power")