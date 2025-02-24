USE [SYMPHONY_HRJ]
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_Site_Stock_Summary]    Script Date: 4/18/2024 3:57:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_Site_Stock_Summary]
AS
BEGIN
  

SELECT sl.stockLocationName 
       ,sl.stockLocationDescription 
	  ,spi.skuItemName as Division  
       ,sls.custom_txt3 as Business  
        ,u.uomName as UOM  
		,slsh.updateDate      
		,count(*) as No_of_SKUs
        ,sum(case when slsh.buffersize>0 then 1 else 0 end) as No_of_buffer_SKUs
		,sum(sls.buffersize) as buffer_Size
		,sum(slsh.inventoryAtSite) as Inventory_at_Site
		,sum(slsh.inventoryAtTransit) as Inventory_at_Transit
		        --,slsh.[consumption]        
  FROM [Symphony_StockLocationSkuHistory] slsh      
  join Symphony_StockLocations sl on sl.stockLocationID=slsh.stockLocationID      
  --join Symphony_SKUs s on s.skuID=slsh.skuID      
  left join Symphony_StockLocationSkus sls on sls.stockLocationID=slsh.stockLocationID and sls.skuID=slsh.skuID      
  left join Symphony_SKUsPropertyItems spi on spi.skuItemID=sls.skuPropertyID1  
  left join Symphony_UOM u on u.uomID=sls.uomID  
  where slsh.updatedate>=convert(date, getdate()-30) and sl.stockLocationType in (5,3)   --and sl.stockLocationName='5135'
  group by sl.stockLocationName,slsh.updateDate,sl.stockLocationDescription ,sls.custom_txt3,u.uomName ,spi.skuItemName
  order by sl.stockLocationName,slsh.updateDate,sls.custom_txt3 desc

  
  

  end
GO
