# Clean up workspace
rm(list=ls())

# Set the working directory
setwd("D:/datasciencecoursera1/EDA assignment 1")

# Read the full data set
household_power_consumption <- read.csv("household_power_consumption.txt", sep=";",na.strings = "?")

# Subset the data between the requested dates
household_power_consumption_subset <- household_power_consumption[household_power_consumption$Date %in% c("1/2/2007", "2/2/2007"), ]

# Remove the full data set from the workspace
rm(household_power_consumption)

#Plot 1
png("plot1.png", width = 480, height = 480)
with(household_power_consumption_subset, hist(Global_active_power, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)"))
dev.off()
