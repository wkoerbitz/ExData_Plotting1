setwd("C:/Users/master_Blaster/Documents")

data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", dec=".", quote="", comment.char="", na.strings="?")
data$Date <- as.Date(data$Date, "%d/%m/%Y")
data      <- subset(data, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
data$when <- strptime(paste(data$Date, data$Time, sep=" "), format="%Y-%m-%d %H:%M:%S")

png(file="plot2.png")
plot(data$when, data$Global_active_power, type="l", ylab="Global Active Power (kilowatts)", xlab="")
dev.off()
