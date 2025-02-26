USE [SYMPHONY_HRJ]
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_NewStatus]    Script Date: 4/18/2024 3:57:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_NewStatus]
AS
BEGIN


IF (OBJECT_ID('Client_STATUS_TEMP_12') IS NOT NULL)
drop table Client_STATUS_TEMP_12;

create table Client_STATUS_TEMP_12
(SKU nvarchar(100),
SL nvarchar(100),
SLoc nvarchar(100),
Year nvarchar(10),
Month nvarchar(10),
Day nvarchar(10),
INV_Site nvarchar(100),
Inv_Transit nvarchar(100),

)
/*
-----temporary addition jun'23----
bulk insert Client_STATUS_TEMP_12
from 'E:\SymphonyData\InputFolder\Status_Site_2023_06_23.csv' --file name to be changed
WITH ( 
                   FIELDTERMINATOR = ',', 
                   ROWTERMINATOR = '\n', 
                   FIRSTROW = 2 

)
-----temporary addition jun'23----
*/
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



SET @path = 'E:\SymphonyData\InputFolder\'
SET @cmd = 'dir "' + @path + '" *.csv /b'
INSERT INTO  ALLFILENAMES(WHICHFILE)
EXEC Master..xp_cmdShell @cmd
UPDATE ALLFILENAMES SET WHICHPATH = @path where WHICHPATH is null

--cursor loop
    declare c1 cursor for SELECT WHICHPATH,WHICHFILE FROM ALLFILENAMES where WHICHFILE like 'STATUS_site_2%.csv%'
    open c1
    fetch next from c1 into @path,@filename
    While @@fetch_status <> -1
      begin
      --bulk insert won't take a variable name, so make a sql and execute it instead:
       set @sql = 'BULK INSERT Client_STATUS_TEMP_12 FROM ''' + @path + @filename + ''' '
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
	
	IF (OBJECT_ID('Client_STATUS_TEMP_5') IS NOT NULL)
drop table Client_STATUS_TEMP_5;


select
 #a.SKU
 ,#a.[Stock_Location]
 ,#a.Year
 ,#a.Month
 ,#a.Day as [Date]
 ,case when #a.Inv_at_site_Qty<0 then 0 else #a.Inv_at_site_Qty end as [Inv_at_site_Qty]
 ,0 as [Inv_at_transit_Qty]
 into Client_STATUS_TEMP_5
from
(select sku as SKU
       ,sl as [Stock_Location]
       ,sum(cast (CASE WHEN CHARINDEX('-',INV_Site) > 0 THEN SUBSTRING(INV_Site,CHARINDEX('-',INV_Site),LEN(INV_Site)) + SUBSTRING(INV_Site,0,CHARINDEX('-',INV_Site))
                                                 ELSE INV_Site
                                                 END as decimal(20,3))) as Inv_at_site_Qty
	
        ,YEAR
        ,MONTH
        ,DAY
	FROM Client_STATUS_TEMP_12  group by SKU,SL,YEAR,MONTH,DAY)#a




	Declare @cmd2 varchar(1000);
set @cmd2 = 'sqlcmd -S "HRJPOWERBI" -d "SYMPHONY_HRJ" -Q "set nocount on; select * from Client_Status_Temp_5;" -o "E:\SymphonyData\InputFolder\Status_New_Site_%date:~-4,4%%date:~-10,2%%date:~-7,2%.csv" -s"," -W'
exec master.dbo.xp_cmdshell @cmd2
	


	end
GO
