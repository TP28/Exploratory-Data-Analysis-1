



setwd("O:/R/Coursera/Exploratory Data Analysis/Exploratory Data Analysis")
data <- read.table("household_power_consumption.txt",skip=1,sep=";")
names(data) <- c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
subdata <- subset(data,data$Date=="1/2/2007" | data$Date =="2/2/2007")

# Transforming the Date and Time vars from characters into objects of type Date and POSIXlt respectively
subdata$Date <- as.Date(subdata$Date, format="%d/%m/%Y")
subdata$Time <- strptime(subdata$Time, format="%H:%M:%S")
subdata[1:1440,"Time"] <- format(subdata[1:1440,"Time"],"2007-02-01 %H:%M:%S")
subdata[1441:2880,"Time"] <- format(subdata[1441:2880,"Time"],"2007-02-02 %H:%M:%S")


dev.copy(png, file="plot1.png", height=480, width=480)
hist(x = as.numeric(as.character(subdata$Global_active_power)), freq = TRUE, col = "red", main = "Global Active Power"
     ,xlab = "Global Active Power (kilowatts)" )

dev.off()