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
png('plot2.png', width = 480, height = 480)
with(consumption, plot(Time, Global_active_power, type = "l", xlab = "", 
                       ylab = "Global Active Power (kilowatts)"))
dev.off()
