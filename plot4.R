hpc = read.table("household_power_consumption.txt",header=TRUE,sep=";",na.string="?")

hpc$Date <- as.Date(hpc$Date, format="%d/%m/%Y")

hpc <- hpc[hpc$Date >= as.Date("2007-02-01") & hpc$Date <= as.Date("2007-02-02"), ]
hpc$Timestamp <- strptime(paste(hpc$Date, hpc$Time), format="%Y-%m-%d %H:%M:%S", tz="EST")

png(filename = "plot4.png", width=480, height=480)

par(mfrow = c(2, 2),ps=12)

plot(y=hpc$Global_active_power, x=hpc$Timestamp, xlab="", ylab="Global Active Power", type="l")

plot(y=hpc$Voltage, x=hpc$Timestamp, xlab="datetime", ylab="Voltage", type="l")

plot (y=hpc$Sub_metering_1, x=hpc$Timestamp, xlab="", ylab="Energy sub metering", type="l", col="black")
lines(y=hpc$Sub_metering_2, x=hpc$Timestamp, xlab="", ylab="Energy sub metering", type="l", col="red"  )
lines(y=hpc$Sub_metering_3, x=hpc$Timestamp, xlab="", ylab="Energy sub metering", type="l", col="blue" )

legend("topright", legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
       col=c("black", "red", "blue"), lty=c(1,1), bty="n")

plot(y=hpc$Global_reactive_power, x=hpc$Timestamp, ylab="Global_reactive_power", xlab="datetime", type="l")

dev.off()