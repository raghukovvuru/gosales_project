with source as (

    select * from {{ source('go_sales', 'go_retailers') }}

),
renamed AS(
    select 
           "Retailer code" AS retailer_id,
           "Retailer name" AS retailer_name,
           TYPE as retailer_type,
           COUNTRY as retailer_country
    from source
)
select * from renamed