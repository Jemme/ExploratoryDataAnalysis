FileName <- "./household_power_consumption.txt"

Data <- read.table(FileName, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

PartialData <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]

Time <- strptime(paste(PartialData$Date, PartialData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

GlobalActivePower <- as.numeric(PartialData$Global_active_power)

GlobalReactivePower <- as.numeric(PartialData$Global_reactive_power)

Volt <- as.numeric(PartialData$Voltage)

SubMeter1 <- as.numeric(PartialData$Sub_metering_1)

SubMeter2 <- as.numeric(PartialData$Sub_metering_2)

SubMeter3 <- as.numeric(PartialData$Sub_metering_3)

png("plot4.png", width=480, height=480)

par(mfrow = c(2, 2)) 

plot(Time, GlobalActivePower, type="l", xlab="", ylab="Global Active Power", cex=0.2)

plot(Time, Volt, type="l", xlab="datetime", ylab="Voltage")

plot(Time, SubMeter1, type="l", ylab="Energy Submetering", xlab="")

lines(Time, SubMeter2, type="l", col="red")

lines(Time, SubMeter3, type="l", col="blue")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=, lwd=2.5, col=c("black", "red", "blue"), bty="o")

plot(Time, GlobalReactivePower, type="l", xlab="datetime", ylab="Global_reactive_power")

dev.off()