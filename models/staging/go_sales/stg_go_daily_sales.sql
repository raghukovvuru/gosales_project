with source as (

    select * from {{ source('go_sales', 'go_daily_sales') }}

),
renamed AS(
    select 
          {{ dbt_utils.surrogate_key(
            ['"Product number"', 
            '"Retailer code"']) }}
                as order_id,
          "Product number"::INT AS product_id,
          "Retailer code"::INT AS retailer_id,
          date,
          quantity::INT AS quantity_sold
    from source
)

select * from renamed