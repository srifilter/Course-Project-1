dat<-read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?" )

dat$Date<-as.Date(dat$Date,format="%d/%m/%y")

dat2<-subset(dat,dat$Date>="2007-02-01" & dat$Date<="2007-02-02")
Datetime<-paste(as.Date(dat2$Date), dat2$Time)
dat2$Datetime<-as.POSIXct(Datetime)

with(dat2, plot(dat2$Datetime,dat2$Global_active_power,xlab="", ylab="Global Active Power (kilowatts)", type="l"))
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
