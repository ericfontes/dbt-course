with payments as (

    select
        id as payment_id,
        amount

    from raw.stripe.payment

)

select * from payments