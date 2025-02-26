USE [SYMPHONY_HRJ]
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_DPLM]    Script Date: 4/18/2024 3:57:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_DPLM]
AS
BEGIN

update sls set sls.custom_txt2='T 0-90'
FROM Symphony_StockLocationSkus sls where sls.noConsumptionDays>90 and sls.custom_txt2 not like 'T 0-90'

update sls set sls.custom_txt2='T 0-90'
FROM Symphony_StockLocationSkus sls where sls.noConsumptionDays>90 and sls.custom_txt2 is null

update sls set sls.custom_txt2=null
FROM Symphony_StockLocationSkus sls where sls.noConsumptionDays<=90 --and sls.custom_txt2 like 'T 0-90' 

update [SYMPHONY_HRJ].[dbo].[Symphony_StockLocationSkus] set autoReplenishment=1 where autoReplenishment=0


update sls
set sls.custom_num4 = osls.inventoryAtSite 
FROM [SYMPHONY_HRJ].[dbo].[Symphony_StockLocationSkus] sls
JOIN [SYMPHONY_HRJ].[dbo].[Symphony_StockLocationSkus] osls on sls.originStockLocation=osls.stockLocationID AND SLS.locationSkuName=OSLS.locationSkuName
where sls.isdeleted = 0 and osls.isdeleted = 0

end
GO
