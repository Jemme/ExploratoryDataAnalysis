FileName <- "./household_power_consumption.txt"

Data <- read.table(FileName, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

PartialData <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]

Time <- strptime(paste(PartialData$Date, PartialData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

GlobalActivePower <- as.numeric(PartialData$Global_active_power)

SubMeter1 <- as.numeric(PartialData$Sub_metering_1)

SubMeter2 <- as.numeric(PartialData$Sub_metering_2)

SubMeter3 <- as.numeric(PartialData$Sub_metering_3)

png("plot3.png", width=480, height=480)

plot(Time, SubMeter1, type="l", ylab="Energy Submetering", xlab="")

lines(Time, SubMeter2, type="l", col="red")

lines(Time, SubMeter3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()