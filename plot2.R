plot2 <- function(table = NULL, mode = "png"){
        if (is.null(table)){
                table <- filedata()
        }
        data <- preprocess(table)
        if (mode == "png"){
                png(filename = "plot2.png", width = 480, height = 480,
                    pointsize = 12, bg = "white",  res = NA)
                plot(data$Global_active_power~data$DateTime, ylab="Global Active Power (kilowatts)", xlab="", type="l")
                dev.off()
        }

        else{
                plot(data$Global_active_power~data$DateTime, ylab="Global Active Power (kilowatts)", xlab="", type="l")
        }
}

source('plot_util.R')
plot2()