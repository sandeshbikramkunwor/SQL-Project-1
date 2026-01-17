-- yesle average calculate garda no. of rows consider garyo not employee total
-- it gives incorrect answer
select *
from(
select distinct emp_name, department, 
sum(sale_amount)over(partition by emp_name) Emp_total,
avg(sale_amount) over(partition by department) Dept_avg
from employee_sales)t
where emp_total>dept_avg

-- correct query

		select * from 
		(select emp_name, department, sum(sale_amount) EMP_TOTAL,
		avg(sum(sale_amount)) over(partition by department) Dept_avg
		from employee_sales
		group by emp_name, department)t
		where emp_total>dept_avg