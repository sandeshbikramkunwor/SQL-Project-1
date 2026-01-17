select * from sales

select Customer_name, sale_amount,
sum(sale_amount) over(partition by customer_name order by sale_date rows between unbounded preceding and current row) Running_total
from sales