plot4 <- function(table = NULL, mode = "png"){
        if (is.null(table)){
                table <- filedata()
        }
        data <- preprocess(table)
        if (mode == "png"){
                png(filename = "plot4.png", width = 480, height = 480, pointsize = 12, bg = "white",  res = NA)
                par(mfcol = c(2,2))
                plot2(mode = "Windows")
                plot3(mode = "Windows")
                plot(data$Voltage~data$DateTime, xlab = "DateTime", ylab = "Voltage", type = "l")
                plot(data$Global_reactive_power~data$DateTime, xlab = "DateTime", ylab = "Global Reactive Power", type = "l")
                dev.off()
        }

        else{
                par(mfcol = c(2,2))
                plot2(mode = "Windows")
                plot3(mode = "Windows")
                plot(data$Voltage~data$DateTime, xlab = "DateTime", ylab = "Voltage", type = "l")
                plot(data$Global_reactive_power~data$DateTime, xlab = "DateTime", ylab = "Global Reactive Power", type = "l")
        }
}

source('plot_util.R')
plot4()