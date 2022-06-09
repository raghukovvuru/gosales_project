with source as(
    select * from {{ref('stg_go_sale_methods')}}
),
transformed as(
    select {{ dbt_utils.surrogate_key(
            ['order_method_id', 
            'order_method_name']) }}
                as sale_method_key,
            order_method_id,
            order_method_name
    from source
)

select * from transformed