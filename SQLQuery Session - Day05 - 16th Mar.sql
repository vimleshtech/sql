/*
Case when/Case statement : is decision makign statement 
Having : can be used only with group by , filter the rows after summarizing the data
Keyword: Top, Distinct 
Constraints & Integrity
Primary key
Foreign key
Unique 
Not null
Null
Default
Check
Identity column
Composite key
*/

use hrms 
select * from employee
--case when 
select 
	eid,
	fname,
	lname,
	gender,
	case when gender ='female'
		 then 
				'f'
		 else  
				'm'
	end as abb_gender
from employee 

--tax example with case stateement
select fname,lname , slry,
	case when slry < 200000
		then 
			0
		else case when slry <300000
			then slry *.10 
			else slry *.20  				
		end						--(for every case there should be end)
		end as tax
from employee 


--Having : can be used only with group by , 
--filter the rows after summarizing(group by) the data
select * from employee

select STATUS_ID ,count(*)
from employee 
group by STATUS_ID 

--show those records where count is greater than 2 

select STATUS_ID ,count(*) --*  : count of rows 
from employee 
group by STATUS_ID 
having count(*) > 2


--Keyword: Top, Distinct 
--top : show given no of rows from top 
select * from employee 
select top 2 * from employee 
select top 4 * from employee   --show from top 

--show button three rows 
select top 3 * from employee 
order by eid desc 


--Distinct  : shwo unique value 
select distinct * from employee 
select distinct gender  from employee 
select distinct fname from employee 


--indentity column : auto incrementer 
create table customer
(
eid int identity(1,1) ,  --(1 - start from 1, 1 - increment by 1)
name varchar(100),
email varchar(40)
)

insert into customer(name,email) 
values('nitin','nitin@gmail.com')

insert into customer(name,email) 
values('rahul','rahult@gmail.com')

select * from customer 

/*
Constraints & Integrity: is properties of column/attribute which can be used for data validation purpose
There are following types of constraints:
-primary key : -unique value/no duplicate,
			   -not allow null
			   -physically sorted 
-foreign key  : referetial value from one table to another table 
			   -can by null 
			   -can contains duplicate value
			   -will allow referential value only 
-unique			: -allow only unique value
				  -one null 
				  -no duplicate 
				  
-null			: allow null

-not null		: not allow null
				  			   
-default		: set sepecific value automatically when user will enter the data 
 			   
-check			: allow from given list 

			   			   
			    
*/
create table proudcts
(
pid int primary key,
panme  varchar(100) not null,
batno  varchar(30)  unique,
price   int   not null,
tax     int  null,
create_date   datetime  default getdate(),  --current date will store by default
status_id		int		check (status_id in (1,0))
)

insert into proudcts(pid,panme,batno,price,status_id)
values(2,'dove','HHH0011',30,1)


select * from proudcts



create table sales_order
(
oid int identity(1,1),
pid  int foreign key references proudcts(pid),
qty  int,
o_date   datetime default getdate()
)

insert into sales_order(pid,qty)
values(1,100)

select * from sales_order
