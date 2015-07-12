library(sqldf)
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

hist(briefData$Global_active_power, col="red", xlab="Global Active Power (kilowatts)", main="Global Active Power", ylim=c(0,1200))
dev.copy(png, file = "./ExData_Plotting1/plot1.png")
dev.off()
