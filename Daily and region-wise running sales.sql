
select sale_id, region, sale_date, sale_amount,
sum(sale_amount) over(order by sale_date) Daily_Running_sales,
sum(sale_amount) over(partition by region order by sale_date) Region_wise_running
from sales