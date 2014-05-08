#Replace the path with the path to the data
setwd("/home/mario/eda")
power <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
power <- subset(power, as.Date(Date,"%d/%m/%Y")>=as.Date('2007-02-01') & as.Date(Date,"%d/%m/%Y")<=as.Date('2007-02-02'))
power$date.time <- strptime(paste(power$Date,power$Time),"%d/%m/%Y %H:%M:%S")
png(file="plot4.png")
par(mfrow=c(2,2))
#first chart
with(power,plot(date.time,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))
#Second Chart
with(power,plot(date.time,Voltage,type="l",xlab="datetime",ylab="Voltage"))
#Thirt Chart
plot(c(power$date.time,power$date.time,power$date.time),c(power$Sub_metering_1,power$Sub_metering_2,power$Sub_metering_3),type="n",xlab="",ylab="Energy sub metering")
lines(power$date.time,power$Sub_metering_1,col="black")
lines(power$date.time,power$Sub_metering_2,col="red")
lines(power$date.time,power$Sub_metering_3,col="blue")
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1),col=c("black","red","blue"))
#last chart
with(power,plot(date.time,Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power"))
dev.off()