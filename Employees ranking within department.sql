select * from employee_sales

select emp_name, department, emp_total,
	rank() over(partition by department order by emp_total desc) Emp_rank
from(
select emp_name, department, sum(sale_amount) Emp_total
from employee_sales
group by emp_name, department)t