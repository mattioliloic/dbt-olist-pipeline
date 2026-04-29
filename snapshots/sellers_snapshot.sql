{% snapshot sellers_olist %}

    {{
        config(

            target_schema='snapshots',
            unique_key='seller_id',
            strategy='check',
            check_cols= ['seller_city', 'seller_state'],
            dbt_valid_to_current= "to_date('9999-12-31')"

        )
    }}

    select * from {{ source('olist_data', 'sellers') }}

{% endsnapshot %}