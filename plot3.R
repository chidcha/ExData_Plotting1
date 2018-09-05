#plot3.R
setwd("C:/Users/Chidchanok/Documents/R/Assignment1")

# Reading and naming power consumption data
data_source <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

# Subsetting data source
data_plot3 <- subset(data_source, Date %in% c("1/2/2007","2/2/2007"))
data_plot3$Date <- as.Date(data_plot3$Date, format="%d/%m/%Y")

# Transforming the Date and Time variables into objects of Date type 
datetime <- paste(as.Date(data_plot3$Date), data_plot3$Time)

#and POSIXlt
data_plot3$Datetime <- as.POSIXct(datetime)


#set target file
png("Plot3.png", width = 480, height = 480)

#calling plot functions
with(data_plot3, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()
