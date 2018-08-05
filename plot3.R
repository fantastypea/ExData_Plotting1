data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";")
data$Date <- as.Date(as.character(data$Date),format="%d/%m/%Y")
newdata <- data[data$Date>=as.Date('2007-02-01') & data$Date<=as.Date('2007-02-02'),]
newdata$Global_active_power <- as.numeric(as.character(newdata$Global_active_power))
time <- paste(newdata$Date,newdata$Time)
time <- as.POSIXct(time,"%d-%m-%Y %H:%M:%S")
png("plot3.png", width = 480, height = 480, units = "px")
with(newdata,{
    plot(time,newdata$Sub_metering_1,"l",col="black",ylab="Energy sub metering")
    lines(time,newdata$Sub_metering_2,"l",col="red")
    lines(time,newdata$Sub_metering_3,"l",col="blue")
})
legend("topright", col=c("black", "red", "blue"), lwd=c(1,1,1), 
       c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()