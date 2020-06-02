plot3 <- function(table = NULL, mode = "png"){
        if (is.null(table)){
                table <- filedata()
        }
        data <- preprocess(data = table)
        if (mode == "png"){
                png(filename = "plot3.png", width = 480, height = 480, pointsize = 12, bg = "white",  res = NA)
                plot(data$Sub_metering_1~data$DateTime, ylab = "Energy Sub Metering", xlab = "", col = "black", type = "l")
                points(data$Sub_metering_2~data$DateTime, ylab = "Energy Sub Metering", xlab = "", col = "red", type = "l")
                points(data$Sub_metering_3~data$DateTime, ylab = "Energy Sub Metering", xlab = "", col = "blue", type = "l")

                legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, lwd=2, col = c("black", "red", "blue"))
                dev.off()
        }
        else{
              plot(data$Sub_metering_1~data$DateTime, ylab = "Energy Sub Metering", xlab = "", col = "black", type = "l")
                points(data$Sub_metering_2~data$DateTime, ylab = "Energy Sub Metering", xlab = "", col = "red", type = "l")
                points(data$Sub_metering_3~data$DateTime, ylab = "Energy Sub Metering", xlab = "", col = "blue", type= "l")

                legend("topright", legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), lty=1, lwd=2, col = c("black", "red", "blue"))
        }
}

source('plot_util.R')
plot3()