-- 집계쿼리 : select 절에 그룹함수가 적용도니 경우

select avg(salary)
	from salaries
		where emp_no = '10060';

-- select 절에 그룹 함수가 있는 경우, 어떤 컬럼도 select 절에 올 수 없다. 
-- emp_no 는 아무런 의미가 없다.         
select avg(salary),emp_no
	from salaries;
    
-- 쿼리 실행 순서 
-- (1)from : 접근 테이블 확인
-- (2) where : 조건에 맞는 row 선택 -> 임시 테이블 
-- (3) 집계
-- (4) projection(select)
-- (5) (order by)
    select avg(salary)
	from salaries;
    
    
-- group by에 참여 하고 있는 컬럼은 select 절에 올 수 있다. 
-- projection 가능 !
    select avg(salary), emp_no
		from salaries
			group by emp_no;
    

-- having 
-- 집계가 끝난 (group by) 데이터를 대상으로 그룹에 대한 조건을 거는것
-- 이미 where절이 끝났음. 집계 후에 조건을 다시 걸어줄 필요가 있고, 그게 바로 having 절.

-- 집계 결과 임시 테이블에서 로우를 선택해야 하는 경우
-- 이미 where절은 실행이 되었기 때문에 having절에서 조건을 주어야 한다. 
   select  emp_no, avg(salary)
		from salaries
			group by emp_no 
				having avg(salary) > 60000
					order by avg(salary);

-- 집계 함수가 사용될 경우, group by에 관여된 컬럼만 select절에 올 수 있는게
-- 옳은 문법이나, sql에서
-- 의미적으로 emp_no는 where절의 조건으로 인해 의미를 가지게 되므로 사용하였다. 
select emp_no, avg(salary), sum(salary), max(salary), min(salary) from salaries where emp_no='10060';
    
    