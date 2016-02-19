#Read text data file
dataFile <- "./household_power_consumption.txt"
EPCdata <- read.table(dataFile, header = TRUE, sep = ";", stringsAsFactors = FALSE, dec = ".")
# subset for dates  2007-02-01 and 2007-02-02
DateData <- EPCdata[EPCdata$Date %in% c("1/2/2007","2/2/2007") ,]

# subset for Global Active Power
globalActivePower <- as.numeric(DateData$Global_active_power)
#Construct the plot and save it to a PNG file with a width of 480 pixels and a height of 480 pixels.
png("plot1.png", width=480, height=480)
#create histogram plot using R base plotting function
hist(globalActivePower, col = "red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
#close graphics device
dev.off()