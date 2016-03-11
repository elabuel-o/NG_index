
mean_exrate <- function(x, y){
        ## x and y are numeric vectors of length 1 that indicates
        ## two dates (in YYYY-mm-dd format): 
        ## x is the first date of the period of interest
        ## y is the last date of the period of interest
        ## REMEMBER: We need the package XML
        
        ## Getting the url of Banxico exchange rates
        url <- "http://www.banxico.org.mx/tipcamb/tipCamIHAction.do" 
        
        ## Getting the tables of the recorded url
        tables <- readHTMLTable(url)
        
        ## The resultant table has 7 lists. We need lists 3 and 6
        ## List 3: dates as factors
        dates <- as.data.frame(tables[3])
        colnames(dates) <- "date"
        ## List 6: values as factors
        data <- as.data.frame(tables[6])
        colnames(data) <- "ex.rate"
        
        ## In order to merge both data frames we need an id key
        id <- 1:length(dates$date)
        
        ## Merging both data frames
        dates <- cbind(id, dates)
        data <- cbind(id, data)
        mydata <- merge(dates, data, by = "id")
        
        rm(id, dates, data)

        ## Converting to numeric and date formats
        mydata$ex.rate <- as.numeric(as.character(mydata$ex.rate))
        mydata$date <- as.Date(as.character(mydata$date), format = "%d/%m/%Y")
        
        ## Defining the period of time
        a <- as.Date(x)
        b <- as.Date(y)
        
        ## Subsetting
        subs <- mydata[mydata$date >= a & mydata$date <= b, ]
        m <- mean(subs$ex.rate)
        
        m
}
                
                


