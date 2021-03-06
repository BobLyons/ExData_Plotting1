# Pull in the required libraries.
library('dplyr')

# Load data and filter, since we need only two days.
power <- read.table('household_power_consumption.txt', header=TRUE, sep=';', na.strings=c('?')) %>%
  filter( grepl( '^1/2/2007|^2/2/2007', Date ) )

# Add DateTime field.
power$DateTime <- strptime( paste( power$Date, power$Time, sep=' '), format='%d/%m/%Y %H:%M:%S' )

# Construct plot and write it to a png file.
png( filename='plot4.png', bg="white" )

par( mfrow = c(2, 2) )

plot( power$DateTime, power$Global_active_power, type='l', xlab='', ylab='Global Active Power' )

plot( power$DateTime, power$Voltage, type='l', xlab='datetime', ylab='Voltage' )

plot( power$DateTime, power$Sub_metering_1, type='l', col='black', xlab='', ylab='Energy sub metering' )
lines( power$DateTime, power$Sub_metering_2, type='l', col='red' )
lines( power$DateTime, power$Sub_metering_3, type='l', col='blue' )
legend( "topright", bty='n', lwd=2, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3") ) 

plot( power$DateTime, power$Global_reactive_power, type='l', xlab='datetime', ylab='Global_reactive_power' )

dev.off()