# RDBMS

		1. (R)DBMS : DA, DB Scheme(entity, ERD Logical) -> table(physical)
+ ��Ű�� �ܰ迡���� ���� ����, �� ���踦 �������� table�� ���������� �����Ѵ�.





		2. SQL(Structured Query Language) : ����ȭ�Ǿ��ִ� ���� ���
1. DDL
2. DCL(data control language, ������ ��Ȯ���� �������� access�� control�Ѵٰ� �����ϸ�ȴ�.)
3. DML(CRUD)
4. ����ȭ(Normaliztion) / ������ȭ




		3. DB Programming(C,C++,JAVA-JDBC, Python, JS, PHP ...)
+ JDBC programming�� �� ���� � DB�� ����ϴ��� ������ ���� �� �ִ�.
Classname.DriverManager.get(asdfa)�� ��ü ���� Ư¡�� ���� ��ü�� �̾��ְ� �츮�� �ϳ��� �ڵ��� �ϸ� �ȴ�.


>> ���� ���
	
	

---

>�� ��ƼƼ�� �Ӽ��̿��� �κ��� ���ο� ��ƼƼ�� ��������߸� �� ��, **����**�� ���ܳ���.

## SQL

		DML-SELECT,INSERT,UPDATE,DELETE,MERGE
+ �⺻, ����, JOIN, SUBQUERY



		DCL -GRANT,REVOKE


		DDL -CREATE,ALTER,DROP,RENAME



---

## MySQL 
		mysql -u root -p (DBA�������� ����)
1. �����ͺ��̽� ����
	ex)	MariaDB [none]>create database webdb;
2. ����� ����(����, ��й�ȣ)
	ex)	MariaDB [none]>create usr 'webdb'@'localhost' identified by 'webdb';
3. ���� �ο�
	ex) MariaDB [webdb]> grant all privileges on webdb.* to 'webdb'@'localhost';
4. ���ο� ���� ���� ����
	MariaDB [webdb]> flush privileges;
5. �׽�Ʈ 
	mysql -u webdb -D webdb -p;
	
	
> workbench

1. ���� �����ؼ� �������ֱ� (Ŭ���̾�Ʈ�� �����Ƿ�)
2. ���� Ȯ���ϱ�
+ use mysql;
+ select user,host from user;


		

		
	
	
		
	