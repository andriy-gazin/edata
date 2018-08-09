#' Повертає сто найбільших транзакцій
#'
#' @param region Код регіону. Можна отримати за допомоги функції regions(). Якщо параметр не зазначено, використовується параметр за замовчуванням ('Вся Україна')
#' 
#' @return Датафрейм, який містить дані про сто найбільших транзакцій
#' 
#' @export

top_transactions <- function(region = NULL){
  
  if(is.null(region)) {
    
    message('Параметр region не зазначено. Використовуємо параметр за замовчуванням')
    
  }
  
  request <- httr::GET(url = 'http://api.spending.gov.ua/api/v2/api/transactions/top100',
                 query = list(region = region))
  
  if(httr::status_code(request) != 200) {
    
    message(paste('Помилка HTTP запиту. Код помилки: ', 
                  httr::status_code(request)))
    
  } else {
    
    response <- httr::content(request, as = 'text')
    response <- jsonlite::fromJSON(response)
    
    dates <- c('doc_date', 'doc_v_date', 'trans_date')
    response[dates] <- lapply(response[dates], as.Date)
    
    response$amount <- as.double(response$amount)
    
  }
  
  return(response)
}