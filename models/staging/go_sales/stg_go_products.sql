with source as (

    select * from {{ source('go_sales', 'go_products') }}

),
renamed as(
    select 
       "Product number" as product_id,
       PRODUCT as product_name,
       "Unit cost" as unit_cost,
       "Unit price" as unit_price,
       "Product line" as product_line,
       "Product type" as product_category,
       "Product brand" as product_brand,
       "Product color" as product_color
    from source

)

select * from renamed