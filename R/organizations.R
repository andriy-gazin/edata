#' Отримайте перелік всіх розпорядників, зареєстрованих на spending.gov.ua
#'
#' @return Датафрейм із переліком всіх розпорядників бюджетних коштів, зареєстрованих на порталі spending.gov.ua
#'
#' @export

get_organizations <- function(){

  download.file('http://api.spending.gov.ua/api/v2/stat/organizations/csv', 
                'organizations.zip')
  
  filename <- unzip('organizations.zip')

  organisations <- read.csv(filename, 
                            fileEncoding = 'Windows-1251', 
                            colClasses = c('Date', 
                                           rep('character', 8), 
                                           rep('integer', 10)),
                            sep = ';', 
                            stringsAsFactors = F, 
                            skip = 1)
  
  file.remove(c('organizations.zip', filename))
  
  message(paste('Знайдено', nrow(organisations), 'розпорядників'))
  
  return(organisations)
  
}
