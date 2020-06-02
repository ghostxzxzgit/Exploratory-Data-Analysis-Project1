plot1 <- function(table = NULL){
        if (is.null(table)){
                table <- filedata()
                }
        png(filename = "plot1.png", width = 480, height = 480,
            pointsize = 12, bg = "white",  res = NA)
        hist(table$Global_active_power, col = "red", xlab = "Global Active Power (KiloWatts)", main = "Global Active Power")
        dev.off()
        }

source('plot_util.R')
plot1()