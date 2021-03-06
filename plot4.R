


## import the full file, semicolon delimiter
consume<-read.delim("C:\\Users\\Dwight\\Documents\\R_Workspace\\Exploratory_Data_Analysis\\Week_1_Project\\household_power_consumption.txt", header=TRUE, sep=";")
library(lubridate)
## filter down to new table based on provided dates, and removing NA records for Global_active_power
consumsub<-subset(consume,dmy(Date)>=dmy("01-02-2007") & dmy(Date)<=dmy("02-02-2007") & Global_active_power != "?")
consumsub<-subset(consumsub,Global_active_power !="?")
## Convert text date and time fields to one date/time field, into a new table
consum_dt<-cbind(consumsub, obs_dttm=strptime(paste(consumsub$Date, consumsub$Time, sep=" "), "%d/%m/%Y %H:%M:%S"))

## specify 2x2 grid for plots
par(mfrow=c(2,2))

## draw histogram. 1
plot(consum_dt$obs_dttm,as.numeric(as.character(consum_dt$Global_active_power)),  type="l", main="", xlab="", ylab="Global Active Power (kilowatts)")

## draw histogram. 2
plot(consum_dt$obs_dttm, as.numeric(as.character(consum_dt$Voltage)),  xlab="", type="l",  ylab="Voltage", main="")

## draw plot 3
plot(consum_dt$obs_dttm, as.numeric(consum_dt$Sub_metering_1), type="l", ylab="Energy sub metering", xlab="")
lines(consum_dt$obs_dttm, as.numeric(as.character(consum_dt$Sub_metering_2)), type="l", col="red")
lines(consum_dt$obs_dttm, as.numeric(as.character(consum_dt$Sub_metering_3)), type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"),lty=c(1,1,1),lwd=c(2.5,2.5,2.5), col=c("black", "red", "blue"), cex=.5)

## draw histogram. 4
plot(consum_dt$obs_dttm, as.numeric(as.character(consum_dt$Global_reactive_power)), type="l",main="", ylab="Global Reactive Power", xlab="datetime")

## export to png
dev.copy(png, "C:\\Users\\Dwight\\Documents\\R_Workspace\\Exploratory_Data_Analysis\\Week_1_Project\\plot4.png")
dev.off()