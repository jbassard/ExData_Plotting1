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

##Calling png function
png("./EDAassignement/plot1.png", width=480, height=480)

##Calling histogram function
hist(as.numeric(as.character(Power$Global_active_power)),col="red",main="Global Active Power",xlab="Global Active Power(kilowatts)")

##Closing png function
dev.off()
