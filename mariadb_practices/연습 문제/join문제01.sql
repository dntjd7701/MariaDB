-- 테이블간 조인(JOIN) SQL 문제입니다.
-- '9999-01-01'
-- 문제 1.
-- 현재 급여가 많은 직원부터 직원의 사번, 이름, 그리고 연봉을 출력 하시오.

select a.emp_no, a.first_name, b.salary
	from employees a, salaries b
    where a.emp_no=b.emp_no
    and  b.to_date='9999-01-01'
    order by b.salary desc;


-- 문제2.
-- 전체 사원의 사번, 이름, 현재 직책을 이름 순서로 출력하세요.

select a.emp_no, a.first_name, b.title
	from employees a, titles b
	where a.emp_no=b.emp_no
    and b.to_date='9999-01-01';

-- 문제3.
-- 전체 사원의 사번, 이름, 현재 부서를 이름 순서로 출력하세요..

select a.emp_no, concat(a.first_name,' ', a.last_name) as name, c.dept_name
	from employees a, dept_emp b, departments c
    where a.emp_no=b.emp_no
    and b.dept_no=c.dept_no
    order by name asc;

-- 문제4.
-- 전체 사원의 사번, 이름, 현재 연봉, 현재 직책, 현재 부서를 모두 이름 순서로 출력합니다.

select 
	a.emp_no, 
	concat(a.first_name,' ', a.last_name) as name,
    b.salary,
    c.title,
    e.dept_name
	from employees a, salaries b, titles c, dept_emp d, departments e
    where a.emp_no=b.emp_no
    and a.emp_no=c.emp_no
    and a.emp_no=d.emp_no
    and d.dept_no=e.dept_no
    and c.to_date='9999-01-01'
    and b.to_date='9999-01-01'
    and d.to_date='9999-01-01'
    order by name asc;

-- 문제5.
-- ‘Technique Leader’의 직책으로 과거에 근무한 적이 있는 모든 사원의
-- 사번과 이름을 출력하세요. (현재 ‘Technique Leader’의 직책(으로 근무하는
-- 사원은 고려하지 않습니다.) 이름은 first_name과 last_name을 합쳐 출력
-- 합니다.

select e.emp_no, concat(e.first_name,' ', e.last_name) as name
		from employees e,(select * 
							from titles t 
							where t.title='Technique Leader'
							and t.to_date != '9999-01-01') t
		where e.emp_no=t.emp_no;

-- select * 
-- 	from titles t 
-- 	where t.title='Technique Leader'
-- 	and t.to_date != '9999-01-01';



-- 문제6.
-- 직원 이름(last_name) 중에서 S(대문자)로 시작하는 직원들의 이름, 부서명,
-- 직책을 조회하세요.
-- where like 검색

select  a.last_name as name,
	c.dept_name,
    d.title
	from employees a, dept_emp b, departments c, titles d
    where a.emp_no=b.emp_no
    and b.dept_no=c.dept_no
    and a.emp_no=d.emp_no
    and a.last_name like 'S%';



-- 문제7.
-- 현재, 직책이 Engineer인 사원 중에서 현재 급여가 40000 이상인 사원을 급여가
-- 큰 순서대로 출력하세요.

select distinct e.emp_no
	from salaries s, titles t, employees e
	where e.emp_no=s.emp_no
    and e.emp_no=t.emp_no
    and s.emp_no=t.emp_no
    and t.to_date='9999-01-01'
    and t.title='Engineer'
    and s.salary >= 40000
    order by s.salary desc;



-- 문제8.
-- 현재 급여가 50000이 넘는 직책을 직책,직원, 급여를 급여가 큰 순서대로 출력하시오

select  t.title, s.emp_no, s.salary
	from salaries s, titles t
    where s.emp_no=t.emp_no
    and s.to_date='9999-01-01'
    and t.to_date='9999-01-01'
    and s.salary > 50000
    order by s.salary desc;



-- 문제9.
-- 현재, 부서별 평균 연봉을 연봉이 큰 부서 순서대로 출력하세요.

select d.dept_no, avg(s.salary) as average
	from dept_emp d, employees e, salaries s
    where e.emp_no=s.emp_no
    and e.emp_no=d.emp_no
    and d.emp_no=s.emp_no
    and s.to_date='9999-01-01'
    and d.to_date='9999-01-01'
    group by d.dept_no
    order by  average desc;
    


-- 문제10.
-- 현재, 직책별 평균 연봉을 연봉이 큰 직책 순서대로 출력하세요.

select t.title, avg(s.salary) as average
	from titles t, salaries s, employees e
    where e.emp_no=s.emp_no
    and e.emp_no=t.emp_no
    and s.emp_no=t.emp_no
    and s.to_date='9999-01-01'
    and t.to_date='9999-01-01'
    group by t.title 
    order by average desc;