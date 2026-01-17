select 
	customer_name, total_sales, cum_percent,
	case when cum_percent<=80 then 'Important_cust'
	else 'Regular_cust' end 'Pareto analysis'
	from(
select
	customer_name, total_sales,
	round(sum(total_sales) over(order by total_sales desc)/sum(total_sales) over()*100,2) cum_percent
	from(
select 
	customer_name, sum(sale_amount) total_sales
	from sales
	group by customer_name)t)t