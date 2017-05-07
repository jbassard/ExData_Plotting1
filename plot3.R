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

##Changing date and time format and local computer time
Sys.setlocale("LC_TIME", "English")
date_time <- strptime(paste(Power$Date, Power$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

##Calling png function
png("./EDAassignement/plot3.png", width=480, height=480)

##Calling plot function and ploting sub metering 1
plot(date_time, Power$Sub_metering_1, type="l", xlab="", ylab="Energy Submetering")

##Adding line for sub metering 2
lines(date_time, Power$Sub_metering_2, type = "l", col = "red" )

##Adding line for sub metering 3
lines(date_time, Power$Sub_metering_3, type = "l", col = "blue" )

##Annotating the graph
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"), lty=1, lwd=3)

##Closing png function
dev.off()
