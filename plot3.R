
# Coursera Exploratory Data Analysis
# Project_1
# plot_3

library("dplyr")
setwd("D:\\Exploratory_Data_Analysis\\Project_1")

Data_00 <- read.table("D:\\Exploratory_Data_Analysis\\Project_1\\household_power_consumption.txt", header = TRUE, sep = ";", stringsAsFactors=FALSE)
Data_00$Date <- as.Date(Data_00$Date, format="%d/%m/%Y")

Data_01 <- filter(Data_00 , Date=="2007-02-01")
Data_02 <- filter(Data_00 , Date=="2007-02-02")
Data_03 <- rbind(Data_01, Data_02)
Data_03$Global_active_power <- as.numeric(Data_03$Global_active_power)

Date_Time <- strptime(paste(Data_03$Date, Data_03$Time), "%Y-%m-%d %H:%M:%S")

par(mfcol = c(1,1))

################# plot 3 #################

png( "plot3.png", width=480, height=480, units='px')
plot_3 <- plot(Date_Time, Data_03$Sub_metering_1, type="l", xlab="", ylab="Energy sub metering")
points(Date_Time,Data_03$Sub_metering_2, type="l",col="red")
points(Date_Time,Data_03$Sub_metering_3, type="l",col="blue")
legend("topright", c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1,1),col=c("black", "red", "blue"))
invisible(dev.off())


