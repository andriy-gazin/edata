# edata
api wrapper for public spending portal


```r

get_transactions(payer, recepient, start, end)

```

## parameters

* payer - ЄДРПОУ платника  
* recepient - ЄДРПОУ отримувача  
* start - дата у форматі dd-mm-yyyy  
* end - дата у форматі dd-mm-yyyy  

Обов’язкові параметри - payer або recepient, решта параметрів працює як фільтри.

[Опис API Є-дата](http://www.minfin.gov.ua/uploads/redactor/files/e-data-API.pdf)

## to do

* list of edrpou codes of most interesting government entities or companies  
* data types conversion for API response