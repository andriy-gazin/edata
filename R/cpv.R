#' Повертає довідник CPV
#'
#' @return Датафрейм із довідником кодів CPV
#'
#' @export

cpv <- function(lang = 'ua') {
  
  if(!lang %in% c('ua', 'en')) {
    
    lang <- 'ua'
    
    message('Параметр lang може приймати значення ua або en.\n
            Виконуємо функцію із параметром ua')
    
  }
  
  request <- httr::GET('http://api.spending.gov.ua/api/v2/dictionaries/procurement',
                       query = list(lang = lang))
  
  if(httr::status_code(request) != 200) {
    
    stop(paste('Помилка. Код помилки:', httr::status_code(request)))
    
  } else {
    
    response <- httr::content(request, as = 'text')
    response <- jsonlite::fromJSON(response, flatten = TRUE)
    
  }
  
  return(response)
  
  
}