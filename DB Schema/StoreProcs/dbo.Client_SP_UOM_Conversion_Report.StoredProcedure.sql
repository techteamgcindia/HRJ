USE [SYMPHONY_HRJ]
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_UOM_Conversion_Report]    Script Date: 4/18/2024 3:57:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_UOM_Conversion_Report]
AS
BEGIN



select sl.stockLocationName as SL,osl.stockLocationName as Origin_Stock_Location   ,sl.stockLocationDescription as SL_Description,  sls.locationSkuName as SKU,
      sls.skuDescription,uom.uomName as UOM
       ,sls.custom_txt3 as Business,spi.skuItemName as Divison
       ,cast(bufferSize as decimal(10,0)) as Buffer_Size,cast(inventoryAtSite as decimal(10,0)) as Inv_Site,
	   cast(inventoryAtTransit as decimal(10,0)) as Inv_Transit ,cast(custom_num5 as decimal(10,0)) as Pack_Size,
      cast(inventoryAtTransit*custom_num5 as decimal(10,0))  as Rev_Inv_at_transit,
 cast(  case when bufferSize-(inventoryAtSite+(inventoryAtTransit*custom_num5)+inventoryAtProduction)>0 then
    bufferSize-(inventoryAtSite+(inventoryAtTransit*custom_num5)+inventoryAtProduction) else 0 end as decimal(10,0)) as Gap_qty 
	,convert(varchar,getdate(),103) as Date
	 from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID
left join Symphony_StockLocations osl on osl.stockLocationID=sls.stockLocationID
  left join Symphony_SKUsPropertyItems spi on spi.skuItemID=sls.skuPropertyID1 

  left join Symphony_UOM uom on uom.uomID=sls.uomID
  
 where custom_num5 is not null and bufferSize-(inventoryAtSite+(inventoryAtTransit*custom_num5)+inventoryAtProduction)>0

 end
GO
