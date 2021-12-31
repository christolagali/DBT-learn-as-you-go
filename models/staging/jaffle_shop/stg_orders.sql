with orders_cte as(
  
  select
  id as order_id,
  user_id as customer_id,
  order_date,
  status
  from DBT_DB.DEV.ORDERS

)select * from orders_cte