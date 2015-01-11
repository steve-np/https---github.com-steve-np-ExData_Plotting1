# README for Project 1 in the Exploratory Data Analysis course within the Data Science Specialization from JHU on Coursera
# Calculate our memory needs:
## # rows * # columns * 8 bytes / 2^20
## 2,075,259 * 9 * 8 /2^20 = 142.4967 MB required to load the database
#
# Data is at https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# We know this site as the Electric Power Consumption Database at the UC Irvine Machine Learning Repository: http://archive.ics.uci.edu/ml/
# Typical data in the df:
# Date;Time;Global_active_power;Global_reactive_power;Voltage;Global_intensity;Sub_metering_1;Sub_metering_2;Sub_metering_3
# 1/2/2007;00:00:00;0.326;0.128;243.150;1.400;0.000;0.000;0.000
# 1/2/2007;00:01:00;0.326;0.130;243.320;1.400;0.000;0.000;0.000
# 1/2/2007;00:02:00;0.324;0.132;243.510;1.400;0.000;0.000;0.000
#
# Locally, we use this directory for the project
setwd("E:/My Documents/Coursera-Data Science/Exploratory Data Analysis/Project 1")
#
#
# Data is at https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
# We know this site as the Electric Power Consumption DB at the UC Irvine Machine Learning Repository: http://archive.ics.uci.edu/ml/
# For general consumption, we remove the setwd command and use this fetch command:
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)