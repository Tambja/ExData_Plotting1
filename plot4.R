# ==========
#PLOT 4
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

## Plot 4

par(mfrow=c(2,2), mar=c(4,4,2,2))
with(power_subset, {
  plot(Global_active_power ~ Datetime, type="l", 
       ylab="Global Active Power (KWh)", xlab = "")
  plot(Voltage ~ Datetime, type="l", 
       ylab = "Voltage (volt)", xlab = "")
  plot(Sub_metering_1 ~ Datetime, type = "l", 
       ylab="Global Active Power (KWh)", xlab = "")
  lines(Sub_metering_2 ~ Datetime, col = 'Red')
  lines(Sub_metering_3 ~ Datetime, col = 'Blue')
  legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, bty = "n",
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power ~ Datetime, type = "l", 
       ylab = "Global Rective Power (KWh)",xlab = "")
})

# Print
dev.copy(png, file="plot4.png", height=480, width=480)

dev.off()
