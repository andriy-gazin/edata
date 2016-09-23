library(httr)
library(plyr)

#' Title
#'
#' @param payer 
#' @param receipt 
#' @param start 
#' @param end 
#'
#' @return
#' @export
#'
#' @examples

get_transactions <- function(payer, receipt = NULL, start = NULL, end = NULL) {
  
  request <- POST(url = "http://api.e-data.gov.ua:8080/api/rest/1.0/transactions", 
                  body = list(payers_edrpous = payer, 
                              receipt_edrpous = receipt,
                              startdate = start,
                              enddate = end),
                  encode = "json")
  
  if (status_code(request) != 200) {
    
    return(paste("Помилка. Кода помилки: ", status_code(request)))
  
  } else {
      
    response <- content(request)
    
    transactions <- response$response$transactions
    transactions <- ldply(transactions, data.frame)

    
    }
}



