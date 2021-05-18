-- outer join

-- select * from dept;
-- insert into dept values(null, '총무');
-- insert into dept values(null, '개발');
-- insert into dept values(null, '영업');
-- insert into dept values(null, '기획');

-- select * from emp;
-- insert into emp values(null, '둘리',1);
-- insert into emp values(null, '마이콜',2);
-- insert into emp values(null, '또치',3);
-- insert into emp values(null, '길동',null);

select emp.name as '이름' , ifnull(dept.name,'없음') as '부서' from emp left join dept on emp.dept_no=dept.no;
select emp.name as '이름' , ifnull(dept.name,'없음') as '부서' from emp right join dept on emp.dept_no=dept.no;


-- 실습문제 1
select e.emp_no as 사번, e.first_name as 이름, d.dept_name as 근무부서 from employees e, departments d, dept_emp de where e.emp_no=de.emp_no and de.dept_no=d.dept_no and de.to_date='9999-01-01';


-- 실습문제 2
select e.emp_no as 사번, e.first_name as 이름, s.salary as 연봉
	from employees e, salaries s
		where e.emp_no=s.emp_no and s.to_date='9999-01-01';
        
        
