library(data.table)
elec<-fread(input="C:/Users/wein0339/Desktop/Dropbox/Coursera/Exploratory Data Analysis/household_power_consumption.txt", sep=";"
            , na.strings=c("?"))

elec1<-subset(elec,Date=="1/2/2007" | Date=="2/2/2007")
rm(elec)
elec1<-as.data.frame(elec1)
elec1$DateTime<-paste(elec1$Date,elec1$Time)
elec1$DateTime<-strptime(elec1$DateTime, "%d/%m/%Y %H:%M:%S")
elec1$GAP<-as.numeric(elec1$Global_active_power)



#Subset February 1st and 2nd, 2007
#In this file formats are dd/mm/yyyy
#Searching for 1/2/2007 & 2/2/2007
#elec1<-subset(elec,Date=="2007-02-01" | Date=="2007-02-02" | Date=="2007-02-03")


#set up plot output
png("C:/Users/wein0339/Desktop/Dropbox/Coursera/Exploratory Data Analysis/plot2.png", width = 480, height = 480)

#build line chart
ylab<-"Global Active Power (kilowatts)"
plot(elec1$DateTime,elec1$GAP,type="l",ylab=ylab,xlab="")

#turn plot off
dev.off()
