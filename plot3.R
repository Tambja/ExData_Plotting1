# ==========
#PLOT 3
# ==========

library(data.table)


setwd("~/Desktop/datasciencecoursera/Exploratory Data Analyses") 

# Read in data                
power_data <- read.csv("household_power_consumption.txt", header = TRUE, sep=';', na.strings = "?") 

# Subset data from 1st to 2nd Feb

power_subset <- subset(power_data, Date %in% c("1/2/2007","2/2/2007"))

# Re-format date
power_subset$Date <- as.Date(power_subset$Date, format = "%d/%m/%Y")
datetime <- paste(as.Date(power_subset$Date), power_subset$Time)
power_subset$Datetime <- as.POSIXct(datetime)

## Plot 3

with(power_subset, {
  plot(Sub_metering_1 ~ Datetime, type = "l",
       ylab = "Global Active Power (kilowatts)", xlab = "")
  lines(Sub_metering_2 ~ Datetime, col = 'Red')
  lines(Sub_metering_3 ~ Datetime, col = 'Blue')
    })
legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Print
dev.copy(png, file="plot2.png", height=480, width=480)

dev.off()

