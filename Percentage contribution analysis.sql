select customer_name,  
sale_amount,
round(sale_amount/sum(sale_amount)over()*100,2) Percent_contbn,
round(sale_amount/sum(sale_amount)over(partition by customer_name)*100,2) Percent_contbn_Cust_wise
from sales