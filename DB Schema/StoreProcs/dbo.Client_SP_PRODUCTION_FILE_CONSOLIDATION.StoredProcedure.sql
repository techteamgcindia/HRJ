USE [SYMPHONY_HRJ]
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_PRODUCTION_FILE_CONSOLIDATION]    Script Date: 4/18/2024 3:57:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_PRODUCTION_FILE_CONSOLIDATION]
AS
BEGIN


drop table Client_PRODUCTION_TEMP_1

create table Client_PRODUCTION_TEMP_1
(WorkID nvarchar(150),
Plant nvarchar(150),
Customer_Code nvarchar(150),
Customer_Name nvarchar(150),
SKU nvarchar(150),
SKU_Desc nvarchar(200),
Qty decimal(25,4),
Order_type nvarchar(150),
SO_Year nvarchar(10),
SO_Month nvarchar(10),
SO_Date nvarchar(10),
Due_Year nvarchar(10),
Due_Month nvarchar(10),
Due_Date nvarchar(10),
Net_Price nvarchar(100),
Year nvarchar(10),
Month nvarchar(10),
Day nvarchar(10),
DC nvarchar(20),
Vendor_Code nvarchar(150) null,
Vendor_Name nvarchar(150) null
)

/*
-----temporary addition jun'23----

bulk insert Client_PRODUCTION_TEMP_1
from 'E:\SymphonyData\InputFolder\PRODUCTION_10_2023_06_23.csv' --file name to be changed
WITH ( 
                   FIELDTERMINATOR = ',', 
                   ROWTERMINATOR = '\n', 
                   FIRSTROW = 2 

)


bulk insert Client_PRODUCTION_TEMP_1
from 'E:\SymphonyData\InputFolder\PRODUCTION_20_2023_06_23.csv' --file name to be changed
WITH ( 
                   FIELDTERMINATOR = ',', 
                   ROWTERMINATOR = '\n', 
                   FIRSTROW = 2 

)



bulk insert Client_PRODUCTION_TEMP_1
from 'E:\SymphonyData\InputFolder\PRODUCTION_25_2023_06_23.csv' --file name to be changed
WITH ( 
                   FIELDTERMINATOR = ',', 
                   ROWTERMINATOR = '\n', 
                   FIRSTROW = 2 

)


bulk insert Client_PRODUCTION_TEMP_1
from 'E:\SymphonyData\InputFolder\PRODUCTION_30_2023_06_23.csv' --file name to be changed
WITH ( 
                   FIELDTERMINATOR = ',', 
                   ROWTERMINATOR = '\n', 
                   FIRSTROW = 2 

)



bulk insert Client_PRODUCTION_TEMP_1
from 'E:\SymphonyData\InputFolder\PRODUCTION_40_2023_06_23.csv' --file name to be changed
WITH ( 
                   FIELDTERMINATOR = ',', 
                   ROWTERMINATOR = '\n', 
                   FIRSTROW = 2 

)



bulk insert Client_PRODUCTION_TEMP_1
from 'E:\SymphonyData\InputFolder\PRODUCTION_50_2023_06_23.csv' --file name to be changed
WITH ( 
                   FIELDTERMINATOR = ',', 
                   ROWTERMINATOR = '\n', 
                   FIRSTROW = 2 

)


bulk insert Client_PRODUCTION_TEMP_1
from 'E:\SymphonyData\InputFolder\PRODUCTION_80_2023_06_23.csv' --file name to be changed
WITH ( 
                   FIELDTERMINATOR = ',', 
                   ROWTERMINATOR = '\n', 
                   FIRSTROW = 2 

)






-----temporary addition jun'23----

 --remove start
*/

drop table allfilenames
drop table bulkact

CREATE TABLE allfilenames(WHICHPATH VARCHAR(500),WHICHFILE varchar(500))
CREATE TABLE bulkact(RAWDATA VARCHAR (max))
declare @filename varchar(500),
        @path     varchar(500),
        @sql      varchar(max),
        @cmd      varchar(5000)



--SET @path = '\\HRJPOWERBI\InputFolder\'
SET @path = 'E:\SymphonyData\InputFolder\'
--SET @cmd = 'dir E:\SymphonyData\InputFolder\*.csv /b'
SET @cmd = 'dir "'+@path+'" *.csv /b'
--print @cmd
INSERT INTO  ALLFILENAMES(WHICHFILE)
----EXEC xp_cmdShell @cmd
EXEC Master..xp_cmdShell @cmd
--UPDATE ALLFILENAMES SET WHICHPATH = @path where WHICHPATH is null

--set @cmd = 'powershell.exe (Get-Item -Path '+@path+'* -filter *.csv).name'
 
--INSERT INTO ALLFILENAMES(WHICHFILE) EXEC xp_cmdShell @cmd;
UPDATE ALLFILENAMES SET WHICHPATH = @path where WHICHPATH is null


--cursor loop
    declare c1 cursor for SELECT WHICHPATH,WHICHFILE FROM ALLFILENAMES where WHICHFILE like 'PRODUCTION%.csv%'
    open c1
    fetch next from c1 into @path,@filename
    While @@fetch_status <> -1
      begin
      --bulk insert won't take a variable name, so make a sql and execute it instead:
       set @sql = 'BULK INSERT Client_PRODUCTION_TEMP_1 FROM ''' + @path + @filename + ''' '
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



	--select * from Client_PRODUCTION_TEMP_1

	update sls set Due_Date=day(cast(SO_Year+'-'+SO_Month+'-'+SO_Date as datetime)+15)  
	from Client_PRODUCTION_TEMP_1 sls
	where ( due_year is null or (cast(SO_Year+'-'+SO_Month+'-'+SO_Date as datetime)=cast(Due_Year+'-'+Due_Month+'-'+Due_Date as datetime)))

	update sls set Due_Month=month(cast(SO_Year+'-'+SO_Month+'-'+SO_Date as datetime)+15)  
		from Client_PRODUCTION_TEMP_1 sls
	where ( due_year is null or (cast(SO_Year+'-'+SO_Month+'-'+SO_Date as datetime)=cast(Due_Year+'-'+Due_Month+'-'+Due_Date as datetime)))

	update sls set Due_Year=year(cast(SO_Year+'-'+SO_Month+'-'+SO_Date as datetime)+15)  
		from Client_PRODUCTION_TEMP_1 sls
	where ( due_year is null or (cast(SO_Year+'-'+SO_Month+'-'+SO_Date as datetime)=cast(Due_Year+'-'+Due_Month+'-'+Due_Date as datetime)))


	Declare @cmd2 varchar(1000);
set @cmd2 = 'sqlcmd -S "HRJPOWERBI" -d "SYMPHONY_HRJ" -Q "set nocount on; select * from Client_PRODUCTION_TEMP_1;" -o "E:\SymphonyData\InputFolder\ProductionZNew_%date:~-4,4%%date:~-10,2%%date:~-7,2%.csv" -s"," -W'
exec master.dbo.xp_cmdshell @cmd2

	end
GO
