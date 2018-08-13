#' Перевірка доступності API транзакцій
#'
#' @return Повертає код відповіді сервера
#'
#' @export

ping_transactions <- function() {
  
  request <- httr::GET('http://api.spending.gov.ua/api/v2/api/transactions/ping')
  
  return(httr::status_code(request))

}
