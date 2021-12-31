with payments_cte as (
  
  select ORDERID,STATUS,
  AMOUNT
  from DBT_DB.STRIPE.Payment
  where status = 'success'

)select * from payments_cte