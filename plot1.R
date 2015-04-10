
# Coursera Exploratory Data Analysis
# Project_1
# plot_1

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

################# plot 1 #################

png( "plot1.png", width=480, height=480, units='px')
plot_1 <- hist(Data_03$Global_active_power, col="red", main = "Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
invisible(dev.off())

