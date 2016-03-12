
mean_exrate <- function(x, y, file = "xrates.csv"){
        ## x and y are numeric vectors of length 1 that indicates
        ## two dates (in YYYY-mm-dd format): 
        ## x is the first date of the period of interest
        ## y is the last date of the period of interest
        ## file is a CSV file with the data in the correct format
        ## by default it is the file resulting of running the 
        ## function getTable (previously done) 
        
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
                