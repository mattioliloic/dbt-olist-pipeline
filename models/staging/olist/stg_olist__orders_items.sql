with source as (

    select * from {{ source('olist_data', 'order_items') }}

),
 
transformed as (

    select 
        order_id,
        order_item_id as item_id,
        product_id,
        seller_id,
        shipping_limit_date,
        price,
        freight_value as freight_amount

    from source
    
)

select * from transformed