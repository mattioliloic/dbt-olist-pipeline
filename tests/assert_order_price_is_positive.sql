select 
    order_id,
    total_amount_brl
from {{ ref('fct_orders') }}
where total_amount_brl < 0