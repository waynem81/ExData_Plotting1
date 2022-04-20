#pull in data from txt file
data <- read.table("C:/Users/Wayne Mogel/Downloads/household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, dec=".")
#exploring data

head(data, 25)

sub <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

head(sub, 25)

gap <- as.numeric(sub$Global_active_power)

head(gap)

png("plot1.png", width=504, height=504)

hist(gap, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")

#not sure why this is needed. googled why plot wasn't displaying 
#and this came up
dev.off()
