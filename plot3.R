# Load the data
source("load-data.R")
data_subset <- load_data()

# Creates figure 3
png(filename="figure3.png", width=480, height=480)
plot(data_subset$dt, data_subset$Sub_metering_1, type="l", col="black", ylab="Energy sub metering", xlab="")
lines(data_subset$dt, data_subset$Sub_metering_2, type="l", col="red")
lines(data_subset$dt, data_subset$Sub_metering_3, type="l", col="blue")
legend("topright", col=c("black", "red", "blue"), lty=1,
    legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()

