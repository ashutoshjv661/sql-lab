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

								
***********************************************************************************************
Date : 18/9/2018
Lab 4;  Termwork1;

	select * from book;

BOOKID     TITLE      PUBNAME       PUBYEAR
---------- ---------- ---------- ----------
a001       maths1     rdsharma         2005
a002       maths2     rdsharma         2006
a003       maths3     rdsharma         2007
a004       civil1     kle              2001
a005       dbms       pearson          2007
a006       automata   pearson          2013
a007       mech1      charu            2017
q008       pubg       charu            2018
a008       basicele   sapna            2001
a009       network    amazon           2017
b001       dms        agarwal          2010

	select * from bookauthor;

BOOKID     AUTHORNAME
---------- ----------
a001       rahul
a002       sharma
a003       sukesh
a004       vishnu
a005       ashutosh
a006       charudatt
a007       dheeraj
a008       ramesh
a009       suresh
b001       avinash
q008       charu

	select * from branch;

BRANCHID   BRANCHNAME BADDR
---------- ---------- ----------
br001      bgm1       belgaum
br002      up1        up
br003      up2        up
br004      mum1       mumbai
br005      del1       delhi
br006      kol1       kolkata
br007      ban1       banglore

	select * from publisher;

PUBNAME    ADDR             PHNO
---------- ---------- ----------
pearson    kolkata    9918291929
agarwal    up         9918291881
sapna      delhi      9189122121
akash      mumbai     9989765816
rdsharma   up         8892728292
amazon     banglore   9987678564
kle        belgaum    7789654786
charu      belgaum    8897609879
	
select * from bookcopy;

BOOKID     BRANCHID          NOC
---------- ---------- ----------
a002       br003            1200
a001       br002            2000
a003       br002            1500
a004       br001             900
a005       br006            3400
a006       br006            1400
a007       br001            1922
q008       br001            9999
a008       br005            4500
a009       br007            2300
b001       br003            2311
	
	select * from booklending;

BOOKID     BRANCHID   CARDNO     DATEOUT   DUEDATE
---------- ---------- ---------- --------- ---------
a001       br002      2kl16cs016 12-FEB-18 20-FEB-18
a002       br003      2kl16cs016 22-JAN-17 12-FEB-18
a004       br001      2kl16cs016 15-MAR-18 28-MAR-18
	
Queries :

1.  select b.bookid,title,pubname,authorname,noc
 from book b,bookcopy bc,bookauthor ba
 where b.bookid=bc.bookid and b.bookid=ba.bookid;

BOOKID     TITLE      PUBNAME    AUTHORNAME        NOC
---------- ---------- ---------- ---------- ----------
a001       maths1     rdsharma   rahul            2000
a002       maths2     rdsharma   sharma           1200
a003       maths3     rdsharma   sukesh           1500
a004       civil1     kle        vishnu            900
a005       dbms       pearson    ashutosh         3400
a006       automata   pearson    charudatt        1400
a007       mech1      charu      dheeraj          1922
a008       basicele   sapna      ramesh           4500
a009       network    amazon     suresh           2300
b001       dms        agarwal    avinash          2311
q008       pubg       charu      charu            9999

2. select cardno from booklending
   where dateout between date '2017-01-01' and date '2018-06-01'
   group by cardno
   having count(*)>3;	

3. delete from book where bookid=XXX;

4.  create view yop2001 as
	select * from book where pubyear=2001;

BOOKID     TITLE      PUBNAME       PUBYEAR
---------- ---------- ---------- ----------
a004       civil1     kle              2001
a008       basicele   sapna            2001

5. create view CurAvailBooks as
	select b.bookid,b.title,
	((select sum(noc) from bookcopy where bookid=b.bookid) -
	(select count(*) from booklending bl where bookid=b.bookid
	group by bookid)) as cnt from book b;

BOOKID     TITLE             CNT
---------- ---------- ----------
a001       maths1           1999
a002       maths2           1199
a003       maths3
a004       civil1            899
a005       dbms
a006       automata
a007       mech1
q008       pubg
a008       basicele
a009       network
b001       dms



  select view_name from user_views;

***************************************
Termwork 2 ;
Date : 18-9-18

 TABLE CREATION :

	create table salesman( sid varchar(10) not null,
				sname varchar(10),
				scity varchar(10),
				commision int,
			primary key(sid));
	
	create table customer( cid varchar(10) not null,
				cname varchar(10),
				ccity varchar(10),
				grade varchar(10),
				sid varchar(10) not null,
			primary key(cid),
			foreign key(sid) references salesman(sid));
	
	create table orders( onum int,
			     pamount int,
		             odate date,
			     cid varchar(10) not null,
			     sid varchar(10) not null,
		primary key(onum,sid,cid),
		foreign key(sid) references salesman(sid)
		ON DELETE CASCADE,
		foreign key(cid) references customer(cid)
		ON DELETE CASCADE
		);
		

***************************************************************************************************************************
Lab 5 ; 25/09/18

insert into salesman values('s1','ashu','belgaum',20);
insert into salesman values('s2','charu','banglore',25);
insert into salesman values('s3','dheeraj','banglore',20);
insert into salesman values('s4','kevin','belgaum',5);
insert into salesman values('s5','darshan','hubli',15);
insert into salesman values('s6','tushr','delhi',10);
	
SID        SNAME      SCITY       COMMISION
---------- ---------- ---------- ----------
s1         ashu       belgaum            20
s2         charu      banglore           25
s3         dheeraj    banglore           20
s4         kevin      belgaum             5
s5         darshan    hubli              15
s6         tushr      delhi              10


insert into customer values('c1','aishwarya','belgaum','7','s1');
insert into customer values('c2','bhoomika','hubli','7','s5');
insert into customer values('c3','apeksha','banglore','5','s2');
insert into customer values('c4','ekta','belgaum','7','s4');
insert into customer values('c5','avinash','hubli','4','s5');
insert into customer values('c6','adarsh','banglore','6','s3');
insert into customer values('c7','akshay','belgaum','7','s1');
insert into customer values('c8','vijay','belgaum','3','s6');


CID        CNAME      CCITY      GRADE      SID
---------- ---------- ---------- ---------- ----------
c1         aishwarya  belgaum    7          s1
c2         bhoomika   hubli      7          s5
c3         apeksha    banglore   5          s2
c4         ekta       belgaum    7          s4
c5         avinash    hubli      4          s5
c6         adarsh     banglore   6          s3
c7         akshay     belgaum    7          s1
c8         vijay      belgaum    3          s6

insert into orders values(1,'12000','01-JAN-2018','c1','s1');
insert into orders values(2,'13000','01-JAN-2018','c2','s5');
insert into orders values(3,'8000','26-FEB-2018','c3','s2');
insert into orders values(4,'12900','12-MAR-2018','c4','s4');
insert into orders values(5,'12310','23-MAR-2018','c5','s5');
insert into orders values(6,'82920','13-APR-2018','c6','s3');
insert into orders values(7,'12300','23-AUG-2018','c7','s1');

  ONUM    PAMOUNT ODATE     CID        SID
------ ---------- --------- ---------- -----
     1      12000 01-JAN-18 c1         s1
     2      13000 01-JAN-18 c2         s5
     3       8000 26-FEB-18 c3         s2
     4      12900 12-MAR-18 c4         s4
     5      12310 23-MAR-18 c5         s5
     6      82920 13-APR-18 c6         s3
     7      12300 23-AUG-18 c7         s1


Query 1 : 
 select count(*) from customer
 where  grade>(select avg(grade) from customer where ccity='banglore') and ccity!='banglore';


 COUNT(*)
---------
        4

Query 2:

select sname,sid from salesman
where sid in
 ( select sid from customer 
group by sid
having count(*)>1);

SNAME      SID
---------- ---------
ashu       s1
darshan    s5

Query 3: 

select s.sid,scity,cname from salesman s,customer c where c.sid=s.sid and scity=ccity
union
select s.sid,scity,'nomatch' from salesman s,customer c where c.sid=s.sid and ccity<>scity; //<> not equal to

SID        SCITY      CNAME
---------- ---------- ----------
s1         belgaum    aishwarya
s1         belgaum    akshay
s2         banglore   apeksha
s3         banglore   adarsh
s4         belgaum    ekta
s5         hubli      avinash
s5         hubli      bhoomika
s6         delhi      nomatch


Query 4: 

create view HighSalesman as
	select o.sid,s.sname
	from orders o,salesman s
	where s.sid=o.sid and
	pamount =( select max(pamount) from orders where odate='01-JAN-2018');

SID        SNAME
---------- ----------
s5         darshan
// termwork 2 complete 
********************************************************************************************************************************************************************************************************
Termwork 3
Date : 9-10-18

Table Creation :

1.
	create table actor ( act_id varchar(10),
		              act_name varchar(10),
	 		act_gender varchar(10),
		primary key(act_id));

2.

	create table director( dir_id varchar(10),
			dir_name varchar(10),
			dir_phone varchar(10),
		primary key(dir_id));
3.
	create table movies( mov_id varchar(10),
			mov_title varchar(10),
			mov_year int,
			dir_id varchar(10),
			mov_lang varchar(10),
		primary key(mov_id),
		foreign key(dir_id) references director(dir_id));
4. 
	create table mov_cast( act_id varchar(10),
			mov_id varchar(10),
			role varchar(10),
		primary key(act_id,mov_id),
		foreign key(act_id) references actor(act_id),
		foreign key(mov_id) references movies(mov_id));
5.

	create table rating( mov_id varchar(10),
			rev_star int,
	foreign key(mov_id) references movies(mov_id));
	

**************************************
Inserting values :

insert into actor values ('a1','charu','M');
insert into actor values ('a2','dheeraj','M');
insert into actor values ('a3','avinash','M');
insert into actor values ('a4','aishwarya','F');
insert into actor values ('a5','kevin','M');

select * from actor;

ACT_ID     ACT_NAME   ACT_GENDER
----------	 ---------- 	----------
a1         charu      	M
a2         dheeraj    	M
a3         avinash    	M
a4         aishwarya  	F
a5         kevin      	M

insert into director values('d1','rgv','9919918201');
insert into director values('d2','srk','9919293929');
insert into director values('d3','salman','4758928376');
insert into director values('d4','amir','9987684562');
insert into director values('d5','karan','8897556908');
insert into director values('d6','anuraj','9909223856');
insert into director values('d7','hitchcock','9911223856');
insert into director values('d8','steven s','9911223856');

select * from directors;

DIR_ID     DIR_NAME   DIR_PHONE
---------- 	---------- 	----------
d1        	 rgv        	9919918201
d2        	 srk        	9919293929
d3         	salman    	 4758928376
d4        	 amir       	9987684562
d5        	 karan     	 8897556908
d6        	 anuraj     	9909223856
d7      	  hitchcock  9911223856
d8         	steven s   9911223856

insert into movies values('m1','dilwale','1999','d1','hindi');
insert into movies values('m2','tezab','1990','d2','hindi');
insert into movies values('m3','insedous','2001','d3','eng');
insert into movies values('m4','pk','2015','d3','hindi');
insert into movies values('m5','piku','2016','d4','hindi');
insert into movies values('m6','paa','2016','d5','hindi');
insert into movies values('m7','inception','2017','d7','eng');
insert into movies values('m8','predator','2017','d8','eng');

select * from movies;
MOV_ID     MOV_TITLE    MOV_YEAR DIR_ID     MOV_LANG
---------- ---------- ---------- ---------- ----------
m1       	  dilwale          1999 	d1         hindi
m2        	 tezab            1990 	d2         hindi
m3         	insedous         2001 	d3         eng
m4        	 pk               2015 	d3         hindi
m5         	piku             2016 	d4         hindi
m6        	 paa              2016 	d5         hindi
m7        	 inception        2017	 d7         eng
m8        	 predator         2017	 d8         eng


insert into rating values('m1','6');
insert into rating values('m2','8');
insert into rating values('m3','10');
insert into rating values('m4','9');
insert into rating values('m5','3');
insert into rating values('m6','5');
insert into rating values('m7','10');
insert into rating values('m8','7');

select * from rating;
MOV_ID       REV_STAR
---------- ----------
m1                  6
m2                  8
m3                 10
m4                  9
m5                  3
m6                  5
m7                 10
m8                  7

insert into mov_cast values('a1','m1','d7');
insert into mov_cast values('a1','m3','d2');
insert into mov_cast values('a2','m2','d3');
insert into mov_cast values('a3','m5','d4');
insert into mov_cast values('a4','m6','d4');
insert into mov_cast values('a5','m7','d8');
insert into mov_cast values('a1','m8','hero');
ACT_ID     MOV_ID     ROLE
---------- ---------- -----
a1       m1         d7
a1       m3         d2
a2       m2         d3
a3       m5         d4
a4       m6         d4
a5         m7         d8
a1          m8        hero
*******************************************
Queries :
1. 
	select mov_title from director d,movies m
	 where d.dir_id=m.dir_id and
 	d.dir_name='hitchcock';
	
MOV_TITLE
----------
inception

2.	select mov_title from movies m, mov_cast mc
	where m.mov_id=mc.mov_id and 
	mc.act_id in (select act_id from mov_cast mc group by act_id having count(*)>2);
	
MOV_TITLE
----------
dilwale
insedous
predator

3.  	select a.act_id , a.act_name from actor a,mov_cast mc,movies m
	where a.act_id=mc.act_id and m.mov_id=mc.mov_id
	and mov_year<2000
	intersect
	select a.act_id , a.act_name from actor a,mov_cast mc,movies m
	where a.act_id=mc.act_id and m.mov_id=mc.mov_id
	and mov_year>2015;
	
ACT_ID     ACT_NAME
---------- ----------
a1         charu

4. 	select mov_title,max(rev_star),sum(rev_star)
	from movies m, rating r
	where m.mov_id=r.mov_id
	group by mov_title
	having max(rev_star)>0
	order by mov_title;

MOV_TITLE  MAX(REV_STAR) SUM(REV_STAR)
----------	 	------------- 	-------------
dilwale     	           	6             6
inception  	          	 10            10
insedous   	      	 10            10
paa                    	5             5
piku                   	3             3
pk                     	9             9
predator               	7             7
tezab                  	8             8

5. 
	update rating r set rev_star=5 
	where r.mov_id in (select m.mov_id from movies m ,director d,rating r where m.mov_id=r.mov_id
	 and d.dir_id=m.dir_id and d.dir_name='steven s' );
MOV_ID       REV_STAR
---------- ----------
m1                  6
m2                  8
m3                 10
m4                  9
m5                  3
m6                  5
m7                 10
m8                  5

****************************************************************************************************************************
Termwork 4
Date : 16/10/18

creating tables :

1.
	create table student( usn varchar(10),
				sname varchar(20),
				addr varchar(20),
				phno varchar(10),
				gen varchar(10),
				 primary key(usn));

2. 	create table semsec (
				ssid varchar(10),
				sem varchar(10),
				sec varchar(10),
			primary key(ssid));

3.	create table subject( 
				subcode varchar(10),
				title varchar(10),
				sem varchar(10),
				credit varchar(10),
				primary key(subcode));
4. 	create table class (
				usn varchar(10),
				ssid varchar(10),
			primary key(usn),
		foreign key(usn) references student(usn),
		foreign key(ssid) references semsec(ssid));

5.
	create table iamarks (
				usn varchar(10),
				subcode varchar(10),
				ssid varchar(10),
				test1 int,
				test2 int,
				test3 int,
				finalia int,
		primary key(usn,subcode),
	foreign key(usn) references student(usn),
	foreign key(subcode) references subject(subcode),
	foreign key(ssid) references semsec(ssid));

********************************************


Inserting data :

1.
	
	select * from student;


USN        SNAME                ADDR                 PHNO       GEN
---------- -------------------- -------------------- ---------- ----------
2KL16CS001 RAKSHIT              BELAGAVI             8877881122 M
2KL16CS002 SANKET               MANGALURU            7722829912 M
2KL16CS003 SANTOSH              MANGALURU            7712312312 M
2KL16CS004 SUDARSHAN            MANGALURU            8877881122 M
2KL16CS005 ANJALI               CHENNAI              9900211201 F
2KL16CS006 AMRUTA               CHENNAI              9923211099 M
2KL16CS007 ASMI                 KOLKATTA             7894737377 F
2KL16CS008 AJAY                 TUMKUR               9845091341 M


2.
	select * from semsec;
insert into semsec values('ele','4','C');
insert into semsec values('enc','4','C');
insert into semsec values('ade','4','C');

SSID       SEM        SEC
---------- ---------- ----------
bio        6          A
MEC        7          B
cse        6          B
CHM        1          A
CSE2       7          B
CSE3       5          A
CS4        5          B
ele        4          C
enc        4          C
ade        4          C

3. 
	select * from class;

insert into class values('2KL16CS006','ele');
insert into class values('2KL16CS003','enc');
insert into class values('2KL16CS008','ade');
insert into class values('','');

USN        SSID
---------- ----------
2KL16CS002 MEC
2KL16CS004 CHM
2KL16CS005 CSE2
2KL16CS006 ele
2KL16CS003 enc
2KL16CS008 ade

4.
	select * from subject;

SUBCODE    TITLE      SEM        CREDIT
---------- ---------- ---------- ----------
10CS81     ATC        6          4
10CS82     JAVA       6          4
10CS83     AJAVA      8          4
10CS84     OOP        8          4
10CS85     OS         5          4
10CS71     CN         5          4
10CS72     CN1        5          4
10CS73     CN2        5          4
10CS74     DBMS       7          4
10CS75     MATHS      7          4

5.

	select * from iamarks;
USN        SUBCODE    SSID            TEST1      TEST2      TEST3    FINALIA
---------- ---------- ---------- ---------- ---------- ---------- ----------
2KL16CS002 10CS82     MEC                12         19         14
2KL16CS004 10CS84     CHM                20         16         19
2KL16CS005 10CS85     CSE2               15         15         12
2KL16CS006 10CS71     CS4                19         18         20
2KL16CS006 10CS81     CS4                15         13         26



**************
Queries :
	

1.	
	select s.sname,s.usn from student s,
	class c, semsec ss
	where s.usn=c.usn and c.ssid=ss.ssid
	and sem='4' and sec='C';


SNAME                USN
-------------------- ----------
AMRUTA               2KL16CS006
SANTOSH              2KL16CS003
AJAY                 2KL16CS008	



2.
	select ss.sem, ss.sec, gen, count(*)
	from student s,class c,semsec ss
	where s.usn=c.usn and ss.ssid=c.ssid
	group by ss.sem,ss.sec,gen;

SEM        SEC        GEN          COUNT(*)
---------- ---------- ---------- ----------
1          A          M                   1
4          C          M                   3
7          B          F                   1
7          B          M                   1


3.
	create view Test1M as
	select test1 from iamarks where
	usn='2KL16CS006';
  
   TEST1
----------
        19
        15

4.	
	

CREATE OR REPLACE PROCEDURE AVGMARKS
IS
CURSOR C_IAMARKS IS
	SELECT GREATEST(TEST1,TEST2)AS A,GREATEST(TEST1,TEST3) AS B,GREATEST(TEST3,TEST2)AS C
	FROM IAMARKS
	WHERE FINALIA IS NULL
	FOR UPDATE;
	C_A INT;
	C_B INT;
	C_C INT;
	C_SM INT;
	C_AV INT;
BEGIN
	OPEN C_IAMARKS;
	LOOP
		FETCH C_IAMARKS INTO C_A,C_B,C_C;
		EXIT WHEN C_IAMARKS %NOTFOUND;
		IF(C_A!=C_B)THEN
			C_SM:=C_A+C_B;
		ELSE
			C_SM:=C_A+C_C;
		END IF;
		C_AV:=C_SM/2;
		UPDATE IAMARKS SET FINALIA=C_AV WHERE CURRENT OF C_IAMARKS;
	END LOOP;
	CLOSE C_IAMARKS;
	END;
	/
	
	
Begin
avgmarks;
End;
/


select * from iamarks;
USN        SUBCODE    SSID            TEST1      TEST2      TEST3    FINALIA
---------- ---------- ---------- ---------- ---------- ---------- ----------
2KL16CS002 10CS82     MEC                12         19         14         17
2KL16CS004 10CS84     CHM                20         16         19         20
2KL16CS005 10CS85     CSE2               15         15         12         15
2KL16CS006 10CS71     CS4                19         18         20         20
2KL16CS006 10CS81     CS4                15         13         26         21


5.
	SELECT S.USN,SNAME,'OUTSTANDING'
	FROM STUDENT S,SEMSEC SS,IAMARKS IA
	WHERE S.USN=IA.USN AND SS.SSID=IA.SSID AND SS.SEM=8 AND
	FINALIA BETWEEN 17 AND 20
	UNION
	SELECT S.USN,SNAME,'AVG'
	FROM STUDENT S,SEMSEC SS,IAMARKS IA
	WHERE S.USN=IA.USN AND SS.SSID=IA.SSID AND
	FINALIA BETWEEN 12 AND 16
	UNION
	SELECT S.USN,SNAME,'WEAK'
	FROM STUDENT S,SEMSEC SS,IAMARKS IA
	WHERE S.USN=IA.USN AND SS.SSID=IA.SSID AND
	FINALIA<12;
	

USN        SNAME                'OUTSTANDIN
---------- -------------------- -----------
2KL16CS005 ANJALI               AVG

*********************************************************************************************************************************
30/10/2018
Termwork 5

Creating tables :

1.
create table dept (
		dno int,
		dname varchar(10),
		mgrssn varchar(10),
		mgrstartdate  date,
	primary key(dno));

2.
create table emp (
		ssn varchar(10),
		name varchar(10),
		addr varchar(10),
		sex varchar(10),
		sal int,
		superssn varchar(10),
		dno int,
	primary key(ssn),
	foreign key(superssn) references emp(ssn),
	foreign key(dno) references dept(dno));

alter table dept add foreign key(mgrssn) references emp(ssn);

3.
create table dloc(	dno int,
		dlocation varchar(10),
		primary key(dno),
		foreign key(dno) references dept(dno));

4.
create table pro(
		pno varchar(10),
		pname varchar(10),
		ploc varchar(10),
		dno int,
		primary key(pno),
		foreign key(dno) references dept(dno));
5.
create table won(
		ssn varchar(10),
		pno varchar(10),
		hours int,
		primary key(ssn,pno),
		foreign key(ssn) references emp(ssn),
		foreign key(pno) references pro(pno));

***************************************
inserting values


1.dept
 
	insert into dept(dno,dname,mgrstartdate) values('&dno','&dname','&mgrstartdate');

	select * from dept;
	
  DNO DNAME      MGRSSN     MGRSTARTD
	-------------- ---------- ---------
    1 research 	  111        10-AUG-12
    2 account   	 222        10-AUG-10
    3 ai        		 333        15-APR-12
    4 networks   	111        18-MAY-14
    5 bigdata  	  666        21-JAN-10

 update dept set mgrssn='666' where dno=5; and so on

2.emp
	

	insert into emp values ('&ssn','&name','&addr','&sex','&sal','&superssn','&dno');
SSN        NAME       ADDR       SEX               SAL SUPERSSN          DNO
---------- ---------- ---------- ---------- ---------- ---------- ----------
111        raj             blr        m              700000     111                1
222        rashmi     mys        f              400000     111               2
333        ragavi     tum        f              800000                     3
444        rajesh     tum        m              650000     333              3
555        raveesh    blr        m              500000     333                3
666        scott        eng        m              700000     444              5
777        niganth    gub        m              200000     222              2
888        ramya      gub        f              400000     222                 3
999        vidya      tum        f              650000     333                3
100        geetha     tum        f              800000                     3 

3.
	insert into dloc values('&dno','&dlocation');

select * from dloc;
    DNO DLOCATION
------- ----------
      1 mys
      2 blr
      3 gub
      4 tum
      5 eng

4.
	INSERT INTO PRO VALUES('&PNO','&PNAME','&PLOC',&DNO); 
	select * from pro;

PNO        PNAME      PLOC              DNO
---------- ---------- ---------- ----------
11        	 iot        gub                 3
22         	text2sp    gub                 3
33         	ipsecure   tum                 4
44        	 traffic    blr                 5
55         	cloud      tum                 1

5.
	insert into won values('&ssn','&pno',&hours);
SSN        PNO             HOURS
---------- ---------- ----------
666        33                  4
666        11                  2
111        22                  3
555        22                  2
333        11                  4
444        11                  6
222        11                  2


queries :


1.
	(SELECT DISTINCT PNO
FROM PRO P, DEPT D,
EMP E WHERE P.DNO=D.DNO AND
SSN=MGRSSN AND
e.NAME like 'sc%')
UNION
(SELECT DISTINCT P.PNO
FROM PRO P, WON W,
EMP E WHERE P.PNO=W.PNO AND
W.SSN=E.SSN AND
e.NAME like 'sc%');

PNO
----------
11
33
44

2.
	select e.ssn,(sal+sal*0.1) as newsal
	from emp e,won w,pro p
	where e.ssn=w.ssn and w.pno=p.pno
	and pname='iot';
SSN            NEWSAL
---------- ----------
666            770000
333            880000
444            715000
222            440000

3.
	SELECT SUM(SAL), MAX(SAL), MIN(SAL),
AVG(SAL) FROM EMP E, DEPT D
WHERE DNAME='ACCOUNTS' AND
D.DNO=E.DNO;

4.
	select * from emp e
	where not exists((select pno from pro p where dno=5 ) minus ( select pno from won w where e.ssn=w.ssn));
SSN        NAME       ADDR       SEX               SAL SUPERSSN          DNO
666        scott        eng        m              700000     444              5
5.
	SELECT DNO,COUNT(SSN)
FROM EMP
WHERE SAL>600000 AND DNO
IN(SELECT DNO
FROM EMP
GROUP BY DNO
HAVING COUNT(SSN)>5)
GROUP BY DNO ;


      DNO COUNT(SSN)
---------- ----------
         3          4
					    
					    
