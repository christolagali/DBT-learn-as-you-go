with payments_cte as (
  
  select ORDERID,
  STATUS,
  AMOUNT/100 as Amount
  from DBT_DB.STRIPE.Payment
  where status = 'success'

)select * from payments_cte