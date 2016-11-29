##Read in the data
getwd()
setwd("D:/Documents and Settings/tnjunge/Documents/R/Exploratorydatanalysisdata/exdata%2Fdata%2Fhousehold_power_consumption")
HHpowerconsumption <-read.table("household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
##subset the data for 1 and 2nd February
HHpowerconsumption_Feb <-rbind(HHpowerconsumption[HHpowerconsumption$Date=="1/2/2007",],HHpowerconsumption[HHpowerconsumption$Date=="2/2/2007",])
##Convert the Date and Time variables to Date/Time classes in R 
HHpowerconsumptionDates <- as.Date(HHpowerconsumption_Feb$Date,"%d/%m/%Y")
HHpowerconsumption_Feb<-cbind(HHpowerconsumption_Feb, "DateTime" = as.POSIXct(paste(HHpowerconsumption_Feb$Date, HHpowerconsumption_Feb$Time)))
##plot plot 1
png('Plot1.png')
hist(as.numeric(HHpowerconsumption_Feb$Global_active_power), col="Red", main="Global Active Power", xlab="Global Active power (kilowatts)", ylab="Frequency")
dev.off()
