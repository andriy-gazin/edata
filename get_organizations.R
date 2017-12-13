

get_organizations <- function(){
  
  if(!dir.exists('data')) {
    
    dir.create('data')
    
  }
  
  download.file("http://api.spending.gov.ua/api/v2/stat/organizations/csv", 
                "data/organizations.zip")
  
  filename <- unzip("data/organizations.zip", exdir = 'data')

  organisations <- read.csv(filename, 
                            fileEncoding = 'Windows-1251', 
                            colClasses = c('Date', 
                                           rep('character', 8), 
                                           rep('integer', 10)),
                            sep = ';', 
                            stringsAsFactors = F, 
                            skip = 1)
  
  return(organisations)
  
  
}
