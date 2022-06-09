with sales as(
    select * from {{ref('stg_go_daily_sales')}}
),
products as(
    select * from {{ref('stg_go_products')}}
),
calculated as(
    select s.order_id,
           s.date,
           s.product_id,
           s.retailer_id,
           s.order_method_id,
           s.quantity_sold,
           p.unit_price,
           (p.unit_price * s.quantity_sold) as sale_total
    from sales as s 
    left join products as p on 
    s.product_id = p.product_id
)

select * from calculated
