USE [SYMPHONY_HRJ]
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_BATCH_INVENTORY_DIST]    Script Date: 4/18/2024 3:57:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_BATCH_INVENTORY_DIST]
AS
BEGIN

drop table Client_batchinv_dist

create table Client_batchinv_dist
(Year nvarchar(10),
Month nvarchar(10),
Day nvarchar(10),
SKU nvarchar(100),
SL nvarchar(100),
INV_Site nvarchar(100),
Batch nvarchar(100),
Distributor_Item_Name nvarchar(300),
)




drop table allfilenames
drop table bulkact

CREATE TABLE ALLFILENAMES(WHICHPATH VARCHAR(255),WHICHFILE varchar(255))
CREATE TABLE BULKACT(RAWDATA VARCHAR (8000))
declare @filename varchar(255),
        @path     varchar(255),
        @sql      varchar(8000),
        @cmd      varchar(1000)

		
SET @path = 'E:\SymphonyData\Batch\Distributor\'
SET @cmd = 'dir ' + @path + '*.csv /b'
INSERT INTO  ALLFILENAMES(WHICHFILE)
EXEC Master..xp_cmdShell @cmd
UPDATE ALLFILENAMES SET WHICHPATH = @path where WHICHPATH is null

--cursor loop
    declare c1 cursor for SELECT WHICHPATH,WHICHFILE FROM ALLFILENAMES where WHICHFILE like 'STATUS_BATCH%.csv%'
    open c1
    fetch next from c1 into @path,@filename
    While @@fetch_status <> -1
      begin
      --bulk insert won't take a variable name, so make a sql and execute it instead:
       set @sql = 'BULK INSERT Client_batchinv_dist FROM ''' + @path + @filename + ''' '
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



select
 #a.SKU
 ,#a.[Stock Location]
 ,case when #a.Inv_at_site_Qty<0 then 0 else #a.Inv_at_site_Qty end as [Inv_at_site_Qty]
 ,#a.[Batch Number]
 ,#a.[Distributor Item Name]
 ,#a.Year
 ,#a.Month
 ,#a.Day as [Date]
from (select sku as SKU
       ,sl as [Stock Location]
       ,cast (CASE WHEN CHARINDEX('-',INV_Site) > 0 THEN SUBSTRING(INV_Site,CHARINDEX('-',INV_Site),LEN(INV_Site)) + SUBSTRING(INV_Site,0,CHARINDEX('-',INV_Site))
                                                 ELSE INV_Site
                                                 END as decimal(20,3)) as Inv_at_site_Qty
	,batch as [Batch Number]
	,Distributor_Item_Name as [Distributor Item Name]
	
        ,YEAR
        ,MONTH
        ,DAY
	FROM Client_batchinv_dist)#a where #a.Inv_at_site_Qty>0

	end
GO
