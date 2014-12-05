#Load the data
dfData <- read.csv.sql("household_power_consumption.txt",
                       sql="select * from file where Date in ('1/2/2007','2/2/2007')",
                       sep=";")

#replace ? with NA
dfData[dfData == "?"] = NA

#set up an R datetime fields
dfData$datetime <- strptime(paste(dfData$Date,dfData$Time), 
                            format="%d/%m/%Y %T")

#Plot3
png(filename="plot3.png",width=480, height=480)
plot(dfData$datetime,dfData$Sub_metering_1, pch="", type="o", 
     ylab="Energy sub metering", xlab="", col="Black")
lines(dfData$datetime,dfData$Sub_metering_2, col="Red")
lines(dfData$datetime,dfData$Sub_metering_3, col="Blue")
legend("topright", col=c("Black", "Red", "Blue"), lty=1, 
       legend=c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"))
dev.off()
