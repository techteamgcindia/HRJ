USE [SYMPHONY_HRJ]
GO
/****** Object:  Table [dbo].[newTempTable1]    Script Date: 4/18/2024 3:55:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[newTempTable1](
	[RowNo] [bigint] NULL,
	[ID1] [int] NULL,
	[splitMonth] [varchar](50) NULL,
	[count] [int] NULL,
	[skuId] [varchar](50) NULL,
	[Annual_Bdgt] [bigint] NULL,
	[Current_Bdgt] [bigint] NULL
) ON [PRIMARY]
GO
