#' Повертає список регіонів із кодами
#'
#' @return Датафрейм, який містить перелік регіонів із їхніми кодами. Ці коди можна використовувати у запитах, що стосуються транзакцій, а також під час обробки таблиць із транзакціями
#'  
#' @export

regions <- function(){
  
  request <- httr::GET('http://api.spending.gov.ua/api/v2/regions')
  
  if (httr::status_code(request) != 200) {
    
    message(paste('Помилка HTTP запиту. Код помилки: ', 
                  httr::status_code(request)))
    
    return(NULL)
    
  } else {
    
    response <- httr::content(request, as = 'text')
    response <- jsonlite::fromJSON(response)
  
  }
  
  return(response)
  
}