plot1<-function(){
#read data from downloaded file
alldata<-read.table("household_power_consumption.txt",skip=1,sep=";")
#rename 9 variables with names from the description 
names(alldata)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
                    "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
#subset data from the dates 2007-02-01 and 2007-02-02
data<-subset(alldata,alldata$Date=="1/2/2007" | alldata$Date =="2/2/2007")
#delete unnecessary data, for cleaning memory
rm(alldata)

#make plot1
hist(as.numeric(as.character(data$Global_active_power)),col="red",
     main="Global Active Power",xlab="Global Active Power(kilowatts)")

#write plot1 to plot1.png
png("plot1.png", width=480, height=480)
hist(as.numeric(as.character(data$Global_active_power)),col="red",
     main="Global Active Power",xlab="Global Active Power(kilowatts)")
dev.off()
}