# Load the data
source("load-data.R")
data_subset <- load_data()

# Creates figure 2
png(filename="figure2.png", width=480, height=480)
plot(data_subset$dt, data_subset$Global_active_power, type="l", xlab="",
    ylab="Global Active Power (kilowatts)")
dev.off()

