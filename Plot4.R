##Read in the data
getwd()
setwd("D:/Documents and Settings/tnjunge/Documents/R/Exploratorydatanalysisdata/exdata%2Fdata%2Fhousehold_power_consumption")
HHpowerconsumption_Feb <-rbind(HHpowerconsumption[HHpowerconsumption$Date=="1/2/2007",],HHpowerconsumption[HHpowerconsumption$Date=="2/2/2007",])
HHpowerconsumptionFeb$Date <- as.Date(HHpowerconsumptionFeb$Date, format = '%d/%m/%Y')
HHpowerconsumptionFeb$DateTime <- as.POSIXct(paste(HHpowerconsumptionFeb$Date, HHpowerconsumptionFeb$Time))

png('Plot4.png',width=480,height=480,units='px')
par(mfrow=c(2,2))

plot(HHpowerconsumptionFeb$DateTime, HHpowerconsumption_Feb$Global_active_power, xlab = '', ylab = 'Global Active Power (kilowatt)', type = 'l')
plot(HHpowerconsumptionFeb$DateTime, HHpowerconsumption_Feb$Voltage, xlab = 'datetime', ylab = 'Voltage', type = 'l')
plot(HHpowerconsumptionFeb$DateTime, HHpowerconsumption_Feb$Sub_metering_1, xlab = '', ylab = 'Energy sub metering', type = 'l')
lines(HHpowerconsumptionFeb$DateTime, HHpowerconsumption_Feb$Sub_metering_2, col = 'red')
lines(HHpowerconsumptionFeb$DateTime, HHpowerconsumption_Feb$Sub_metering_3, col = 'blue')
legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 1)
plot(HHpowerconsumptionFeb$DateTime, HHpowerconsumption_Feb$Global_reactive_power, xlab = 'datetime', ylab = 'Global_reactive_power', type = 'l')

dev.off()