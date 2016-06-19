
setwd("C:\\Users\\Dwight\\Documents\\R_Workspace\\Exploratory_Data_Analysis\\Week_1_Project\\")

## import the full file, semicolon delimiter
consume<-read.delim("~/household_power_consumption.txt", header=TRUE, sep=";")
library(lubridate)
## filter down to new table based on provided dates, and removing NA records for Global_active_power
consumsub<-subset(consume,dmy(Date)>=dmy("01-02-2007") & dmy(Date)<=dmy("02-02-2007") & Global_active_power != "?")
consumsub<-subset(consumsub,Global_active_power !="?")
## Convert text date and time fields to one date/time field, into a new table
consum_dt<-cbind(consumsub, obs_dttm=strptime(paste(consumsub$Date, consumsub$Time, sep=" "), "%d/%m/%Y %H:%M:%S"))

## draw histogram.
hist(as.numeric(as.character(consum_dt$Global_active_power)), col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")

## export to png
dev.copy(png, "~/plot1.png")
dev.off()

