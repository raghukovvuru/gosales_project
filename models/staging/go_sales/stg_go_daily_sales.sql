with source as (

    select * from {{ source('go_sales', 'go_daily_sales') }}

),
renamed AS(
    select 
          "Product number" AS product_id,
          "Retailer code" AS retailer_id,
          date,
          quantity AS quantity_sold
    from source
)

select * from renamed