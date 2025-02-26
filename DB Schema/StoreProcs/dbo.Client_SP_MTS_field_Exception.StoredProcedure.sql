USE [SYMPHONY_HRJ]
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_MTS_field_Exception]    Script Date: 4/18/2024 3:57:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_MTS_field_Exception]
AS
BEGIN


select sl.stockLocationName as [Stock Location],sls.locationSkuName as SKU
   ,sls.skuDescription as [SKU Description],sls.skuPropertyID1 as Division,sls.custom_txt3 as Business,sls.originStockLocation as [Origin Stock Location],sls.custom_txt8 as [Parent code],
   sls.custom_txt10 as [HBT National],u.uomName as UOM
 from Symphony_StockLocationSkus sls
left join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID
left join Symphony_UOM u on u.uomID=sls.uomID
where (sls.skuPropertyID1 is null or sls.skuDescription is null or sls.skuDescription='' or 
sls.custom_txt3 is null or sls.custom_txt3='' or sls.originStockLocation='' or sls.originStockLocation is null
 or sls.custom_txt8 is null or sls.custom_txt8='' or sls.custom_txt10 is null or sls.custom_txt10='' or sls.uomID=1)
  and sls.inventoryAtSite+sls.inventoryAtTransit>0 

 end
 
GO
