-- inner join(**표준 조인임 inner join == equi join == join~on, natural join(X), using(X))

-- 예제 1.
select title from titles;
-- join condition
select concat(e.last_name, ' ', e.first_name) as 이름, e.emp_no as "employees's_emp_no", t.emp_no as "s_emp_no", t.title 
	from employees e, titles t 
		where e.emp_no=t.emp_no;


-- 예제 2.
select concat(e.last_name, ' ', e.first_name) as 이름, e.emp_no as "employees's_emp_no", t.emp_no as "s_emp_no", t.title, e.gender 
	from employees e, titles t 
		where e.emp_no=t.emp_no and gender='f' and t.title='engineer';
        

-- ANSI / ISO SQL1999 JOIN 표준 문법

-- 1) natural join
-- 두 테이블에 공통 컬럼이 있으면 별다른 조건 없이 묵시적으로 조인된다.
select concat(e.first_name, ' ', e.last_name) as name, t.title from employees e natural join titles t;
-- natural join의 문제점

-- 2) 현재 근무하고 있는 직원의 이름과 타이틀, 월급을 출력하세요.
select count(*)
	from employees e 
		join titles t on e.emp_no=t.emp_no
		join salaries s on t.emp_no=s.emp_no;
        
select count(*)
	from titles t 
		natural join salaries s;
        
select a.first_name, b.title
	from salaries a
		join titles b on a.emp_no=b.emp_no where a.to_date='9999-01-01' and b.to_date='9999-01-01';


    
-- 3) join ~on

select concat(e.first_name, ' ', e.last_name) as name, t.title from employees e join titles t on e.emp_no=t.emp_no;




