SELECT 
	customer_name, sale_amount, cust_avg,
	case when sale_amount> cust_avg then 'Spikedspending'
	else 'RegularSpending' end Spending_analysis
	from(
select	
	customer_name, sale_amount,
	Round(avg(sale_amount) over(partition by customer_name),2) Cust_avg
	from sales)t

