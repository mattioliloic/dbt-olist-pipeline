{%- macro convert_currency(amount, rate) -%}
    ROUND({{ amount }} * {{ rate }}, 2)
{%- endmacro -%}