d<-read.table('household_power_consumption.txt', header=T, sep=";", na.strings = "?") # Read data
d$Date <- as.Date(d$Date, format="%d/%m/%Y") # convert Date to Date class
d$Time <- paste(d$Date, d$Time, sep=" ") # convert Time to Time class
d$Time <- strptime(d$Time, "%Y-%m-%d %H:%M:%S")

d <-subset(d, d$Date == "2007-02-01" | d$Date == "2007-02-02") # Extract data with dates 2007-02-01 and 2007-02-02

png("plot4.png", width = 480, height = 480)
par(mfrow=c(2,2))
# draw first plot (1,1)
plot(d$Time, d$Global_active_power, type="l", ylab = "Global Active Power (kilowatts)")

# draw second plot (1,2)
plot(d$Time, d$Voltage, type="l", ylab = "Voltage", xlab = "datetime")

# draw third plot (2,1)
limit <- range(d$Sub_metering_1) 
plot(d$Time, d$Sub_metering_1, type = "l", ylab = "Energy sub metering", xlab = "", ylim = limit)
par(new = T)
plot(d$Time, d$Sub_metering_2, type = "l", col="red", ylab = "", xlab = "", ylim = limit, axes = F)
par(new = T)
plot(d$Time, d$Sub_metering_3, type = "l", col="blue", ylab = "", xlab = "", ylim = limit, axes = F)
legend('topright', c("Sub_metering_1", "Sub_meterint_2", "Sub_metering_3"), lty=c(1,1,1), bty = "n", col=c("black", "red", "blue"))

# draw fourth plot (2,2)
plot(d$Time, d$Global_reactive_power, type="l", ylab="Global_reactive_power", xlab="datetime")

dev.off() 