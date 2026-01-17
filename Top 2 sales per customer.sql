SELECT CUSTOMER_NAME, SALE_AMOUNT, RANK_PER_CUSTOMER
FROM(
select customer_name, sale_amount,
rank() over(partition by customer_name order by sale_amount desc) Rank_per_customer
from sales)T
WHERE RANK_PER_CUSTOMER <= 2