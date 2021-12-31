with customers_cte as(
    select *
    from {{ ref('stg_customers') }}
),
orders_cte as(
    select *
    from {{ ref('fct_orders') }}
),
customer_orders as(
  
  select customer_id,
  min(order_date) as first_order_date,
  max(order_date) as most_recent_order_date,
  count(order_id) as number_of_orders,
  sum(amount) as lifetime_value
  from orders_cte
  group by 1
),
final as(
  
  select 
    customers_cte.customer_id,
    customers_cte.first_name,
    customers_cte.last_name,
  customer_orders.first_order_date,
  customer_orders.most_recent_order_date,
  coalesce(customer_orders.number_of_orders,0) as number_of_orders,
  customer_orders.lifetime_value
  from customers_cte
  left join customer_orders using(customer_id)

)select * from final