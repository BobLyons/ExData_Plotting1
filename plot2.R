# Pull in the required libraries.
library('dplyr')

# Load data and filter, since we need only two days.
power <- read.table('household_power_consumption.txt', header=TRUE, sep=';', na.strings=c('?')) %>%
  filter( grepl( '^1/2/2007|^2/2/2007', Date ) )

# Add DateTime field.
power$DateTime <- strptime( paste( power$Date, power$Time, sep=' '), format='%d/%m/%Y %H:%M:%S' )

# Construct plot and write it to a png file.
png(filename='plot2.png', bg="white")

plot(power$DateTime, power$Global_active_power, type='l', xlab='', ylab='Global Active Power (kilowatts)')

dev.off()