

library(data.table)


setwd("~/Desktop/datasciencecoursera/Exploratory Data Analyses") 

# Read in data                
power_data <- read.csv("household_power_consumption.txt", header = TRUE, sep=';', na.strings = "?") 
                       
# Subset data from 1st to 2nd Feb

power_subset <- subset(power_data, Date %in% c("1/2/2007","2/2/2007"))

# Re-format date
power_subset$Date <- as.Date(power_subset$Date, format = "%d/%m/%Y")

# plot 1
hist(power_subset$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (KWh)", ylab = "Frequency", col = "Red")

png("plot1.png", width=480, height=480) #save to file
dev.off()

# plot 2













