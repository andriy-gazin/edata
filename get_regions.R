library(httr)
library(jsonlite)

get_regions <- function(){
  
  request <- GET('http://api.spending.gov.ua/api/v2/regions')
  
  if (status_code(request) != 200) {
    
    message(paste("Помилка HTTP запиту. Код помилки: ", status_code(request)))
    return(NULL)
    
  } else {
    
    response <- content(request, as = 'text')
    response <- fromJSON(response)
  
  }
  
  return(response)
  
}