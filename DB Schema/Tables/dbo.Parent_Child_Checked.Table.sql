USE [SYMPHONY_HRJ]
GO
/****** Object:  Table [dbo].[Parent_Child_Checked]    Script Date: 4/18/2024 3:55:12 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Parent_Child_Checked](
	[Parent] [nvarchar](40) NULL,
	[Child] [nvarchar](40) NULL,
	[Priority] [int] NULL,
	[Checked] [int] NULL
) ON [PRIMARY]
GO
