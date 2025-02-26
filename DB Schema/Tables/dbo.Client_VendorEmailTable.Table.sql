USE [SYMPHONY_HRJ]
GO
/****** Object:  Table [dbo].[Client_VendorEmailTable]    Script Date: 4/18/2024 3:55:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_VendorEmailTable](
	[DealerCode] [nvarchar](200) NULL,
	[CustomerName] [nvarchar](200) NULL,
	[Filename] [nvarchar](200) NULL,
	[ReportDate] [datetime] NULL,
	[ind01] [int] NULL
) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Client_VendorEmailTable] ADD  DEFAULT ((0)) FOR [ind01]
GO
