library(data.table)
elec<-fread(input="C:/Users/wein0339/Desktop/Dropbox/Coursera/Exploratory Data Analysis/household_power_consumption.txt", sep=";"
            , na.strings=c("?"))

#Subset February 1st and 2nd, 2007
#In this file formats are dd/mm/yyyy
#Searching for 1/2/2007 & 2/2/2007
elec1<-subset(elec,Date=="1/2/2007" | Date=="2/2/2007")
#delete larger file
rm(elec)

#convert to data frame
elec1<-as.data.frame(elec1)

#convert times
elec1$DateTime<-paste(elec1$Date,elec1$Time)
elec1$DateTime<-strptime(elec1$DateTime, "%d/%m/%Y %H:%M:%S")
elec1$Sub_metering_1<-as.numeric(elec1$Sub_metering_1)

#set up plot output
png("C:/Users/wein0339/Desktop/Dropbox/Coursera/Exploratory Data Analysis/plot3.png", width = 480, height = 480)

#build line chart
ylab<-"Energy sub metering"
plot(elec1$DateTime,elec1$Sub_metering_1,type="l",col="black",ylab=ylab,xlab="")
lines(elec1$DateTime,elec1$Sub_metering_2,col="red")
lines(elec1$DateTime,elec1$Sub_metering_3,col="blue")
legend('topright',c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), 
       lty=c(1,1,1), # gives the legend appropriate symbols (lines)
       lwd=c(2.5,2.5,2.5),col=c("black","red","blue")) # gives the legend lines the correct color and width

#turn plot off
dev.off()
