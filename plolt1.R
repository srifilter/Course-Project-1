dat<-read.table("household_power_consumption.txt", header=T, sep=';', na.strings="?" )

dat$Date<-as.Date(dat$Date,format="%d/%m/%y")

dat2<-subset(dat,dat$Date>="2007-02-01" & dat$Date<="2007-02-02")
Datetime<-paste(as.Date(dat2$Date), dat2$Time)
dat2$Datetime<-as.POSIXct(Datetime)

hist(dat2$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", ylab="Frequency", main= "Global Active Power")
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()