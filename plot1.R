#Plot 1

#read in data from file
data<-read.table("household_power_consumption.txt",sep=";",header=TRUE,colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),na.strings = "?")
#filter for only dates 1/2/2007 and 2/2/2007
data2<-data[(data$Date=='1/2/2007')|(data$Date=='2/2/2007'),]
#open png graphics device
png(file="plot1.png")
#draw histogram for Global_active_power 
hist(data2$Global_active_power, col="red",main="Global Active Power",xlab="Global Active Power (kilowatts)")
#close graphics device
dev.off()