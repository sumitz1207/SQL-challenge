--1.) List following details of each employee: employee number, last name, first name, sex, and salary.

select employee.emp_no, employee.last_name, employee.first_name, employee.sex, sal.salary
from employees as employee inner join salaries as sal
on sal.emp_no = employee.emp_no;

--2.) List the first names, last names, and hire dates for each employees hired in the year 1986.

select employee.first_name, employee.last_name, employee.hire_date FROM employees as employee
where hire_date between '1986-01-01' and '1986-12-31';


--3.) List manager for each department giving the info: dept no, dept name, manager employee #, last name, first name.

select departments.dept_no, departments.dept_name, dept_manager.emp_no, employees.last_name, employees.first_name
from departments
inner join dept_manager on departments.dept_no = dept_manager.dept_no
inner join employees on dept_manager.emp_no = employees.emp_no;

--4.) List the department of each employee with the following information: employee number, last name, first name, and department name.

select departments.dept_no, departments.dept_name, dept_emp.emp_no, employees.last_name, employees.first_name
from departments
inner join dept_emp on departments.dept_no = dept_emp.dept_no
inner join employees on dept_emp.emp_no = employees.emp_no;


--5.) List first name, last name, and sex for employees first name "Hercules" last name starting with "B."

select employee.first_name, employee.last_name, employee.sex from employees as employee
where first_name = 'Hercules' and last_name like 'B%';

--6.) List all employees in the Sales department, including their employee number, last name, first name, and department name.

select dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name
from dept_emp
inner join employees on dept_emp.emp_no = employees.emp_no
join departments on dept_emp.dept_no = departments.dept_no
where departments.dept_name = 'Sales';

--7.) List all employees in the Sales and Development departments, including their employee number, last name, first name, and department name.

select dept_emp.emp_no, employees.last_name, employees.first_name, departments.dept_name from dept_emp
inner join employees on dept_emp.emp_no = employees.emp_no
join departments on dept_emp.dept_no = departments.dept_no
where departments.dept_name = 'Sales' or departments.dept_name = 'Development';

--8.) In descending order, list the count of employee last names.

select last_name,
count(last_name) as "last_name_number" from employees
group by last_name
order by "last_name_number" desc;