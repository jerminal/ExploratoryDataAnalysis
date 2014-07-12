#setting english locale
Sys.setlocale("LC_ALL", 'en_US.UTF-8')

#setting filename with data
power_cons_file = "household_power_consumption.txt"

#read 2075259 lines, setting separator as ;
consumption <- read.table(power_cons_file, 
							nrows=2075259, 
							sep=";", 
							header=TRUE,
							stringsAsFactors =FALSE)

#choosing only data between  01/02/2017 and 02/02/2007
subsetdata <- consumption[consumption$Date %in% c("1/2/2007","2/2/2007") ,]

#converting date
date <- as.character(as.Date(subsetdata$Date, "%d/%m/%Y"))
x <- paste(date, subsetdata$Time)
dateTime <- strptime(x, "%Y-%m-%d %H:%M:%S")

#drawing a plot
png("plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2)) 

plot(dateTime, as.numeric(subsetdata$Global_active_power), 
					     ylab="Global Active Power", 
					     cex=0.19, 
					     type="l", 
					     xlab="")

plot(dateTime, as.numeric(subsetdata$Voltage), 
					     ylab="Voltage", 
					     type="l", 
					     xlab="datetime")

plot(dateTime, as.numeric(subsetdata$Sub_metering_1), 
    					ylab="Energy Submetering", 
    					type="l", 
    					xlab="")

lines(dateTime, as.numeric(subsetdata$Sub_metering_2), 
							col="#ff0000", 
							type="l")
lines(dateTime, as.numeric(subsetdata$Sub_metering_3), 
							col="#0000ff", 
							type="l")

legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
							col=c("#000000", "#ff0000", "#0000ff"),
							lty=1, 
							lwd =2.49,
					    	bty = "n")

plot(dateTime, as.numeric(subsetdata$Global_reactive_power), 
							xlab="datetime",
    						ylab="Global_reactive_power",
    						type="l")

dev.off()