USE [SYMPHONY_HRJ]
GO
/****** Object:  Table [dbo].[Client_Temp_UpdateSKUs_HRJ_Pendi_1]    Script Date: 4/18/2024 3:55:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_Temp_UpdateSKUs_HRJ_Pendi_1](
	[SL] [nvarchar](100) NULL,
	[SKU] [nvarchar](100) NULL,
	[Unreserved_Open_Orders_Trade] [nvarchar](100) NULL,
	[Unreserved_Open_Orders_Projects] [nvarchar](100) NULL,
	[Unreserved_Open_Orders_Dealer_Projects] [nvarchar](100) NULL
) ON [PRIMARY]
GO
