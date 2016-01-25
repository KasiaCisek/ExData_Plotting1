#read data file
data <- read.delim("household_power_consumption.txt", ";", header=TRUE)
#filter data for correct dates
data2 <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")
#converts Global Active Power to numeric
data2$Global_active_power <- as.numeric(as.character(data2$Global_active_power))
#creates additional column that combines data and time values
data2$TimeFull <-paste(data2$Date, data2$Time)
par(mfcol = c(1,1))
#creates histogram for Global Active Power
hist(data2$Global_active_power, col = "red", main = "Global Active Power", 
xlab = "Global Active Power (kilowatts)")
dev.copy(png, filename = "plot1.png",
    width = 480, height = 480, units = "px")
dev.off()