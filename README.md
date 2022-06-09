Analytics Engineering project with Great Outdoors dataset.


dbt Project docs url - https://cloud.getdbt.com/accounts/68052/develop/1204134/docs/index.html

### dbt Lineage Graph
![dbt lineage graph](https://github.com/raghukovvuru/gosales_project/blob/59794233de70793faea8896882fc9c7ed2911950/dbt-graph.png?raw=true)

### Technologies Used
<ul>
  <li><strong>MySQL</strong>- as transaction database(OLTP)</li>
  <li><strong>Airbyte</strong>- as Extract-Load(EL) tool between MySQL database and Snowflake data warehouse</li>
  <li><strong>Snowflake</strong> - as Data Warehouse for loading raw data and performing transformations using dbt</li>
  <li><strong>dbt</strong> - as Transformation tool</li>
  <li><strong>Metabase</strong> - as data visualization tool</li>
</ul>

### Arctitecture diagram
![GoSales Data pipeline](https://github.com/raghukovvuru/gosales_project/blob/9b030b4faf1d1435e82a41655adeb88156481213/GoSales%20Analytics%20Architecture.svg?raw=true)


### Sample queries 
~~~~sql
select products.product_category,sum(sales.sale_total) 
from fct_sales sales 
join dim_products as products
on sales.product_key=products.product_key
group by 1 order by 2 desc;
~~~~
