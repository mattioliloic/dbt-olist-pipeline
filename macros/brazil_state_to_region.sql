{%- macro brazil_state_to_region(column_state) -%}
    CASE
        WHEN {{ column_state }} IN ('AC', 'AP', 'AM', 'PA', 'RO', 'RR', 'TO') THEN 'Norte'
        WHEN {{ column_state }} IN ('AL', 'BA', 'CE', 'MA', 'PB', 'PE', 'PI', 'RN', 'SE') THEN 'Nordeste'
        WHEN {{ column_state }} IN ('DF', 'GO', 'MT', 'MS') THEN 'Centro-Oeste'
        WHEN {{ column_state }} IN ('ES', 'MG', 'RJ', 'SP') THEN 'Sudeste'
        WHEN {{ column_state }} IN ('PR', 'RS', 'SC') THEN 'Sul'
        ELSE 'Unknown'
    END
{%- endmacro -%}