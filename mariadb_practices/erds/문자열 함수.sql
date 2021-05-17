-- 함수형 : 문자열 함수

-- upper
select upper('buSan');
select upper(first_name) from employees;

-- lower
select lower('buSan');
select lower(first_name) from employees;

-- subString(문장, 시작 인덱스, 시작부터의 길이)
select substring('Happy Day', 3, 2);
-- 전산은 1에서 시작하는게 많음. 코드와는 다름

select concat(first_name, ' ', last_name) as name, hire_date from employees where hire_date like '1989-%';
select concat(first_name, ' ', last_name) as name, hire_date from employees where '1989' = substring(hire_date, 1, 4);

-- lpad, rpad
select lpad ('1234', 10, '-');
select rpad ('1234', 10, '-');

select emp_no, lpad(salary,10,'*') as salary from salaries where to_date like '2001-%' and salary <= 70000 order by emp_no;

-- trim, ltrim, rtrim
select 	concat('---',ltrim('    hello    '),'---') as ltrim,
		concat('---',rtrim('    hello    '),'---') as rtrim,
		trim('      hi             ') as trim , trim(both 'x' from 'xxxxxxxxxhixxxxxxxxxxx') as trim2;

