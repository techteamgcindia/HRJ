USE [SYMPHONY_HRJ]
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_Dealer_Replenishment_Regionwise]    Script Date: 4/18/2024 3:57:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_Dealer_Replenishment_Regionwise] @REGION NVARCHAR(100)
AS
BEGIN


  select 
  slpi4.slItemName as Region
  ,SL.stockLocationName as [Dealer code]
  ,sl.stockLocationDescription as Customer_Name


  , SLS.locationSkuName as [HRJ SKU code]
  ,sls.custom_txt8 as [HRJ Parent SKU code] 
 ,sls.skuDescription as [HRJ SKU Description]
 ,sls.custom_txt4 as [Dealer's SKU Description]
,SKUPI1.skuItemName [Division],
--,SLS.custom_txt3 [Business], SLS.custom_txt5 [Material Frieght Group],
SLS.bufferSize,
SLS.inventoryAtSite,  
SLS.InventoryAtTransit,
sls.inventoryNeeded as [Suggested Replenishment Qty]
,isnull(cast(SKUPI2.skuItemName as decimal(10,3))*sls.inventoryNeeded,0) as [Suggested Replenishment Qty in M2]
,Case WHEN SLS.siteColor =0 THEN 'Cyan' 
     WHEN SLS.SiteColor =1 then 'Green' 
WHEN SLS.SiteColor =2 then 'Yellow' 
WHEN SLS.SiteColor =3 then 'Red' 
WHEN SLS.SiteColor =4 then 'Black'  
END [Parent code SiteColor],
Case WHEN SLS.TransitColor =0 THEN 'Cyan' 
     WHEN SLS.TransitColor =1 then 'Green' 
WHEN SLS.TransitColor =2 then 'Yellow' 
WHEN SLS.TransitColor =3 then 'Red' 
WHEN SLS.TransitColor =4 then 'Black'  
END [Parent code TransitColor]

from Symphony_StockLocationSkus SLS
join Symphony_StockLocations SL on SL.stockLocationID = SLS.stockLocationID
left join Symphony_StockLocationPropertyItems slpi4 on slpi4.slItemID=sl.slPropertyID4
left join Symphony_StockLocationPropertyItems slpi1 on slpi1.slItemID=sl.slPropertyID1
left join Symphony_StockLocationPropertyItems slpi2 on slpi2.slItemID=sl.slPropertyID2
left join Symphony_StockLocationPropertyItems slpi5 on slpi5.slItemID=sl.slPropertyID5
Left JOIN Symphony_SkusPropertyItems SKUPI1 ON SLS.skuPropertyID1 = SKUPI1.skuItemID
Left JOIN Symphony_SkusPropertyItems SKUPI2 ON SLS.skuPropertyID2 = SKUPI2.skuItemID
Left JOIN Symphony_SkusPropertyItems SKUPI3 ON SLS.skuPropertyID3 = SKUPI3.skuItemID
Left JOIN Symphony_SkusPropertyItems SKUPI4 ON SLS.skuPropertyID4 = SKUPI4.skuItemID
Left join Symphony_Stocklocations OSL on OSL.stockLocationID = SLS.originStockLocation 
	

where SLS.isDeleted = 0 and sl.stockLocationType=3 and slpi4.slItemName= @REGION

END
GO
