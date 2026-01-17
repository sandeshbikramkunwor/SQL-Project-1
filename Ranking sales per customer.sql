select * from sales

select customer_name, sale_amount,
rank() over(partition by customer_name order by sale_amount desc) Rank_per_customer
from sales