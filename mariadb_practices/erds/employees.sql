-- select 연습

select * from departments;
select dept_no, dept_name from departmeents;

-- concat, alias(as 생략 가능)
-- 예제 : employees 테이블에서 저네 직원이의 이름, 성별, 입사일을 출력

-- distinct
-- 예제 1 
select distinct(title) from titles ;




-- where 절 #1
select first_name, gender, hire_date from employees where hire_date < '1991-01-01';

-- where #2
select first_name, hire_date from employees where hire_date < '1989-01-01' and gender = 'F' order by hire_date;
-- 결과를 검증해야한다.

-- where #3, in 
select emp_no, dept_no from dept_emp where dept_no in ('doo5', 'doo9');
select emp_no, dept_no from dept_emp where dept_no = 'doo5' or dept_no = 'doo9';
select * from dept_emp;

-- where #3, like
select first_name, hire_date from employees where hire_date > '1988-12-31' and  hire_date < '1990-01-01';
select first_name, hire_date from employees where hire_date between '1988-12-31' and '1990-01-01';
select first_name, hire_date from employees where hire_date like '1989-%';

-- order by #1
select concat(first_name,' ', last_name) as name, gender, hire_date from employees where gender = 'M' order by hire_date;
-- asc,desc -> default == asc

-- order by #2
select emp_no, salary;
select emp_no, salary from salaries where from_date like '2001-%' and to_date like '2001-%' order by salary asc;
-- 직원들의 월급을 사번, 월급 순으로 사번, 월급으로 출력하세요
select emp_no, salary from salaries order by emp_no asc, salary desc;






