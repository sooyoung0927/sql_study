use employee;

select * from employee;
select EMP_ID, EMP_NAME from employee;
select * from employee where DEPT_CODE = 'D9';
select EMP_NO, EMP_NAME, DEPT_CODE, salary from employee where SALARY>= 3000000;
select emp_name, dept_code, salary, bonus from employee where bonus is null;
select emp_no, emp_name, phone from employee where phone like '___9_______';
select emp_name, dept_code, salary from employee where dept_code in ('D6','D8');
select emp_no, emp_name, email from employee where emp_name not like '이%';
select emp_no, salary, job_code from employee where (job_code='J2' and salary >= 200000) or(job_code='J7'); 
select emp_no, salary, job_code from employee where (job_code='J2'or job_code='J7' )and salary > 2000000; 

select emp_name, substr(emp_no,1,2) as '생년',substr(emp_no,3,2) as '생월',substr(emp_no,5,2) as '생일'  from employee;
select emp_name, substr(hire_date,1,4) as '입사년도',substr(hire_date,6,2) as '입사월',substr(hire_date,9,2) as '입사날짜'  from employee;
select * from employee where substr(emp_no,8,1)%2=0;
