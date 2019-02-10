select * from [dbo].[employee]

--delete all 
--delete from employee

--delete selected
delete from employee where emp_id =6

--proper case 
select emp_id, upper(left(fname,1))+ lower(right(fname, len(fname)-1))  from employee

--show list of employee with salary details when salary of employee with match with given employee

use hrms 

select * from salary 

select * from salary 
where basic = (select basic from salary where eid = 4)


use db_hrms
--wild card / like 
select * from employee
where fname like 'a%' --start with a

select * from employee
where fname like '%a'  --end with a

select * from employee
where fname like '%a%'  --contains a


select * from employee
where fname like 'a___'

select * from employee
where emailid like '%@gmail.com'


select * from employee
where fname like 'ra%'


--distinct : show distinct/unique rows 
select * from employee
select distinct * from employee
select distinct status from employee
select distinct gender from employee
select distinct status,gender from employee


--identity column : auto_incremeter 
-- indentity(start,incrementer)
create table customer(cid  int identity(10,1), name varchar(100))

alter table customer
add month_name varchar(100)


alter table customer
alter column month_name varchar(100) not null

alter table customer
alter column name varchar(100) not null


insert into customer values('divya')

select  * from customer 

update customer 
set month_name ='jan'



--create composite key
alter table customer
add constraint comp_key primary key(name,month_name)


insert into customer values('ayush','mar')

select * from customer 



--Mathematic Function
select power(2,3)
select sqrt(10)
select ROUND(113333.33322,2)

select Pi()

select Reverse('abcd')


---Type conversion function, and other
select 1+1

select 'a'+'b'

select 'a'+1

-- data converion 
select 'a'+ convert(varchar,1)

select * from customer
select cid, name, convert(varchar,cid)+name  from customer

select cid, name, left(convert(varchar,cid),1)+name  from customer

select cid, name , cast(cid as varchar)+name from customer 


select cid, name , cast(null as varchar)+name from customer 
select cid, name , convert(varchar,null)+name from customer 

select getdate()

select cid, name , convert(varchar,getdate(),101) from customer 


select  left( convert(varchar,ROUND(113333.33322,2)),9) 



select  left( convert(varchar,ROUND(113333.33322,2)),9) 

select  CHARINDEX('.', convert(varchar,ROUND(113333.33322,2)))

select left(convert(varchar,ROUND(113333.33322,2)), CHARINDEX('.', convert(varchar,ROUND(113333.33322,2))))



