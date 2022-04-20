#pull in data from txt file
data <- read.table("C:/Users/Wayne Mogel/Downloads/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#exploring data
head(data, 25)

sub <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

head(sub, 25)

convertDateTime <- strptime(paste(sub$Date, sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
head(convertDateTime, 25)

gap <- as.numeric(sub$Global_active_power)
subMeter1 <- as.numeric(sub$Sub_metering_1)
subMeter2 <- as.numeric(sub$Sub_metering_2)
subMeter3 <- as.numeric(sub$Sub_metering_3)

head(gap, 25)
head(subMeter1, 25)
head(subMeter2, 25)
head(subMeter3, 25)

png("plot3.png", width=504, height=504)
plot(convertDateTime, subMeter1, type="l", ylab="Energy Submetering", xlab="")
lines(convertDateTime, subMeter2, type="l", col="red")
lines(convertDateTime, subMeter3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))

dev.off()
