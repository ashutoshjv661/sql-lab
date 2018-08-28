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
