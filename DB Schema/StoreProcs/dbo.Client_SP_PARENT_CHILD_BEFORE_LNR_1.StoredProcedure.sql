USE [SYMPHONY_HRJ]
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_PARENT_CHILD_BEFORE_LNR_1]    Script Date: 4/18/2024 3:57:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_PARENT_CHILD_BEFORE_LNR_1]
AS
BEGIN


drop table Client_Parent_child

create table Client_Parent_child
(Parent nvarchar(100),
Child nvarchar(100),
Priority int,
)

BULK INSERT Client_Parent_child
FROM 'E:\SymphonyData\Parent_Child_Scripts\Inputfile\Parent_child.csv'
WITH
(
FIRSTROW = 2, --ignores first row (header row)
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)



drop table Client_STATUS_TEMP

create table Client_STATUS_TEMP
(SKU nvarchar(100),
SL nvarchar(100),
Year nvarchar(10),
Month nvarchar(10),
Day nvarchar(10),
INV_Site decimal(20,4),
Inv_Transit decimal(20,4),
)

/*
-----temporary addition jun'23----

bulk insert Client_STATUS_TEMP
from 'E:\SymphonyData\InputFolder\STATUS_TRANSIT_new_2023_06_23.csv' --file name to be changed
WITH ( 
                   FIELDTERMINATOR = ',', 
                   ROWTERMINATOR = '\n', 
                   FIRSTROW = 2 

)


bulk insert Client_STATUS_TEMP
from 'E:\SymphonyData\InputFolder\STATUS_TRAN_RM_2023_06_23.csv' --file name to be changed
WITH ( 
                   FIELDTERMINATOR = ',', 
                   ROWTERMINATOR = '\n', 
                   FIRSTROW = 2 

)


-----temporary addition jun'23----

--- select *  from Client_STATUS_TEMP



-- remove start
*/
drop table allfilenames
drop table bulkact

CREATE TABLE ALLFILENAMES(WHICHPATH VARCHAR(255),WHICHFILE varchar(255))
CREATE TABLE BULKACT(RAWDATA VARCHAR (8000))
declare @filename varchar(255),
        @path     varchar(255),
        @sql      varchar(8000),
        @cmd      varchar(1000)



SET @path = 'E:\SymphonyData\InputFolder\'
SET @cmd = 'dir ' + @path + '*.csv /b'
INSERT INTO  ALLFILENAMES(WHICHFILE)
EXEC Master..xp_cmdShell @cmd
UPDATE ALLFILENAMES SET WHICHPATH = @path where WHICHPATH is null

--cursor loop
    declare c1 cursor for SELECT WHICHPATH,WHICHFILE FROM ALLFILENAMES where WHICHFILE like 'Status_Tran%.csv%'
    open c1
    fetch next from c1 into @path,@filename
    While @@fetch_status <> -1
      begin
      --bulk insert won't take a variable name, so make a sql and execute it instead:
       set @sql = 'BULK INSERT Client_STATUS_TEMP FROM ''' + @path + @filename + ''' '
           + '     WITH ( 
                   FIELDTERMINATOR = '','', 
                   ROWTERMINATOR = ''\n'', 
                   FIRSTROW = 3 
                ) '
    print @sql
    exec (@sql)

      fetch next from c1 into @path,@filename
      end
    close c1
    deallocate c1
    
   
/*
drop table Client_STATUS_TEMP_1

select 
#a.parent as SKU,
#a.sl as SL,
DATEPART(year,getdate()) as [year],
DATEPART(MONTH,getdate()) as [Month], 
DATEPART(DAY,getdate()) as [Day],
'' as Inv_site,
sum(#a.Inv_Transit) Inv_Transit

into Client_STATUS_TEMP_1

from 
(select st.SL,
       sb.Parent,
	    SUM(st.Inv_Transit) as Inv_Transit
from Client_Status_temp st 
right join Client_Parent_child sb on st.sku=SB.child
group by sl,Parent

union

select st.SL,
       st.SKU,
	     0 as Inv_transit
from Client_Status_temp st 
right join Client_Parent_child sb on st.sku=SB.child
group by sl,st.SKU) #a where #a.SL is not null
group by #a.sl,#a.parent order by #a.SL
*/

Declare @cmd3 varchar(1000);
set @cmd3 = 'sqlcmd -i E:\SymphonyData\Parent_Child_Scripts\New_Status_tran_1.sql'
exec master.dbo.xp_cmdshell @cmd3


	Declare @cmd2 varchar(1000);
set @cmd2 = 'sqlcmd -S "HRJPOWERBI" -d "SYMPHONY_HRJ" -Q "set nocount on; select * from Client_Status_Temp_1;" -o "E:\SymphonyData\InputFolder\Status_ZTransit_new_RM_FG%date:~-4,4%%date:~-10,2%%date:~-7,2%.csv" -s"," -W'
exec master.dbo.xp_cmdshell @cmd2


end
GO
