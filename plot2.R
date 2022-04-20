#pull in data from txt file
data <- read.table("C:/Users/Wayne Mogel/Downloads/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#exploring data
head(data, 25)

sub <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

head(sub, 25)

convertDateTime <- strptime(paste(sub$Date, sub$Time, sep=" "), "%d/%m/%Y %H:%M:%S")
head(convertDateTime, 25)

gap <- as.numeric(sub$Global_active_power)

head(gap, 25)

png("plot2.png", width=504, height=504)
plot(convertDateTime, gap, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()
