#Read text data file
dataFile <- "./household_power_consumption.txt"
EPCdata <- read.table(dataFile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
# subset for dates  2007-02-01 and 2007-02-02
DateData <- EPCdata[EPCdata$Date %in% c("1/2/2007","2/2/2007") ,]

#Convert the dates
datetime <- strptime(paste(DateData$Date, DateData$Time, sep=" "), "%d/%m/%Y %H:%M:%S")

#subset for the needed data
globalActivePower <- as.numeric(DateData$Global_active_power)
globalReactivePower <- as.numeric(DateData$Global_reactive_power)
voltage <- as.numeric(DateData$Voltage)
subMetering1 <- as.numeric(DateData$Sub_metering_1)
subMetering2 <- as.numeric(DateData$Sub_metering_2)
subMetering3 <- as.numeric(DateData$Sub_metering_3)

#Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
png("plot4.png", width=480, height=480)
#Use mfrow to allow for multiple rows of plots
par(mfrow = c(2, 2), mar=c(4,4,2,1), oma=c(0,0,2,0))
#plot 1
plot(datetime, globalActivePower, type = "l", xlab= "", ylab= "Global Active Power", col = "black")
#plot 2
plot(datetime, voltage, type = "l", xlab = "datetime", ylab = "Voltage", col = "black")
#plot 3
plot(datetime, subMetering1, type = "l", xlab = "", ylab = "Energy sub metering", col= "black")
lines(datetime, subMetering2, type="l", col="red")
lines(datetime, subMetering3, type="l", col="blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2, col=c("black", "red", "blue"))

#plot 4
plot(datetime, globalReactivePower, type = "l", xlab = "datetime", ylab = "Global_reactive_power", col = "black")

#turn graphics device off
dev.off()
