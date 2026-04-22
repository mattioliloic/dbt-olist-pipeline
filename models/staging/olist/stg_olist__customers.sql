with source as (

    select * from {{ source('olist_data', 'customers') }}

),
 
transformed as (

    select 

        distinct customer_unique_id as unique_id,
        customer_id,
        customer_zip_code_prefix as zipcode,
        customer_city as city,
        customer_state as state,
        customer_city ||' , '|| customer_state ||' '|| customer_zip_code_prefix as full_address

    from source
    
)

select * from transformed