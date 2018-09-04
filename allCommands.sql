create table department(DID varchar(3),
			DNAME varchar(15),
			DHEAD varchar(10),
			DLOC varchar(5),
			primary key(DID)
			);

create table employee(EID varchar(5),
			ENAME varchar(15),
			AGE int,
			SALARY int,
			DID varchar(3),
			foreign key(DID) references department(DID)
			);

insert into department values('01','resource','Ajay','Hubli');
insert into department values('02','design','Amit','Hubli');
insert into department values('03','sales','Raju','Hubli');

insert into employee values('r02','Rakshit',27,12000,'01');
insert into employee values('d02','Shiv',23,27000,'02');
insert into employee values('s02','Jayant',31,45000,'03');


select * from employee where age>25;
select ename,age,salary from employee where salary>27000;
select * from employee where (age>25 and salary<30000);
select * from employee where (age<29 or salary>30000);
select * from employee where (age between 26 and 30);
select DNAME from department where (DLOC='Hubli');
select DNAME from department where (DLOC!='Hubli');
select * from employee,department where DLOC='Hubli' and employee.did=department.did;



********************************************************************************************************************

/* 2nd LAB */

-- IN operator 

select DNAME 
from employee,department
where DLOC in ('Hubli');

-- LIKE OPERATOR

select * from department where DNAME like '_e%';

select * from employee where ENAME like '%t';

select * from employee where AGE like '2%';

-- ACCESS ALL TABLES FROM DB

select table_name from user_tables ;


/ * Aggregate Functions */


-- COUNT

select count(*)
from employee
where did=2;

-- AVG

select avg(SALARY)
from employee;

-- AUTOCOMMIT ON 

set autocommit on;

-- MIN
-- MAX
-- SUM
--GROUP BY

select count(*)
from employee 
group by dname;


Q-

select count(*),max(salary)
from employee
where did=01;



*********** copied from KArtik
select  dname
from department
where dloc in ('bgm','delhi'); 


select  *
from department
where dloc not in ('bgm','delhi'); 


select  *
from department,employee
where department.did=employee.did and
dname='resrch';


select  eid,ename,age
from department,employee
where department.did=employee.did and
dname='resrch';

select *
from department d,employee e
where d.did=e.did and
dloc='delhi';

select *
from department d,employee e
where d.did=e.did and
dname='test' and salary>20000;

select  eid,ename
from employee
order by ename desc;

select  eid,ename,salary
from employee
order by salary desc;

SELECT *
FROM employee
WHERE  ename LIKE  '% or %';


select max(salary)
from employee;
select count(eid)
from employee;
select avg(salary)
from employee;






****************************************************************************************************
Lab 3 Termwork 1

create table publisher( pubname varchar(10),
			addr varchar(10),
			phno int,
			primary key(pubname));

create table book( bookid varchar(10),
		   title varchar(10),
		  pubname varchar(10),
		  pubyear int,
		 primary key(bookid),
		 foreign key(pubname) references publisher(pubname));


create table bookauthor( bookid varchar(10),
		   	authorname varchar(10),
			foreign key(bookid) references book(bookid));



create table branch( branchid varchar(10),
			branchname varchar(10),
			baddr varchar(10),
			primary key(branchid));

create table bookcopy( bookid varchar(10),
			branchid varchar(10),
			noc int,
			foreign key(bookid) references book(bookid),
			foreign key(branchid) references branch(branchid));

create table booklending( bookid varchar(10),
			  branchid varchar(10),
			 cardno varchar(10),
			 dateout date,
			  duedate date,
			foreign key(bookid) references book(bookid),
			foreign key(branchid) references branch(branchid));





insert into publisher values ('&pubname','&addr','&phno');
insert into book values ('&bookid','&title','&pubname','&pubyear');
insert into bookauthor values ('&bookid','&authorname');
insert into branch values ('&branchid','&branchname','&baddr');
insert into bookcopy values ('&bookid','&branchid','&noc');
insert into booklending values('&bookid','&branchid','&cardno','&dateout','&duedate');
