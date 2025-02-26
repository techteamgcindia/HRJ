USE [SYMPHONY_HRJ]
GO
/****** Object:  StoredProcedure [dbo].[Client_ProcessDataForVendorEmail]    Script Date: 4/18/2024 3:57:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--select top 1 * from Dealer_wise_Data 
--exec Client_ProcessDataForVendorEmail
CREATE proc [dbo].[Client_ProcessDataForVendorEmail]
as
begin


/*
create table Client_VendorEmailTable
(
DealerCode nvarchar(200)
,CustomerName nvarchar(200)
,Filename nvarchar(200)
,ReportDate datetime
,ind01 int default 0
)

select * from Client_VendorEmailTable
*/

truncate table Client_VendorEmailTable

insert into Client_VendorEmailTable
select distinct [Dealer code],	Customer_Name,'',getdate(), 0 as 'ind01' from Dealer_wise_Data

declare @var_DealerCount int,@var_DealerCode nvarchar(100),@var_filedate nvarchar(10)

set @var_DealerCount=(select isnull(count(*),0) from Client_VendorEmailTable)

set @var_filedate=(select top 1 replace(convert(nvarchar(10),reportdate,102),'.','_') from Client_VendorEmailTable)

while @var_DealerCount<>0
begin
set @var_DealerCode=(select top 1 dealercode from Client_VendorEmailTable where ind01=0)

truncate table HRJ_EmailData_Send

insert into HRJ_EmailData_Send  
values('Region'
,'Dealercode'
,'Customer_Name'
,'HRJSKUcode'
,'HRJParentSKUcode'
,'HRJSKUDescription'
,'Dealer_SKUDescription'
,'Division'
,'bufferSize'
,'inventoryAtSite'
,'InventoryAtTransit'
,'SuggestedReplenishmentQty'
,'SuggestedReplenishmentQty_in_M2'
,'Parent_code_SiteColor'
,'Parent_code_TransitColor'

)


insert into HRJ_EmailData_Send 
select *  from Dealer_wise_Data where [Dealer code]=@var_DealerCode


begin

declare @OutputFile nvarchar(100), @FilePath NVARCHAR(100) ,@bcpCommand NVARCHAR(1000) 

SET @bcpCommand = 'bcp "SELECT * FROM [Symphony_HRJ].[dbo].[HRJ_EmailData_Send]"  queryout ' 

SET @FilePath = '"E:\AutoEmail\'

SELECT @OutputFile='Dealer_Replenishment_'+@var_DealerCode+'_'+@var_filedate +'.CSV"' FROM [SYMPHONY_HRJ].[dbo].[HRJ_EmailData_Send]
                 
SET @bcpCommand = @bcpCommand + @FilePath + @OutputFile + ' -T -t"," -S "LOCALHOST" -c'                  
print @bcpcommand                
EXEC master..xp_cmdshell @bcpCommand , no_output

/*
update Client_VendorEmailTable set filename='Dealer_Replenishment_'+@var_DealerCode+'_'+@var_filedate +'.CSV' where DealerCode=@var_DealerCode */
update Client_VendorEmailTable set filename='Dealer_Replenishment_'+@var_DealerCode+'_'+@var_filedate  where DealerCode=@var_DealerCode
end

update Client_VendorEmailTable set ind01=1 where DealerCode=@var_DealerCode
set @var_DealerCount=@var_DealerCount-1
end

/*CSV Generation is completed*/

end





GO
