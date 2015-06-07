########### Read the data

Data <- read.table(file = "household_power_consumption.txt",na.strings = "?", header = TRUE,sep = ";")

########### Subset data

Data = subset(Data,Date == "1/2/2007" | Date == "2/2/2007")

########### Change Format

Data$Date = as.Date(Data$Date,format = "%d/%m/%Y") # Date
Data$Time = strptime(x = Data$Time,format = "%H:%M:%S") # Time
Data$Time = strftime(Data$Time, "%H:%M:%S") # Time
Data$Time = as.POSIXct(paste(Data$Date, Data$Time), format="%Y-%m-%d %H:%M:%S")

########### Plot

dev.off()
par(mfcol = c(2,2), mar = c(4,4,1,1))
# 1
with(Data, plot(Time,Global_active_power,type = "n",
                ylab = "Global Active Power (kilowatts)"),xlab = "")
with(Data, lines(Time,Global_active_power))
# 2
with(Data, plot(Time,Global_active_power,type = "n",
                ylab = "Energy sub metering",xlab = "",ylim = c(0,40)))
with(Data, lines(Time,Sub_metering_1))
with(Data, lines(Time,Sub_metering_2, col = "red"))
with(Data, lines(Time,Sub_metering_3, col = "blue"))
legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1),
       
       lwd=c(2.5,2.5),col=c("black","blue","red"), cex = 0.75)
# 3
with(Data, plot(Time,Voltage,type = "n",
                ylab = "Voltage"),xlab = "datetime")
with(Data, lines(Time,Voltage))

# 4 
with(Data, plot(Time,Global_reactive_power,type = "n",
                ylab = "Global_reactive_power"),xlab = "datetime")
with(Data, lines(Time,Global_reactive_power))

########### Write Plot into File
png("plot4.png")
        par(mfcol = c(2,2), mar = c(4,4,1,1))
        # 1
        with(Data, plot(Time,Global_active_power,type = "n",
                        ylab = "Global Active Power (kilowatts)"),xlab = "")
        with(Data, lines(Time,Global_active_power))
        # 2
        with(Data, plot(Time,Global_active_power,type = "n",
                        ylab = "Energy sub metering",xlab = "",ylim = c(0,40)))
        with(Data, lines(Time,Sub_metering_1))
        with(Data, lines(Time,Sub_metering_2, col = "red"))
        with(Data, lines(Time,Sub_metering_3, col = "blue"))
        legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
               lty=c(1,1,1),
               
               lwd=c(2.5,2.5),col=c("black","blue","red"), cex = 0.75)
        # 3
        with(Data, plot(Time,Voltage,type = "n",
                        ylab = "Voltage"),xlab = "datetime")
        with(Data, lines(Time,Voltage))
        
        # 4 
        with(Data, plot(Time,Global_reactive_power,type = "n",
                        ylab = "Global_reactive_power"),xlab = "datetime")
        with(Data, lines(Time,Global_reactive_power))
dev.off()
