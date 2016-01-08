plot3 <- function() {
    
    # Get the data for plotting.
    dat <- prepare_data()
    
    # Ready the file.
    png(filename = "plot3.png")
    
    # Create the plot.
    plot(
        dat$datetime,
        dat$sub_metering_1,
        type = "l",
        xlab = "",
        ylab = "Energy sub metering"
    )
    
    lines(dat$datetime, dat$sub_metering_2, col = "red")
    lines(dat$datetime, dat$sub_metering_3, col = "blue")
    
    legend(x = "topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=c(1,1), col = c("black", "red", "blue"))
    
    # Finish up.
    dev.off()
    
    # Confirmation to user.
    return(message("File plot3.png created."))
    
}