USE [SYMPHONY_HRJ]
GO
/****** Object:  StoredProcedure [dbo].[Client_Batch_Virtual_WH]    Script Date: 4/18/2024 3:57:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Client_Batch_Virtual_WH]
AS
BEGIN

DROP TABLE BATCH_WH

CREATE TABLE BATCH_WH
(SKU nvarchar(100),
SL nvarchar (100),
SLoc nvarchar (100),
Stock_at_site numeric (18,5), 
Batch nvarchar (100),)

BULK INSERT BATCH_WH
FROM 'E:\SymphonyData\BatchWH\BatchWH.csv' 
WITH
(
FIRSTROW = 2, 
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)



declare @cmd1 varchar(1000)

set @cmd1 = 'move "E:\SymphonyData\BatchWH\"Batch*.* "E:\SymphonyData\BatchWH\Archive\"'


EXEC Master..xp_cmdShell @cmd1

end
GO
