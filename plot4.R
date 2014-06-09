epconsumption <- read.table("household_power_consumption.txt", header = T, sep = ";",
                            nrows = 69518, na.strings = "?")

# Subsetting just the rows corresponding to 1/2/2007 and 2/2/2007
epconsumption <- epconsumption[66637:69516, ]

# Converting Date and Time variables to their respective formats
epconsumption$Time <- strptime(paste(epconsumption$Date, epconsumption$Time, sep=" "),
                               "%d/%m/%Y %H:%M:%S")
epconsumption$Date <- as.Date(epconsumption$Date, format = "%d/%m/%Y")

# Plotting
png("plot4.png")

par(mfcol = c(2, 2))

plot(epconsumption$Time, epconsumption$Global_active_power, type = "l",
     ylab = "Global Active Power", xlab = "")

plot(epconsumption$Time, epconsumption$Sub_metering_1, type = "l",
     ylab = "Energy sub metering", xlab = "")
lines(epconsumption$Time, epconsumption$Sub_metering_2, col = 2)
lines(epconsumption$Time, epconsumption$Sub_metering_3, col = 4)
legend("topright", lty = 1, col = c(1, 2, 4), 
       legend = tail(names(epconsumption), 3), bty = "n")

plot(epconsumption$Time, epconsumption$Voltage, type = "l", xlab = "datetime",
     ylab = "Voltage")

with(epconsumption, plot(Time, Global_reactive_power, type = "l", xlab = "datetime"))

dev.off()
