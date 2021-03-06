consumption <- read.table(unz("../exdata_data_household_power_consumption.zip", "household_power_consumption.txt"), 
                          header = FALSE, sep = ";", skip = 66637, nrow = 2880, stringsAsFactors = F, 
                          na.strings = "?")
data_head <- read.table(unz("../exdata_data_household_power_consumption.zip", "household_power_consumption.txt"), 
                     nrow = 1, sep = ";", stringsAsFactors = F)
names(consumption) <- unlist(data_head)
consumption <- transform(consumption, Date = as.Date(Date, "%d/%m/%Y"), 
                                       Time = strptime(paste(Date, Time), 
                                                       "%d/%m/%Y %H:%M:%S"))
par(mfrow = c(1, 1))
png('plot1.png', width = 480, height = 480)
hist(consumption$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)", 
     main = "Global Active Power")
dev.off()
