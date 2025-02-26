USE [SYMPHONY_HRJ]
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_SFTP_Filecopy_status]    Script Date: 4/18/2024 3:57:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_SFTP_Filecopy_status]
AS
BEGIN


IF (OBJECT_ID('Client_STATUS_TEMP_Dist_ftp') IS NOT NULL)
drop table Client_STATUS_TEMP_Dist_ftp;

create table Client_STATUS_TEMP_Dist_ftp
(SKU nvarchar(100),
SL nvarchar(100),
Year nvarchar(10),
Month nvarchar(10),
Day nvarchar(10),
INV_Site nvarchar(100),
Inv_Transit nvarchar(100),
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
    declare c1 cursor for SELECT WHICHPATH,WHICHFILE FROM ALLFILENAMES where WHICHFILE like 'STATUS_site%.csv%'
    open c1
    fetch next from c1 into @path,@filename
    While @@fetch_status <> -1
      begin
      --bulk insert won't take a variable name, so make a sql and execute it instead:
       set @sql = 'BULK INSERT Client_STATUS_TEMP_Dist_ftp FROM ''' + @path + @filename + ''' '
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


	IF (OBJECT_ID('Client_STATUS_Dist_ftp_t1') IS NOT NULL)
drop table Client_STATUS_Dist_ftp_t1;

	

	select SKU,sl,DATEPART(year,getdate()) as [year],
DATEPART(MONTH,getdate()) as [Month], 
DATEPART(DAY,getdate()) as [Day],INV_Site,'' as Inv_at_Transit  into Client_STATUS_Dist_ftp_t1 from Client_STATUS_TEMP_Dist_ftp


--select * from Client_STATUS_Dist_ftp_t1

	Declare @cmd23 varchar(1000);
set @cmd23 = 'sqlcmd -S "HRJPOWERBI" -d "SYMPHONY_HRJ" -Q "set nocount on; select * from Client_STATUS_Dist_ftp_t1;" -o "E:\SymphonyData\InputFolder\Status_Distributor_Site_%date:~-4,4%%date:~-10,2%%date:~-7,2%.csv" -s"," -W'
exec master.dbo.xp_cmdshell @cmd23



end
GO
