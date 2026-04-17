with products as (
    select * from {{ ref('stg_olist__products') }}
),

final as (

    select 

        products.product_id,
        products.category,
        products.name_lenght,
        products.description_lenght,
        products.photos_count,
        products.weight_grams,
        products.lenght_cm,
        products.height_cm,
        products.width_cm,

        concat(
            products.lenght_cm, ' x ',
            products.width_cm, ' x ',
            products.height_cm, ' cm '
        ) as dimensions,

        products.lenght_cm * products.width_cm * products.height_cm as volume_cm3

    from products 

)

select * from final