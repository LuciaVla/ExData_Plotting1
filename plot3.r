# PLOT 3

# uncomment this line and "dev.off()" at the end of the script to export a png file of this plot into your working directory
# png(filename = "plot3.png", width = 480, height = 480)

# if your R is not in English 
# Sys.setlocale("LC_TIME", "English") 

data <- read.table(
  "household_power_consumption.txt", 
  sep = ";",
  skip = 66637, 
  nrows = 2880,
  col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3") 
)

data$Date <- format(as.Date(data$Date, format = "%d/%m/%Y"), "%Y/%m/%d")
DateTime <- as.POSIXlt(paste(data$Date, data$Time), tz = "")
data <- cbind(DateTime, data)

par(mfrow = c(1,1))
plot(
  data$DateTime,
  data$Sub_metering_1,
  ylab = "Energy sub metering",
  xlab = "",
  type = "l"
)

points(data$DateTime, data$Sub_metering_2, col = "red", type = "l")

points(data$DateTime, data$Sub_metering_3, col = "blue", type = "l")

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = 1, col = c("black", "red", "blue"))

# uncomment this line and "png(...)" at the beginning of the script to export a png file of this plot into your working directory
# dev.off()