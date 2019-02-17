#Extract the specified data as per instructions by selecting the data,
#only for 1/2/2007 and 2/2/2007 for plotting.
library(datasets)
house_data <-read.table("exdata_data/household_power_consumption.txt", header=TRUE, sep=";", na.strings = "?")
house_x_data <-rbind(house_data[house_data$Date=="1/2/2007",], house_data[house_data$Date=="2/2/2007",])

#Transform the date to "Date-format" and assign a new variable with Date and Time cocantinated
house_x_data$Date <- as.Date(house_x_data$Date,"%d/%m/%Y")
house_x_data<-cbind(house_x_data, "DateTime" = as.POSIXct(paste(house_x_data$Date, house_x_data$Time)))

#Plot to measure Global Active power (in Kilowhatts) as a sample of three days of a week (plot2.png)
plot(house_x_data$Global_active_power ~ house_x_data$DateTime, type="l", xlab= "", ylab="Global Active power (kilowatts)")
dev.copy(png, file = "plot2.png" , width = 480, height = 480)
dev.off( )
