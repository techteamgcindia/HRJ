USE [SYMPHONY_HRJ]
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_PARENT_CHILD_AFTER_LNR]    Script Date: 4/18/2024 3:57:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_PARENT_CHILD_AFTER_LNR]
AS
BEGIN


drop table Client_Replenishment

SELECT * into Client_Replenishment from (SELECT sl.stockLocationName as [SL]
         ,ss.skuName as SKU
		 ,CAST(sls.replenishmentQuantity AS decimal(20,0)) as [Repl_Qty]
		 ,sl1.stockLocationName as [Origin_SL]
		 ,cast(sls.bpProduction as decimal (20,2)) as VPP
		 ,case when productionColor=0 then 'Cyan' 
       when productionColor=1 then 'Green' 
	when productionColor=2 then 'yellow' 	
   	when productionColor=3 then 'Red' 	
	when productionColor=4 then 'Black' end	[BP Color]
	,cast(sls.bufferSize as decimal(20,0)) as [Buffer Size]
		 FROM [dbo].[Symphony_StockLocationSkus] sls
  join Symphony_StockLocations sl
on sls.stockLocationID=sl.stockLocationID
 join Symphony_StockLocations sl1
on sls.originStockLocation=sl1.stockLocationID
join Symphony_SKUs ss
on sls.skuid=ss.skuID
where sls.replenishmentQuantity>0 and sl.stockLocationType=3 and sls.avoidReplenishment=0 and sls.bufferSize>0)#b


DROP TABLE To_be_allocated

Create Table To_be_allocated
(
	SL nvarchar(40),
	SKU nvarchar(40),
	Req_Qty int,
	Origin nvarchar(40),
	Checked int,
	Allocated int
)

Insert into To_be_allocated
Select SL,SKU,Repl_Qty,Origin_SL,0,0 from Client_Replenishment r 
right join client_parent_child c on r.sku=c.Child where sl is not null



DROP TABLE Parent_Child_Checked

Create Table Parent_Child_Checked
(
	Parent nvarchar(40),
	Child nvarchar(40),
	Priority int,
	Checked int
)


Insert into Parent_Child_Checked
Select Parent,Child,Priority,0 from Client_Parent_Child


DROP TABLE WHSE_Stock_Checked

Create Table WHSE_Stock_Checked
(
	Whse nvarchar(40),
	SKU nvarchar(40),
	Qty int,
	Allocated int,
	Checked int
)


Insert into WHSE_Stock_Checked
Select SL,SKU,Inv_site,0,0 from Client_STATUS_TEMP where sl like 'COR%' and inv_site>0


Drop table Final_List
Create Table Final_List
(
	SL nvarchar(40),
	Parent nvarchar(40),
	Child nvarchar(40),
	Qty int,
	Whse nvarchar(40)
)

Declare @Sku nvarchar(40)
Declare @SL nvarchar(40)
Declare @Child nvarchar(40)
Declare @Whse nvarchar(40)
Declare @Qty int
Declare @avail int

While (Select COUNT(*) from to_be_allocated where Checked=0)>0
Begin

Set @Sku=(Select Top 1 SKU from to_be_allocated where Checked=0)
Set @SL=(Select Top 1 SL from to_be_allocated where Checked=0)
Set @WHSE=(Select Top 1 Origin from to_be_allocated where Checked=0)
Set @Qty=(Select Top 1 Req_Qty-Allocated from to_be_allocated where Checked=0)

Update WHSE_Stock_Checked set Checked=0

truncate table Parent_Child_Checked
Insert into Parent_Child_Checked
Select Parent,Child,Priority,0 from Client_Parent_Child where Parent=@Sku

Update to_be_allocated Set Checked=1 where SKU=@Sku and SL=@SL and Origin=@Whse

		While (Select COUNT(*) from Parent_Child_Checked where Checked=0)>0
		Begin
			
		Set @Child=(Select Top 1 Child from Parent_Child_Checked where Checked=0 order by Priority Asc)
				
				Update Parent_Child_Checked Set Checked=1 Where Child=@Child
				
				While (Select ISNULL((Select COUNT(*) from WHSE_Stock_Checked where SKU=@Child and Whse=@Whse and Checked=0),0))>0
				Begin
										
					Set @avail=(Select Qty-Allocated From WHSE_Stock_Checked where SKU=@Child and Whse=@Whse )
						If(@avail>=@Qty)
							Begin
                                                                        update to_be_allocated set Allocated=(@Qty+Allocated) where SKU=@Sku and SL=@SL and Origin=@Whse
									update WHSE_Stock_Checked set Allocated=(@Qty+Allocated),Checked=1 where SKU=@Child  and Whse=@Whse
									Insert into Final_List
									Select @SL,@Sku,@Child,@Qty,@Whse
									Set @Qty=0
							End
						
						Else
							Begin
									If(@avail>0)
									Begin
										update to_be_allocated set Allocated=(@avail+Allocated) where SKU=@Sku and SL=@SL and Origin=@Whse
										update WHSE_Stock_Checked set Allocated=(@avail+Allocated),Checked=1 where SKU=@Child  and Whse=@Whse
										Insert into Final_List
										Select @SL,@Sku,@Child,@avail,@Whse
										Set @Qty=@Qty-@avail
									End
							End	
						update WHSE_Stock_Checked set Checked=1 where SKU=@Child  and Whse=@Whse
				End
		
			
		End

End


Drop table Client_Replenishemnt_rev

select * into  Client_Replenishemnt_rev from 

(Select sl as [Stock Location], child as [SKU], Qty as [Replenishment Quantity], whse as [Origin Stock Location],
   0 as VPP,'' as [BP Color],0 as [Buffer Size]
      from Final_List

union
Select sl as [Stock Location],
       SKU as [SKU],
       Repl_Qty as [Replenishment Quantity],
       Origin_SL as [Origin Stock Location],
       VPP AS VPP,
       [BP COLOR] AS [BP Color],
       [Buffer Size] as [Buffer Size]
        from Client_Replenishment r
       LEFT join client_parent_child c on r.sku=c.Child 
       where SKU not in (select child from client_parent_child)
       
 union
 
 SELECT SL.stockLocationName as [Stock Location],SKF.name as SKU,CAST(totalNPI AS decimal(20,0)) as [Replenishment Quantity],SL1.stockLocationName as [Origin Stock Location],
0 as vpp,'' as [BP Color],0 as [Buffer Size]
FROM Symphony_RetailAllocationRequest RAR 
LEFT JOIN Symphony_StockLocations SL on SL.stockLocationID=RAR.destinationID 
LEFT JOIN Symphony_SkuFamilies SKF on SKF.id=RAR.familyID 
LEFT JOIN Symphony_StockLocations SL1 on SL1.stockLocationID=RAR.originID 

WHERE userSelection=1 and allocationRecommendationType=2)#az


Declare @cmd2 varchar(1000);
set @cmd2 = 'sqlcmd -S "HRJPOWERBI" -d "SYMPHONY_HRJ" -Q "set nocount on; select * from Client_Replenishemnt_rev;" -o "E:\SymphonyData\OutputFolder\Stores Replenishment\Symphony_Daily_Recommendation_Stores_%date:~-4,4%%date:~-10,2%%date:~-7,2%.csv" -s"," -W'
exec master.dbo.xp_cmdshell @cmd2


end
GO
