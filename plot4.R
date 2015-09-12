# Create plot4.png

data1 <- read.table(pipe('grep "^[1-2]/2/2007" "household_power_consumption.txt"'), 
                    sep = ";", stringsAsFactors = FALSE)
data1_names <- c("Date", "Time", "Global_active_power", "Global_reactive_power", 
                 "Voltage", "Global_intensity", "Sub_metering_1", 
                 "Sub_metering_2", "Sub_metering_3")
names(data1) <- data1_names
data1$Date_Time <- paste(data1$Date, data1$Time)
data1$Date_Time <- strptime(data1$Date_Time, "%d/%m/%Y %T")

png(filename = "plot4.png")
par(mfrow = c(2,2), mar = c(4,4,2,2), oma = c(0,0,2,0))

with(data1, {plot(Date_Time, Global_active_power, type = "l", xlab = "", 
                  ylab = "Global Active Power")})

with(data1, {plot(Date_Time, Voltage, type = "l", 
                  xlab = "datetime", ylab = "Voltage")})

with(data1, {
  plot(Date_Time, Sub_metering_1, type = "l", 
     col = "black", xlab = "", ylab = "Energy sub metering")
  lines(Date_Time, Sub_metering_2, type = "l", 
    col = "red", xlab = "", ylab = "")
  lines(Date_Time, Sub_metering_3, type = "l", 
     col = "blue", xlab = "", ylab = "")
  legend("topright",lty = 1, bty = "n", col = c("black", "red", "blue"), 
       legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
})

with(data1, {plot(Date_Time, Global_reactive_power, 
                  type = "l", xlab = "datetime")})             
dev.off()