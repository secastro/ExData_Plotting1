# Load the data
source("load-data.R")
data_subset <- load_data()

# Creates figure 1
png(filename="figure1.png", width=480, height=480)
hist(data_subset$Global_active_power, col="red", 
xlab="Global Active Power (kilowatts)",
main="Global Active Power")
dev.off()

