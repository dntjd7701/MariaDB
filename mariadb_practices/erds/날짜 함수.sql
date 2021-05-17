-- 함수 : 날짜 함수

-- curdate()/current_date, 오늘 날짜를 YYYY-MM-DD나 YYYYMMDD 형식으로 반환
select curdate(), current_date;
-- curtime()/current_time
select curtime(), current_time;


-- now() vs sysdate(), 현재 날짜와 시간을 출력하는 것은 똑같아 보이지만 now는 쿼리가 들어갈 때의 시간을, sysdate은 쿼리가 들어갈 때마다의 시간
select now(), sysdate();
select now(), sleep(2), now();
select sysdate(), sleep(2), sysdate();


-- date_format(date, format)
select date_format(now(), "%Y년 %m월 %d일 %h시 %m분 %s초" );

-- period off
-- YYM , YYYYMM
-- ex) 근묵 개월 수를 출력
select * from eployees;

select period_diff(date_format(curdate, '%Y,%Y%m'), date_format(hire_date, '%Y%m'),
	date format(hire_date,'%Y%m'));
	from employees;

-- date_add(addddate랑 같음) , date_sub(subdate),
-- 날짜 data에 type(day, month, yeaar(=;;
-- ex) 각 사원ㄷ르의 근무 년 수가 5년이 되는 날은 

select first_name, hire_date (hire3 interval 5 year) from employees;

-- cast
select cast('2021-05-07' as date);
select cast('2021-05-07' as int) + 10;
select now(), cast(now() as date);
select cast(cast(1-2 as unsigned) as signed);

-- mysql type
-- VARCHAR(가변길이), CHAR, TEXT(긴~거)
-- INT(INTEGER), MEDIUM INT, BIG INT, INT(11)
-- FLOAT, DOUBLE
-- TIME, DATE, DATETIME
-- LOB(Large OBject) : CLOB, BLOB








