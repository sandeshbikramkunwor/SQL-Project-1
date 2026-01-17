
select * from SALES

SELECT customer_name, sale_amount, sale_date,
case when 
row_number() over(partition by customer_name order by sale_date ) = 1 then 'First Time'
else 'Repeat Customer' end First_Vs_Repeat
from sales