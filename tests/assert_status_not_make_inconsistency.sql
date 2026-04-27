{{ config(error_if = '> 20') }}

select 
    order_id,
    status,
    delivered_to_customer_at
from {{ ref('stg_olist__orders') }}
where status = 'delivered' and delivered_to_customer_at is null

{{ endconfig }}