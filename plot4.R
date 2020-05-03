#Import raw data
raw_data <- read.table("household_power_consumption.txt", header= TRUE, sep=";", stringsAsFactors=FALSE, dec=".")


#Create a new data frame by filtering the complete data for the 2 days (1/2/2017 and 2/2/2017)
analysis_data <- raw_data[raw_data$Date %in% c("1/2/2007","2/2/2007"),]

#Convert global active power,voltage, global reactive power and sub metering variables into numeric
Global_active_power <- as.numeric(analysis_data$Global_active_power)
Sub_metering_1 <- as.numeric(analysis_data$Sub_metering_1)
Sub_metering_2 <- as.numeric(analysis_data$Sub_metering_2)
Sub_metering_3 <- as.numeric(analysis_data$Sub_metering_3)
voltage <- as.numeric(analysis_data$Voltage)
Global_reactive_power <- as.numeric(analysis_data$Global_reactive_power)


#Convert the date into proper format
date <- strptime(paste(analysis_data$Date, analysis_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 


#Set graphics device to png
png("plot4.png") 

#Arrange plots in 2X2 format
par(mfrow = c(2, 2)) 

# Plot 1
plot(date, Global_active_power, type="l", xlab="", ylab="Global Active Power", cex=0.25)

# Plot 2
plot(date, voltage, type="l", xlab="datetime", ylab="Voltage")


# Plot 3
plot(date, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", col="black")
lines(date, Sub_metering_2, type="l", col="red")
lines(date, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lwd=1, col=c("black", "red", "blue"),bty="n")

# Plot 4
plot(date, Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power", cex=0.25)

dev.off()