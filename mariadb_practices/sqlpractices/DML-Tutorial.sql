-- 테이블 삭제하기
drop table pet;

-- 테이블 만들기
create table pet(
	name varchar(20),
    owner varchar(20),
    species varchar(20),
    gender char(1),
    birth date,
    death date);

-- scheme 확인
desc pet;

-- 조회
select name, owner, species, gender from pet;

-- 데이터 생성(CRUD, Create)
insert into pet values ('크롬', '우성', 'cat', 'm', '2014-05-10',null);

-- 데이터 삭제(CRUD, Delete)
delete from pet where name='크롬';