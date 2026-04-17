with customers as (
    select * from {{ ref('stg_olist__customers') }}
),

final as (
    
    select 

        customers.customer_id,
        customers.zipcode,
        upper(customers.city) as city,
        customers.state,
        upper(customers.full_address) as address

    from customers
)

select * from final 