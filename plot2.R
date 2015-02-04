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
png(file="plot2.png",width=480,height=480,res=72)
#
# The next line Generates the plot
#
plot(pwData$DateTime, pwData$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)")
#
# The next line closes the device
#
dev.off()
