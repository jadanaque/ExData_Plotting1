# Loading 'dplyr' package
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

png("plot1.png")

hist(epConsumption$Global_active_power, col = 2, main = "Global Active Power", xlab = "Global Active Power (kilowatts)")

dev.off()