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
Power <- rbind(Power[Power$Date=="1/2/2007",],Power[Power$Date=="2/2/2007",])

##Changing date and time format and change local computer time
Sys.setlocale("LC_TIME", "English")
date_time <- strptime(paste(Power$Date, Power$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

##Calling png function
png("./EDAassignement/plot2.png", width=480, height=480)

##Calling plot function
plot(date_time, as.numeric(as.character(Power$Global_active_power)), type="l", xlab="", ylab="Global Active Power (kilowatts)")

##Closing png function
dev.off()
