{{ config(materialized="incremental", incremental_strategy="append") }}

with 
    orders as (select * from {{ ref('stg_olist__orders') }}),
    order_items as (select * from {{ ref('stg_olist__order_items') }}),

    final as (

        select 

            order_items.order_items_pk,
            orders.order_id,
            orders.customer_id,
            order_items.seller_id,
            order_items.product_id,
            order_items.price,
            order_items.freight_amount as freight,
            order_items.price + order_items.freight_amount as total_amount,
            orders.purchased_at as purchased_at,
            {{ days_between_dates('order_items.shipping_limit_date', 'orders.delivered_to_customer_at') }} > 0 as is_late,
            datediff(day, orders.purchased_at, orders.delivered_to_customer_at) as days_to_delivery
            
        from orders 
        join order_items on order_items.order_id = orders.order_id         
    )

    select * from final

    {% if is_incremental() %}
        where purchased_at > (select max(purchased_at) from {{ this }})
    {% endif %}