truncate table Client_TRANSACTIONS_TEMP

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



SET @path = 'E:\SymphonyData\Dist_Sale\'
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
       set @sql = 'BULK INSERT Client_TRANSACTIONS_TEMP FROM ''' + @path + @filename + ''' '
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

--select * from Client_TRANSACTIONS_TEMP