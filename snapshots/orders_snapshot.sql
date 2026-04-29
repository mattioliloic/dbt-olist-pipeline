{% snapshot orders_olist %}

    {{
        config(

            target_schema='snapshots',
            unique_key='order_id',
            strategy='check',
            check_cols= ['order_status', 'order_delivered_customer_date'],
            dbt_valid_to_current= "to_date('9999-12-31')"

        )
    }}

    select * from {{ source('olist_data', 'orders') }}

{% endsnapshot %}