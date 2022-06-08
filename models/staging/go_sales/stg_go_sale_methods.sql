with source as (

    select * from {{ source('go_sales', 'go_methods') }}

),
renamed as(
    select 
        "Order method code" as order_method_id,
        "Order method type" as order_method_name
    from source

)

select * from renamed