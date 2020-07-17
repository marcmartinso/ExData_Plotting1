#setting working directory
getwd()
setwd("/home/marcmart/Programming/R/data_science/exploratory_data_analysis")

#reading and setting the house_power_consumption.txt file 
hpc.full <- read.table(file = "exdata_data_household_power_consumption/household_power_consumption.txt", 
                       sep = ";", dec = ".", header = TRUE, na.strings = "?", 
                       colClasses = c(rep("character", 2), rep("numeric", 7)))

#transforming the Date vector values into the Date format
hpc.full$Date <- as.Date(hpc.full$Date, format = "%d/%m/%Y")

#subsetting only the first two days of February 2007
hpc <- subset(hpc.full, Date >= "2007-02-01" & Date <= "2007-02-02")                      

#plotting the histogram of Global active power 
with(hpc, hist(Global_active_power,
               xlim = c(0,max(Global_active_power)),
               col = "red", 
               main = "Global Active Power",
               xlab = "Global Active Power (kilowatts)"))

#plotting in the png file format 
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()