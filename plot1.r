# PLOT 1

# uncomment this line and "dev.off()" at the end of the script to export a png file of this plot into your working directory
# png(filename = "plot1.png", width = 480, height = 480)

data <- read.table(
  "household_power_consumption.txt", 
  sep = ";",
  skip = 66637, 
  nrows = 2880,
  col.names = c("Date", "Time", "Global_active_power", "Global_reactive_power", "Voltage", "Global_intensity", "Sub_metering_1", "Sub_metering_2", "Sub_metering_3") 
)

par(mfrow = c(1,1))
hist(
  data$Global_active_power,
  col = "red",
  xlab = "Global Active Power (kilowatts)",
  main = "Global Active Power"
)

# uncomment this line and "png(...)" at the beginning of the script to export a png file of this plot into your working directory
# dev.off()