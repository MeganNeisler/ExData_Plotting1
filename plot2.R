#Read text data file
dataFile <- "./household_power_consumption.txt"
EPCdata <- read.table(dataFile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
# subset for dates  2007-02-01 and 2007-02-02
DateData <- EPCdata[EPCdata$Date %in% c("1/2/2007","2/2/2007") ,]

#Convert the dates
datetime <- strptime(paste(DateData$Date, DateData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 
# subset for global active power data
GlobalActivePower <- as.numeric(DateData$Global_active_power)
#Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
png("plot2.png", width=480, height=480)
plot(datetime, globalActivePower, type="l", xlab="", ylab="Global Active Power (kilowatts)")
# turn off graphics device
dev.off()
