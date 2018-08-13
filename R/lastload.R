#' Повертає дату останнього завантаження даних до БД API транзакцій
#'
#' @return Датафрейм, який містить дати останнього завантаження даних до БД API
#' 
#' @export
#' 
#' 

lastload <- function() {
  
  request <- httr::GET('http://api.spending.gov.ua/api/v2/api/transactions/lastload')
  
  if(httr::status_code(request) !=  200) {
    
    stop(paste('Помилка. Код помилки:', httr::status_code(request)))
    
  } else {
    
    response <- httr::content(request, as = 'text')
    response <- jsonlite::fromJSON(response)
    
  }
  
  return(response)
  
}