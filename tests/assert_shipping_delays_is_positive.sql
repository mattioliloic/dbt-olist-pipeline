select 
    order_id,
    days_to_delivery
from {{ ref('fct_order_items') }}
where days_to_delivery < 0