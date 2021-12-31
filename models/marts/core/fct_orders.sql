with orders_cte as(
    select *
    from {{ ref('stg_orders') }}
),
payments_cte as(
    select *
    from {{ ref('stg_payments') }}
),
order_payments_cte as(
    select 
    ORDERID,
    sum(case when status = 'success' then AMOUNT else 0 end) as Amount
    from payments_cte
    group by 1
)
select
orders_cte.order_id,
orders_cte.customer_id,
orders_cte.order_date,
coalesce(order_payments_cte.Amount,0) as Amount
from orders_cte
left join order_payments_cte on order_payments_cte.ORDERID = orders_cte.order_id
