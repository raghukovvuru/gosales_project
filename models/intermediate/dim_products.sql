with source as(
    select * from {{ref('stg_go_products')}}
),
transformed as(
    select {{ dbt_utils.surrogate_key(
            ['product_id', 
            'product_name']) }}
                as product_key,
            product_id,
            product_name,
            product_line,
            product_category,
            product_color,
            product_brand,
            unit_cost,
            unit_price
    from source
)

select * from transformed