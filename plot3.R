#Plot 3

#read in data from file
data<-read.table("household_power_consumption.txt",sep=";",header=TRUE,colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings = "?")
#filter for only dates 1/2/2007 and 2/2/2007
data2<-data[(data$Date=='1/2/2007')|(data$Date=='2/2/2007'),]
data2$DateTime <- strptime(paste(data2$Date, data2$Time), "%d/%m/%Y %H:%M:%S") 
#open png graphics device
png(file="plot3.png")
#draw line plots for Energy sub metering 
plot.new()
plot(data2$DateTime,data2$Sub_metering_1,xlab="",ylab="Energy sub metering",type="n")
points(data2$DateTime,data2$Sub_metering_1,col="black",type = "l")
points(data2$DateTime,data2$Sub_metering_2,col="red",type = "l")
points(data2$DateTime,data2$Sub_metering_3,col="blue",type = "l")
legend("topright", legend=c(colnames(data2[7:9])),lty = c(1, 1, 1), col = c("black","red","blue"))
#close graphics device
dev.off()