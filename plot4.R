##Check if file exists in the folder "EDAassignement" in working directory, otherwise create the folder, download and unzip the dataset in that folder
if(!file.exists("./EDAassignement")) {
	dir.create("./EDAassignement")}
if(!file.exists("./EDAassignement/Power.zip")) {
	fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
	download.file(fileUrl, destfile="EDAassignement/Power.zip")}
if(!file.exists(".EDAassignement/houshold_power_consumption")) {
	unzip(zipfile="./EDAassignement/Power.zip", exdir="./EDAassignement")}

##Then read and store the file used for the assignement
dataFile <- "./EDAassignement/household_power_consumption.txt"
Power <- read.table(dataFile , header=TRUE, sep=";", na.strings = "?")

##Subset the data
Power <-rbind(Power[Power$Date=="1/2/2007",],Power[Power$Date=="2/2/2007",])

##Changing date and time format
date_time <- strptime(paste(Power$Date, Power$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

##Calling png function
png("./EDAassignement/plot4.png", width=480, height=480)

##Making the 2,2 matrice for the graphs
par(mfrow = c(2, 2)) 

##Making graph 1
plot(date_time, as.numeric(as.character(Power$Global_active_power)), type="l", xlab="", ylab="Global Active Power")

##Making graph 2
plot(date_time, as.numeric(as.character(Power$Voltage)), type="l", xlab="datetime", ylab="Voltage")

##Making graph 3
plot(date_time, Power$Sub_metering_1, type="l", xlab="", ylab="Energy Sub metering")
lines(date_time, Power$Sub_metering_2, type = "l", col = "red" )
lines(date_time, Power$Sub_metering_3, type = "l", col = "blue" )
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=3, col=c("black", "red", "blue"), box.lty=0  #box.lty=0 to remove the legend boarder

##Making graph 4
plot(date_time, as.numeric(as.character(Power$Global_reactive_power)), type="l", xlab="datetime", ylab="Global_Rective_Power")

##Closing png function
dev.off()
