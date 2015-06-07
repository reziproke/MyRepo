# Read the data

Data <- read.table(file = "household_power_consumption.txt",na.strings = "?", header = TRUE,sep = ";")

# Subset data

Data = subset(Data,Date == "1/2/2007" | Date == "2/2/2007")

# Change Format

Data$Date = as.Date(Data$Date,format = "%d/%m/%Y") # Date
Data$Time = strptime(x = Data$Time,format = "%H:%M:%S") # Time
Data$Time = strftime(Data$Time, "%H:%M:%S") # Time
Data$Time = as.POSIXct(paste(Data$Date, Data$Time), format="%Y-%m-%d %H:%M:%S")

# Plot
dev.off()
with(Data, plot(Time,Global_active_power,type = "n",
                ylab = "Global Active Power (kilowatts)"),xlab = "")
with(Data, lines(Time,Global_active_power))

# Write Plot into File
png("plot2.png")
        with(Data, plot(Time,Global_active_power,type = "n",
                        ylab = "Global Active Power (kilowatts)"),xlab = "")
        with(Data, lines(Time,Global_active_power))
dev.off()
