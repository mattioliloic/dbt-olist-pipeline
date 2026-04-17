with source as (

    select * from {{ source('olist_data', 'payments') }}

),
 
transformed as (

    select 
        order_id,
        payment_sequential as sequential_number,
        payment_type as method,
        payment_installments as installments,
        payment_value as amount

    from source
    
)

select * from transformed