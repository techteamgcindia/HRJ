USE [SYMPHONY_HRJ]
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_MTA_MTO_combine_Report_IPNR]    Script Date: 4/18/2024 3:57:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_MTA_MTO_combine_Report_IPNR]
AS
BEGIN

drop table client_temp_WO_detail
SELECT 
      wo.[stockLocationName] as Client_SL
	  ,substring (sl.stockLocationName,1, len(sl.stockLocationName)-1) as Plant
      	  ,s.skuName
	  ,isnull(slls.Parent_code,s.skuName) as Parent_code
       ,[quantity]
      ,[bufferColor]
	  ,wo.woid
     into client_temp_WO_detail
  FROM [SYMPHONY_HRJ].[dbo].[Symphony_WorkOrders] wo
  left join Symphony_StockLocations sl on sl.stockLocationID=wo.plantID
  left join Symphony_SKUs s on s.skuID=wo.skuID
  left join  (select ssl.stockLocationName as SL,ssls.locationSkuName as sku,ssls.custom_txt8 as Parent_code from  Symphony_StockLocationSkus ssls 
  left join symphony_stocklocations ssl on ssl.stockLocationID=ssls.stockLocationID) slls on slls.SL=substring (sl.stockLocationName,1, len(sl.stockLocationName)-1) and slls.sku=s.skuName



SELECT  sl.stockLocationName as [Stock Location]       
    ,sl.stockLocationDescription as [SL Description]     
	    ,sls.locationSkuName as SKU        
	 ,sls.custom_txt8 as [Parent Code]  
	 ,sls.skuDescription as [SKU Description] 
    ,SLS.custom_txt3 [Business]  
	 ,spi.skuItemName [Division]  
	 ,sls.bufferSize 
	  ,sls.inventoryAtSite as [Inventory at Site] 
	   ,case when sls.siteColor=0 then 'Cyan' when sls.siteColor=1 then 'Green' when sls.siteColor=2 then 'yellow' when sls.siteColor=3 then 'Red' when sls.siteColor=4 
	 then 'Black' end [BP Site Color]  
	   ,sls.inventoryAtTransit as [Inventory at Transit]
	  ,sls.inventoryAtProduction as [Inventory at Production]
	  ,sls.inventoryNeeded as InventoryNeeded 
	  ,sls.custom_num7 as [Unreserved Open Orders_Trade]
	  ,sls.custom_num8 as [Unreserved Open Orders_Projects]
	  ,sls.custom_num9 as [Unreserved Open Orders_Dealer Projects]
	  ,sls.custom_num7+sls.custom_num8+sls.custom_num9+sls.inventoryNeeded as [Total Production Requirement]
	  ,BR.Total_WO_Count as [Total Number of MTO orders]
	  ,BR.Total_WO_Qty as [MTO requirement qty for Total Orders]
	  ,BR.BR_WO_Count as [Number of MTO orders in Black & Red]
	  ,BR.BR_WO_Qty as [MTO requirement qty for orders in Black & Red]
	  
	 FROM [SYMPHONY_HRJ].[dbo].[Symphony_StockLocationSkus] sls   
	 join Symphony_StockLocations sl on sls.stockLocationID=sl.stockLocationID   
	 join Symphony_StockLocations sl1 on sls.originStockLocation=sl1.stockLocationID    
	 left join Symphony_SKUsPropertyItems spi on spi.skuItemID=sls.skuPropertyID1   
	 left join Symphony_SKUsPropertyItems spi1 on spi1.skuItemID=sls.skuPropertyID6 
	 left join Symphony_SKUsPropertyItems spi5 on spi5.skuItemID=sls.skuPropertyID5  
	 
	 left join (
	 
  select t1.Plant,t1.skuName,sum(t1.quantity) as Total_WO_Qty,count(t1.woid ) as Total_WO_Count,isnull(max( t2.Total_WO_BR),0 )as BR_WO_Count,isnull(max(t2.WO_Qty_BR ),0) as BR_WO_Qty from client_temp_WO_detail t1
   left join (select Plant,skuName,count(woid ) as Total_WO_BR,sum(quantity) as WO_Qty_BR from  client_temp_WO_detail where bufferColor in (3,4) group by Plant,skuName) t2  on t2.Plant=t1.Plant and t2.skuName=t1.skuName
   group by t1.Plant,t1.skuName) BR on BR.Plant=sl.stockLocationName  and BR.skuName=sls.locationSkuName

	  where 
	  sls.custom_txt3 like 'IPNR'  and SLS.isDeleted = 0 and sl.stockLocationType=5 
	  and sl.isDeleted=0  and sls.avoidReplenishment=0 
	  --and sl1.stockLocationName in ('106205' ) and sl.stockLocationName='6100' and sls.inventoryNeeded>0 and sls.bufferSize>0 and 
	  end
GO
