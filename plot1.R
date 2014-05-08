#Replace the path with the path to the data
setwd("/home/mario/eda")
power <- read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
power <- subset(power, as.Date(Date,"%d/%m/%Y")>=as.Date('2007-02-01') & as.Date(Date,"%d/%m/%Y")<=as.Date('2007-02-02'))
png(file="plot1.png")
hist(as.numeric(power$Global_active_power),col="red",xlab="Global Active Power (kilowatts)", main="Global Active Power")
dev.off()