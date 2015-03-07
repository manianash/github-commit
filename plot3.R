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

# Create variable datetime
household_power_consumption_subset$datetime <- strptime(paste(household_power_consumption_subset$Date, household_power_consumption_subset$Time, sep = " "), "%d/%m/%Y %H:%M:%S")

#Plot 3
png("plot3.png", width = 480, height = 480)
with(household_power_consumption_subset, {
  plot(datetime, Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
  lines(datetime, Sub_metering_2, type = "l", col = "red")
  lines(datetime, Sub_metering_3, type = "l", col = "blue")
  
  #Construct the legend
  labels <- c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3")
  colors <- c("black", "red", "blue")
  legend("topright", labels, lty = 1, col = colors)
})
dev.off()