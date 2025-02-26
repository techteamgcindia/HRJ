USE [SYMPHONY_HRJ]
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_Exception_Site_Cyan_Transit_exist]    Script Date: 4/18/2024 3:57:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_Exception_Site_Cyan_Transit_exist]
AS
BEGIN



select SL.StockLocationName,sl.stockLocationDescription, SLS.LocationSkuName as SKU,SLS.skuDescription, 
 SLS.bufferSize,SLS.inventoryAtSite,Case WHEN SLS.siteColor =0 THEN 'Cyan' END SiteColor,
 SLS.InventoryAtTransit


from Symphony_Stocklocationskus SLS
join Symphony_Stocklocations SL on SLS.stocklocationID = SL.stocklocationID
left JOIN Symphony_SkusPropertyItems SKUPI1 ON SLS.skuPropertyID1 = SKUPI1.skuItemID
left JOIN Symphony_SkusPropertyItems SKUPI2 ON SLS.skuPropertyID2 = SKUPI2.skuItemID
left JOIN Symphony_SkusPropertyItems SKUPI3 ON SLS.skuPropertyID3 = SKUPI3.skuItemID
left JOIN Symphony_SkusPropertyItems SKUPI4 ON SLS.skuPropertyID4 = SKUPI4.skuItemID

left JOIN Symphony_StockLocationPropertyItems SLPI1 ON SL.SLPropertyID1 = SLPI1.SLItemID
where SLS.siteColor=0 and SLS.inventoryAtTransit>0 and SLS.bufferSize>0 
/* and SKUPI1.skuItemName not in ('EB Accessories','EB Foot Wear') */
order by SLPI1.SLItemName, SL.StockLocationName, SLS.LocationSkuName

end
GO
