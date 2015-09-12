# Create plot3.png

data1 <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), 
                    sep = ";", stringsAsFactors = FALSE)
data1_names <- c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                 "Voltage", "Global_intensity", "Sub_metering_1", 
                 "Sub_metering_2", "Sub_metering_3")
names(data1) <- data1_names
data1$Date_Time <- paste(data1$Date, data1$Time)
data1$Date_Time <- strptime(data1$Date_Time, "%d/%m/%Y %T")

png(filename = "plot3.png")
plot(data1$Date_Time, data1$Sub_metering_1, type = "l", 
     col = "black", xlab = "", ylab = "Energy sub metering")
lines(data1$Date_Time, data1$Sub_metering_2, type = "l", 
     col = "red", xlab = "", ylab = "")
lines(data1$Date_Time, data1$Sub_metering_3, type = "l", 
     col = "blue", xlab = "", ylab = "")
legend("topright",lty = 1, col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()