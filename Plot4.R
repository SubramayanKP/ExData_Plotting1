#Extract the specified data as per instructions by selecting the data,
#only for 1/2/2007 and 2/2/2007 for plotting.
library(datasets)
house_data <-read.table("exdata_data/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
house_x_data <-rbind(house_data[house_data$Date=="1/2/2007",], house_data[house_data$Date=="2/2/2007",])

#Transform the date to "Date-format" and assign a new variable with Date and Time cocantinated
house_x_data$Date <- as.Date(house_x_data$Date,"%d/%m/%Y")
house_x_data<-cbind(house_x_data, "DateTime" = as.POSIXct(paste(house_x_data$Date, house_x_data$Time)))

#Plot for comparision of (Global_active_power V/s three days of a week) and (Voltage V/s three days of a week)
par(mfrow=c(2,2))
plot(house_x_data$Global_active_power ~ house_x_data$DateTime, type="l")
plot(house_x_data$Voltage ~ house_x_data$DateTime, type="l")

#Plot for comparision of (Sub_metering_1,Sub_metering_2 and Sub_metering_3 V/s three days of a week)
with(house_x_data, {plot(Sub_metering_1 ~ DateTime, type="l")})
lines(house_x_data$Sub_metering_2 ~ house_x_data$DateTime, col = 'Red')
lines(house_x_data$Sub_metering_3 ~ house_x_data$DateTime, col = 'Blue')

#Plot for comparision of (Global_reactive_power V/s three days of a week)
plot(house_x_data$Global_reactive_power ~ house_x_data$DateTime, type="l")


#Copy the Plot of the data extracted as above and store it to plot4.png plot
dev.copy(png, file = "plot4.png")
dev.off( )

