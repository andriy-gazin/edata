library(httr)
library(jsonlite)

#
# function to get a transactions data from e-data.gov.ua API
# at least one of the args, @payer OR @recipient, must be not NULL 
# @start and @end  must be a date with  yyyy-mm-dd format
# 
#

get_transactions <- function(payer = NULL, recipt = NULL, start = NULL, end = NULL, region = NULL){
  
  ###
  
  if(is.null(payer) && is.null(recipt) ) {
    
    message('Помилка. Обидва ЄДРПОУ, і платника (payer) і отримувача (recipt) - відсутні. 
            Повинен бути хоча б один з цих кодів')
    
    return(NULL)
    
  }
  
  ###
  
  if(!is.null(payer) && nchar(payer) < 8) {
    
    
    message('Помилка. Код ЄДРПОУ не може містити менше восьми символів')
    
    return(NULL)
    
  }
  
  ###
  
  if(!is.null(recipt) && nchar(recipt) < 8) {
    
    
    message('Помилка. Код ЄДРПОУ не може містити менше восьми символів')
    
    return(NULL)
    
  }
  
  ###
  
  request <- GET(url = 'http://api.spending.gov.ua/api/v2/api/transactions/',
                 query = list(payers_edrpous = payer,
                              recipt_edrpous = recipt,
                              regions = region,
                              startdate = start,
                              enddate = end))
  
  ###
  
  if (status_code(request) != 200) {
    
    message(paste("Помилка HTTP запиту. Код помилки: ", status_code(request)))
    return(NULL)
    
  } else {
    
    response <- content(request, as = 'text')
    response <- fromJSON(response)
    
    ###
    
    dates <- c('doc_date', 'doc_v_date', 'trans_date')
    response[dates] <- lapply(response[dates], as.Date)
    
    integers <- c('id', 'doc_number', 'region_id')
    response[integers] <- lapply(response[integers], as.integer)
    
    response$amount <- as.double(response$amount)
    
  }
  
  return(response)
  
}