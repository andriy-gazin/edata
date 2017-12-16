library(httr)
library(jsonlite)

top_transactions <- function(region = NULL){
  
  if(is.null(region)) {
    
    message('Параметр region не зазначено. Використовуємо параметр за замовчуванням')
    
  }
  
  request <- GET(url = 'http://api.spending.gov.ua/api/v2/api/transactions/top100',
                 query = list(region = region))
  
  if(status_code(request) != 200) {
    
    message(paste('Помилка HTTP запиту. Код помилки: ', status_code(request)))
    
  } else {
    
    response <- content(request, as = 'text')
    response <- fromJSON(response)
    
    dates <- c('doc_date', 'doc_v_date', 'trans_date')
    response[dates] <- lapply(response[dates], as.Date)
    
    response$amount <- as.double(response$amount)
    
  }
  
  return(response)
}