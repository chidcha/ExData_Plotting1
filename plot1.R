#plot1.R
setwd("C:/Users/Chidchanok/Documents/R/Assignment1")

#Reading, naming and subsetting power consumption data
data_source <- read.csv("household_power_consumption.txt", 
                        header=T, 
                        sep=';',  
                        na.strings="?",
                        nrows=2075259, 
                        check.names=F, 
                        stringsAsFactors=F, 
                        comment.char="", 
                        quote='\"')

#Select data between 1/2/2007 and 2/2/2007
dataplot1 <- subset(data_source, Date %in% c("1/2/2007","2/2/2007"))

#Date format
dataplot1$Date <- as.Date(data1$Date, format="%d/%m/%Y")

#Saving to target file png 480px x 480px
png("Plot1.png", width = 480, height = 480)

#calling the histogram plot function
hist(dataplot1$Global_active_power, 
     main="Global Active Power", 
     xlab="Global Active Power (kilowatts)", 
     ylab="Frequency", 
     col="Red")


dev.off()
