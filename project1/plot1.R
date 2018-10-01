#Libraries
library(dplyr)

#Getting the file

wd <- "C:/Users/kiryl.varanovich/Documents/Knowledge/Data Science/Courses/006_Coursera_Exploratory_Data_Analysis"
setwd(wd)

if (!dir.exists("project1")) {dir.create("project1")}

dataset_url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
download.file(url = dataset_url,
              destfile = "project1/data.zip")
unzip(zipfile = "project1/data.zip",
      exdir = "project1")

#Reading the file
power_df <- read.csv2(file = "project1/household_power_consumption.txt",
                      na.strings = "?",
                      dec = ".",
                      stringsAsFactors = FALSE)

#Filtering and transforming
power_df <- power_df %>% 
  filter(Date %in% c("1/2/2007", "2/2/2007"))

power_df$Date_time <- paste(power_df$Date, power_df$Time)
power_df$Date_time <- strptime(power_df$Date_time, "%d/%m/%Y %H:%M:%S")

#Plotting
png(filename = "project1/plot1.png",
    width = 480,
    height = 480)
hist(power_df$Global_active_power,
     col = "red",
     main = "Global Active Power",
     xlab = "Global Active Power (kilowatts)")
dev.off()
