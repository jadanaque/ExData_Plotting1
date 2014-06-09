epconsumption <- read.table("household_power_consumption.txt", header = T, sep = ";",
                            nrows = 69518, na.strings = "?")

# Subsetting just the rows corresponding to 1/2/2007 and 2/2/2007
epconsumption <- epconsumption[66637:69516, ]

# Converting Date and Time variables to their respective formats
epconsumption$Time <- strptime(paste(epconsumption$Date, epconsumption$Time, sep=" "),
                               "%d/%m/%Y %H:%M:%S")
epconsumption$Date <- as.Date(epconsumption$Date, format = "%d/%m/%Y")

# Plotting
png("plot1.png")
hist(epconsumption$Global_active_power, col = 2, main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

dev.off()