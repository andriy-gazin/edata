#' Отримайте дані транзакцій
#'
#' @param payer Код ЄДРПОУ платника. Не може містити менше восьми символів
#' 
#' @param recipt Код ЄДРПОУ отримувача. Не може містити менше восьми символів
#' 
#' @param start Дата початку у форматі YYYY-MM-DD
#' 
#' @param end Дата закінчення у форматі YYYY-MM-DD
#' 
#' @param region Числовий код регіону, можна отримати за допомоги функції regions()
#' 
#' @param save Логічне (TRUE/FALSE), записувати результат пошуку у CSV файл (TRUE), чи повертати звичайний датафрейм (FALSE). Значення за замовчуванням - FALSE
#' 
#' @return Датафрейм із даними транзакцій
#' 
#' @export

transactions <- function(payer = NULL, recipt = NULL, start = NULL, end = NULL, region = NULL, save = FALSE){
  
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
  
  request <- httr::GET(url = 'http://api.spending.gov.ua/api/v2/api/transactions/',
                 query = list(payers_edrpous = payer,
                              recipt_edrpous = recipt,
                              regions = region,
                              startdate = start,
                              enddate = end))
  
  if (httr::status_code(request) != 200) {
    
    message(paste("Помилка HTTP запиту. Код помилки: ", 
                  httr::status_code(request)))
    
    return(NULL)
    
  } else {
    
    response <- httr::content(request, as = 'text')
    response <- jsonlite::fromJSON(response)
    
  }
  
  if(save == TRUE) {

    
    filename <- paste(payer, recipt, start, end, sep = '-')
    
    write.csv(response, file = paste0(filename, '.csv'), row.names = F)
    
  } else {
    
    return(response)
    
  }
  
}