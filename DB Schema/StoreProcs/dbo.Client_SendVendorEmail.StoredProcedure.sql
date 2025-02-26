USE [SYMPHONY_HRJ]
GO
/****** Object:  StoredProcedure [dbo].[Client_SendVendorEmail]    Script Date: 4/18/2024 3:57:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec Client_SendVendorEmail

 

CREATE proc [dbo].[Client_SendVendorEmail]
as
begin
delete from Client_VendorEmailTable where len(filename) < 10

declare @var_count int,@var_dealercode nvarchar(100),@var_filename nvarchar(100),@var_customername nvarchar(100)
declare @ReportDate nvarchar(10),@var_email nvarchar(100)

set @var_count=580

while @var_count<>0
begin
set @var_email=''
set @var_dealercode=(select top 1 dealercode from Client_VendorEmailTable where ind01=1 and convert(date,reportdate)=convert(date,getdate()))
set @var_email=(select slpi.slItemName from Symphony_StockLocations SL left join Symphony_StockLocationPropertyItems slpi
on sl.slpropertyid7=slpi.slItemID  where sl.stockLocationName=@var_dealercode and sl.slPropertyID7 is not null and 
slpi.slPropertyID = 'slpropertyid7')
set @var_filename=(select top 1 filename from Client_VendorEmailTable where DealerCode=@var_dealercode and ind01=1)
set @var_customername=(select top 1 CustomerName from Client_VendorEmailTable where DealerCode=@var_dealercode and ind01=1)
set @ReportDate=(convert(nvarchar(4),datepart(yyyy,getdate()))+'_'+ case when len(convert(nvarchar(2),datepart(mm,getdate())))=1 then ('0'+convert(nvarchar(2),datepart(mm,getdate()))) else convert(nvarchar(2),datepart(mm,getdate())) end +'_'+
case when len(convert(nvarchar(2),datepart(dd,getdate())))=1 then ('0'+convert(nvarchar(2),datepart(dd,getdate()))) else convert(nvarchar(2),datepart(dd,getdate())) end )

if len(@var_email) > 2
begin
 exec obp_HRJVendorDailyEmail @var_email,@var_customername,@var_dealercode,@var_filename,@ReportDate
end
print @var_dealercode
update Client_VendorEmailTable set ind01=2 where DealerCode=@var_dealercode
set @var_count=@var_count-1

if not exists(select * from Client_VendorEmailTable where ind01=1)
begin
set @var_count=0
end

end

end
GO
