# Load the data
source("load-data.R")
data_subset <- load_data()

# Creates figure 4
png(filename="figure4.png", width=480, height=480)
par(mfrow = c(2,2))

# Subplot 1
plot(data_subset$dt, data_subset$Global_active_power, type="l",
    col="black", xlab="", ylab="Global Active Power")

# Subplot 2
plot(data_subset$dt, data_subset$Voltage, type="l", col="black",
xlab="datetime", ylab="Voltage")

# Subplot 3, same as plot3.R
plot(data_subset$dt, data_subset$Sub_metering_1, type="l", col="black", ylab="Energy sub metering", xlab="")
lines(data_subset$dt, data_subset$Sub_metering_2, type="l", col="red")
lines(data_subset$dt, data_subset$Sub_metering_3, type="l", col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1, bty="n",
    legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

# Subplot 4
plot(data_subset$dt, data_subset$Global_reactive_power, type="l",
col="black", xlab="datetime", ylab="Global_reactive_power")

# Close the device
dev.off()
