USE [SYMPHONY_HRJ]
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_IPNR_STPO_for_IPNR_Morbi_3100_from_2500_2900]    Script Date: 4/18/2024 3:57:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_IPNR_STPO_for_IPNR_Morbi_3100_from_2500_2900]
AS
BEGIN


  SELECT  sl.stockLocationName as [Stock Location]       
    ,sl.stockLocationDescription as [Stock Location Description]     
	  ,sls.locationSkuName as SKU        
	 ,sls.custom_txt8 as [Parent Code]  
	 ,sls.skuDescription as [SKU Description]        
	 ,SLS.custom_txt3 [Business]  
	 ,spi.skuItemName [Division]  
	 ,spi1.skuItemName [Design]         
	 ,sl1.stockLocationName as [Supply_Plant]  
	 ,sl1.stockLocationDescription as [Supply_Plant_Description]         
	 ,sls.bufferSize  ,sls.inventoryAtSite as Site_Qty  
	 ,sls.inventoryAtTransit as Transit_Qty  
	 ,1-bpProduction as [BP%]  
	 ,case when productionColor=0 then 'Cyan' when productionColor=1 then 'Green' when productionColor=2 then 'yellow' when productionColor=3 then 'Red' when productionColor=4 then 'Black' end [BP Color]  
	 ,sls.inventoryNeeded as InventoryNeeded  
	 ,sls.replenishmentQuantity as ReplenishmentQty   
	 --,isnull(a.inveneed,0) as Depot_InventoryNeeded   
	 --,isnull(((sls.bufferSize+isnull(a.inveneed,0)+sls.saftyStock)-(sls.inventoryAtSite+sls.inventoryAtTransit+sls.inventoryAtProduction)),0) as Total_Gap  
	 FROM [SYMPHONY_HRJ].[dbo].[Symphony_StockLocationSkus] sls   
	 join Symphony_StockLocations sl on sls.stockLocationID=sl.stockLocationID   
	 join Symphony_StockLocations sl1 on sls.originStockLocation=sl1.stockLocationID    
	 left join Symphony_SKUsPropertyItems spi on spi.skuItemID=sls.skuPropertyID1   
	 left join Symphony_SKUsPropertyItems spi1 on spi1.skuItemID=sls.skuPropertyID6      
	/* left join  (SELECT sl1.stockLocationName as [Stock Location]  ,slss.locationSkuName ,sum(case when slss.inventoryNeeded>=slss.minimumReplenishment 
	 then slss.inventoryNeeded else 0 end) as inveneed     
	 FROM [SYMPHONY_HRJ].[dbo].[Symphony_StockLocationSkus] slss   
	 join Symphony_StockLocations sl on slss.stockLocationID=sl.stockLocationID  
	 join Symphony_StockLocations sl1 on slss.originStockLocation=sl1.stockLocationID 
	 join Symphony_SKUs ss on slss.skuid=ss.skuID where /*sls.inventoryNeeded-sls.replenishmentQuantity>0 and */ sl.stockLocationName<>'4750' 
	 and  slss.avoidReplenishment=0 and slss.bufferSize>0 group by sl1.stockLocationName,slss.locationSkuName)a on a.[Stock Location]=sl.stockLocationName 
	 and a.locationSkuName=sls.locationSkuName  */
	  where sls.inventoryNeeded>0 
	  and sls.bufferSize>0 and sls.custom_txt3 like 'IPNR%'  and SLS.isDeleted = 0 --and sl.stockLocationType=5 
	  and sl.isDeleted=0  and sls.avoidReplenishment=0 and sl.stockLocationName='3100'
	  and spi.skuItemName='IPNR FG'
	 and sl1.stockLocationName in ('2500','2900')

	 END
GO
