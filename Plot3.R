##Read in the data
getwd()
setwd("D:/Documents and Settings/tnjunge/Documents/R/Exploratorydatanalysisdata/exdata%2Fdata%2Fhousehold_power_consumption")
HHpowerconsumption_Feb <-rbind(HHpowerconsumption[HHpowerconsumption$Date=="1/2/2007",],HHpowerconsumption[HHpowerconsumption$Date=="2/2/2007",])
HHpowerconsumptionFeb$Date <- as.Date(HHpowerconsumptionFeb$Date, format = '%d/%m/%Y')
HHpowerconsumptionFeb$DateTime <- as.POSIXct(paste(HHpowerconsumptionFeb$Date, HHpowerconsumptionFeb$Time))
plot.new()
png('Plot3.png',width=480,height=480,units='px')
plot(HHpowerconsumptionFeb$DateTime, HHpowerconsumption_Feb$Sub_metering_1, xlab = '', ylab = 'Energy sub metering', type = 'l')
lines(HHpowerconsumptionFeb$DateTime, HHpowerconsumption_Feb$Sub_metering_2, col = 'red')
lines(HHpowerconsumptionFeb$DateTime, HHpowerconsumption_Feb$Sub_metering_3, col = 'blue')
legend('topright', col = c('black', 'red', 'blue'), legend = c('Sub_metering_1', 'Sub_metering_2', 'Sub_metering_3'), lwd = 1)
dev.off()


