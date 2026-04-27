select 
    order_id,
    freight
from {{ ref('fct_order_items') }}
where freight < 0