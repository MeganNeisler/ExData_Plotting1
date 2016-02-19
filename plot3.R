#Read text data file
dataFile <- "./household_power_consumption.txt"
EPCdata <- read.table(dataFile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
# subset for dates  2007-02-01 and 2007-02-02
DateData <- EPCdata[EPCdata$Date %in% c("1/2/2007","2/2/2007") ,]

#Convert the dates
datetime <- strptime(paste(DateData$Date, DateData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
# subset for submetering data
subMetering1 <- as.numeric(DateData$Sub_metering_1)
subMetering2 <- as.numeric(DateData$Sub_metering_2)
subMetering3 <- as.numeric(DateData$Sub_metering_3)

#Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
png("plot3.png", width=480, height=480)
plot(datetime, subMetering1, type = "l", xlab = "", ylab = "Energy sub metering")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))
#turn off graphics device
dev.off()