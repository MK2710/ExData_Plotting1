download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip", destfile = "EDA_W1.zip")

unzip("EDA_W1.zip")

power_data <- read.csv("household_power_consumption.txt", sep = ";")

power_data$Date <- as.character(power_data$Date)
power_data$Time <- as.character(power_data$Time)
power_data <- power_data[power_data$Date == "1/2/2007"|power_data$Date == "2/2/2007", ]
power_data$Date_Time <- paste(power_data$Date, power_data$Time, sep = " ")
power_data$Date_Time <- strptime(power_data$Date_Time, format = "%d/%m/%Y %H:%M:%S")

for (i in 3:8){
        power_data[,i] <- as.numeric(as.character(power_data[,i]))        
}

png("plot1.png")
par(mfrow = c(1,1), mar = c(5.1, 4.1, 2.1, 2.1))
hist(power_data$Global_active_power, main = "Global Active Power", xlab = "Global Active Power (kilowatts)", col = "red")
dev.off() 