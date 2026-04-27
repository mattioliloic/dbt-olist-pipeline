with source as (

    select * from {{ source('olist_data', 'order_reviews') }}

),
 
transformed as (

    select 
        {{dbt_utils.generate_surrogate_key(['review_id', 'order_id'])}} as review_pk,
        review_id,
        order_id,
        review_score as score,
        review_comment_title as title,
        review_comment_message as message,
        review_creation_date as creation_date,
        review_answer_timestamp as answer_at

    from source
    
)

select * from transformed