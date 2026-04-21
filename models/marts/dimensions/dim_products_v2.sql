with products as (
    select * from {{ ref('stg_olist__products') }}
),

final as (

    select 

        products.product_id,
        upper(products.category) as category,
        coalesce(products.name_lenght, 0) as name_lenght,
        coalesce(products.description_lenght, 0) as descr_lenght,
        coalesce(products.photos_count, 0) as photos_count,
        products.weight_grams,

        concat(
            products.lenght_cm, ' x ',
            products.width_cm, ' x ',
            products.height_cm, ' cm '
        ) as dimensions,

        products.lenght_cm * products.width_cm * products.height_cm as volume_cm3

    from products 

    order by products.category
)

select * from final