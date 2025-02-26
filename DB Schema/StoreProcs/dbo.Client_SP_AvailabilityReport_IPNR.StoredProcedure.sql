USE [SYMPHONY_HRJ]
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_AvailabilityReport_IPNR]    Script Date: 4/18/2024 3:57:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_AvailabilityReport_IPNR]
AS
BEGIN

select SL.stockLocationName, SLS.locationSkuName,sls.skuDescription, 
SKUPI1.skuItemName [Division]
,SLS.custom_txt3 [Business], SLS.custom_txt5 [Material Frieght Group],
SLS.bufferSize,
SLS.inventoryAtSite,  
SLS.InventoryAtTransit,
Case WHEN SLS.siteColor =0 THEN 'Cyan' 
     WHEN SLS.SiteColor =1 then 'Green' 
WHEN SLS.SiteColor =2 then 'Yellow' 
WHEN SLS.SiteColor =3 then 'Red' 
WHEN SLS.SiteColor =4 then 'Black'  
END [SiteColor],
Case WHEN SLS.TransitColor =0 THEN 'Cyan' 
     WHEN SLS.TransitColor =1 then 'Green' 
WHEN SLS.TransitColor =2 then 'Yellow' 
WHEN SLS.TransitColor =3 then 'Red' 
WHEN SLS.TransitColor =4 then 'Black'  
END [TransitColor],
RCONS.LastWeeksConsumption, RCONS.SiteStockoutDaysLastWeek, MCONS.Last30DaysConsumption, MCONS.SiteStockoutDaysLast30Days,
TMCONS.Last60DaysConsumption, TMCONS.SiteStockoutDaysLast60Days,
HMCONS.Last90DaysConsumption, HMCONS.SiteStockoutDaysLast90Days,
isnull(wavd.AvailableDaysLastWeek,0) as AvailableDaysLastWeek,
isnull(mavd.AvailableLast30Days,0) as AvailableLast30Days,
isnull(tmavd.AvailableLast60Days,0) as AvailableLast60Days,
isnull(Hmavd.AvailableLast90Days,0) as AvailableLast90Days,
OSL.StockLocationName [OriginWH],isnull(awh1.WHnewsiteStock,0) as [WH site Stock]
,isnull(ceiling(awh.LastWeekAverageWHsiteStock),0) as LastWeekAverageWHsiteStock,
FINW.firstInwarddate, datediff(day, FINW.firstInwarddate, getdate()+1) [DaysSinceFirstInward]
,sls.custom_txt10 as [National HBT]
,HMCONS.Last90DaysConsumption/nullif(Hmavd.AvailableLast90Days,0) as [ROS_90days]
from Symphony_StockLocationSkus SLS
join Symphony_StockLocations SL on SL.stockLocationID = SLS.stockLocationID
Left JOIN Symphony_SkusPropertyItems SKUPI1 ON SLS.skuPropertyID1 = SKUPI1.skuItemID
Left JOIN Symphony_SkusPropertyItems SKUPI2 ON SLS.skuPropertyID2 = SKUPI2.skuItemID
Left JOIN Symphony_SkusPropertyItems SKUPI3 ON SLS.skuPropertyID3 = SKUPI3.skuItemID
Left JOIN Symphony_SkusPropertyItems SKUPI4 ON SLS.skuPropertyID4 = SKUPI4.skuItemID
Left join Symphony_Stocklocations OSL on OSL.stockLocationID = SLS.originStockLocation 

join (select stocklocationID, skuID, min(updatedate) [firstInwarddate] from Symphony_StockLocationSkuhistory 
where totalIn>0 OR InventoryAtSite>0 OR Consumption>0
group by stocklocationID, skuID) FINW on FINW.stocklocationID = SLS.stocklocationID and  FINW.skuID = SLS.skuID


left join (select SLSH.stockLocationID, SLSH.skuID, 
Sum ( Case when (totalIn>0 OR InventoryAtSite>0 OR Consumption>0) then 1 else 0 End ) [AvailableDaysLastWeek]
from Symphony_stocklocationskuhistory SLSH
where updateDate >= convert(date,GETDATE()-6)
group by SLSH.stockLocationID, SLSH.skuID ) WAVD on WAVD.stockLocationID = SLS.stockLocationID and WAVD.skuID = SLS.skuID

left join (select SLSH.stockLocationID, SLSH.skuID, 
Sum ( Case when (totalIn>0 OR InventoryAtSite>0 OR Consumption>0) then 1 else 0 End ) [AvailableLast30Days]
from Symphony_stocklocationskuhistory SLSH
where updateDate >= convert(date,GETDATE()-29)
group by SLSH.stockLocationID, SLSH.skuID ) MAVD on MAVD.stockLocationID = SLS.stockLocationID and MAVD.skuID = SLS.skuID

left join (select SLSH.stockLocationID, SLSH.skuID, 
Sum ( Case when (totalIn>0 OR InventoryAtSite>0 OR Consumption>0) then 1 else 0 End ) [AvailableLast60Days]
from Symphony_stocklocationskuhistory SLSH
where updateDate >=  convert(date,GETDATE()-59)
group by SLSH.stockLocationID, SLSH.skuID ) TMAVD on TMAVD.stockLocationID = SLS.stockLocationID and TMAVD.skuID = SLS.skuID

left join (select SLSH.stockLocationID, SLSH.skuID, 
Sum ( Case when (totalIn>0 OR InventoryAtSite>0 OR Consumption>0) then 1 else 0 End ) [AvailableLast90Days]
from Symphony_stocklocationskuhistory SLSH
where updateDate >=  convert(date,GETDATE()-89)
group by SLSH.stockLocationID, SLSH.skuID ) HMAVD on HMAVD.stockLocationID = SLS.stockLocationID and HMAVD.skuID = SLS.skuID



left join (select SLSH.stockLocationID, SLSH.skuID, avg(SLSH.inventoryAtSite) [LastWeekAverageWHsiteStock]
from Symphony_stocklocationskuhistory SLSH
where updateDate >=  convert(date,GETDATE()-6) 
group by SLSH.stockLocationID, SLSH.skuID ) AWH on AWH.stockLocationID = OSL.stockLocationID and AWH.skuID = SLS.skuID

left join (select distinct SLSH.stockLocationID, SLSH.skuID,SLSH.inventoryAtSite [WHnewsiteStock]
from Symphony_StockLocationSkus SLSh
) AWH1 on AWH1.stockLocationID = OSL.stockLocationID and AWH1.skuID = sls.skuID

left join (select SLSH.stockLocationID, SLSH.skuID, SUM(SLSH.consumption) [LastWeeksConsumption],
Sum ( Case when SLSH.InventoryAtSite > 0 or totalIn>0 OR InventoryAtSite>0 OR Consumption>0 then 0 else 1 End ) [SiteStockoutDaysLastWeek]
from Symphony_stocklocationskuhistory SLSH
join (select stocklocationID, skuID, min(updatedate) [firstInwarddate] from Symphony_StockLocationSkuhistory 
where totalIn>0 OR InventoryAtSite>0 OR Consumption>0
group by stocklocationID, skuID) FINW on FINW.stocklocationID = SLSH.stocklocationID and  FINW.skuID = SLSH.skuID
where updateDate >= convert(date,GETDATE()-6) and updatedate > convert(date,finw.firstInwarddate)
group by SLSH.stockLocationID, SLSH.skuID ) RCONS on RCONS.stockLocationID = SLS.stockLocationID and RCONS.skuID = SLS.skuID

left join (select SLSH.stockLocationID, SLSH.skuID, SUM(SLSH.consumption) [Last30DaysConsumption],
Sum ( Case when SLSH.InventoryAtSite > 0 or totalIn>0 OR InventoryAtSite>0 OR Consumption>0 then 0 else 1 End ) [SiteStockoutDaysLast30Days]
from Symphony_stocklocationskuhistory SLSH
join (select stocklocationID, skuID, min(updatedate) [firstInwarddate] from Symphony_StockLocationSkuhistory 
where totalIn>0 OR InventoryAtSite>0 OR Consumption>0
group by stocklocationID, skuID) FINW on FINW.stocklocationID = SLSH.stocklocationID and  FINW.skuID = SLSH.skuID
where updateDate >= convert(date,GETDATE()-29) and updatedate > convert(date,finw.firstInwarddate)
group by SLSH.stockLocationID, SLSH.skuID ) MCONS on MCONS.stockLocationID = SLS.stockLocationID and MCONS.skuID = SLS.skuID

left join (select SLSH.stockLocationID, SLSH.skuID, SUM(SLSH.consumption) [Last60DaysConsumption],
Sum ( Case when SLSH.InventoryAtSite > 0 or totalIn>0 OR InventoryAtSite>0 OR Consumption>0 then 0 else 1 End ) [SiteStockoutDaysLast60Days]
from Symphony_stocklocationskuhistory SLSH
join (select stocklocationID, skuID, min(updatedate) [firstInwarddate] from Symphony_StockLocationSkuhistory 
where totalIn>0 OR InventoryAtSite>0 OR Consumption>0
group by stocklocationID, skuID) FINW on FINW.stocklocationID = SLSH.stocklocationID and  FINW.skuID = SLSH.skuID
where updateDate >= convert(date,GETDATE()-59) and updatedate > convert(date,finw.firstInwarddate)
group by SLSH.stockLocationID, SLSH.skuID ) TMCONS on TMCONS.stockLocationID = SLS.stockLocationID and TMCONS.skuID = SLS.skuID


left join (select SLSH.stockLocationID, SLSH.skuID, SUM(SLSH.consumption) [Last90DaysConsumption],
Sum ( Case when SLSH.InventoryAtSite > 0 or totalIn>0 OR InventoryAtSite>0 OR Consumption>0 then 0 else 1 End ) [SiteStockoutDaysLast90Days]
from Symphony_stocklocationskuhistory SLSH
join (select stocklocationID, skuID, min(updatedate) [firstInwarddate] from Symphony_StockLocationSkuhistory 
where totalIn>0 OR InventoryAtSite>0 OR Consumption>0
group by stocklocationID, skuID) FINW on FINW.stocklocationID = SLSH.stocklocationID and  FINW.skuID = SLSH.skuID
where updateDate >= convert(date,GETDATE()-89) and updatedate > convert(date,finw.firstInwarddate)
group by SLSH.stockLocationID, SLSH.skuID ) HMCONS on HMCONS.stockLocationID = SLS.stockLocationID and HMCONS.skuID = SLS.skuID


where SLS.isDeleted = 0 and sl.stockLocationType=5 and sls.custom_txt3='IPNR'
--order by SL.stockLocationName, SLS.locationSkuName;



end
GO
