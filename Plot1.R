# Read the data

Data <- read.table(file = "household_power_consumption.txt",na.strings = "?", header = TRUE,sep = ";")

# Subset data

Data = subset(Data,Date == "1/2/2007" | Date == "2/2/2007")

# Change Format

Data$Date = as.Date(Data$Date,format = "%d/%m/%Y") # Date
Data$Time = strptime(x = Data$Time,format = "%H:%M:%S") # Time
Data$Time = strftime(Data$Time, "%H:%M:%S") # Time

# Plot
dev.off()
hist(Data$Global_active_power, col = "red", main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")

# Write Plot into File
png("plot1.png")
        hist(Data$Global_active_power, col = "red", main = "Global Active Power",
             xlab = "Global Active Power (kilowatts)")
dev.off()