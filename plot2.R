## plot2.R
# setwd("~/Documents/DSU/coursera")

# read in the data without factors
powerdata <- read.table("household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?")

# paste the two date & time strings together
powerdata$Datetime <- strptime(paste(powerdata$Date,powerdata$Time), format="%d/%m/%Y %H:%M:%S")

#Take character vectors & turn into dates using as.Date() 
powerdata$Date <- as.Date(powerdata$Date,format="%d/%m/%Y")

# Select the rows between the dates 2007-02-01 and 2007-02-02;
powerdata <- powerdata[powerdata$Date >= as.Date("2007-02-01") & powerdata$Date <= as.Date("2007-02-02"),]

# Construct the plot and save to a PNG file with a width of 480 pixels and a height of 480 pixels
png(filename="plot2.png", width=480, height=480)
plot(powerdata$Datetime, powerdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)") 

# Close the png file device
dev.off()
