USE [SYMPHONY_HRJ]
GO
/****** Object:  Table [dbo].[cl_mst]    Script Date: 4/18/2024 3:55:09 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[cl_mst](
	[dist_code] [varchar](1000) NULL,
	[ret_name] [varchar](1000) NULL,
	[clust_code] [varchar](50) NULL
) ON [PRIMARY]
GO
