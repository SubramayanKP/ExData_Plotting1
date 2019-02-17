
#Extract the specified data as per instructions by selecting the data,

#only for 1/2/2007 and 2/2/2007 for plotting.

library(datasets)

house_data <-read.table("exdata_data/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")

house_x_data <-rbind(house_data[house_data$Date=="1/2/2007",], house_data[house_data$Date=="2/2/2007",])



#Transform the date to "Date-format" and assign a new variable with Date and Time cocantinated

house_x_data$Date <- as.Date(house_x_data$Date,"%d/%m/%Y")

house_x_data<-cbind(house_x_data, "DateTime" = as.POSIXct(paste(house_x_data$Date, house_x_data$Time)))



#Plot for comparision of submetering1,submetering2 and submetering3 during three different days of the week

with(house_x_data, {plot(Sub_metering_1 ~ DateTime, type="l", xlab= "", ylab="Energy Sub Metering")})

lines(house_x_data$Sub_metering_2 ~ house_x_data$DateTime, col = 'Red')

lines(house_x_data$Sub_metering_3 ~ house_x_data$DateTime, col = 'Blue')

legend("topright",lty = 1, lwd = 3, col=c("black","red","blue"), legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

#Copy the Plot of the data extracted as above and store it to plot3.png plot

dev.copy(png, file = "plot3.png" , width = 480, height = 480)

dev.off( )