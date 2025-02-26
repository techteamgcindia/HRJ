USE [SYMPHONY_HRJ]
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_MTS_History_TILES]    Script Date: 4/18/2024 3:57:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Client_SP_MTS_History_TILES]    
AS    
BEGIN    
    
    
SELECT sl.stockLocationName    
      ,s.skuName 
	  ,spi.skuItemName as Division
	  ,sls.custom_txt3 as Business
	  ,u.uomName as UOM
     ,slsh.bufferSize    
   ,slsh.inventoryAtSite    
   ,slsh.inventoryAtTransit    
   ,slsh.inventoryAtProduction    
   ,case when slsh.bufferSize=0 and (slsh.inventoryAtSite + slsh.inventoryAtTransit+slsh.inventoryAtProduction)=0 then 'Green' else    
   case when slsh.bufferSize=0 and (slsh.inventoryAtSite + slsh.inventoryAtTransit+slsh.inventoryAtProduction)>0 then 'Cyan' else    
   case when slsh.bufferSize>0 and (slsh.inventoryAtSite + slsh.inventoryAtTransit+slsh.inventoryAtProduction)=0 then 'Black' else    
   case when slsh.bufferSize=(slsh.inventoryAtSite + slsh.inventoryAtTransit+slsh.inventoryAtProduction) then 'Green' else    
   case when slsh.bufferSize<(slsh.inventoryAtSite + slsh.inventoryAtTransit+slsh.inventoryAtProduction) then 'Cyan' else    
   case when slsh.bufferSize>0 and (slsh.inventoryAtSite + slsh.inventoryAtTransit+slsh.inventoryAtProduction)/slsh.bufferSize>1 then 'Cyan' else    
   case when slsh.bufferSize>0 and (slsh.inventoryAtSite + slsh.inventoryAtTransit+slsh.inventoryAtProduction)/slsh.bufferSize between 0.6601 and 1 then 'Green' else    
   case when slsh.bufferSize>0 and (slsh.inventoryAtSite + slsh.inventoryAtTransit+slsh.inventoryAtProduction)/slsh.bufferSize between 0.3301 and 0.66 then 'Yellow' else    
   case when slsh.bufferSize>0 and (slsh.inventoryAtSite + slsh.inventoryAtTransit+slsh.inventoryAtProduction)/slsh.bufferSize between 0.001 and 0.33 then 'Red'     
    end end end end end end end end end as [BP Colour]    
    ,slsh.updateDate    
      --,slsh.[consumption]      
  FROM [Symphony_StockLocationSkuHistory] slsh    
  join Symphony_StockLocations sl on sl.stockLocationID=slsh.stockLocationID    
  join Symphony_SKUs s on s.skuID=slsh.skuID    
  left join Symphony_StockLocationSkus sls on sls.stockLocationID=slsh.stockLocationID and sls.skuID=slsh.skuID    
  left join Symphony_SKUsPropertyItems spi on spi.skuItemID=sls.skuPropertyID1
  left join Symphony_UOM u on u.uomID=sls.uomID
  where slsh.updatedate>=convert(date, getdate()-90)   
  /*Condition added on 2019-08-08 by bharat*/  
  and slsh.bufferSize > 0  and s.skuID in (select distinct skuID  from Symphony_StockLocationSkus where custom_txt3='TILES' )
   -- commented SL by bharat on 2019-08-05
  --and sl.stockLocationName in ('2400','7410') --and s.skuName='U0004FUCOAL0405'    
  /*END - Condition added on 2019-08-05 by bharat*/ 
  order by slsh.updateDate    
      
  end 
GO
