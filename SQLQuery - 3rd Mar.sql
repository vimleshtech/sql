select * from #users 

/*
-Temp Table 
	#			:  for current session 
	##			:  global 
-Table Variable
-Procredure and it's parameter 

*/

create table #users
(
id int identity(1,1),
email varchar(30),
pwd  varchar(30)
)


select * from #users

insert into #users 
values('abcd@gmail.com','aa')


drop table #users 

create table ##users
(
id int identity(1,1),
email varchar(30),
pwd  varchar(30)
)

select * From ##users

insert into ##users 
values('abcd@gmail.com','aa')


-- table variable 
declare @users as table 
	(
	id int identity(1,1),
	email varchar(100),
	pwd varchar(30)
	)

insert into @users 
values('abcd@gmail.com','aa')


select * from @users 

/*
Procedure : is precompiled sql statement or code which can use/call from anywhere 
	create proc procname
	create procedure  procname 
	

	-- to execute
	procname 
	exe procname
	execute procname 

*/

use test 

--no argument 
create proc get_data
as
begin
		
			select * from people 
			--select * From orders 
						 


end

--
select * from orders 
 
create proc get_data_with_condition
(
@reg  varchar(20) 
)
as
begin
		
			select * from people 
			where region = @reg 
			--select * From orders 
						 


end




select * From sys.objects where type='p'

-- execute 
get_data


exec get_data

execute get_data
---
get_data_with_condition 'east'

get_data_with_condition 'west'

get_data_with_condition 'west'





