plot2 <- function() {
    
    # Get the data for plotting.
    dat <- prepare_data()
    
    # Ready the file.
    png(filename = "plot2.png")
    
    # Create the plot.
    plot(
        dat$datetime,
        dat$global_active_power,
        type = "l",
        xlab = "",
        ylab = "Global Active Power (kilowatts)"
    )
    
    # Finish up.
    dev.off()
    
    # Confirmation to user.
    return(message("File plot2.png created."))
    
}