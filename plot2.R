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
    
    # plot the graphic 2
    library(datasets)
    
    # open graphic device png
    png(filename="plot2.png", width=480, height=480)
    
    with(powerData, plot(Date,Global_active_power, 
                      type="l", 
                      ylab="Global Active Power (kilowatts)", 
                      xlab=""))
    
    # close graphic device
    dev.off()
}