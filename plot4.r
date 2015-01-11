# Multiple scatterplots on the same diagram
# Data is at https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# We know this site as the Electric Power Consumption DB at the UC Irvine Machine Learning Repository
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
ed <- read.table(unz(temp, "household_power_consumption.txt"), header = TRUE, sep = ";", nrows = 2075260, na.strings = "?" )
# Get the Date column into a form that we can subset 
ed$Date <- as.Date(as.factor(ed$Date), format = "%d/%m/%Y")
# Subset the Date to get just the rows we want
ed <- ed[with(ed, ed$Date == "2007-02-01" | ed$Date == "2007-02-02"), ]
# Make the class of the Date and Time columns compatible, then combine them. This new variable will be our X-axis
datetime <- as.POSIXct(paste(as.character(ed$Date), as.character(ed$Time)))
# Open the png device before making the calls with par, or you will only get the last plot in the file; screen will print normally.
png(file = "plot4.png", width = 480, height = 480, units = "px", pointsize = 12)
# Set up for 2 X 2 plots on this diagram
par(mfcol = c(2, 2)) # Didnt need this: , mar=c(4,4,0.5,0.5), oma=c(1.5,2,1,1
# Previously known as Plot 2, now in Upper Left using mfcol
plot(ed$Global_active_power~datetime, cex = 0.5, col = "black", 
     xlab = "", ylab = "Global Active Power (kilowatts)") # , mar = c(4,4,2,2), pch = 20,
lines(ed$Global_active_power~datetime)
# Previously known as Plot 3, now in Lower Left
plot(ed$Sub_metering_1~datetime, type = "n", xlab = "", ylab = "Energy sub metering")
lines(ed$Sub_metering_1~datetime, lty = 1, col = "black")  
lines(ed$Sub_metering_2~datetime, lty = 1, col = "red") 
lines(ed$Sub_metering_3~datetime, lty = 1, col = "blue") 
legend("topright",legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), bty = "n", lwd = 1, col = c("black", "red", "blue"))
# New plot in Upper Right - datetime vs Voltage
plot(ed$Voltage~datetime, cex = 0.25, col = "black", xlab = "", ylab = "Voltage")  
lines(ed$Voltage~datetime)
# New plot in Lower Right - datetime vs Global_reactive_power
plot(ed$Global_reactive_power~datetime, cex = 0.25, col = "black", xlab = "", ylab = "Global_reactive_power")  
lines(ed$Global_reactive_power~datetime)
dev.off()