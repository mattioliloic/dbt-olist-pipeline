{{ config(materialized="incremental", incremental_strategy="append") }}

with 
    order_item as (select * from {{ ref('stg_olist__order_items') }}),
    orders as (select * from {{ ref('stg_olist__orders') }}),

final as (

        select

            order_item.order_id,
            orders.customer_id,
            orders.purchased_at,
            orders.status,
            {{ get_delivery_status('orders.estimated_delivery_at','orders.delivered_to_customer_at') }} as shipping_status,
            count(order_item.order_items_pk) as nb_items,
            sum(order_item.price + order_item.freight_amount) as total_amount_brl,
            {{ convert_currency('total_amount_brl', 0.20) }} as total_amount_usd,
            {{ convert_currency('total_amount_brl', 0.17) }} as total_amount_eur
        
        from orders
        join order_item on order_item.order_id = orders.order_id

        group by order_item.order_id, orders.customer_id, orders.purchased_at, orders.status, shipping_status
)

select * from final

{% if is_incremental() %}
     where purchased_at > (select max(purchased_at) from {{ this }})
{% endif %}