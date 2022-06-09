with products as(
    select * from {{ref('dim_products')}}
),
retailers as(
    select * from {{ref('dim_retailers')}}
),
sale_methods as(
    select * from {{ref('dim_sale_methods')}}
),
sales_totals as(
    select * from {{ref('int_go_sales_totals')}}
),
final as (select sales.order_id,
                 sales.date,
       products.product_key,
       retailers.retailer_key,
       sale_methods.sale_method_key,
       sales.quantity_sold,
       sales.sale_total 
from sales_totals as sales 
join products on sales.product_id = products.product_id
join retailers on sales.retailer_id = retailers.retailer_id
join sale_methods on sales.order_method_id = sale_methods.order_method_id
)

select * from final
