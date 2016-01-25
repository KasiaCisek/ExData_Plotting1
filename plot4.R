#read data file
data <- read.delim("household_power_consumption.txt", ";", header=TRUE)

#filter data for correct dates
data2 <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

#converts variables to numeric
data2$Global_active_power <- as.numeric(as.character(data2$Global_active_power))
data2$Global_reactive_power <- as.numeric(as.character(data2$Global_reactive_power))
data2$Sub_metering_1 <- as.numeric(as.character(data2$Sub_metering_1))
data2$Sub_metering_2 <- as.numeric(as.character(data2$Sub_metering_2))
data2$Sub_metering_3 <- as.numeric(as.character(data2$Sub_metering_3))
data2$Voltage <- as.numeric(as.character(data2$Voltage))

#creates additional column that combines data and time values
data2$TimeFull <-paste(data2$Date, data2$Time)
par(mfcol = c(2,2))

# 1st graph of date/time vs global active power data
plot(strptime(data2$TimeFull, "%d/%m/%Y %H:%M:%S"), data2$Global_active_power, type = "l", 
     xlab = "", ylab = "Global Active Power(kilowatts)")

#2nd graph in 1st column 1 ; datetime v sub metering 1 data
plot(strptime(data2$TimeFull, "%d/%m/%Y %H:%M:%S"), data2$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")

# Addition of: line in red (sub metering 2), line in blue (sub metering 3) & legend
lines(strptime(data2$TimeFull, "%d/%m/%Y %H:%M:%S"), data2$Sub_metering_2, type = "l", col = "red" )
lines(strptime(data2$TimeFull, "%d/%m/%Y %H:%M:%S"), data2$Sub_metering_3, type = "l", col = "blue" )
legend("topright", lty= 1, col = c("Black", "red", "blue"), legend = c( "Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#1st graph in 2nd column; datetime v voltage
plot(strptime(data2$TimeFull, "%d/%m/%Y %H:%M:%S"), data2$Voltage, type = "l", 
     xlab = "datetime", ylab = "Voltage")

#2nd graph in 2nd column; datetime v global reactive power
plot(strptime(data2$TimeFull, "%d/%m/%Y %H:%M:%S"), data2$Global_reactive_power, type = "l", 
     xlab = "datetime", ylab = "Global_reactive_power")
dev.copy(png, filename = "plot4.png",
         width = 480, height = 480, units = "px")
dev.off()