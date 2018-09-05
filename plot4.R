#plot4.R
setwd("C:/Users/Chidchanok/Documents/R/Assignment1")

# Reading and naming power consumption data
data_source <- read.csv("household_power_consumption.txt", 
                        header=T, sep=';', 
                        na.strings="?",
                        nrows=2075259,
                        check.names=F, 
                        stringsAsFactors=F, 
                        comment.char="", 
                        quote='\"')

#subsetting data source 
data_plot4 <- subset(data_source, Date %in% c("1/2/2007","2/2/2007"))


# Date and Time variables are transformed to objects 
data_plot4$Date <- as.Date(data_plot4$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data_plot4$Date), data_plot4$Time)

#POSIXct
data_plot4$Datetime <- as.POSIXct(datetime)

#set target file
png("Plot4.png", width = 480, height = 480)

#arranging a composite plot
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))

#calling the basic plot functions 
#to build the 4 plots that form the graph

with(data_plot4, {
  plot(Global_active_power~Datetime, 
       type="l", 
       ylab="Global Active Power (kilowatts)", 
       xlab="")
  
  plot(Voltage~Datetime, 
       type="l", 
       ylab="Voltage (volt)", 
       xlab="")
  
  plot(Sub_metering_1~Datetime, 
       type="l", 
       ylab="Global Active Power (kilowatts)", 
       xlab="")
  
  lines(Sub_metering_2~Datetime,col='Red')
  
  lines(Sub_metering_3~Datetime,col='Blue')
  
  legend("topright", col=c("black", "red", "blue"), 
         lty=1, lwd=2, bty="n",
  legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  
  plot(Global_reactive_power~Datetime, 
       type="l", 
       ylab="Global Rective Power (kilowatts)",
       xlab="")
})

dev.off()
