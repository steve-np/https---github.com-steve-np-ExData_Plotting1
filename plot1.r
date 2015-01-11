# Histogram
# Data is at https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# We know this site as the Electric Power Consumption DB at the UC Irvine Machine Learning Repository
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
ed <- read.table(unz(temp, "household_power_consumption.txt"), header = TRUE, sep = ";", nrows = 2075260, na.strings = "?" )
unlink(temp)
#
# Convert the dates from factors to Date format so we can select the ones we want: 
ed$Date <- as.Date(as.factor(ed$Date), format = "%d/%m/%Y")
#
# Select the dates we are interested in:
ed <- ed[with(ed, ed$Date == "2007-02-01" | ed$Date == "2007-02-02"), ]
#
# This will convert the time from a factor to POSIXlt:
ed$Time <- strptime(as.character(ed$Time), format = "%H:%M:%S")
#
png(file = "plot1.png", width = 480, height = 480, units = "px", pointsize = 12)
hist(ed$Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)", ylab = "Frequency")
dev.off()