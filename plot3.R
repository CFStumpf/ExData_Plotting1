hpc = read.table("household_power_consumption.txt",header=TRUE,sep=";",na.string="?")

hpc$datetime = strptime(paste(hpc$Date, hpc$Time), format="%d/%m/%Y %H:%M:%S")
hpc$Date = as.Date(hpc$Date, format = "%d/%m/%Y")

hpc = subset(hpc, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02") )


png("plot3.png", width = 480, height = 480)
par(mar = c(5.1,5.1,4.1,2.1))
plot(hpc$datetime,hpc$Sub_metering_1,type="l",xlab=NA,ylab = "Energy sub metering")
lines(hpc$datetime,hpc$Sub_metering_2,col="red")
lines(hpc$datetime,hpc$Sub_metering_3,col="blue")
legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1),col=c("black","blue","red"),cex=1)

dev.off()