USE [SYMPHONY_HRJ]
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_BATCH_INVENTORY]    Script Date: 4/18/2024 3:57:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_BATCH_INVENTORY]
AS
BEGIN

drop table Client_batchinv

create table Client_batchinv
(Year nvarchar(10),
Month nvarchar(10),
Day nvarchar(10),
SKU nvarchar(100),
SL nvarchar(100),
INV_Site nvarchar(100),
Batch nvarchar(100),
)


BULK INSERT Client_batchinv
FROM 'E:\SymphonyData\Batch\Status_Batch_inventory.csv'
WITH
(
FIRSTROW = 1,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
select
 #a.SKU
 ,#a.[Stock Location]
 ,case when #a.Inv_at_site_Qty<0 then 0 else #a.Inv_at_site_Qty end as [Inv_at_site_Qty]
 ,#a.[Batch Number]
 ,#a.Year
 ,#a.Month
 ,#a.Day as [Date]
from (select sku as SKU
       ,sl as [Stock Location]
       ,cast (CASE WHEN CHARINDEX('-',INV_Site) > 0 THEN SUBSTRING(INV_Site,CHARINDEX('-',INV_Site),LEN(INV_Site)) + SUBSTRING(INV_Site,0,CHARINDEX('-',INV_Site))
                                                 ELSE INV_Site
                                                 END as decimal(20,3)) as Inv_at_site_Qty
	,batch as [Batch Number]
	
        ,YEAR
        ,MONTH
        ,DAY
	FROM Client_batchinv)#a where #a.Inv_at_site_Qty>0

	end
GO
