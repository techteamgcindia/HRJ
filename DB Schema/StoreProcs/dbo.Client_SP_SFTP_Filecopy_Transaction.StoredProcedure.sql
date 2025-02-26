USE [SYMPHONY_HRJ]
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_SFTP_Filecopy_Transaction]    Script Date: 4/18/2024 3:57:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_SFTP_Filecopy_Transaction] 
AS
BEGIN


IF (OBJECT_ID('Client_Trans_TEMP_Dist_ftp') IS NOT NULL)
drop table Client_Trans_TEMP_Dist_ftp;


create table Client_Trans_TEMP_Dist_ftp
(
TransID nvarchar(100),
SAP_validation nvarchar(100),
TransType nvarchar(10),
Origin nvarchar(100),
Destination nvarchar(100),
--AdjustInventory int,
SKUName nvarchar(100),
Quantity decimal(10,4),
Year nvarchar(10),
Month nvarchar(10),
Day nvarchar(10),
Doc_date nvarchar(100),
Doc_ref nvarchar(100),
movement nvarchar(100),
adjust nvarchar(100),

Dist_SKU nvarchar(200),
) 



IF (OBJECT_ID('allfilenames') IS NOT NULL)
drop table allfilenames;

IF (OBJECT_ID('bulkact') IS NOT NULL)
drop table bulkact;

CREATE TABLE ALLFILENAMES(WHICHPATH VARCHAR(255),WHICHFILE varchar(255))
CREATE TABLE BULKACT(RAWDATA VARCHAR (8000))
declare @filename varchar(255),
        @path     varchar(255),
        @sql      varchar(8000),
        @cmd      varchar(1000)



SET @path = 'E:\SymphonyData\SFTP_files\'
SET @cmd = 'dir "' + @path + '" *.csv /b'
INSERT INTO  ALLFILENAMES(WHICHFILE)
EXEC Master..xp_cmdShell @cmd
UPDATE ALLFILENAMES SET WHICHPATH = @path where WHICHPATH is null

--cursor loop
    declare c1 cursor for SELECT WHICHPATH,WHICHFILE FROM ALLFILENAMES where WHICHFILE like 'TRANSACTIONS%.csv%'
    open c1
    fetch next from c1 into @path,@filename
    While @@fetch_status <> -1
      begin
      --bulk insert won't take a variable name, so make a sql and execute it instead:
       set @sql = 'BULK INSERT Client_Trans_TEMP_Dist_ftp FROM ''' + @path + @filename + ''' '
           + '     WITH ( 
                   FIELDTERMINATOR = '','', 
                   ROWTERMINATOR = ''\n'', 
                   FIRSTROW = 2 
                ) '
    print @sql
    exec (@sql)

      fetch next from c1 into @path,@filename
      end
    close c1
    deallocate c1

	--select * from Client_Trans_TEMP_Dist_ftp

	IF (OBJECT_ID('Client_Trans_TEMP_Dist_ftpdata') IS NOT NULL)
drop table Client_Trans_TEMP_Dist_ftpdata;



select TransID,isnull(SAP_validation,'') as SAP_validation,TransType,Origin,Destination,SKUName,Quantity,DATEPART(year,getdate()) as [year],
DATEPART(MONTH,getdate()) as [Month],DATEPART(DAY,getdate()) as [Day],isnull(Doc_date,'') as Doc_date,Doc_ref,isnull(movement,'') as movement,isnull(adjust,'') as adjust 
into Client_Trans_TEMP_Dist_ftpdata 
from Client_Trans_TEMP_Dist_ftp

--select * from client_DIST_SALE_DATA
 --select * from Client_Trans_TEMP_Dist_ftp
insert into client_DIST_SALE_DATA select * from (
select origin,s.stockLocationDescription,Destination,SKUName,Dist_SKU,Quantity,Year,Month,day,'' as Division,'' as region, '' as Business  from Client_Trans_TEMP_Dist_ftp d
left join Symphony_StockLocations s on s.stockLocationName=d.Origin
where TransType='OUT' and Origin not like '1%')#edfg

update client_DIST_SALE_DATA
	set distributor_item_name=REPLACE(distributor_item_name,',','')

update d set Region=slpi4.slItemName
 from client_DIST_SALE_DATA d
 left join Symphony_StockLocations s on s.stockLocationName=d.Distributor_code
 left join Symphony_StockLocationPropertyItems slpi4 on slpi4.slItemID=s.slPropertyID4
 --where region is null

 update d set Division=sls1.desc1
 from client_DIST_SALE_DATA d
 left join (select s.locationSkuName, MAX(SKUPI1.skuItemName) as desc1  from Symphony_StockLocationSkus s
 Left JOIN Symphony_SkusPropertyItems SKUPI1 ON S.skuPropertyID1 = SKUPI1.skuItemID
 where s.isDeleted=0 group by s.locationSkuName) sls1 on sls1.locationSkuName=d.HRJ_SKU

 update d set Business=sls.desc1
 from client_DIST_SALE_DATA d
 left join (select s.locationSkuName, MAX(s.custom_txt3) as desc1  from Symphony_StockLocationSkus s
 where s.isDeleted=0 group by s.locationSkuName) sls on sls.locationSkuName=d.HRJ_SKU


Declare @cmd231 varchar(1000);
set @cmd231 = 'sqlcmd -S "HRJPOWERBI" -d "SYMPHONY_HRJ" -Q "set nocount on; select * from Client_Trans_TEMP_Dist_ftpdata;" -o "E:\SymphonyData\InputFolder\Transactions_Distributor_%date:~-4,4%%date:~-10,2%%date:~-7,2%.csv" -s"," -W'
exec master.dbo.xp_cmdshell @cmd231



end
GO
