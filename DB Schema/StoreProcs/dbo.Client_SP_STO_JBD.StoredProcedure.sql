USE [SYMPHONY_HRJ]
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_STO_JBD]    Script Date: 4/18/2024 3:57:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_STO_JBD]
AS
BEGIN
SELECT  sl1.stockLocationName as [Supplying Plant]
         ,sls.locationSkuName as Material
         	,sls.replenishmentQuantity
			,spi.skuItemName as Division
        ,CONVERT(VARCHAR(10), GETDATE(), 103) as [Delivery Date]
         ,sl.stockLocationName as [Plant]
	
 FROM [SYMPHONY_HRJ].[dbo].[Symphony_StockLocationSkus] sls
  join Symphony_StockLocations sl on sls.stockLocationID=sl.stockLocationID
  join Symphony_StockLocations sl1 on sls.originStockLocation=sl1.stockLocationID 
  left join Symphony_SKUsPropertyItems spi on spi.skuItemID=sls.skuPropertyID1
  left join Symphony_SKUsPropertyItems spi1 on spi1.skuItemID=sls.skuPropertyID6
where sls.inventoryNeeded>0 and sls.bufferSize>0 
 and SLS.isDeleted = 0 and sl.stockLocationType=5 and sl.isDeleted=0 and sls.custom_txt3='JBD' and sls.replenishmentQuantity>0    and
 sls.avoidReplenishment=0 and sl.stockLocationName not in ('7550','4750') and sl1.stockLocationName in 
 ('4200','5000','5135','5160','6100','6700','7550','8110','7000','7590','8900','7680') order by sl1.stockLocationName

 end
GO
