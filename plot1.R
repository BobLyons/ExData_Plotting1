# Pull in the required libraries.
library('dplyr')

# Load data and filter, since we need only two days.
power <- read.table('household_power_consumption.txt', header=TRUE, sep=';', na.strings=c('?')) %>%
  filter( grepl( '^1/2/2007|^2/2/2007', Date ) )

# Construct plot and write it to a png file.
png(filename='plot1.png', bg="white")

hist(power$Global_active_power, xlab='Global Active Power (kilowatts)', main='Global Active Power', col='red', ylim=c(0,1200))

dev.off()