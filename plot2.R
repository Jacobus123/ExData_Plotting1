#Plot 2

#read in data from file
data<-read.table("household_power_consumption.txt",sep=";",header=TRUE,colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings = "?")
#filter for only dates 1/2/2007 and 2/2/2007
data2<-data[(data$Date=='1/2/2007')|(data$Date=='2/2/2007'),]
data2$DateTime <- strptime(paste(data2$Date, data2$Time), "%d/%m/%Y %H:%M:%S") 
#open png graphics device
png(file="plot2.png")
#draw line plot for Global_active_power 
plot(data2$DateTime,data2$Global_active_power, type = "l",xlab="",ylab="Global Active Power (kilowatts)")
#close graphics device
dev.off()