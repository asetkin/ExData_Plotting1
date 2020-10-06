plot2<-function(){
#read data from downloaded file
alldata<-read.table("household_power_consumption.txt",skip=1,sep=";")
#rename 9 variables with names from the description 
names(alldata)<-c("Date","Time","Global_active_power","Global_reactive_power","Voltage",
                    "Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3")
#subset data from the dates 2007-02-01 and 2007-02-02
data<-subset(alldata,alldata$Date=="1/2/2007" | alldata$Date =="2/2/2007")
#delete unnecessary data, for cleaning memory
rm(alldata)

#changing date format to Date format (dd.mm.yy)
data$Date<-as.Date(data$Date, format="%d/%m/%Y")
#changing time format to POSIXlt
data$Time<-strptime(data$Time, format="%H:%M:%S")
data[1:1440,"Time"]<-format(data[1:1440,"Time"],"2007-02-01 %H:%M:%S")
data[1441:2880,"Time"]<-format(data[1441:2880,"Time"],"2007-02-02 %H:%M:%S")

#write plot2 to plot2.png
png("plot2.png", width=480, height=480)
plot(data$Time,as.numeric(as.character(data$Global_active_power)),type="l",
     main="", xlab="",ylab="Global Active Power (kilowatts)") 
dev.off()
}