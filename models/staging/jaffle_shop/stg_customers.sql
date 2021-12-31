with customers_cte as (
  
  select 
  id as customer_id,
  first_name,
  last_name
  from DBT_DB.DEV.CUSTOMERS

)select * from customers_cte