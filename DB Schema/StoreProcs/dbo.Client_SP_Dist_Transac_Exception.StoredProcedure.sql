USE [SYMPHONY_HRJ]
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_Dist_Transac_Exception]    Script Date: 4/18/2024 3:57:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_Dist_Transac_Exception]
AS
BEGIN

select distinct #aca.stockLocationID,#aca.stockLocationName,#aca.stockLocationDescription
      ,case when out.Last_OUT_Transaction>(ISNULL (a.Last_IN_Transaction,0)) then out.Last_OUT_Transaction else 
     a.Last_IN_Transaction end as Last_Transaction
     ,out.Last_OUT_Transaction,a.Last_IN_Transaction
   

from (

   SELECT sl.stockLocationID,sl.stockLocationName,sl.stockLocationDescription
      ,max(t.reportedDate) as Last_OUT_Transaction
	  ,'' as Last_IN_Transaction
      
  FROM [SYMPHONY_HRJ].[dbo].[Symphony_Transactions] t
  join Symphony_StockLocations sl on sl.stockLocationID=t.sender
  where sl.slPropertyID6=122 and transactionType=0 and receiver=-1 --and sl.stockLocationName='BH0M0010'
  group by sl.stockLocationID,sl.stockLocationName,sl.stockLocationDescription
  --having max(t.reportedDate) is not null


union  

   SELECT sl.stockLocationID,sl.stockLocationName,sl.stockLocationDescription
       ,'' as Last_OUT_Transaction
      ,max(t.reportedDate) as Last_IN_Transaction
      
  FROM [SYMPHONY_HRJ].[dbo].[Symphony_Transactions] t
  join Symphony_StockLocations sl on sl.stockLocationID=t.receiver
  where sl.slPropertyID6=122 and transactionType=1 --and sl.stockLocationName='BH0M0010'
  group by sl.stockLocationID,sl.stockLocationName,sl.stockLocationDescription)#aca


  left join (SELECT sl.stockLocationID,sl.stockLocationName
      ,max(t.reportedDate) as Last_OUT_Transaction
	  ,'' as Last_IN_Transaction
      
  FROM [SYMPHONY_HRJ].[dbo].[Symphony_Transactions] t
  join Symphony_StockLocations sl on sl.stockLocationID=t.sender
  where sl.slPropertyID6=122 and transactionType=0 and receiver=-1 --and sl.stockLocationName='BH0M0010'
  group by sl.stockLocationID,sl.stockLocationName ) OUT on out.stockLocationID=#aca.stockLocationID

  left join (SELECT sl.stockLocationID,sl.stockLocationName
       ,'' as Last_OUT_Transaction
      ,max(t.reportedDate) as Last_IN_Transaction
      
  FROM [SYMPHONY_HRJ].[dbo].[Symphony_Transactions] t
  join Symphony_StockLocations sl on sl.stockLocationID=t.receiver
  where sl.slPropertyID6=122 and transactionType=1 --and sl.stockLocationName='BH0M0010'
  group by sl.stockLocationID,sl.stockLocationName) a on a.stockLocationID=#aca.stockLocationID

  end
GO
