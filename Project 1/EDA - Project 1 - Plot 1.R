FileName <- "./household_power_consumption.txt"

Data <- read.table(FileName, header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

PartialData <- Data[Data$Date %in% c("1/2/2007","2/2/2007") ,]

GlobalActivePower <- as.numeric(PartialData$Global_active_power)

png("plot1.png", width=480, height=480)

hist(GlobalActivePower, col="red", main="Global Active Power", xlab="Global Active Power (kw)")

dev.off()