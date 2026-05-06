with 
    orders as (select * from {{ ref('fct_orders') }}),
    customers as (select * from {{ ref('dim_customers') }}),
    geolocation as (select * from {{ ref('dim_geolocation') }}),

    final as (

        select

            sum(orders.total_amount_brl) as CA,
            geolocation.city,
            geolocation.state,
            'BR' ||'-'|| geolocation.state as state_map

        from orders 
        join customers on orders.customer_id = customers.customer_id 
        join geolocation on geolocation.zipcode = customers.zipcode

        group by geolocation.city, geolocation.state
        order by STATE ASC

    )

    select * from final
