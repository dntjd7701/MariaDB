# RDBMS

		1. (R)DBMS : DA, DB Scheme(entity, ERD Logical) -> table(physical)
+ 스키마 단계에서는 논리적 설계, 그 설계를 바탕으로 table을 물리적으로 구성한다.





		2. SQL(Structured Query Language) : 구조화되어있는 쿼리 언어
1. DDL
2. DCL(data control language, 이지만 정확히는 데이터의 access를 control한다고 생각하면된다.)
3. DML(CRUD)
4. 정규화(Normaliztion) / 반정규화




		3. DB Programming(C,C++,JAVA-JDBC, Python, JS, PHP ...)
+ JDBC programming만 잘 배우면 어떤 DB를 사용하던지 쿼리를 날릴 수 있다.
Classname.DriverManager.get(asdfa)와 객체 지향 특징을 통해 객체를 뽑아주고 우리는 하나의 코딩만 하면 된다.


>> 수정 요망
	
	

---

>한 엔티티의 속성이였던 부분이 새로운 엔티티로 만들어져야만 할 때, **관계**가 생겨난다.

## SQL

		DML-SELECT,INSERT,UPDATE,DELETE,MERGE
+ 기본, 집계, JOIN, SUBQUERY



		DCL -GRANT,REVOKE


		DDL -CREATE,ALTER,DROP,RENAME



---

## MySQL 
		mysql -u root -p (DBA권한으로 접속)
1. 데이터베이스 생성
	ex)	MariaDB [none]>create database webdb;
2. 사용자 생성(인증, 비밀번호)
	ex)	MariaDB [none]>create usr 'webdb'@'localhost' identified by 'webdb';
3. 권한 부여
	ex) MariaDB [webdb]> grant all privileges on webdb.* to 'webdb'@'localhost';
4. 새로운 변경 사항 적용
	MariaDB [webdb]> flush privileges;
5. 테스트 
	mysql -u webdb -D webdb -p;
	
	
> workbench

1. 계정 생성해서 연결해주기 (클라이언트쪽 아이피로)
2. 계정 확인하기
+ use mysql;
+ select user,host from user;


		

		
	
	
		
	