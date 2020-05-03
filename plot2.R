#Import raw data
raw_data <- read.table("household_power_consumption.txt", header= TRUE, sep=";", stringsAsFactors=FALSE, dec=".")


#Create a new data frame by filtering the complete data for the 2 days (1/2/2017 and 2/2/2017)
analysis_data <- raw_data[raw_data$Date %in% c("1/2/2007","2/2/2007"),]

#Convert global active power into numeric
Global_active_power <- as.numeric(analysis_data$Global_active_power)

#Convert the date into proper format
date <- strptime(paste(analysis_data$Date, analysis_data$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 


#Set graphics device to png
png("plot2.png") 

#Create the plot
plot(date, Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")

dev.off()