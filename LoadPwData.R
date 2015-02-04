# R script to download and unzip the required data
#
# httr library added for GET function
#
library(httr)
#
# This line sets my working directory and the location of the household_power_consumption.txt file.
#
setwd("~/Coursera/DataScience/ExDataAnalysis")
#
# Next 3 lines download and unzip the required data 
#
url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip" 
GET(url, write_disk(basename(url), overwrite=TRUE))
unzip(basename(url))
#
# The next four lines load the required dataset
#
# Calculating numberof lines to skip and rows to load. . 
# 1 Header row
# 396 rows between 17:24 and 23:59 on 12/16
# 66240 = 1440 rows per day - 46 days between 12/17/06 and 1/31/07 - inclusive 
# 66637 rows to skip
# 2880 rows to load for 2/1/07 and 2/2/07
# Initial read.table is to grap the column headers to be loaded with colnames()
#
header <- read.table('household_power_consumption.txt', nrows = 1, header = FALSE, sep =';', stringsAsFactors = FALSE)
pwData<-read.table("household_power_consumption.txt", header=FALSE, sep=";", nrows=2880, skip=66637, na.strings = "?")
colnames( pwData ) <- unlist(header)
pwData$DateTime<-as.POSIXct(paste(pwData$Date, pwData$Time), format="%d/%m/%Y %H:%M:%S")

