## Read all data
all_data <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')
all_data$Date <- as.Date(all_data$Date, format="%d/%m/%Y")

## Subset the data
data <- subset(all_data, subset=(Date > "2007-01-31" & Date < "2007-02-03"))
rm(all_data)

## Dates conversion
data$DateTime <- as.POSIXct(paste(as.Date(data$Date), data$Time))

## Create Plot 1
plot(data$Global_active_power~data$DateTime, type="l",
     ylab="Global Active Power (kilowatts)", xlab="")

#Save as png file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
