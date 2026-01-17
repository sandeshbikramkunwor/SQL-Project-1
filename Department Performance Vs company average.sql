select * from employee_sales

select department, sum(sale_amount) dept_total, avg(sum(sale_amount)) over() company_avg
from employee_sales
group by department