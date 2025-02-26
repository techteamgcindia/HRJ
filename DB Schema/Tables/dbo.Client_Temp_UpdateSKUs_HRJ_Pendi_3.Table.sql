USE [SYMPHONY_HRJ]
GO
/****** Object:  Table [dbo].[Client_Temp_UpdateSKUs_HRJ_Pendi_3]    Script Date: 4/18/2024 3:55:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_Temp_UpdateSKUs_HRJ_Pendi_3](
	[Stock Location] [nvarchar](100) NULL,
	[SKU] [nvarchar](100) NULL,
	[Unreserved Open Orders_Trade] [decimal](38, 3) NULL,
	[Unreserved Open Orders_Projects] [decimal](38, 3) NULL,
	[Unreserved Open Orders_Dealer Projects] [decimal](38, 3) NULL
) ON [PRIMARY]
GO
