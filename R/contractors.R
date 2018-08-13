#' Повертає довідник типів контрагентів
#'
#' @return Датафрейм із довідником типів контрагентів
#' 
#' @export

contractors <- function() {
  
  request <- httr::GET('http://api.spending.gov.ua/api/v2/dictionaries/contractors')
  
  if(httr::status_code(request) != 200) {
    
    stop(paste('Помилка. Код помилки:', httr::status_code(request)))
    
  } else {
    
    response <- httr::content(request, as = 'text')
    response <- jsonlite::fromJSON(response, flatten = TRUE)
    
  }
  
  return(response)
  
}