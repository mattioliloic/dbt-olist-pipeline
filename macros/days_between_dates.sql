{%- macro days_between_dates(first, second) -%}
    datediff(day, {{first}}, {{second}})
{%- endmacro -%}