rm(list=ls())
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip","./household_power_consumption.zip")

unzip("./household_power_consumption.zip")
f1<-file("./household_power_consumption.txt")
df<-read.table(f1,header = TRUE,sep=";",nrows=100000,na.strings = "?")
rm(f1)

df$Date<-as.Date(df$Date,"%d/%m/%Y")
df<-df[df$Date=="2007-02-01"|df$Date=="2007-02-02",]
df$Time<-paste(df$Date,df$Time,sep=" ")
df$Time<-strptime(df$Time,"%Y-%m-%d %H:%M:%S")

png(file ="plot1.png")
with(df,hist(Global_active_power,col= "red",main = "Global Active Power",xlab = "Global Active Power (kilowatts)"))
dev.off()
rm(df)