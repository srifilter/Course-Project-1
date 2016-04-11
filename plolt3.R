dat<-read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?" )

dat$Date<-as.Date(dat$Date,format="%d/%m/%y")

dat2<-subset(dat,dat$Date>="2007-02-01" & dat$Date<="2007-02-02")
Datetime<-paste(as.Date(dat2$Date), dat2$Time)
dat2$Datetime<-as.POSIXct(Datetime)

with(dat2, plot(dat2$Datetime,dat2$Sub_metering_1,xlab="", ylab="Global Active Power (kilowatts)", type="l", col="black"))
lines(dat2$Datetime,dat2$Sub_metering_2, col="red")
lines(dat2$Datetime,dat2$Sub_metering_3, col="blue")
legend("topright", col=c("black","red","blue"), lty=1, lwd=2,legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))

dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()