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

#creating a new variable collum DateTime, containing both values of Date and Time
hpc$DateTime <- with(hpc, paste(Date, Time))

#setting the DateTime variable to a format representing calendar dates and times 
hpc$DateTime <- as.POSIXct(hpc$DateTime)


#Turning on and setting the graphics device to png
dev.copy(png, file="plot3.png", height=480, width=480)

#Plotting blank hpc DateTime X Sub_metering levels and then the lines and legend 
with(hpc,
     {
       plot(
         DateTime,
         Sub_metering_1,
         type = "n",
         xlab = "",
         ylab = "Energy sub metering"
       )
       lines(DateTime, Sub_metering_1, type  = "l")
       lines(DateTime, Sub_metering_2, type  = "l", col = "red")
       lines(DateTime, Sub_metering_3, type  = "l", col = "blue")
       legend(
         "topright",
         c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
         col = c("black", "red", "blue"),
         lty = 1,
         lwd = 2
       )
     })

#Turning off the graphics device
dev.off()

