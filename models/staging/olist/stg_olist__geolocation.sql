with source as (

    select * from {{ source('olist_data', 'geolocation') }}

),
 
transformed as (

    select 
        geolocation_zip_code_prefix as geolocation_id,
        geolocation_lat as latitude,
        geolocation_lng as longitude,
        geolocation_lat ||' , ' || geolocation_lng as gps_coordinates,
        geolocation_city as city,
        geolocation_state as state

    from source
    
)

select * from transformed