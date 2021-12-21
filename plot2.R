# ==========
#PLOT 2
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

## Plot 2
with(power_subset, {
  plot(Global_active_power ~ Datetime, type = "l",
       ylab = "Global Active Power (KWh)", xlab = "")
      })

# Print
dev.copy(png, file = "plot2.png", height = 480, width = 480)

dev.off()
