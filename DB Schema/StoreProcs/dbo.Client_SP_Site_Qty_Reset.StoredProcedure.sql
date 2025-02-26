USE [SYMPHONY_HRJ]
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_Site_Qty_Reset]    Script Date: 4/18/2024 3:57:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_Site_Qty_Reset]
AS
BEGIN
  

  	
IF (OBJECT_ID('Client_STATUS_TEMP_RM') IS NOT NULL)
drop table Client_STATUS_TEMP_RM;

create table Client_STATUS_TEMP_RM
(SKU nvarchar(100),
Stock_Location nvarchar(100),

Year nvarchar(10),
Month nvarchar(10),
Date nvarchar(10),
INV_at_Site_Qty nvarchar(100),
Inv_at_Transit_qty nvarchar(100),

)

IF (OBJECT_ID('allfilenames') IS NOT NULL)
drop table allfilenames;

IF (OBJECT_ID('bulkact') IS NOT NULL)
drop table bulkact;

CREATE TABLE ALLFILENAMES(WHICHPATH VARCHAR(255),WHICHFILE varchar(255))
CREATE TABLE BULKACT(RAWDATA VARCHAR (8000))
declare @filename1 varchar(255),
        @path1     varchar(255),
        @sql1      varchar(8000),
        @cmd1      varchar(1000)



SET @path1 = 'E:\SymphonyData\InputFolder\'
SET @cmd1 = 'dir "' + @path1 + '" *.csv /b'
INSERT INTO  ALLFILENAMES(WHICHFILE)
EXEC Master..xp_cmdShell @cmd1
UPDATE ALLFILENAMES SET WHICHPATH = @path1 where WHICHPATH is null

--cursor loop
    declare c1 cursor for SELECT WHICHPATH,WHICHFILE FROM ALLFILENAMES where WHICHFILE like 'STATUS_site_RM%.csv%'
    open c1
    fetch next from c1 into @path1,@filename1
    While @@fetch_status <> -1
      begin
      --bulk insert won't take a variable name, so make a sql and execute it instead:
       set @sql1 = 'BULK INSERT Client_STATUS_TEMP_RM FROM ''' + @path1 + @filename1 + ''' '
           + '     WITH ( 
                   FIELDTERMINATOR = '','', 
                   ROWTERMINATOR = ''\n'', 
                   FIRSTROW = 1 
                ) '
    print @sql1
    exec (@sql1)

      fetch next from c1 into @path1,@filename1
      end
    close c1
    deallocate c1

	--select * from Client_Status_Temp_combined_n1
	
	Truncate table Client_Status_Temp_combined_n1
	insert into Client_Status_Temp_combined_n1
	--select * into Client_Status_Temp_combined_n1
	--from (
	select  SKU,Stock_Location,Year,Month,Date,cast(Inv_at_site_Qty as nvarchar) as Inv_at_Site_Qty,cast ('' as nvarchar) as Inv_at_Transit_qty from Client_Status_Temp_5
	union
	select  SKU,Stock_Location,Year,Month,Date,cast(INV_at_Site_Qty as nvarchar) as Inv_at_Site_Qty, cast ('' as nvarchar) as Inv_at_Transit_qty from Client_STATUS_TEMP_RM

	
	

	update sls set inventoryAtSite=0
 from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 
where sl.stockLocationName + '|' + sls.locationSkuName not in (select Stock_Location  + '|' + SKU from Client_Status_Temp_combined_n1)
and    sl.stockLocationName  in (select distinct stock_location from Client_Status_Temp_combined_n1) 

end
GO
