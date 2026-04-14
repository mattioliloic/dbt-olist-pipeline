with source as (

    select * from {{ source('olist_data', 'products') }}

),
 
transformed as (

    select 
        product_id,
        product_category_name as category,
        product_name_lenght as name_lenght,
        product_description_lenght as description_lenght,
        product_photos_qty as photos_count,
        product_weight_g as weight_grams,
        product_length_cm as lenght_cm,
        product_height_cm as height_cm,
        product_width_cm as width_cm

    from source
    
)

select * from transformed