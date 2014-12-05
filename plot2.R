#Load the data
dfData <- read.csv.sql("household_power_consumption.txt",
                       sql="select * from file where Date in ('1/2/2007','2/2/2007')",
                       sep=";")

#replace ? with NA
dfData[dfData == "?"] = NA

#set up an R datetime fields
dfData$datetime <- strptime(paste(dfData$Date,dfData$Time), 
                            format="%d/%m/%Y %T")

#Plot2
png(filename="plot2.png",width=480, height=480)
plot(dfData$datetime,dfData$Global_active_power, pch="", type="o", 
     ylab="Global Active Power (kilowatts)", xlab="")
dev.off()