fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
fileName <- "Electric.zip"

if(!file.exists(fileName)){
  download.file(fileUrl, destfile = fileName, mode='wb')
  unzip(fileName)
}

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", dec='.', stringsAsFactors = FALSE)
data <- data[data$Date %in% c("1/2/2007", "2/2/2007"),]

global_active <- as.numeric(data$Global_active_power)
png("plot1.png", width=480, height=480)
hist(global_active, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")

dev.off()
