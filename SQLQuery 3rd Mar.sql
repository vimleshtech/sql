--Q. was to refresh the stage table for last one hour sales data 

select top 2  * from [Person].[Person]
select top 2  * from  [Person].[PersonPhone]
select top 2  * from [Person].[PhoneNumberType]

select top 2 * from  [Sales].[Customer]
select  top 2 * from [Production].[Product]

select top 2 * from  [Sales].[SalesOrderDetail]


alter proc get_data 
as 
begin

		select p.FirstName,p.LastName,p.MiddleName,pp.PhoneNumber,pt.Name
		into #temp1 
		from [Person].[Person] as p inner join [Person].[PersonPhone] as pp
			on p.BusinessEntityId = pp.BusinessEntityId
			inner join [Person].[PhoneNumberType] pt
			on pp.phonenumberTypeId = pt.phonenumberTypeId


		select s.CarrierTrackingNumber,s.ModifiedDate,s.OrderQty,p.Name
		into #temp2
		from [Sales].[SalesOrderDetail] s inner join  [Production].[Product]  p
			on s.productid = p.productid 


		select name from #temp2
		union  
		select name from #temp1

end 


execute get_data 
