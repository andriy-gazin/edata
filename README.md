# edata
api wrapper for public spending portal


```r

get_transactions(payer, recepient, start, end)

```

## parameters

* payer - ЄДРПОУ платника, string
* recepient - ЄДРПОУ отримувача, string
* start - дата у форматі dd-mm-yyyy або "yyyy-mm-dd"
* end - дата у форматі dd-mm-yyyy або "yyyy-mm-dd"

Обов’язкові параметри - payer або recepient, решта параметрів працює як фільтри.

[Опис API Є-дата](http://www.minfin.gov.ua/uploads/redactor/files/e-data-API.pdf)

## to do

* list of edrpou codes of most interesting government entities or companies  
* data types conversion for API response
