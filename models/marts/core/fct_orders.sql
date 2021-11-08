with customers as (

    select * from {{ ref('stg_customers') }}
),

orders as (

    select * from {{ ref('stg_orders') }}
),

payments as (

    select * from {{ ref('stg_payments') }}
),


final2 as (

    select
       orders.order_id,
       customers.customer_id,
       payments.payment_id,
       payments.amount
       

    from orders

    left join customers on (customers.customer_id = orders.order_id)
    
    left join payments on (payments.payment_id = customers.customer_id)

)

select * from final2