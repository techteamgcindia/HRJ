USE [SYMPHONY_HRJ]
GO
/****** Object:  Table [dbo].[Final_List]    Script Date: 4/18/2024 3:55:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Final_List](
	[SL] [nvarchar](40) NULL,
	[Parent] [nvarchar](40) NULL,
	[Child] [nvarchar](40) NULL,
	[Qty] [int] NULL,
	[Whse] [nvarchar](40) NULL
) ON [PRIMARY]
GO
