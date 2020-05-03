
#Import raw data
raw_data <- read.table("household_power_consumption.txt", header= TRUE, sep=";", stringsAsFactors=FALSE, dec=".")



#Create a new data frame by filtering the complete data for the 2 days (1/2/2017 and 2/2/2017)
analysis_data <- raw_data[raw_data$Date %in% c("1/2/2007","2/2/2007"),]


Global_active_power <- as.numeric(analysis_data$Global_active_power)

#Set graphics device to png
png("plot1.png") 

#Create histogram
hist(Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)",
     ylim=c(0,1200))

dev.off()


