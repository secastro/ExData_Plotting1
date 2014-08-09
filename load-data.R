load_data <- function() {
    zip_file = 'household_power_consumption.zip'
    txt_file = 'household_power_consumption.txt'

    # Check if the zip file exists
    if (!file.exists(zip_file)) {
        message("Zip file with data doesn't exist, downloading")
        download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",
        destfile=zip_file, method="curl")
    }
    # Prepare a connection that reads directly from the zip file
    data_conn <- unz(zip_file, txt_file)

    # Get the data from the original source
    data <- read.table(data_conn, sep=';', header=TRUE, colClasses='character')

    # Parse the date column so it can be filtered later
    data$Date <- as.Date( data$Date, "%d/%m/%Y")

    ss <- data[ data$Date == '2007-02-01' | data$Date == '2007-02-02', ]

    # We need this field to prepare a graph later
    ss$dt <- strptime(paste(ss$Date, ss$Time, sep=" "), "%Y-%m-%d %H:%M:%S", tz='UTC')

    # Cast the numeric columns of interest as numeric, for easier handling
    ss$Global_reactive_power <- as.numeric(ss$Global_reactive_power)

    ss$Global_active_power <- as.numeric(ss$Global_active_power)

    ss$Sub_metering_1 <- as.numeric(ss$Sub_metering_1)
    ss$Sub_metering_2 <- as.numeric(ss$Sub_metering_2)
    ss$Sub_metering_3 <- as.numeric(ss$Sub_metering_3)

    ss$Voltage <- as.numeric(ss$Voltage)

    ss
}
