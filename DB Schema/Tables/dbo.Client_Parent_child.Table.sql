USE [SYMPHONY_HRJ]
GO
/****** Object:  Table [dbo].[Client_Parent_child]    Script Date: 4/18/2024 3:55:10 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_Parent_child](
	[Parent] [nvarchar](100) NULL,
	[Child] [nvarchar](100) NULL,
	[Priority] [int] NULL
) ON [PRIMARY]
GO
