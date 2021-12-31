with orders_cte as(
    select *
    from {{ ref('stg_orders') }}
),
payments_cte as(
    select *
    from {{ ref('stg_payments') }}
)
select
payments_cte.ORDERID,
sum(case when payments_cte.status = 'success' then payments_cte.AMOUNT else 0 end) as Amount
from payments_cte
left join orders_cte on payments_cte.ORDERID = orders_cte.order_id
group by 1