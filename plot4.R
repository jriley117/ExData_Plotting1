## plot4.R
# setwd("~/Documents/DSU/coursera")

# read in the data without factors
powerdata <- read.table("household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?")

# paste the two date & time strings together
powerdata$Datetime <- strptime(paste(powerdata$Date,powerdata$Time), format="%d/%m/%Y %H:%M:%S")

#Take character vectors & turn into dates w/ as.Date().  
powerdata$Date <- as.Date(powerdata$Date,format="%d/%m/%Y")

# Select the rows between the dates 2007-02-01 and 2007-02-02;
powerdata <- powerdata[powerdata$Date >= as.Date("2007-02-01") & powerdata$Date <= as.Date("2007-02-02"),]

png(filename="plot4.png", width=480, height=480)
par(mfrow = c(2,2)) # Four plots on a page

# upper left:
plot(powerdata$Datetime, powerdata$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

# upper right:
plot(powerdata$Datetime, powerdata$Voltage, type="l", xlab="datetime", ylab="Voltage")

#lower left:
plot(powerdata$Datetime, powerdata$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
lines(powerdata$Datetime, powerdata$Sub_metering_2, col = "red")
lines(powerdata$Datetime, powerdata$Sub_metering_3, col = "blue")
legend("topright", lwd=1, bty="n", col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# lower right:
plot(powerdata$Datetime, powerdata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()