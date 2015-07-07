d<-read.table('household_power_consumption.txt', header=T, sep=";", na.strings = "?") # Read data
d$Date <- as.Date(d$Date, format="%d/%m/%Y") # convert Date to Date class
d$Time <- paste(d$Date, d$Time, sep=" ") # convert Time to Time class
d$Time <- strptime(d$Time, "%Y-%m-%d %H:%M:%S")

d <-subset(d, d$Date == "2007-02-01" | d$Date == "2007-02-02") # Extract data with dates 2007-02-01 and 2007-02-02

png("plot1.png", width = 480, height = 480)
hist(d$Global_active_power, col='red', main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()