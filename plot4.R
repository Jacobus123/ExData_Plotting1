#Plot4

#read in data from file
data<-read.table("household_power_consumption.txt",sep=";",header=TRUE,colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings = "?")
#filter for only dates 1/2/2007 and 2/2/2007
data2<-data[(data$Date=='1/2/2007')|(data$Date=='2/2/2007'),]
data2$DateTime <- strptime(paste(data2$Date, data2$Time), "%d/%m/%Y %H:%M:%S") 
#open png graphics device
png(file="plot4.png")

#multi frame 
par(mfcol=c(2,2))

#1.draw line plot for Global_active_power 
plot(data2$DateTime,data2$Global_active_power, type = "l",xlab="",ylab="Global Active Power (kilowatts)")

#2.draw line plots for Energy sub metering 
#plot.new()
plot(data2$DateTime,data2$Sub_metering_1,xlab="",ylab="Energy sub metering",type="n")
points(data2$DateTime,data2$Sub_metering_1,col="black",type = "l")
points(data2$DateTime,data2$Sub_metering_2,col="red",type = "l")
points(data2$DateTime,data2$Sub_metering_3,col="blue",type = "l")
legend("topright", legend=c(colnames(data2[7:9])),lty = c(1, 1, 1), col = c("black","red","blue"))

#3.draw line plot for Voltage 
plot(data2$DateTime,data2$Voltage, type = "l",xlab="datetime",ylab="Voltage")

#4.draw line plot for Global Reactive Power 
#plot.new()
plot(data2$DateTime,data2$Global_reactive_power, type = "l",xlab="datetime",ylab="Global_reactive_power")


#close graphics device
dev.off()