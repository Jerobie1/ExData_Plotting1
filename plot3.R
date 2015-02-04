#
# This first line sets my working directory and the location of the household_power_consumption.txt file.
#
setwd("~/Coursera/DataScience/ExDataAnalysis")
#
# The next four lines load the required dataset
#
header <- read.table('household_power_consumption.txt', nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)
pwData<-read.table("household_power_consumption.txt", header=FALSE, sep=";", nrows=2880, skip=66637, na.strings = "?")
colnames( pwData ) <- unlist(header)
pwData$DateTime<-as.POSIXct(paste(pwData$Date, pwData$Time), format="%d/%m/%Y %H:%M:%S")
#
# This next line of code establishes the graphics device for this process
#
png(file="plot3.png",width=480,height=480,res=72)
#
# The next 5 lines Generates the plot
#
with(pwData, plot(DateTime, Sub_metering_1, xlab="", ylab="Energy sub metering", type = "n"))
with(pwData, points(DateTime, Sub_metering_1, type = "l", col = "black"))
with(pwData, points(DateTime, Sub_metering_2, type = "l", col = "red"))
with(pwData, points(DateTime, Sub_metering_3, type = "l", col = "blue"))
legend("topright", lty=1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
#
# The next line closes the device
#
dev.off()
