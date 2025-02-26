USE [SYMPHONY_HRJ]
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_MTSSKUsUpdate]    Script Date: 4/18/2024 3:57:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_MTSSKUsUpdate]
AS
BEGIN

update sls 
set sls.avoidReplenishment = 1
from [SYMPHONY_HRJ].[dbo].[Symphony_StockLocationSkus] sls
where locationSkuName in ('1000000000000','1.00E+12')

update sls
set sls.custom_num6 = batch.Inv_at_site_Qty
from [SYMPHONY_HRJ].[dbo].[Symphony_StockLocationSkus] sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID
join Symphony_SKUs s on s.skuID=sls.skuID
join (select a.SL,a.SKU,batch,Inv_at_site_Qty  from client_temp_batch_inv a 
	inner join (select sku,sl,max(Inv_at_site_Qty) as qty from client_temp_batch_inv group by SKU,SL) b on b.SKU=a.SKU and b.SL=a.SL and b.qty=a.Inv_at_site_Qty
) batch on batch.SL=sl.stockLocationName and batch.SKU=s.skuName
where sl.stockLocationName in ('2400','2100','2200','2600','0200','0300','0400','6610','7210','7410','7800')


update sls set inventoryAtTransit=#sym.rev_transit
from Symphony_StockLocationSkus sls
join (select slsh.stockLocationID,slsh.skuID,sum(slsh.totalIn) as TotIN,sls.inventoryAtTransit as trasit,sls.inventoryAtTransit-sum(slsh.totalIn) as rev_transit from Symphony_StockLocationSkuHistory slsh
join Symphony_StockLocationSkus sls on sls.stockLocationID=slsh.stockLocationID and sls.skuID=slsh.skuID
join Symphony_StockLocations sl on sl.stockLocationID=slsh.stockLocationID
where sl.slPropertyID6=122 and sls.inventoryAtTransit>0 -- slsh.stockLocationID=141 and slsh.skuID=12526 
group by slsh.stockLocationID,slsh.skuID,sls.inventoryAtTransit
having sls.inventoryAtTransit-sum(slsh.totalIn)>0 and sum(slsh.totalIn)>0
)#sym on #sym.stockLocationID=sls.stockLocationID and #sym.skuID=sls.skuID


/*
update sls set inventoryAtTransit=0
from Symphony_StockLocationSkus sls
join (select sls.stockLocationID, sl.stockLocationName, locationSkuName,datediff(d,slsh.Update_date,getdate()) as No_of_days_from_His_Lastupdate,
sls.skuID,replenishmentTime,inventoryAtTransit ,slsh.count_transit_days,slsh.inv_trans from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 
left join (select stockLocationID,skuID,max(updateDate) as Update_date,sum(case when inventoryAtTransit>0 then 1 else 0 end) as 
count_transit_days,sum(inventoryAtTransit) as inv_trans from Symphony_StockLocationSkuHistory where updateDate>=convert(date,getdate()-7) group by stockLocationID,skuID ) slsh on 
slsh.stockLocationID=sls.stockLocationID and slsh.skuID=sls.skuID
where sl.slPropertyID6=122 and replenishmentTime<=7 and sls.inventoryAtTransit>0 
and (slsh.count_transit_days is null or slsh.count_transit_days=7))#xdm on #xdm.stockLocationID=sls.stockLocationID and #xdm.skuID=sls.skuID
*/

update sls set inventoryAtTransit=0
from Symphony_StockLocationSkus sls
join (
select sls.stockLocationID, sl.stockLocationName, locationSkuName,datediff(d,slsh.Update_date,getdate()) as No_of_days_from_His_Lastupdate,
sls.skuID,replenishmentTime,inventoryAtTransit ,slsh.count_transit_days,slsh.inv_trans from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 
left join (select stockLocationID,skuID,max(updateDate) as Update_date,sum(case when inventoryAtTransit>0 then 1 else 0 end) as 
count_transit_days,sum(inventoryAtTransit) as inv_trans from Symphony_StockLocationSkuHistory where updateDate>=convert(date,getdate()-2) group by stockLocationID,skuID ) slsh on 
slsh.stockLocationID=sls.stockLocationID and slsh.skuID=sls.skuID
where sl.slPropertyID6=122  and sls.inventoryAtTransit>0 and slsh.count_transit_days+datediff(d,slsh.Update_date,getdate())>sls.replenishmentTime and sls.replenishmentTime=1
)#xdm on #xdm.stockLocationID=sls.stockLocationID and #xdm.skuID=sls.skuID





update sls set inventoryAtTransit=0
from Symphony_StockLocationSkus sls
where sls.inventoryAtTransit<0


update slsh set inventoryAtTransit=0
from Symphony_StockLocationSkuHistory slsh
where slsh.inventoryAtTransit<0


---- added day wise (Repl. lead time) reset of In-transit qty from 1 day to 20 days

update sls set inventoryAtTransit=0
from Symphony_StockLocationSkus sls
join (
select sls.stockLocationID, sl.stockLocationName, locationSkuName,datediff(d,slsh.Update_date,getdate()) as No_of_days_from_His_Lastupdate,
sls.skuID,replenishmentTime,inventoryAtTransit ,slsh.count_transit_days,slsh.inv_trans from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 
left join (select stockLocationID,skuID,max(updateDate) as Update_date,sum(case when inventoryAtTransit>0 then 1 else 0 end) as 
count_transit_days,sum(inventoryAtTransit) as inv_trans from Symphony_StockLocationSkuHistory where
 updateDate>=convert(date,getdate()-3) group by stockLocationID,skuID ) slsh on 
slsh.stockLocationID=sls.stockLocationID and slsh.skuID=sls.skuID
where sl.slPropertyID6=122  and sls.inventoryAtTransit>0 and slsh.count_transit_days+datediff(d,slsh.Update_date,getdate())>sls.replenishmentTime 
and sls.replenishmentTime=2
)#xdm on #xdm.stockLocationID=sls.stockLocationID and #xdm.skuID=sls.skuID


update sls set inventoryAtTransit=0
from Symphony_StockLocationSkus sls
join (
select sls.stockLocationID, sl.stockLocationName, locationSkuName,datediff(d,slsh.Update_date,getdate()) as No_of_days_from_His_Lastupdate,
sls.skuID,replenishmentTime,inventoryAtTransit ,slsh.count_transit_days,slsh.inv_trans from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 
left join (select stockLocationID,skuID,max(updateDate) as Update_date,sum(case when inventoryAtTransit>0 then 1 else 0 end) as 
count_transit_days,sum(inventoryAtTransit) as inv_trans from Symphony_StockLocationSkuHistory where
 updateDate>=convert(date,getdate()-4) group by stockLocationID,skuID ) slsh on 
slsh.stockLocationID=sls.stockLocationID and slsh.skuID=sls.skuID
where sl.slPropertyID6=122  and sls.inventoryAtTransit>0 and slsh.count_transit_days+datediff(d,slsh.Update_date,getdate())>sls.replenishmentTime 
and sls.replenishmentTime=3
)#xdm on #xdm.stockLocationID=sls.stockLocationID and #xdm.skuID=sls.skuID

update sls set inventoryAtTransit=0
from Symphony_StockLocationSkus sls
join (
select sls.stockLocationID, sl.stockLocationName, locationSkuName,datediff(d,slsh.Update_date,getdate()) as No_of_days_from_His_Lastupdate,
sls.skuID,replenishmentTime,inventoryAtTransit ,slsh.count_transit_days,slsh.inv_trans from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 
left join (select stockLocationID,skuID,max(updateDate) as Update_date,sum(case when inventoryAtTransit>0 then 1 else 0 end) as 
count_transit_days,sum(inventoryAtTransit) as inv_trans from Symphony_StockLocationSkuHistory where
 updateDate>=convert(date,getdate()-5) group by stockLocationID,skuID ) slsh on 
slsh.stockLocationID=sls.stockLocationID and slsh.skuID=sls.skuID
where sl.slPropertyID6=122  and sls.inventoryAtTransit>0 and slsh.count_transit_days+datediff(d,slsh.Update_date,getdate())>sls.replenishmentTime 
and sls.replenishmentTime=4
)#xdm on #xdm.stockLocationID=sls.stockLocationID and #xdm.skuID=sls.skuID


update sls set inventoryAtTransit=0
from Symphony_StockLocationSkus sls
join (
select sls.stockLocationID, sl.stockLocationName, locationSkuName,datediff(d,slsh.Update_date,getdate()) as No_of_days_from_His_Lastupdate,
sls.skuID,replenishmentTime,inventoryAtTransit ,slsh.count_transit_days,slsh.inv_trans from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 
left join (select stockLocationID,skuID,max(updateDate) as Update_date,sum(case when inventoryAtTransit>0 then 1 else 0 end) as 
count_transit_days,sum(inventoryAtTransit) as inv_trans from Symphony_StockLocationSkuHistory where
 updateDate>=convert(date,getdate()-6) group by stockLocationID,skuID ) slsh on 
slsh.stockLocationID=sls.stockLocationID and slsh.skuID=sls.skuID
where sl.slPropertyID6=122  and sls.inventoryAtTransit>0 and slsh.count_transit_days+datediff(d,slsh.Update_date,getdate())>sls.replenishmentTime 
and sls.replenishmentTime=5
)#xdm on #xdm.stockLocationID=sls.stockLocationID and #xdm.skuID=sls.skuID


update sls set inventoryAtTransit=0
from Symphony_StockLocationSkus sls
join (
select sls.stockLocationID, sl.stockLocationName, locationSkuName,datediff(d,slsh.Update_date,getdate()) as No_of_days_from_His_Lastupdate,
sls.skuID,replenishmentTime,inventoryAtTransit ,slsh.count_transit_days,slsh.inv_trans from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 
left join (select stockLocationID,skuID,max(updateDate) as Update_date,sum(case when inventoryAtTransit>0 then 1 else 0 end) as 
count_transit_days,sum(inventoryAtTransit) as inv_trans from Symphony_StockLocationSkuHistory where
 updateDate>=convert(date,getdate()-7) group by stockLocationID,skuID ) slsh on 
slsh.stockLocationID=sls.stockLocationID and slsh.skuID=sls.skuID
where sl.slPropertyID6=122  and sls.inventoryAtTransit>0 and slsh.count_transit_days+datediff(d,slsh.Update_date,getdate())>sls.replenishmentTime 
and sls.replenishmentTime=6
)#xdm on #xdm.stockLocationID=sls.stockLocationID and #xdm.skuID=sls.skuID


update sls set inventoryAtTransit=0
from Symphony_StockLocationSkus sls
join (
select sls.stockLocationID, sl.stockLocationName, locationSkuName,datediff(d,slsh.Update_date,getdate()) as No_of_days_from_His_Lastupdate,
sls.skuID,replenishmentTime,inventoryAtTransit ,slsh.count_transit_days,slsh.inv_trans from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 
left join (select stockLocationID,skuID,max(updateDate) as Update_date,sum(case when inventoryAtTransit>0 then 1 else 0 end) as 
count_transit_days,sum(inventoryAtTransit) as inv_trans from Symphony_StockLocationSkuHistory where
 updateDate>=convert(date,getdate()-8) group by stockLocationID,skuID ) slsh on 
slsh.stockLocationID=sls.stockLocationID and slsh.skuID=sls.skuID
where sl.slPropertyID6=122  and sls.inventoryAtTransit>0 and slsh.count_transit_days+datediff(d,slsh.Update_date,getdate())>sls.replenishmentTime 
and sls.replenishmentTime=7
)#xdm on #xdm.stockLocationID=sls.stockLocationID and #xdm.skuID=sls.skuID


update sls set inventoryAtTransit=0
from Symphony_StockLocationSkus sls
join (
select sls.stockLocationID, sl.stockLocationName, locationSkuName,datediff(d,slsh.Update_date,getdate()) as No_of_days_from_His_Lastupdate,
sls.skuID,replenishmentTime,inventoryAtTransit ,slsh.count_transit_days,slsh.inv_trans from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 
left join (select stockLocationID,skuID,max(updateDate) as Update_date,sum(case when inventoryAtTransit>0 then 1 else 0 end) as 
count_transit_days,sum(inventoryAtTransit) as inv_trans from Symphony_StockLocationSkuHistory where
 updateDate>=convert(date,getdate()-9) group by stockLocationID,skuID ) slsh on 
slsh.stockLocationID=sls.stockLocationID and slsh.skuID=sls.skuID
where sl.slPropertyID6=122  and sls.inventoryAtTransit>0 and slsh.count_transit_days+datediff(d,slsh.Update_date,getdate())>sls.replenishmentTime 
and sls.replenishmentTime=8
)#xdm on #xdm.stockLocationID=sls.stockLocationID and #xdm.skuID=sls.skuID


update sls set inventoryAtTransit=0
from Symphony_StockLocationSkus sls
join (
select sls.stockLocationID, sl.stockLocationName, locationSkuName,datediff(d,slsh.Update_date,getdate()) as No_of_days_from_His_Lastupdate,
sls.skuID,replenishmentTime,inventoryAtTransit ,slsh.count_transit_days,slsh.inv_trans from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 
left join (select stockLocationID,skuID,max(updateDate) as Update_date,sum(case when inventoryAtTransit>0 then 1 else 0 end) as 
count_transit_days,sum(inventoryAtTransit) as inv_trans from Symphony_StockLocationSkuHistory where
 updateDate>=convert(date,getdate()-10) group by stockLocationID,skuID ) slsh on 
slsh.stockLocationID=sls.stockLocationID and slsh.skuID=sls.skuID
where sl.slPropertyID6=122  and sls.inventoryAtTransit>0 and slsh.count_transit_days+datediff(d,slsh.Update_date,getdate())>sls.replenishmentTime 
and sls.replenishmentTime=9
)#xdm on #xdm.stockLocationID=sls.stockLocationID and #xdm.skuID=sls.skuID


update sls set inventoryAtTransit=0
from Symphony_StockLocationSkus sls
join (
select sls.stockLocationID, sl.stockLocationName, locationSkuName,datediff(d,slsh.Update_date,getdate()) as No_of_days_from_His_Lastupdate,
sls.skuID,replenishmentTime,inventoryAtTransit ,slsh.count_transit_days,slsh.inv_trans from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 
left join (select stockLocationID,skuID,max(updateDate) as Update_date,sum(case when inventoryAtTransit>0 then 1 else 0 end) as 
count_transit_days,sum(inventoryAtTransit) as inv_trans from Symphony_StockLocationSkuHistory where
 updateDate>=convert(date,getdate()-11) group by stockLocationID,skuID ) slsh on 
slsh.stockLocationID=sls.stockLocationID and slsh.skuID=sls.skuID
where sl.slPropertyID6=122  and sls.inventoryAtTransit>0 and slsh.count_transit_days+datediff(d,slsh.Update_date,getdate())>sls.replenishmentTime 
and sls.replenishmentTime=10
)#xdm on #xdm.stockLocationID=sls.stockLocationID and #xdm.skuID=sls.skuID


update sls set inventoryAtTransit=0
from Symphony_StockLocationSkus sls
join (
select sls.stockLocationID, sl.stockLocationName, locationSkuName,datediff(d,slsh.Update_date,getdate()) as No_of_days_from_His_Lastupdate,
sls.skuID,replenishmentTime,inventoryAtTransit ,slsh.count_transit_days,slsh.inv_trans from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 
left join (select stockLocationID,skuID,max(updateDate) as Update_date,sum(case when inventoryAtTransit>0 then 1 else 0 end) as 
count_transit_days,sum(inventoryAtTransit) as inv_trans from Symphony_StockLocationSkuHistory where
 updateDate>=convert(date,getdate()-12) group by stockLocationID,skuID ) slsh on 
slsh.stockLocationID=sls.stockLocationID and slsh.skuID=sls.skuID
where sl.slPropertyID6=122  and sls.inventoryAtTransit>0 and slsh.count_transit_days+datediff(d,slsh.Update_date,getdate())>sls.replenishmentTime 
and sls.replenishmentTime=11
)#xdm on #xdm.stockLocationID=sls.stockLocationID and #xdm.skuID=sls.skuID

update sls set inventoryAtTransit=0
from Symphony_StockLocationSkus sls
join (
select sls.stockLocationID, sl.stockLocationName, locationSkuName,datediff(d,slsh.Update_date,getdate()) as No_of_days_from_His_Lastupdate,
sls.skuID,replenishmentTime,inventoryAtTransit ,slsh.count_transit_days,slsh.inv_trans from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 
left join (select stockLocationID,skuID,max(updateDate) as Update_date,sum(case when inventoryAtTransit>0 then 1 else 0 end) as 
count_transit_days,sum(inventoryAtTransit) as inv_trans from Symphony_StockLocationSkuHistory where
 updateDate>=convert(date,getdate()-13) group by stockLocationID,skuID ) slsh on 
slsh.stockLocationID=sls.stockLocationID and slsh.skuID=sls.skuID
where sl.slPropertyID6=122  and sls.inventoryAtTransit>0 and slsh.count_transit_days+datediff(d,slsh.Update_date,getdate())>sls.replenishmentTime 
and sls.replenishmentTime=12
)#xdm on #xdm.stockLocationID=sls.stockLocationID and #xdm.skuID=sls.skuID


update sls set inventoryAtTransit=0
from Symphony_StockLocationSkus sls
join (
select sls.stockLocationID, sl.stockLocationName, locationSkuName,datediff(d,slsh.Update_date,getdate()) as No_of_days_from_His_Lastupdate,
sls.skuID,replenishmentTime,inventoryAtTransit ,slsh.count_transit_days,slsh.inv_trans from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 
left join (select stockLocationID,skuID,max(updateDate) as Update_date,sum(case when inventoryAtTransit>0 then 1 else 0 end) as 
count_transit_days,sum(inventoryAtTransit) as inv_trans from Symphony_StockLocationSkuHistory where
 updateDate>=convert(date,getdate()-14) group by stockLocationID,skuID ) slsh on 
slsh.stockLocationID=sls.stockLocationID and slsh.skuID=sls.skuID
where sl.slPropertyID6=122  and sls.inventoryAtTransit>0 and slsh.count_transit_days+datediff(d,slsh.Update_date,getdate())>sls.replenishmentTime 
and sls.replenishmentTime=13
)#xdm on #xdm.stockLocationID=sls.stockLocationID and #xdm.skuID=sls.skuID


update sls set inventoryAtTransit=0
from Symphony_StockLocationSkus sls
join (
select sls.stockLocationID, sl.stockLocationName, locationSkuName,datediff(d,slsh.Update_date,getdate()) as No_of_days_from_His_Lastupdate,
sls.skuID,replenishmentTime,inventoryAtTransit ,slsh.count_transit_days,slsh.inv_trans from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 
left join (select stockLocationID,skuID,max(updateDate) as Update_date,sum(case when inventoryAtTransit>0 then 1 else 0 end) as 
count_transit_days,sum(inventoryAtTransit) as inv_trans from Symphony_StockLocationSkuHistory where
 updateDate>=convert(date,getdate()-15) group by stockLocationID,skuID ) slsh on 
slsh.stockLocationID=sls.stockLocationID and slsh.skuID=sls.skuID
where sl.slPropertyID6=122  and sls.inventoryAtTransit>0 and slsh.count_transit_days+datediff(d,slsh.Update_date,getdate())>sls.replenishmentTime 
and sls.replenishmentTime=14
)#xdm on #xdm.stockLocationID=sls.stockLocationID and #xdm.skuID=sls.skuID


update sls set inventoryAtTransit=0
from Symphony_StockLocationSkus sls
join (
select sls.stockLocationID, sl.stockLocationName, locationSkuName,datediff(d,slsh.Update_date,getdate()) as No_of_days_from_His_Lastupdate,
sls.skuID,replenishmentTime,inventoryAtTransit ,slsh.count_transit_days,slsh.inv_trans from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 
left join (select stockLocationID,skuID,max(updateDate) as Update_date,sum(case when inventoryAtTransit>0 then 1 else 0 end) as 
count_transit_days,sum(inventoryAtTransit) as inv_trans from Symphony_StockLocationSkuHistory where
 updateDate>=convert(date,getdate()-16) group by stockLocationID,skuID ) slsh on 
slsh.stockLocationID=sls.stockLocationID and slsh.skuID=sls.skuID
where sl.slPropertyID6=122  and sls.inventoryAtTransit>0 and slsh.count_transit_days+datediff(d,slsh.Update_date,getdate())>sls.replenishmentTime 
and sls.replenishmentTime=15
)#xdm on #xdm.stockLocationID=sls.stockLocationID and #xdm.skuID=sls.skuID



update sls set inventoryAtTransit=0
from Symphony_StockLocationSkus sls
join (
select sls.stockLocationID, sl.stockLocationName, locationSkuName,datediff(d,slsh.Update_date,getdate()) as No_of_days_from_His_Lastupdate,
sls.skuID,replenishmentTime,inventoryAtTransit ,slsh.count_transit_days,slsh.inv_trans from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 
left join (select stockLocationID,skuID,max(updateDate) as Update_date,sum(case when inventoryAtTransit>0 then 1 else 0 end) as 
count_transit_days,sum(inventoryAtTransit) as inv_trans from Symphony_StockLocationSkuHistory where
 updateDate>=convert(date,getdate()-17) group by stockLocationID,skuID ) slsh on 
slsh.stockLocationID=sls.stockLocationID and slsh.skuID=sls.skuID
where sl.slPropertyID6=122  and sls.inventoryAtTransit>0 and slsh.count_transit_days+datediff(d,slsh.Update_date,getdate())>sls.replenishmentTime 
and sls.replenishmentTime=16
)#xdm on #xdm.stockLocationID=sls.stockLocationID and #xdm.skuID=sls.skuID


update sls set inventoryAtTransit=0
from Symphony_StockLocationSkus sls
join (
select sls.stockLocationID, sl.stockLocationName, locationSkuName,datediff(d,slsh.Update_date,getdate()) as No_of_days_from_His_Lastupdate,
sls.skuID,replenishmentTime,inventoryAtTransit ,slsh.count_transit_days,slsh.inv_trans from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 
left join (select stockLocationID,skuID,max(updateDate) as Update_date,sum(case when inventoryAtTransit>0 then 1 else 0 end) as 
count_transit_days,sum(inventoryAtTransit) as inv_trans from Symphony_StockLocationSkuHistory where
 updateDate>=convert(date,getdate()-18) group by stockLocationID,skuID ) slsh on 
slsh.stockLocationID=sls.stockLocationID and slsh.skuID=sls.skuID
where sl.slPropertyID6=122  and sls.inventoryAtTransit>0 and slsh.count_transit_days+datediff(d,slsh.Update_date,getdate())>sls.replenishmentTime 
and sls.replenishmentTime=17
)#xdm on #xdm.stockLocationID=sls.stockLocationID and #xdm.skuID=sls.skuID


update sls set inventoryAtTransit=0
from Symphony_StockLocationSkus sls
join (
select sls.stockLocationID, sl.stockLocationName, locationSkuName,datediff(d,slsh.Update_date,getdate()) as No_of_days_from_His_Lastupdate,
sls.skuID,replenishmentTime,inventoryAtTransit ,slsh.count_transit_days,slsh.inv_trans from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 
left join (select stockLocationID,skuID,max(updateDate) as Update_date,sum(case when inventoryAtTransit>0 then 1 else 0 end) as 
count_transit_days,sum(inventoryAtTransit) as inv_trans from Symphony_StockLocationSkuHistory where
 updateDate>=convert(date,getdate()-19) group by stockLocationID,skuID ) slsh on 
slsh.stockLocationID=sls.stockLocationID and slsh.skuID=sls.skuID
where sl.slPropertyID6=122  and sls.inventoryAtTransit>0 and slsh.count_transit_days+datediff(d,slsh.Update_date,getdate())>sls.replenishmentTime 
and sls.replenishmentTime=18
)#xdm on #xdm.stockLocationID=sls.stockLocationID and #xdm.skuID=sls.skuID


update sls set inventoryAtTransit=0
from Symphony_StockLocationSkus sls
join (
select sls.stockLocationID, sl.stockLocationName, locationSkuName,datediff(d,slsh.Update_date,getdate()) as No_of_days_from_His_Lastupdate,
sls.skuID,replenishmentTime,inventoryAtTransit ,slsh.count_transit_days,slsh.inv_trans from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 
left join (select stockLocationID,skuID,max(updateDate) as Update_date,sum(case when inventoryAtTransit>0 then 1 else 0 end) as 
count_transit_days,sum(inventoryAtTransit) as inv_trans from Symphony_StockLocationSkuHistory where
 updateDate>=convert(date,getdate()-20) group by stockLocationID,skuID ) slsh on 
slsh.stockLocationID=sls.stockLocationID and slsh.skuID=sls.skuID
where sl.slPropertyID6=122  and sls.inventoryAtTransit>0 and slsh.count_transit_days+datediff(d,slsh.Update_date,getdate())>sls.replenishmentTime 
and sls.replenishmentTime=19
)#xdm on #xdm.stockLocationID=sls.stockLocationID and #xdm.skuID=sls.skuID


update sls set inventoryAtTransit=0
from Symphony_StockLocationSkus sls
join (
select sls.stockLocationID, sl.stockLocationName, locationSkuName,datediff(d,slsh.Update_date,getdate()) as No_of_days_from_His_Lastupdate,
sls.skuID,replenishmentTime,inventoryAtTransit ,slsh.count_transit_days,slsh.inv_trans from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 
left join (select stockLocationID,skuID,max(updateDate) as Update_date,sum(case when inventoryAtTransit>0 then 1 else 0 end) as 
count_transit_days,sum(inventoryAtTransit) as inv_trans from Symphony_StockLocationSkuHistory where
 updateDate>=convert(date,getdate()-21) group by stockLocationID,skuID ) slsh on 
slsh.stockLocationID=sls.stockLocationID and slsh.skuID=sls.skuID
where sl.slPropertyID6=122  and sls.inventoryAtTransit>0 and slsh.count_transit_days+datediff(d,slsh.Update_date,getdate())>sls.replenishmentTime 
and sls.replenishmentTime=20
)#xdm on #xdm.stockLocationID=sls.stockLocationID and #xdm.skuID=sls.skuID


---- Update Dist_sku column from FTP files folder, Pls chk all the files in FTP folder is hving all columns filled, some files may have last record not proper

drop table Client_STATUS_TEMP_Dist_ftp_mts_update;

create table Client_STATUS_TEMP_Dist_ftp_mts_update
(SKU nvarchar(100),
SL nvarchar(100),
Year nvarchar(10),
Month nvarchar(10),
Day nvarchar(10),
INV_Site nvarchar(100),
Inv_Transit nvarchar(100),
Dist_SKU nvarchar(500),
)

IF (OBJECT_ID('allfilenames') IS NOT NULL)
drop table allfilenames;

IF (OBJECT_ID('bulkact') IS NOT NULL)
drop table bulkact;

CREATE TABLE ALLFILENAMES(WHICHPATH VARCHAR(255),WHICHFILE varchar(255))
CREATE TABLE BULKACT(RAWDATA VARCHAR (8000))
declare @filename varchar(255),
        @path     varchar(255),
        @sql      varchar(8000),
        @cmd      varchar(1000)



SET @path = 'E:\SymphonyData\SFTP_files\Archive\'
SET @cmd = 'dir "' + @path + '" *.csv /b'
INSERT INTO  ALLFILENAMES(WHICHFILE)
EXEC Master..xp_cmdShell @cmd
UPDATE ALLFILENAMES SET WHICHPATH = @path where WHICHPATH is null

--cursor loop
--''\n''
    declare c1 cursor for SELECT WHICHPATH,WHICHFILE FROM ALLFILENAMES where WHICHFILE like 'STATUS_site%.csv%'
    open c1
    fetch next from c1 into @path,@filename
    While @@fetch_status <> -1
      begin
      --bulk insert won't take a variable name, so make a sql and execute it instead:
       set @sql = 'BULK INSERT Client_STATUS_TEMP_Dist_ftp_mts_update FROM ''' + @path + @filename + ''' '
           + '     WITH ( 
                   FIELDTERMINATOR = '','', 
                   ROWTERMINATOR = ''\n'', 
                   FIRSTROW = 2 
                ) '
    print @sql
    exec (@sql)

      fetch next from c1 into @path,@filename
      end
    close c1
    deallocate c1


	--select * from Client_STATUS_TEMP_Dist_ftp_mts_update

	update Client_STATUS_TEMP_Dist_ftp_mts_update
	set Dist_SKU=REPLACE(DIST_SKU,',','')

update sls
set sls.custom_txt4 = d.dis_sku
from [SYMPHONY_HRJ].[dbo].[Symphony_StockLocationSkus] sls
join Symphony_StockLocations SL on SL.stockLocationID = SLS.stockLocationID
left join (select distinct sl,sku,max(dist_sku) as dis_sku from Client_STATUS_TEMP_Dist_ftp_mts_update  group by sl,sku ) d on d.sl=sl.stockLocationName and d.SKU=sls.locationSkuName
where sls.isDeleted=0 and sl.isDeleted=0 --and sl.stockLocationType=3 


update sls set sls.skuDescription =s1.desc1
from Symphony_StockLocationSkus sls
join (select s.locationSkuName, MAX(s.skuDescription) as desc1  from Symphony_StockLocationSkus s
 where s.isDeleted=0 group by s.locationSkuName) s1 on s1.locationSkuName=sls.locationSkuName
where (sls.skuDescription is null or sls.skuDescription=''  )
 and sls.isDeleted=0

  update sls set sls.skuPropertyID1 =s1.desc1
from Symphony_StockLocationSkus sls
join (select s.locationSkuName, MAX(s.skuPropertyID1) as desc1  from Symphony_StockLocationSkus s
 where s.isDeleted=0 group by s.locationSkuName) s1 on s1.locationSkuName=sls.locationSkuName
where (sls.skuPropertyID1 is null or sls.skuPropertyID1=''  )
 and sls.isDeleted=0

  update sls set sls.custom_txt3 =s1.desc1
from Symphony_StockLocationSkus sls
join (select s.locationSkuName, MAX(s.custom_txt3) as desc1  from Symphony_StockLocationSkus s
 where s.isDeleted=0 group by s.locationSkuName) s1 on s1.locationSkuName=sls.locationSkuName
where (sls.custom_txt3 is null  )
 and sls.isDeleted=0


 update sls set sls.custom_txt5 =s1.desc1
from Symphony_StockLocationSkus sls
join (select s.locationSkuName, MAX(s.custom_txt5) as desc1  from Symphony_StockLocationSkus s
 where s.isDeleted=0 group by s.locationSkuName) s1 on s1.locationSkuName=sls.locationSkuName
where (sls.custom_txt5 is null  )
 and sls.isDeleted=0


 update sls set sls.custom_txt8 =s1.desc1
from Symphony_StockLocationSkus sls
join (select s.locationSkuName, MAX(s.custom_txt8) as desc1  from Symphony_StockLocationSkus s
 where s.isDeleted=0 group by s.locationSkuName) s1 on s1.locationSkuName=sls.locationSkuName
where (sls.custom_txt8 is null  )
 and sls.isDeleted=0

 ---- Update Shipping buffer (Symphony_WorkOrders table) fieds (i.e: business & division) ---

 update sls set sls.woCustom_txt7 =s1.desc1
from Symphony_WorkOrders sls
join (select s.skuID, MAX(spi.skuItemName) as desc1  from Symphony_StockLocationSkus s
left join Symphony_SKUsPropertyItems spi on spi.skuItemID=s.skuPropertyID1
 where s.isDeleted=0 group by s.skuID) s1 on s1.skuID=sls.skuID
where (sls.woCustom_txt7 is null or sls.woCustom_txt7=''  )
 --and sls.isDeleted=0

  update sls set sls.woCustom_txt6 =s1.desc1
from Symphony_WorkOrders sls
join (select s.skuID, MAX(s.custom_txt3) as desc1  from Symphony_StockLocationSkus s
 where s.isDeleted=0 group by s.skuID) s1 on s1.skuID=sls.skuID
where (sls.woCustom_txt6 is null or sls.woCustom_txt6='' )


------- Added for Finance data - Feb'21 by Pratiksha --------------------

Update sls

set custom_num2=isnull(b.bdgt+isnull(tin.ttlIn,0)-isnull(cns.ttlOut,0),0)

,inventoryatsite=isnull(b.bdgt+isnull(tin.ttlIn,0)-isnull(cns.ttlOut,0),0)

,buffersize=b.bdgt      --isnull(cast(sls.custom_num1*5/12 as decimal(18,0)),0)

--select sls.stockLocationID,sls.buffersize,sls.locationskuname,sls.skuDescription,isnull(sls.custom_num1,0) AnualBud,sls.custom_num2 ShortExcess

--,sls.inventoryAtSite,cns.ttlout,tin.TtlIn

--,isnull(b.Bdgt+ isnull(tin.ttlIn,0)-isnull(cns.ttlOut,0),0) NewInvSite

--,b.Bdgt CurrentBudget

from Symphony_stocklocationskus sls

join (Select stockLocationID,buffersize,locationskuname,skuDescription,custom_num1,inventoryAtSite

      ,cast((isnull(custom_num1,0)/12)*(

                                          Case when month(getdate())= 1 then 10

                                                          when month(getdate())= 2 then 11

                                                          when month(getdate())= 3 then 12

                                                          when month(getdate())= 4 then 1

                                                          when month(getdate())= 5 then 2

                                                          when month(getdate())= 6 then 3

                                                          when month(getdate())= 7 then 4

                                                          when month(getdate())= 8 then 5

                                                          when month(getdate())= 9 then 6

                                                          when month(getdate())= 10 then 7

                                                          when month(getdate())= 11 then 8

                                                          when month(getdate())= 12 then 9

                                           end) as decimal(18,0)) Bdgt

                                 ,custom_num2 ExcessShort

                from Symphony_StockLocationSkus

                where stocklocationid=4783) b on b.stocklocationid=sls.stockLocationID and b.locationSkuName=sls.locationSkuName
				and custom_txt4 = 'All'

left join (Select sl.stockLocationName SL,sk.skuname Sku,sum(quantity) TtlOut,sender,t.Skuid

                                           from Symphony_transactions t

                                           join Symphony_skus sk on sk.skuid=t.skuID

                                           join Symphony_StockLocations sl on sl.stockLocationID=t.sender

                                           where sender=4783 and transactiontype=0 and  reportedDate > '2021-03-31 00:00:00' and reportedDate < '2022-04-01 00:00:00'

                                           group by sl.stockLocationName,sk.skuName,sender,t.skuID) cns on cns.sender=sls.stocklocationid and cns.skuid=sls.skuid

left join (Select sl.stockLocationName SL,sk.skuname Sku,sum(quantity) TtlIn,receiver,t.Skuid

                                           from Symphony_transactions t

                                           join Symphony_skus sk on sk.skuid=t.skuID

                                           join Symphony_StockLocations sl on sl.stockLocationID=t.receiver

                                           where receiver=4783 and transactiontype=1 and  reportedDate > '2021-03-31 00:00:00' and reportedDate < '2022-04-01 00:00:00'

                                           group by sl.stockLocationName,sk.skuName,t.receiver,t.skuID) tin on tin.Receiver=sls.stocklocationid and tin.skuid=sls.skuid

where sls.stocklocationid=4783

-------------------- Fin data update END ---------------------------------------


 end
 
GO
