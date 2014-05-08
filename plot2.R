#Replace the path with the path to the data
setwd("/home/mario/eda")
power <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
power <- subset(power, as.Date(Date,"%d/%m/%Y")>=as.Date('2007-02-01') & as.Date(Date,"%d/%m/%Y")<=as.Date('2007-02-02'))
power$date.time <- strptime(paste(power$Date,power$Time),"%d/%m/%Y %H:%M:%S")
png(file="plot2.png")
with(power,plot(date.time,Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)"))
dev.off()