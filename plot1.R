elec<-fread(input="C:/Users/wein0339/Desktop/Dropbox/Coursera/Exploratory Data Analysis/household_power_consumption.txt", sep=";"
            , na.strings=c("?"))

#Subset February 1st and 2nd, 2007
#In this file formats are dd/mm/yyyy
#Searching for 1/2/2007 & 2/2/2007
elec1<-subset(elec,Date=="1/2/2007" | Date=="2/2/2007")

#set up plot output
png("C:/Users/wein0339/Desktop/Dropbox/Coursera/Exploratory Data Analysis/plot1.png", width = 480, height = 480)

#build histogram
elec1$GAP<-as.numeric(elec1$Global_active_power)
xlab<-"Global Active Power (kilowatts)"
main="Global Active Power"
hist(elec1$GAP,xlab=xlab,main=title,col="RED")

#turn plot off
dev.off()




     
