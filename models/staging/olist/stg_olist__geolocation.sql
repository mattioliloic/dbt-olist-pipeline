with source as (

    select * from {{ source('olist_data', 'geolocation') }}

),
 
transformed as (

    select 

        distinct {{dbt_utils.generate_surrogate_key(['geolocation_zip_code_prefix', 'geolocation_lat', 'geolocation_lng', 
        'geolocation_city', 'geolocation_state'])}} as geolocation_pk,
        geolocation_zip_code_prefix as zipcode,
        geolocation_lat as latitude,
        geolocation_lng as longitude,
        geolocation_lat ||' , ' || geolocation_lng as gps_coordinates,
        geolocation_city as city,
        geolocation_state as state

    from source
    
)

select * from transformed