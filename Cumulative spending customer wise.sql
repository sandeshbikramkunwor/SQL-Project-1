select * from sales
select 
	customer_name, sale_amount,
	round(sum(sale_amount) over(partition by customer_name order by sale_date)/sum(sale_amount) over(partition by customer_name)*100,2) Cum_percent
	from sales