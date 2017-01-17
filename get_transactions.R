library(httr)
library(plyr)

#
# function to get a transactions data from e-data.gov.ua API
# at least one of the args, @payer OR @recipient, must be not NULL 
# @start and @end  must be a date with  dd-mm-yyyy format
# 
#

get_transactions <- function(payer = NULL, recipient = NULL, start = NULL, end = NULL) {
  
  if( is.null(payer) && is.null(recipient) ){
    return("Помилка. Обидва ЄДРПОУ, і платника і отримувача - відсутні. Повинен бути хоча б один з цих кодів.");
  }
  
  request <- POST(url = "http://api.e-data.gov.ua:8080/api/rest/1.0/transactions", 
                  body = list(payers_edrpous = payer, 
                              recipt_edrpous = recipient,
                              startdate = start,
                              enddate = end),
                  encode = "json")
  
  if (status_code(request) != 200) {
    
    return(paste("Помилка. Кода помилки: ", status_code(request)))
    
  } else {
    
    response <- content(request)
    
    transactions <- response$response$transactions
    transactions <- ldply(transactions, data.frame)
    
    return(transactions)  
  }
  
  
}



