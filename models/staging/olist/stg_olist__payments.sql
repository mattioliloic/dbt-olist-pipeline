with source as (

    select * from {{ source('olist_data', 'payments') }}

),
 
transformed as (

    select 
        {{dbt_utils.generate_surrogate_key(['order_id', 'payment_sequential'])}} as payment_pk,
        order_id,
        payment_sequential as sequential_number,
        payment_type as method,
        payment_installments as installments,
        payment_value as amount

    from source
    
)

select * from transformed