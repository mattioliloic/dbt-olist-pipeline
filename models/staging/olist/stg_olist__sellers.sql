with source as (

    select * from {{ source('olist_data', 'sellers') }}

),
 
transformed as (

    select 

        seller_id,
        seller_zip_code_prefix as zipcode,
        seller_city as city,
        seller_state as state,
        seller_state ||' '|| seller_zip_code_prefix ||' , '|| seller_city as full_address

    from source
    
) 

select * from transformed