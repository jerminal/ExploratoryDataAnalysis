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


date <- as.character(as.Date(subsetdata$Date, "%d/%m/%Y"))
x <- paste(date, subsetdata$Time)
dateTime <- strptime(x, "%Y-%m-%d %H:%M:%S")

#drawing plot color red = #ff0000 
png("plot1.png", height = 480, width = 480)
hist(as.numeric(subsetdata$Global_active_power), 
     xlab="Global Active Power (kilowatts)",
     main = "Global Active Power",
     col="#ff0000")
dev.off()