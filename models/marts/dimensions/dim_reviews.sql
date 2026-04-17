with orders as (
    select * from {{ ref('stg_olist__orders') }}
),

reviews as (
    select * from {{ ref('stg_olist__order_reviews') }}
),

final as (

        select 

            orders.order_id,
            reviews.review_id,
            reviews.score as score,
            coalesce(reviews.title, ' / ') as comment_title,
            coalesce(reviews.message, ' / ') as comment_message,
            reviews.creation_date as created_at,
            reviews.answer_at 


        from orders
        join reviews on orders.order_id = reviews.order_id

)

select * from final