{%- macro get_delivery_status(estimated_date, actual_date) -%}
    CASE 
        WHEN datediff(day, {{ estimated_date }}, {{ actual_date }}) < 0 THEN 'In advance'
        WHEN datediff(day, {{ estimated_date }}, {{ actual_date }}) > 0 THEN 'Late'
        ELSE 'On time'
    END 
{%- endmacro -%}