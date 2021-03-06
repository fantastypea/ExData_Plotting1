data <- read.table("household_power_consumption.txt", header = TRUE, sep = ";",na.strings = "?")
data$Date <- as.Date(as.character(data$Date),format="%d/%m/%Y")
newdata <- data[data$Date>=as.Date('2007-02-01') & data$Date<=as.Date('2007-02-02'),]
newdata$Global_active_power <- as.numeric(as.character(newdata$Global_active_power))
png("plot1.png",width = 480, height = 480, units = "px")
hist(newdata$Global_active_power,col = "red",xlab = "Global Active Power (kilowatts)",ylab = "Frequency",main="Global Active Power")
dev.off()
time <- paste(newdata$Date,newdata$Time)
time <- as.POSIXct(time,"%d-%m-%Y %H:%M:%S")
png("plot2.png", width = 480, height = 480, units = "px")
plot(time,newdata$Global_active_power,"l",ylab="Global Active Power (kilowatts)")
dev.off()


