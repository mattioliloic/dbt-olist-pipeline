with source as (

    select * from {{ ref('sellers_olist') }}

),
 
transformed as (

    select 

        seller_id,
        seller_zip_code_prefix as zipcode,
        seller_city as city,
        seller_state as state,
        seller_state ||' '|| seller_zip_code_prefix ||' , '|| seller_city as full_address

    from source
    
    where dbt_valid_to = to_date('9999-12-31')
) 

select * from transformed