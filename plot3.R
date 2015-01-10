render <- function() {
    # read the data
    powerData <- read.table("household_power_consumption.txt", 
                            sep=";", 
                            header=TRUE, 
                            na.string=c("?", ""), 
                            as.is=T)
    
    # filtered the data to take data from 1/2/2007 and 2/2/2007
    powerData <- powerData[powerData$Date %in% c("1/2/2007", "2/2/2007"),]
    
    # convert Date to datetime
    powerData$Date <- strptime(paste(powerData$Date, " ", powerData$Time),
                               "%d/%m/%Y %H:%M:%S")
    
    # plot the graphic 3
    library(datasets)
    
    # open graphic device png
    png(filename="plot3.png", width=480, height=480)   
    
    # render the sub_metering_1, sub_metering_2, sub_metering_3 
    # and set the legend
    with(powerData, plot(Date,Sub_metering_1, 
                         type="l", 
                         ylab="Energy sub metering", 
                         xlab=""))
    
    with(powerData, points(Date,Sub_metering_2, 
                           type="l", 
                           col="red"))
    
    with(powerData, points(Date,Sub_metering_3, 
                           type="l", 
                           col="blue"))
    
    legend("topright", 
           legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"), 
           lty=c(1,1,1), 
           col=c("black", "red", "blue"))
    
    # close graphic device
    dev.off()
}