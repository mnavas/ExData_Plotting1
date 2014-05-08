#Replace the path with the path to the data
setwd("/home/mario/eda")
power <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
power <- subset(power, as.Date(Date,"%d/%m/%Y")>=as.Date('2007-02-01') & as.Date(Date,"%d/%m/%Y")<=as.Date('2007-02-02'))
power$date.time <- strptime(paste(power$Date,power$Time),"%d/%m/%Y %H:%M:%S")
png(file="plot3.png")
#Empty plot
plot(c(power$date.time,power$date.time,power$date.time),c(power$Sub_metering_1,power$Sub_metering_2,power$Sub_metering_3),type="n",xlab="",ylab="Energy sub metering")
#Plot lines
lines(power$date.time,power$Sub_metering_1,col="black")
lines(power$date.time,power$Sub_metering_2,col="red")
lines(power$date.time,power$Sub_metering_3,col="blue")
#Plot legend
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=c(1,1),col=c("black","red","blue"))
dev.off()