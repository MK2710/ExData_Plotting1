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


png("plot3.png")

par(mfrow = c(1,1), mar = c(5.1, 4.1, 2.1, 2.1))

with (power_data, plot(Date_Time,Sub_metering_1, type = "n", ylab = "Energy sub metering", xlab = ""))
with (power_data,lines(Date_Time,Sub_metering_1))
with (power_data,lines(Date_Time,Sub_metering_2, col = "red"))
with (power_data,lines(Date_Time,Sub_metering_3, col = "blue"))
legend("topright", col = c ("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1)

dev.off()