# Loading "dplyr" package
library(dplyr)

# Loading data into R
epConsumption <- read.table("household_power_consumption.txt", header = T, sep = ";", nrows = 69518, na.strings = "?")

# Subsetting to only data from the dates 2007-02-01 and 2007-02-02
# Our Date variable is in format: dd/mm/yyyy, i.e., we are looking for the values 1/2/2007 and 2/2/2007
epConsumption <- filter(epConsumption, Date %in% c("1/2/2007", "2/2/2007"))

# Transforming our Date and Time variables
epConsumption$Date <- as.Date(epConsumption$Date, format="%d/%m/%Y")
	# epConsumption <- mutate(epConsumption, Date = as.Date(Date, format = "%d/%m/%Y"))

epConsumption$Time <- strptime(paste(epConsumption$Date, epConsumption$Time), "%Y-%m-%d %H:%M:%S")

# Plotting

png("plot4.png")

par(mfrow = c(2, 2))
with(epConsumption, {
	plot(Time, Global_active_power, type = "l", ylab = "Global Active Power", xlab = "")
	plot(Time, Voltage, type = "l", xlab = "datetime")
	plot(Time, Sub_metering_1, type = "l", ylab = "Enery sub metering", xlab = "")
	lines(Time, Sub_metering_2, col = 2)
	lines(Time, Sub_metering_3, col = 4)
	legend("topright", legend = tail(names(epConsumption), 3), lty = 1, col = c(1, 2, 4), bty = "n")
	plot(Time, Global_reactive_power, type = "l", xlab = "datetime")
})

dev.off()