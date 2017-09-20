library(data.table)

data <- fread('grep "^[12]/2/2007\\|Date" household_power_consumption.txt', header = T, sep = ';', na.strings=c("?"))
data$DateTime <- as.POSIXct(paste(data$Date, data$Time), format="%d/%m/%Y %H:%M:%S")
data$Date <- as.Date(data$Date, format="%d/%m/%Y")

png(filename = "plot2.png",width=480,height=480)
plot(data$DateTime, data$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
dev.off()
