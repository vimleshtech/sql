
select * from employee 
select * from salary 


--inner join 
select e.EID,e.fname,e.lname,s.BASIC,s.DA,s.HRA  --3
from employee  as e inner join salary as s   --1
	on e.eid = s.eid						 --2


select e.EID,e.fname,e.lname,s.BASIC,s.DA,s.HRA  --3
from employee  as e join salary as s   --1
	on e.eid = s.eid						 --2


select e.EID,e.fname,e.lname,s.BASIC,s.DA,s.HRA  --3
from employee  as e join salary as s   --1
	on e.eid = s.eid						 --2
	  and s.basic > 20000

--outer join

select e.EID,e.fname,e.lname,s.BASIC,s.DA,s.HRA  --3
from employee  as e full outer join salary as s   --1
	on e.eid = s.eid						 --2
	  and s.basic > 20000

--left join

select e.EID,e.fname,e.lname,s.BASIC,s.DA,s.HRA  --3
from employee  as e left  join salary as s   --1
	on e.eid = s.eid						 --2
	  and s.basic > 20000


--right join


select e.EID,e.fname,e.lname,s.BASIC,s.DA,s.HRA  --3
from employee  as e right  join salary as s   --1
	on e.eid = s.eid						 --2


select e.EID,e.fname,e.lname,s.BASIC,s.DA,s.HRA.d.name  --3
from employee  as e inner  join salary as s   --1
			on e.eid = s.eid						 --2
	inner join department as d 
			on e.did = d.id 



--store in new table
select e.EID,e.fname,e.lname,s.BASIC,s.DA,s.HRA  
into output_tbl
from employee  as e left  join salary as s   --1
	on e.eid = s.eid						 --2
	  and s.basic > 20000

select * from output_tbl

-----------------
update test 
set reg_no = id+100 
where status='y'

--------------------
update test 
set found_status='completed',found_date=getdate()
where img_1 is not null  and 
img_2 is not null and
img_3 is not null and
img_4 is not null 


update test 
set found_status='in-completed',found_date=getdate()
where found_status !='completed'


--Q.WAS to copy one table to anoter new table 
select * into new_tble from old_table 
 --create new table : into new_tble

--Q. WAS to copy name,dob,age from one table to another existing table
insert into new_table(name,dob,age) select name,dob,age from old_table 

--Q.WAS to exchange data between two columns
/*
tbl:
A  B
------
a1 b1
a2 b2

out:
A   B
b1  a1
b2  a2

*/
update tbl 
set A = B, B=A

/*ANSWER THE FOLLOWING QUESTIONS 
old_table
-------
id name 
1   raman
2  jatin 
*/
select * from old_table where 1 =1 -- output : will all data
select * from old_table where 100 =100 -- output : will all data
select * from old_table where 1 =2   --no data print 



/* append three columns and show full name 
old_table
id  fname  mname lname  email 
1   raman  null  sinha ....
2   jatin  kumar sharma ...
3   rahul null   null

out:
1   null 
2  jatin kuamr sharma
3  null

value + null = null
*/
select id, fname+mname+lname from old_table
select id, fname +isnull(mname,'')+isnull(lname,'') from old_table

/*WAS to show list of managers whose direct reportee is at least 3  
old_table
id  fname  mname lname  email		mgr_id		sal 
1   raman  null  sinha ....			null				
2   jatin  kumar sharma ...			1
3   rahul null   null				1		
4   jatin  kumar sharma ...			2
5   jatin  kumar sharma ...			2
6   jatin  kumar sharma ...			3
8   jatin  kumar sharma ...			1
9   jatin  kumar sharma ...			1
20   jatin  kumar sharma ...		3
21   jatin  kumar sharma ...		3
22   jatin  kumar sharma ...		3

*/
select mgr_id,count(mgr_id) from old_table 
group by mgr_id 
having count(mgr_id)>=3

/*WAS to return/show details of empoloyee whose salary is 3rd highest */

select top 1 * from 
(
	select  top 3 * from old_name order by sal desc 
) t
order by sal asc 

--2+3*4 
--(2+3)*4 

/*
old_table
id  fname  mname lname  email		mgr_id  country  dept	sal 
1   raman  null  sinha ....			null	 india    it			
2   jatin  kumar sharma ...			1		 us       it
3   rahul null   null				1		 india    hr 
4   jatin  kumar sharma ...			2		 india    fin
5   jatin  kumar sharma ...			2		 india    hr 
6   jatin  kumar sharma ...			3
8   jatin  kumar sharma ...			1
9   jatin  kumar sharma ...			1
20   jatin  kumar sharma ...		3
21   jatin  kumar sharma ...		3
22   jatin  kumar sharma ...		3

out:
was to show country and department wise head count and total cost 

*/
select country,dept, count(*), sum(sal)
from old_table 
group by country,dept
















