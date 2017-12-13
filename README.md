# edata
api wrapper for public spending portal


```r

get_transactions(payer, recipt, start, end, region)

```

## parameters

* payer - ЄДРПОУ платника  
* recepient - ЄДРПОУ отримувача  
* start - дата у форматі yyyy-mm-dd  
* end - дата у форматі yyyy-mm-dd
* region - код регіону

Обов’язкові параметри - payer або recipt, решта параметрів працює як фільтри.

[Опис API Є-дата](https://confluence.spending.gov.ua/pages/viewpage.action?pageId=5800614&src=contextnavpagetreemode)

## to do

* list of edrpou codes of most interesting government entities or companies  
* data types conversion for API response