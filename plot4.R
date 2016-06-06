fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
fileName <- "Electric.zip"

if(!file.exists(fileName)){
  download.file(fileUrl, destfile = fileName, mode='wb')
  unzip(fileName)
}

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", dec='.', stringsAsFactors = FALSE)
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]



time <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
global_active <- as.numeric(data$Global_active_power)
global_reactive <- as.numeric(data$Global_reactive_power)
voltage <- as.numeric(data$Voltage)
submeter1 <- as.numeric(data$Sub_metering_1)
submeter2 <- as.numeric(data$Sub_metering_2)
submeter3 <- as.numeric(data$Sub_metering_3)
png("plot4.png", width=480, height=480)
par(mfrow=c(2,2))

plot(time, global_active, type='l', xlab='', ylab="Global Active Power")

plot(time, voltage, type='l', xlab="datetime", ylab="Voltage")


plot(time, submeter1, type='l', ylab="Energy sub metering", xlab="")
lines(time, submeter2, type='l', col="Red")
lines(time, submeter3, type='l', col="Blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, col=c("black", "red", "blue"))

plot(time, global_reactive, type='l', xlab='datetime', ylab='Global_reactive_power')

dev.off()