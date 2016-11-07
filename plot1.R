## plot1.R
## Examine how household energy usage varies over a 2-day period in February, 2007
# setwd("~/Documents/DSU/coursera")

# read in the data without factors
powerdata <- read.table("household_power_consumption.txt",header=TRUE, sep=";", stringsAsFactors=FALSE, na.strings="?")

# Take character vectors & turn into dates w/ as.Date()
powerdata$Date <- as.Date(powerdata$Date,format="%d/%m/%Y")

# Select the rows between the dates 2007-02-01 and 2007-02-02 
powerdata <- powerdata[powerdata$Date >= as.Date("2007-02-01") & powerdata$Date <= as.Date("2007-02-02"),]


# Construct the plot and save to a PNG file with a width of 480 pixels and a height of 480 pixels
png(file = "plot1.png", width = 480, height = 480, units = "px")
hist(powerdata$Global_active_power,main = "Global Active Power", col="red", xlab = "Global Active Power (kilowatts)")
dev.off()  # Close the png file device
