
### Function: mean_exrate
### Returns the mean exchange rate MXN/USD for the specified period.
### You do not need additional packages

mean_exrate <- function(x, y, file){
        ## x and y are character vectors of length 1 that indicates
        ## two dates (in YYYY-mm-dd format): 
        ## x is the first date of the period of interest
        ## y is the last date of the period of interest
        ## file is character vector of length 1 
        ## with CSV filename with the data in the correct format
        ## if you run this function inmediately after running getTable(), then 
        ## the CSV file is stored in your current wd with the filename
        ## xrate_"date".csv
        
        ## Defining the period of time
        a <- as.Date(x)
        b <- as.Date(y)
        
        ## Reading the file 
        mydata <- read.csv(file, header = TRUE)
        
        ## Converting the dates format 
        mydata$date <- as.Date(as.character(mydata$date), format = "%d/%m/%Y")
        
        ## Subsetting
        subs <- mydata[mydata$date >= a & mydata$date <= b, ]
        m <- mean(subs$ex.rate)
        
        m
}
                