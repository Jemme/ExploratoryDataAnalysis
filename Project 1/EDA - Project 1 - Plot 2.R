FileName <- "./household_power_consumption.txt"

Data <- read.table(FileName, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

PartialData <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]

Time <- strptime(paste(PartialData$Date, PartialData$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

GlobalActivePower <- as.numeric(PartialData$Global_active_power)

png("plot2.png", width=480, height=480)

plot(Time, GlobalActivePower, type="l", xlab="", ylab="Global Active Power (kw)")

dev.off()