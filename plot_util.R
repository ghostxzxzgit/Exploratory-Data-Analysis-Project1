#Set the directory
setdirectory <- function(dir = "Project1"){
        old.dir <- "/cloud/project/Project1"
        new.dir <- getwd()
        if (old.dir != new.dir){
                setwd(dir)
        }
}

#Download and unzip the file
download <- function(){
        url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
        file <- "Power.zip"
        if (!file.exists(file)){
                download.file(url, destfile = file, method = "curl")
                }
        if(!file.exists("household_power_consumption.txt")){
                unzip(file)
                }
}

#Read the data and clean it
filedata <- function(){
        if(file.exists("household_power_consumption.txt")){
                table <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
        }
        else{
                download()
                table <- read.table("household_power_consumption.txt", sep = ";", header = TRUE, na.strings = "?")
        }
        dates <- as.Date.character(table$Date, format = "%d/%m/%Y")
        required_dates <- (dates == "2007-02-01"|dates == "2007-02-02")
        data <- subset(table, required_dates)
        data$Date <- as.Date.character(data$Date, format = "%d/%m/%Y")

        invisible(data)
}

#Add the datetime column to the data
preprocess <- function(data = table){
        ## Add new column with datetime
        datetime <- paste(data$Date, data$Time)
        data$DateTime <- as.POSIXct(datetime)

        invisible(data)
}
