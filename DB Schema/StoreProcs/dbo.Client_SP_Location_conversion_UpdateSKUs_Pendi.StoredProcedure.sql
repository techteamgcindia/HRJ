USE [SYMPHONY_HRJ]
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_Location_conversion_UpdateSKUs_Pendi]    Script Date: 4/18/2024 3:57:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_Location_conversion_UpdateSKUs_Pendi]
AS
BEGIN


IF (OBJECT_ID('Client_Parent_child_OSO') IS NOT NULL)
drop table Client_Parent_child_OSO

create table Client_Parent_child_OSO
(Parent nvarchar(100),
Child nvarchar(100),
Priority int,
)

BULK INSERT Client_Parent_child_OSO
FROM 'E:\SymphonyData\Parent_Child_Scripts\Inputfile\Parent_child.csv'
WITH
(
FIRSTROW = 2, --ignores first row (header row)
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)

IF (OBJECT_ID('Client_Temp_Location_Change') IS NOT NULL)
drop table Client_Temp_Location_Change

create table Client_Temp_Location_Change
(Actual_Location_in_Input_file nvarchar(100),
To_be_changed_Location nvarchar(100)
)

BULK INSERT Client_Temp_Location_Change
FROM 'E:\SymphonyData\Parent_Child_Scripts\Inputfile\Location_Change.csv'
WITH
(
FIRSTROW = 2, --ignores first row (header row)
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)


IF (OBJECT_ID('Client_Temp_UpdateSKUs_HRJ_Pendi_1') IS NOT NULL)
drop table Client_Temp_UpdateSKUs_HRJ_Pendi_1

create table Client_Temp_UpdateSKUs_HRJ_Pendi_1
(SL nvarchar(100),
SKU nvarchar(100),
Unreserved_Open_Orders_Trade nvarchar(100),
Unreserved_Open_Orders_Projects nvarchar(100),
Unreserved_Open_Orders_Dealer_Projects nvarchar(100),
)
/*
-----temporary addition jun'23----

bulk insert Client_Temp_UpdateSKUs_HRJ_Pendi_1
from 'E:\SymphonyData\InputFolder\UPDATESKUS_HRJ_Pendi_2023_06_23.csv' --file name to be changed
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
    declare c1 cursor for SELECT WHICHPATH,WHICHFILE FROM ALLFILENAMES where WHICHFILE like 'UPDATESKUS_HRJ_Pendi%.csv%'
    open c1
    fetch next from c1 into @path,@filename
    While @@fetch_status <> -1
      begin
      --bulk insert won't take a variable name, so make a sql and execute it instead:
       set @sql = 'BULK INSERT Client_Temp_UpdateSKUs_HRJ_Pendi_1 FROM ''' + @path + @filename + ''' '
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

	--*/ --rmoe ed
	IF (OBJECT_ID('Client_Temp_UpdateSKUs_HRJ_Pendi_2') IS NOT NULL)
drop table Client_Temp_UpdateSKUs_HRJ_Pendi_2;


select
 #a.[Stock_Location]
 ,#a.SKU
 ,#a.Unreserved_Open_Orders_Trade_Qty
 ,#a.Unreserved_Open_Orders_Projects_Qty
 ,#a.Unreserved_Open_Orders_Dealer_Projects_Qty
 --,case when #a.Unreserved_Open_Orders_Trade_Qty<0 then 0 else #a.Unreserved_Open_Orders_Trade_Qty end as [Unreserved_Open_Orders_Trade_Qty]
 --,case when #a.Unreserved_Open_Orders_Projects_Qty<0 then 0 else #a.Unreserved_Open_Orders_Projects_Qty end as [Unreserved_Open_Orders_Projects_Qty]
 --,case when #a.Unreserved_Open_Orders_Dealer_Projects_Qty<0 then 0 else #a.Unreserved_Open_Orders_Dealer_Projects_Qty end as [Unreserved_Open_Orders_Dealer_Projects_Qty]
 into Client_Temp_UpdateSKUs_HRJ_Pendi_2
from
(select  sl as [Stock_Location]
        ,sku as SKU
       ,sum(cast (CASE WHEN CHARINDEX('-',Unreserved_Open_Orders_Trade) > 0 THEN SUBSTRING(Unreserved_Open_Orders_Trade,CHARINDEX('-',Unreserved_Open_Orders_Trade),LEN(Unreserved_Open_Orders_Trade)) + SUBSTRING(Unreserved_Open_Orders_Trade,0,CHARINDEX('-',Unreserved_Open_Orders_Trade))
                                                 ELSE Unreserved_Open_Orders_Trade
                                                 END as decimal(20,3))) as Unreserved_Open_Orders_Trade_Qty
	  ,sum(cast (CASE WHEN CHARINDEX('-',Unreserved_Open_Orders_Projects) > 0 THEN SUBSTRING(Unreserved_Open_Orders_Projects,CHARINDEX('-',Unreserved_Open_Orders_Projects),LEN(Unreserved_Open_Orders_Projects)) + SUBSTRING(Unreserved_Open_Orders_Projects,0,CHARINDEX('-',Unreserved_Open_Orders_Projects))
                                                 ELSE Unreserved_Open_Orders_Projects
                                                 END as decimal(20,3))) as Unreserved_Open_Orders_Projects_Qty
     ,sum(cast (CASE WHEN CHARINDEX('-',Unreserved_Open_Orders_Dealer_Projects) > 0 THEN SUBSTRING(Unreserved_Open_Orders_Dealer_Projects,CHARINDEX('-',Unreserved_Open_Orders_Dealer_Projects),LEN(Unreserved_Open_Orders_Dealer_Projects)) + SUBSTRING(Unreserved_Open_Orders_Dealer_Projects,0,CHARINDEX('-',Unreserved_Open_Orders_Dealer_Projects))
                                                 ELSE Unreserved_Open_Orders_Dealer_Projects
                                                 END as decimal(20,3))) as Unreserved_Open_Orders_Dealer_Projects_Qty

	FROM Client_Temp_UpdateSKUs_HRJ_Pendi_1  group by SL,SKU)#a



	
update ctt set ctt.sku=ces.Parent
	from Client_Temp_UpdateSKUs_HRJ_Pendi_2 ctt
	join Client_Parent_child_OSO ces on ces.child = CTT.SKU

	update ctt set ctt.Stock_Location=ces.To_be_changed_Location
	from Client_Temp_UpdateSKUs_HRJ_Pendi_2 ctt 
	join Client_Temp_Location_Change ces on ces.Actual_Location_in_Input_file = CTT.Stock_Location
	
	
	IF (OBJECT_ID('Client_Temp_UpdateSKUs_HRJ_Pendi_3') IS NOT NULL)
drop table Client_Temp_UpdateSKUs_HRJ_Pendi_3

select * into Client_Temp_UpdateSKUs_HRJ_Pendi_3 from (

select Stock_Location as [Stock Location]
        ,SKU as [SKU]
        ,sum(Unreserved_Open_Orders_Trade_Qty) as [Unreserved Open Orders_Trade] 
       ,sum(Unreserved_Open_Orders_Projects_Qty) as [Unreserved Open Orders_Projects]
	   ,sum(Unreserved_Open_Orders_Dealer_Projects_Qty) as [Unreserved Open Orders_Dealer Projects]
	     from Client_Temp_UpdateSKUs_HRJ_Pendi_2 
		 group by Stock_Location,SKU )#efc

update sls set custom_num7=0 , custom_num8=0, custom_num9=0
 from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 
where 
sl.stockLocationName + '|' + sls.locationSkuName not in (select n.[Stock Location]  + '|' + n.SKU from Client_Temp_UpdateSKUs_HRJ_Pendi_3 n
left join Symphony_StockLocations sl on sl.stockLocationName=n.[Stock Location] where sl.stockLocationID between 0 and 1000 )
and    sl.stockLocationName  in (select distinct [Stock Location] from Client_Temp_UpdateSKUs_HRJ_Pendi_3) and sls.isDeleted=0 
and sls.stockLocationID between 0 and 1000

update sls set custom_num7=0 , custom_num8=0, custom_num9=0
 from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 
where 
sl.stockLocationName + '|' + sls.locationSkuName not in (select n.[Stock Location]  + '|' + n.SKU from Client_Temp_UpdateSKUs_HRJ_Pendi_3 n
left join Symphony_StockLocations sl on sl.stockLocationName=n.[Stock Location] where sl.stockLocationID between 1000 and 5000 )
and    sl.stockLocationName  in (select distinct [Stock Location] from Client_Temp_UpdateSKUs_HRJ_Pendi_3) and sls.isDeleted=0 
and sls.stockLocationID between 1000 and 5000

update sls set custom_num7=0 , custom_num8=0, custom_num9=0
 from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 
where 
sl.stockLocationName + '|' + sls.locationSkuName not in (select n.[Stock Location]  + '|' + n.SKU from Client_Temp_UpdateSKUs_HRJ_Pendi_3 n
left join Symphony_StockLocations sl on sl.stockLocationName=n.[Stock Location] where sl.stockLocationID > 5000 )
and    sl.stockLocationName  in (select distinct [Stock Location] from Client_Temp_UpdateSKUs_HRJ_Pendi_3) and sls.isDeleted=0 
and sls.stockLocationID > 5000
	
	Declare @cmd2 varchar(1000);
set @cmd2 = 'sqlcmd -S "HRJPOWERBI" -d "SYMPHONY_HRJ" -Q "set nocount on; select * from Client_Temp_UpdateSKUs_HRJ_Pendi_3;" -o "E:\SymphonyData\InputFolder\UPDATESKUS_ZRevised_HRJ_PendingSO_%date:~-4,4%%date:~-10,2%%date:~-7,2%.csv" -s"," -W'
exec master.dbo.xp_cmdshell @cmd2

end
GO
