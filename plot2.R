#plot2.R
setwd("C:/Users/Chidchanok/Documents/R/Assignment1")

# Reading and naming
data_source <- read.csv("household_power_consumption.txt", 
                      header=T, 
                      sep=';', 
                      na.strings="?", 
                      nrows=2075259, 
                      check.names=F, 
                      stringsAsFactors=F, 
                      comment.char="", 
                      quote='\"')

#Subsetting the power consumption data source
data_plot2 <- subset(data_source, Date %in% c("1/2/2007","2/2/2007"))

# Transforming the Date and Time variables from characters into objects of type Date 
data_plot2$Date <- as.Date(data_plot2$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data_plot2$Date), data_plot2$Time)

#and POSIXct
data_plot2$Datetime <- as.POSIXct(datetime)

#set target
png("Plot2.png", width = 480, height = 480)

#calling the plot function and annotating graph
with(data_plot2, {
  plot(Global_active_power~Datetime, 
       type="l",
       ylab="Global Active Power (kilowatts)", 
       xlab="")
})

dev.off()
