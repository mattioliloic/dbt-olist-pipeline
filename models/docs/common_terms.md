{% docs order_id %}
    A unique identifier for each order.
{% enddocs %}

{% docs customer_id %}
    Key to the orders dataset. Each order has a unique customer_id.
{% enddocs %}

{% docs seller_id %}
    A unique identifier for each seller.
{% enddocs %}

{% docs product_id %}
    A unique identifier for each product.
{% enddocs %}

{% docs order_items_pk %}
    A technical primary key (surrogate key) generated to ensure the uniqueness of each row in this table. Created from the order_item_id and order_id columns.
{% enddocs %}

{% docs review_pk %}
     A technical primary key (surrogate key) generated to ensure the uniqueness of each row in this table. Created from the review_id and order_id columns.
{% enddocs %}

{% docs geolocation_pk %}
    A technical primary key (surrogate key) generated to ensure the uniqueness of each row in this table. Created from the geolocation_zip_code_prefix, the latitude, longitude, city and state columns.
{% enddocs %}

{% docs payment_pk %}
    A technical primary key (surrogate key) generated to ensure the uniqueness of each row in this table. Created from the order_id and payment_sequential columns.
{% enddocs %}

