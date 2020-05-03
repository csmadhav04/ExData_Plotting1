#Import raw data
raw_data <- read.table("household_power_consumption.txt", header= TRUE, sep=";", stringsAsFactors=FALSE, dec=".")


#Create a new data frame by filtering the complete data for the 2 days (1/2/2017 and 2/2/2017)
analysis_data <- raw_data[raw_data$Date %in% c("1/2/2007","2/2/2007"),]

#Convert global active power and sub metering variables into numeric
Global_active_power <- as.numeric(analysis_data$Global_active_power)
Sub_metering_1 <- as.numeric(analysis_data$Sub_metering_1)
Sub_metering_2 <- as.numeric(analysis_data$Sub_metering_2)
Sub_metering_3 <- as.numeric(analysis_data$Sub_metering_3)


#Convert the date into proper format
date <- strptime(paste(analysis_data$Date, analysis_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 


#Set graphics device to png
png("plot3.png") 

#Create the plot
plot(date, Sub_metering_1, type="l", ylab="Energy sub metering", xlab="", col="black")
lines(date, Sub_metering_2, type="l", col="red")
lines(date, Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))


dev.off()