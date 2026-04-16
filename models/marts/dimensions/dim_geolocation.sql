with geolocation as (
    select * from {{ ref('stg_olist__geolocation') }}
),

final as (

    select 
        
        geolocation.geolocation_id,
        round(geolocation.latitude, 5) as latitude,
        round(geolocation.longitude, 5) as longitude,
        
        concat(
            abs(round(latitude, 5)), '° ',
            iff(latitude < 0, 'S', 'N'),
            ', ',
            abs(round(longitude, 5)), '° ',
            iff(longitude < 0, 'W', 'E')
        )as gps,

        geolocation.city,
        geolocation.state

    from geolocation

)

select * from final