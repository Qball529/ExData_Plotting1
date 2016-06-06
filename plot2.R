fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
fileName <- "Electric.zip"

if(!file.exists(fileName)){
  download.file(fileUrl, destfile = fileName, mode='wb')
  unzip(fileName)
}

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", dec='.', stringsAsFactors = FALSE)
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]



global_active <- as.numeric(data$Global_active_power)
time <- strptime(paste(data$Date, data$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
png("plot2.png", width=480, height=480)
plot(time, global_active, type='l', xlab='', ylab="Global Active Power")
dev.off()