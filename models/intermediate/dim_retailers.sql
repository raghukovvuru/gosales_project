with source as(
    select * from {{ref('stg_go_retailers')}}
),
transformed as(
    select {{ dbt_utils.surrogate_key(
            ['retailer_id', 
            'retailer_name']) }}
                as retailer_key,
            retailer_id,
            retailer_name,
            retailer_type,
            retailer_country
    from source
)

select * from transformed