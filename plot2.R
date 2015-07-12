library(sqldf)
library(lubridate)
dir="C:/Users/dwilliams/Dropbox/Coursework/Coursera/DataScienceSpec/Exploratory Data Analysis"
setwd(dir)
file = "./data/household_power_consumption.txt"

if(!exists("data")) {
    firstRows <- read.table(file, header = TRUE, sep=";", comment.char="", nrows=5)
    classes <- sapply(firstRows, class)
    data <- read.table(file, header = T, comment.char="", 
                       sep=";", colClasses = classes)
}

if(!exists("briefData")) {
    briefData <- read.csv.sql(file, sep=";", header=T, colClasses = classes,
                              sql = 
                                  "select * from file
                              where date IN (\"2/1/2007\",\"2/2/2007\")")
}

date <- dmy(briefData$Date)
time <- hms(briefData$Time)
dateTime <- date + time
lubriData <- cbind(briefData,dateTime)
plot(lubriData$Global_active_power, type="l", xaxt="n", ylab="Global Active Power (kilowatts)")


dev.copy(png, file = "./ExData_Plotting1/plot2.png")
dev.off()
