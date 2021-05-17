-- 함수 : 수학 함수

-- abs(), 절대값
select abs(-1), abs(1);

-- mode(), 나머지 
select mod(10,3);

-- floor(x), x보다 크지 않은 가장 큰 정수 반환
select floor(3.7);
select floor(1.23);
select floor(-1.23);

-- ceil(x), x보다 큰 정수 중 가장 작은 정수 반환
select ceil(3.5), ceil(1.23), ceil(-1.23), ceiling(3.14);

-- round(x)/round(x, d), x에 가장 근접한 정수 반환/x 값 중에서 소숫점 d자리에 가장 근접한 실수 반환
-- 즉, 반올림과 반올림 자릿수 
select round(5.654647, 3), round(1.234, 0), round(1.5551);


-- pow(x, y)/power(x, y), x의 y승
select pow(2, 3), power(2, 10), pow(10, 3);

-- sign(x)
-- x가 양수이면 1, 음수이면 -1, 0이면 0을 보여준다.
select sign(324), sign(-3241), sign(0);

-- greatest(x,y,.....), least(x,y,.....), 가장 크고 작은 값을 반환
select greatest(10, 40, 20, 30), least(19,28,59,3), greatest('a','b','c');