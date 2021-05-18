-- subquery
-- 1) from절의 서브쿼리
select now() as n, sysdate() as b, 3+1 as c;

select s.n, s.b, s.c
	from (select now() as n, sysdate() as b, 3+1 as c) s;




-- 2-1) where절의 서브쿼리 : 단일행
-- 단일행 연산자 : =, >, <, <=, >=, !=, <>
-- 로우와 컬럼이 하나가 나와야한다.

-- 실습문제 1:
-- subquery
select avg(salary)
	from salaries
		where to_date='9999-01-01';
        
-- answer
select e.first_name as 이름 , s.salary as 급여
	from employees e, salaries s
		where e.emp_no=s.emp_no
        and s.to_date='9999-01-01'
        and s.salary < (select avg(salary)
						from salaries
						where to_date='9999-01-01')
        order by s.salary desc;


-- 실습문제 2:
-- subquery

-- 1.group by, 직책별 평균 급여

select avg(s.salary), t.title
	from salaries s, titles t 
		where s.emp_no=t.emp_no
        and s.to_date='9999-01-01'
        and t.to_date='9999-01-01'
			group by t.title;
            
            
				
-- 2. 가장 적은 평균 급여
-- answer:
select min(s.average)
	from (select avg(s.salary) as average, t.title as title
			from salaries s, titles t 
				where s.emp_no=t.emp_no
				and s.to_date='9999-01-01'
				and t.to_date='9999-01-01'
					group by t.title) s;


-- answer 2: top-k

select *
	from (select avg(s.salary) as average, t.title as title
			from salaries s, titles t 
				where s.emp_no=t.emp_no
				and s.to_date='9999-01-01'
				and t.to_date='9999-01-01'
					group by t.title
						order by average asc
							limit 0,1) s;
                            
                            
-- solve 3:
--
select a.title, avg(b.salary) as avg_salary
	from titles a, salaries b
   where a.emp_no = b.emp_no
     and a.to_date = '9999-01-01'
     and b.to_date = '9999-01-01'
group by a.title
  having round(avg_salary) = (select min(a.avg_salary)
                                from (  select round(avg(b.salary)) as avg_salary
	                                      from titles a, salaries b
		                                 where a.emp_no = b.emp_no
                                           and a.to_date = '9999-01-01'
                                           and b.to_date = '9999-01-01'
	                                  group by a.title) a);    
						

-- querey 1)
select d.dept_no 
	from employees e, dept_emp d
		where e.emp_no=d.emp_no 
        and d.to_date='9999-01-01'
        and concat(e.first_name,' ',e.last_name)='Fai Bale';
        
-- query 2)
select e.emp_no, e.first_name
	from employees e, dept_emp d
		where e.emp_no=d.emp_no
			and d.dept_no='d004';
            
            
-- subquery(query 1 +  query 2) 완성
-- 각 조건의 쿼리를 두 개 만들고 하나로 이어서 만든다.
select e.emp_no, e.first_name
	from employees e, dept_emp d
		where e.emp_no=d.emp_no
			and d.dept_no=(select d.dept_no 
	from employees e, dept_emp d
		where e.emp_no=d.emp_no 
        and d.to_date='9999-01-01'
        and concat(e.first_name,' ',e.last_name)='Fai Bale');

-- 2-2) where절의 서브쿼리 : 복수행
-- 복수행 연산자 : in, not in, any, all

-- any 사용법
-- 1. =any : in과 동일
-- 2. >any, >=any : 최소값
-- 3. <any, <=any : 최대값
-- 4. <>any : not in 과 동일


-- all 사용법a
-- 1. =all(x)
-- 2. >all, >= all : 최대값
-- 3. <all, <=all ㅣ;최소값

-- 예제 : 현재
-- solve 1)
select * 
	from employees e, salaries s
		where e.emp_no=s.emp_no
			and s.to_date='9999-01-01'
            and (e.emp_no, s.salary) in(select emp_no, salary
									from salaires 
									where to_date = '9999-01-01'
									and salary > 50000)
					order by s.salary asc;
                    
-- sovle 2)
select a.first_name as name, b.salary as salary
	from employees a, 
		salaries b
		where a.emp_no=b.emp_no
        and b.to_date='9999-01-01'
        and b.salary > 50000
        order by b.salary asc;


-- solve 3)
select * 
	from employees e, salaries s
		where e.emp_no=s.emp_no
			and s.to_date='9999-01-01'
            and (e.emp_no, s.salary) = any(select emp_no, salary
									from salaires 
									where to_date = '9999-01-01'
									and salary > 50000)
					order by s.salary asc;
                    



-- 실습문제 4
-- 각 부서별로 최고 월급을 받는 직원의 이름과 월급을 출력
-- 둘리 40000

-- solv1: where subquery =any
-- solv2: from subquery 

select max(s.salary) as high_salary, t.title as title, s.emp_no as no
	from salaries s, titles t
		where  s.emp_no=t.emp_no
			group by t.title
            order by s.salary desc;

-- 정답:

select a.dept_no, max(b.salary) as max_salary
	from dept_emp a, salaries b
    where a.emp_no=b.emp_no
    and a.to_date='9999-01-01'
    and b.to_date='9999-01-01'
    group by a.dept_no;
    
    
select a.dept_no, c.first_name, b.salary
	from dept_emp a, salaries b, employees c
    where a.emp_no=b.emp_no
    and b.emp_no=c.emp_no
    and a.to_date='9999-01-01'
    and b.to_date='9999-01-01'
    and (a.dept_no, b.salary) = any(select a.dept_no, max(b.salary)
										from dept_emp a, salaries b
										where a.emp_no=b.emp_no
										and a.to_date='9999-01-01'
										and b.to_date='9999-01-01'
										group by a.dept_no);



-- 2
select a.dept_no, c.first_name, b.salary
	from 
    dept_emp a, 
    salaries b, 
    employees c,
		(select a.dept_no, max(b.salary) as max_salary
			from dept_emp a, salaries b
			where a.emp_no=b.emp_no
			and a.to_date='9999-01-01'
			and b.to_date='9999-01-01'
				group by a.dept_no) d
    where a.emp_no=b.emp_no
    and b.emp_no=c.emp_no
    and a.dept_no=d.dept_no
    and b.salary=d.max_salary
    and a.to_date='9999-01-01'
    and b.to_date='9999-01-01';




select a.title, avg(b.salary) as avg_salary
	from titles a, salaries b
   where a.emp_no = b.emp_no
     and a.to_date = '9999-01-01'
     and b.to_date = '9999-01-01'
group by a.title
  having round(avg_salary) = (select min(a.avg_salary)
                                from (  select round(avg(b.salary)) as avg_salary
	                                      from titles a, salaries b
		                                 where a.emp_no = b.emp_no
                                           and a.to_date = '9999-01-01'
                                           and b.to_date = '9999-01-01'
	                                  group by a.title) a);    

















































































































































 