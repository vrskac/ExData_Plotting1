plot1 <- function() {
    
    # Get the data for plotting.
    dat <- prepare_data()
    
    # Ready the file.
    png(filename = "plot1.png")
    
    # Create the plot.
    hist(dat$global_active_power,
         col = "red",
         main = "Global Active Power",
         xlab = "Global Active Power (kilowatts)"
    )
    
    # Finish up.
    dev.off()
    
    # Confirmation to user.
    return(message("File plot1.png created."))
    
}