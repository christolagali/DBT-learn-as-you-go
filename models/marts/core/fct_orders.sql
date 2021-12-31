with orders_cte as(
    select *
    from {{ ref('stg_orders') }}
),
payments_cte as(
    select *
    from {{ ref('stg_payments') }}
)
select
orders_cte.customer_id,
payments_cte.ORDERID,
sum(payments_cte.AMOUNT) as Amount
from payments_cte
left join orders_cte on payments_cte.ORDERID = orders_cte.order_id
group by 1,2