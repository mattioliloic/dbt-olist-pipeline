with source as (

    select * from {{ source('olist_data', 'order_items') }}

),
 
transformed as (

    select 

        {{dbt_utils.generate_surrogate_key(['order_item_id', 'order_id'])}} as order_items_pk,
        order_id,
        order_item_id as count_items,
        product_id,
        seller_id,
        shipping_limit_date,
        price,
        freight_value as freight_amount

    from source
    
)

select * from transformed