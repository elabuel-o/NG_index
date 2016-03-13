
### Function: getTable
### Returns a data frame with Banxico exchange rates from 2006 to present.
### Needs the XML package

getTable <- function(url = "http://www.banxico.org.mx/tipcamb/tipCamIHAction.do"){
        ## url is a character vector of length 1 with the 
        ## url of Banxico's daily exchange rate data
        ## Once the function reads and shapes the table, it storages the
        ## resulting data frame in the computer's memory.
        ## REMEMBER: We need the package XML!
        
        ## Getting the tables of the recorded url
        a <- url
        tables <- readHTMLTable(a)
        
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
        
        ## Writing and reading again the resulting CSV file
        g <- Sys.Date()
        filename = paste("xrate", "_", g, ".csv", sep = "")
        write.csv(mydata, file = filename)
}
        
        
        
        