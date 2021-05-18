-- 서브쿼리(SUBQUERY) SQL 문제입니다.
-- '9999-01-01'
-- 문제1.
-- 현재 평균 연봉보다 많은 월급을 받는 직원은 몇 명이나 있습니까?


select avg(salary)
	from salaries s
    where s.to_date='9999-01-01';
    
--
select count(distinct(s.emp_no))
	from salaries s
    where s.salary > (select avg(salary)
						from salaries s
						where s.to_date='9999-01-01')
	and s.to_date='9999-01-01';



-- 문제2.
-- 현재, 각 부서별로 최고의 급여를 받는 사원의 사번/, 이름, 부서 연봉을 조회하세요. 단
-- 조회결과는 연봉의 내림차순으로 정렬되어 나타나야 합니다.

--
select e.emp_no, e.first_name, d.dept_no, max(s.salary) as high_salary
	from employees e, salaries s, dept_emp d
    where e.emp_no=s.emp_no
    and e.emp_no=d.emp_no
    and s.to_date='9999-01-01'
    and d.to_date='9999-01-01'
    group by d.dept_no
    order by high_salary asc;
    

-- 문제3.
-- 현재, 자신의 부서 평균 급여/보다 연봉(salary)이 많은 /사원의 사번, 이름과 연봉을 조회하세요
-- from 절 

select avg(s.salary) as dept_average, d.dept_no
	from employees e, dept_emp d, salaries s
    where e.emp_no=d.emp_no
    and e.emp_no=s.emp_no
    and s.emp_no=d.emp_no
    and s.to_date='9999-01-01'
    and d.to_date='9999-01-01'
    group by d.dept_no;
    
    
--
select a.emp_no, a.first_name, b.salary
	from employees a, salaries b, dept_emp c, (select avg(s.salary) as dept_average, d.dept_no
												from employees e, dept_emp d, salaries s
												where e.emp_no=d.emp_no
												and e.emp_no=s.emp_no
												and s.emp_no=d.emp_no
												and s.to_date='9999-01-01'
												and d.to_date='9999-01-01'
												group by d.dept_no) k
	where a.emp_no=b.emp_no
    and a.emp_no=c.emp_no
    and b.emp_no=c.emp_no
    and c.dept_no=k.dept_no
    and b.to_date='9999-01-01'
    and c.to_date='9999-01-01'
    and b.salary>k.dept_average;


-- 검증
select *
	from employees e, dept_emp d
    where e.emp_no=d.emp_no
    and e.emp_no='10001';
    
-- dept_no == d005, 부서 평균 연봉 67657, 확인한 사원 연봉 88958, 높음 확인


-- 문제4.
-- 현재, 사원들의 사번, 이름, 매니저 이름, 부서 이름으로 출력해 보세요.
-- 혼합 문제 (조인, 서브쿼리)

-- 그냥 현재 매니저들의 사번, 이름, 부서 이름 출력 ㄱㄱ
-- 검증을 위해 직책 추가

-- solv 1
-- outer join 써서 해보기
select sb1.emp_no, sb1.first_name, sb2.first_name, sb2.dept_name
	from(
    
    select e.emp_no, e.first_name, de.dept_no
	from employees e, dept_emp de
    where de.to_date > current_date()
    and e.emp_no=de.emp_no
    
    ) sb1
    
    left join (
    
    select dm.emp_no, dm.dept_no, e.first_name, d.dept_name
	from employees e, dept_manager dm, departments d
    where e.emp_no=dm.emp_no
    and d.dept_no=dm.dept_no
    and dm.to_date > current_date()
    
    ) sb2
    on sb1.dept_no=sb2.dept_no;
    
    
    
    
-- from 1
 select e.emp_no, e.first_name, de.dept_no
	from employees e, dept_emp de
    where de.to_date > current_date();
-- from 2
select dm.dept_no, e.first_name, d.dept_name
	from employees e, dept_manager dm, departments d
    where e.emp_no=dm.emp_no
    and d.dept_no=dm.dept_no
    and dm.to_date > current_date();
    
    
-- solv 2
select a.emp_no, a.first_name, b.dept_name, d.title
	from employees a, departments b, (select dm.emp_no, dm.dept_no
										from employees e, dept_manager dm
										where e.emp_no=dm.emp_no
										and dm.to_date='9999-01-01') c, titles d
    where a.emp_no=c.emp_no
    and b.dept_no=c.dept_no
    and d.emp_no=a.emp_no
    and d.emp_no=c.emp_no
    and d.to_date='9999-01-01';



-- 문제5.
-- 평균 연봉이 가장 높은 부서는(이름, 평균연봉)?

-- 평균 연봉 가장 높은 부서

 select avg(s.salary) as average, de.dept_no
	from employees e, salaries s, dept_emp de
    where e.emp_no=s.emp_no
    and e.emp_no=de.emp_no
    and s.emp_no=de.emp_no
    and s.to_date='9999-01-01'
    and de.to_date='9999-01-01'
    group by de.dept_no
    order by 1 desc
    limit 1;
    
    
-- select k.no
-- 	from (select avg(s.salary) as average, de.dept_no as no
-- 	from employees e, salaries s, dept_emp de
--     where e.emp_no=s.emp_no
--     and e.emp_no=de.emp_no
--     and s.emp_no=de.emp_no
--     and s.to_date='9999-01-01'
--     and de.to_date='9999-01-01'
--     group by de.dept_no
--     order by 1 desc
--     limit 1) k;
 
-- 부서 이름까지 고고
-- solv 1
select dp.dept_name, dp.dept_no, k.average
	from departments dp, ( select avg(s.salary) as average, de.dept_no
							from employees e, salaries s, dept_emp de
							where e.emp_no=s.emp_no
							and e.emp_no=de.emp_no
							and s.emp_no=de.emp_no
							and s.to_date='9999-01-01'
							and de.to_date='9999-01-01'
							group by de.dept_no
							order by 1 desc
							limit 1) k
	where dp.dept_no=k.dept_no
    order by k.average desc;


-- 문제6.
-- 현재, 평균연봉이 가장 높은 부서의 사원들의 사번, 이름, 직책, 연봉을 조회하고 연봉 순으로
-- 출력하세요.

-- solv1
select e.emp_no, e.first_name, t.title, s.salary, de.dept_no
	from employees e, titles t, salaries s, departments d, dept_emp de, 
    ( select avg(s.salary) as average, de.dept_no as no
	from employees e, salaries s, dept_emp de
    where e.emp_no=s.emp_no
    and e.emp_no=de.emp_no
    and s.emp_no=de.emp_no
    and s.to_date='9999-01-01'
    and de.to_date='9999-01-01'
    group by de.dept_no
    order by 1 desc
    limit 1) k
    where e.emp_no=s.emp_no
    and e.emp_no=t.emp_no
    and s.emp_no=t.emp_no
    and s.to_date='9999-01-01'
    and t.to_date='9999-01-01'
    and k.no = d.dept_no
    and d.dept_no = de.dept_no
    and de.emp_no = e.emp_no
    order by s.salary desc;
				


-- 문제7.
-- 평균 연봉이 가장 높은 직책?

-- solv 1
select avg(s.salary), t.title
	from employees e, salaries s, titles t
    where e.emp_no=t.emp_no
    and e.emp_no=s.emp_no
    and t.to_date='9999-01-01'
    and s.to_date='9999-01-01'
    group by t.title
    order by 1 desc
    limit 1;


-- 문제8.
-- 현재 자신의 매니저보다 높은 연봉을 받고 있는 직원은?
-- 부서이름, 사원이름, 연봉, 매니저 이름, 메니저 연봉 순으로 출력합니다.

-- 매니저 연봉과, 그 부서
-- from 2
select s.salary as manager_salary, dm.dept_no as dn, e.first_name as manger_name, dm.emp_no as manager_no
				from dept_manager dm, employees e, salaries s
				where dm.emp_no=e.emp_no
				and e.emp_no=s.emp_no
				and dm.to_date='9999-01-01'
				and s.to_date='9999-01-01';
    
    

-- from 1
select d.dept_name, e.first_name, de.dept_no, s.salary
		from departments d, employees e, dept_emp de, salaries s 
        where d.dept_no=de.dept_no
        and s.emp_no=e.emp_no
        and de.emp_no=e.emp_no
        and de.to_date > current_date()
        and s.to_date > current_date();
        
        
-- join
-- solv

select sb1.dept_name, sb1.first_name, sb1.salary, sb2.first_name, sb2.salary
	from (select d.dept_name, e.first_name, de.dept_no , s.salary
		from departments d, employees e, dept_emp de, salaries s 
        where d.dept_no=de.dept_no
        and s.emp_no=e.emp_no
        and de.emp_no=e.emp_no
        and de.to_date > current_date()
        and s.to_date > current_date()
 ) sb1 left join
 (select s.salary, dm.dept_no, e.first_name, dm.emp_no
				from dept_manager dm, employees e, salaries s
				where dm.emp_no=e.emp_no
				and e.emp_no=s.emp_no
				and dm.to_date='9999-01-01'
				and s.to_date='9999-01-01'
)  sb2
on sb1.dept_no = sb2.dept_no
where sb1.salary > sb2.salary order by 3 desc;
        
	