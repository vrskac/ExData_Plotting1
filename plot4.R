plot4 <- function() {
    # Get the data for plotting.
    dat <- prepare_data()
    
    # Ready the file.
    png(filename = "plot4.png")
    
    # Setup the canvas.
    par(mfrow = c(2,2))
    
    # Create the plots.
    plot(
        dat$datetime,
        dat$global_active_power,
        type = "l",
        xlab = "",
        ylab = "Global Active Power"
    )
    
    plot(
        dat$datetime,
        dat$voltage,
        type = "l",
        xlab = "",
        ylab = "Voltage"
    )
    
    plot(
        dat$datetime,
        dat$sub_metering_1,
        type = "l",
        xlab = "",
        ylab = "Energy sub metering"
    )
    lines(dat$datetime, dat$sub_metering_2, col = "red")
    lines(dat$datetime, dat$sub_metering_3, col = "blue")
    legend(
        x = "topright",
        c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
        lty = c(1,1),
        col = c("black", "red", "blue"),
        bty = "n"
    )
    
    plot(
        dat$datetime,
        dat$global_reactive_power,
        type = "l",
        xlab = "",
        ylab = "Global_reactive_power"
    )
    
    # Finish up.
    dev.off()
    
    # Confirmation to user.
    return(message("File plot4.png created."))
}