USE [SYMPHONY_HRJ]
GO
/****** Object:  Table [dbo].[Client_STATUS_Dist_ftp_t1]    Script Date: 4/18/2024 3:55:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_STATUS_Dist_ftp_t1](
	[SKU] [nvarchar](100) NULL,
	[sl] [nvarchar](100) NULL,
	[year] [int] NULL,
	[Month] [int] NULL,
	[Day] [int] NULL,
	[INV_Site] [nvarchar](100) NULL,
	[Inv_at_Transit] [varchar](1) NOT NULL
) ON [PRIMARY]
GO
