USE [SYMPHONY_HRJ]
GO
/****** Object:  Table [dbo].[Client_Temp_UpdateSKUs_HRJ_Pendi_2]    Script Date: 4/18/2024 3:55:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_Temp_UpdateSKUs_HRJ_Pendi_2](
	[Stock_Location] [nvarchar](100) NULL,
	[SKU] [nvarchar](100) NULL,
	[Unreserved_Open_Orders_Trade_Qty] [decimal](38, 3) NULL,
	[Unreserved_Open_Orders_Projects_Qty] [decimal](38, 3) NULL,
	[Unreserved_Open_Orders_Dealer_Projects_Qty] [decimal](38, 3) NULL
) ON [PRIMARY]
GO
