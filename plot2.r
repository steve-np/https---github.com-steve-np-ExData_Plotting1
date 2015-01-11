# Scatterplot
# Data is at https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# We know this site as the Electric Power Consumption DB at the UC Irvine Machine Learning Repository
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
ed <- read.table(unz(temp, "household_power_consumption.txt"), header = TRUE, sep = ";", nrows = 2075260, na.strings = "?" )
unlink(temp)
# Get the Date column into a form that we can subset 
ed$Date <- as.Date(as.factor(ed$Date), format = "%d/%m/%Y")
# Subset the Date to get just the rows we want
ed <- ed[with(ed, ed$Date == "2007-02-01" | ed$Date == "2007-02-02"), ]
# Make the class of the Date and Time columns compatible, then combine them. This new variable will be our X-axis
datetime <- as.POSIXct(paste(as.character(ed$Date), as.character(ed$Time)))
# Make a png file
png(file = "plot2.png", width = 480, height = 480, units = "px", pointsize = 12)
plot(ed$Global_active_power~datetime, cex = 0.5, mar = c(4,4,2,2), pch = 20, 
     col = "black", xlab = "", ylab = "Global Active Power (kilowatts)", sub = NA)
# The plain point characters look smudged, so lets use lines instead
lines(ed$Global_active_power~datetime)
dev.off()