with sellers as (
    select * from {{ ref('stg_olist__sellers') }}
),

final as (

    select

        sellers.seller_id,
        sellers.zipcode,
        upper(sellers.city) as city,
        sellers.state,
        upper(sellers.full_address) as address

    from sellers

)

select * from final