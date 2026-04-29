with source as (

    select * from {{ ref('orders_olist') }}

),
 
transformed as (

    select 
        order_id,
        customer_id,
        order_status as status,
        order_purchase_timestamp as purchased_at,
        order_approved_at as approved_at,
        order_delivered_carrier_date as delivered_to_carrier_at,
        order_delivered_customer_date as delivered_to_customer_at,
        order_estimated_delivery_date as estimated_delivery_at

    from source
    
    where dbt_valid_to = to_date('9999-12-31')
)

select * from transformed