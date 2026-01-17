
select 
	customer_name, cust_sales, cum_percent,
	case
		when cum_percent <=20 then 'VIP'
		when cum_percent <= 50 then'Regular'
		else 'Low Value' end 'Segmentation' from(
select
	customer_name, cust_sales,
	round(sum(cust_sales) over(order by cust_sales desc)/sum(cust_sales) over()*100,2) Cum_percent 
	from(
SELECT 
	CUSTOMER_NAME, sum(sale_amount) cust_sales
	from sales
	group by customer_name)t)t


	SELECT 
    customer_name,
    total_sales,
    cumulative_percent,
    CASE
        WHEN cumulative_percent <= 20 THEN 'VIP'
        WHEN cumulative_percent <= 50 THEN 'Regular'
        ELSE 'Low Value'
    END AS customer_segment
FROM (
    SELECT 
        customer_name,
        total_sales,
        ROUND(
            SUM(total_sales) OVER (
                ORDER BY total_sales DESC
                ROWS BETWEEN UNBOUNDED PRECEDING AND CURRENT ROW
            ) 
            / 
            SUM(total_sales) OVER () * 100
        ,2) AS cumulative_percent
    FROM (
        SELECT 
            customer_name,
            SUM(sale_amount) AS total_sales
        FROM sales
        GROUP BY customer_name
    ) t
) s
ORDER BY total_sales DESC;
