USE [SYMPHONY_HRJ]
GO
/****** Object:  Table [dbo].[client_temp_WO_detail]    Script Date: 4/18/2024 3:55:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[client_temp_WO_detail](
	[Client_SL] [nvarchar](100) NOT NULL,
	[Plant] [nvarchar](100) NULL,
	[skuName] [nvarchar](100) NULL,
	[Parent_code] [nvarchar](100) NULL,
	[quantity] [numeric](18, 5) NULL,
	[bufferColor] [tinyint] NULL,
	[woid] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
