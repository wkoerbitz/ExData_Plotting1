setwd("C:/Users/master_Blaster/Documents")

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", quote="", comment.char="", na.strings="?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data      <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
data$when <- strptime(paste(data$Date, data$Time, sep=" "), format="%Y-%m-%d %H:%M:%S")

png(file="plot3.png")
plot(data$when, data$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
points(data$when, data$Sub_metering_2, type="l", col="red") 
points(data$when, data$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, lwd=1) 
dev.off()
