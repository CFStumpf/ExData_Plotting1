hpc = read.table("household_power_consumption.txt",header=TRUE,sep=";",na.string="?")

hpc$datetime = strptime(paste(hpc$Date, hpc$Time), format="%d/%m/%Y %H:%M:%S")
hpc$Date = as.Date(hpc$Date, format = "%d/%m/%Y")

hpc = subset(hpc, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02") )

png("plot1.png", width = 480, height = 480)
par(mar = c(5.1,5.1,4.1,2.1))
hist(hpc$Global_active_power, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()