# Calling this script with the regenerate_subset_file parameter as TRUE will
# regenerate the subset data file. Otherwise if the file exists it will be used.

prepare_data <- function(regenerate_subset_file = FALSE) {
    library(lubridate)
    
    
    # Check if the subset file exists, if not set flag to regenerate.
    if (file.exists("household_power_consumption_subset.txt") == FALSE) {
        regenerate_subset_file = TRUE
    }
    
    # Check if flag has been set to regenerate the subset file.
    if (regenerate_subset_file == TRUE) {
        
        # First we need to check if the data file is available.
        if(file.exists("household_power_consumption.txt") == FALSE) {
            stop(paste("File household_power_consumption.txt is not",
                       "available in the root directory! See README.md for",
                       "download information."))
        }
        
        dat <- read.table(
            file = "household_power_consumption.txt",
            header = TRUE,
            sep = ";",
            na.strings = "?",
            col.names = c(
                "date",
                "time",
                "global_active_power",
                "global_reactive_power",
                "voltage",
                "global_intensity",
                "sub_metering_1",
                "sub_metering_2",
                "sub_metering_3"
            ),
            colClasses = c(
                "character",
                "character",
                "numeric",
                "numeric",
                "numeric",
                "numeric",
                "numeric",
                "numeric",
                "numeric"
            )
        )
        
        # Convert date variable character class to POSIXct.
        dat$date <- dmy(dat$date)
        
        # Subset for only the dates we are concerned with.
        dat <- dat[dat$date %within% interval(ymd("2007-02-01"),
                                              ymd("2007-02-02")),]
        
        # Write the subset to file for quicker loading.
        write.table(
            dat,
            file = "household_power_consumption_subset.txt",
            sep = ";",
            row.names = FALSE,
            col.names = TRUE
        )
    }
    
    dat <-
        read.table(
            file = "household_power_consumption_subset.txt",
            header = TRUE,
            sep = ";",
            colClasses = c(
                "character",
                "character",
                "numeric",
                "numeric",
                "numeric",
                "numeric",
                "numeric",
                "numeric",
                "numeric"
            )
        )
    
    # Create a new variable that combines the date and time.
    datetime <- with(dat, as.POSIXct(paste(date, time), format = "%Y-%m-%d %H:%M:%S"))
    
    # Bind the new variable on the left of the existing.
    dat <- cbind(datetime, dat)
    
    # Convert date variable character class to POSIXct.
    dat$date <- ymd(dat$date)
    
    # Convert time variable character class to lubridate period.
    dat$time <- hms(dat$time)
    
    return(dat)
    
}