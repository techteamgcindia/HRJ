USE [SYMPHONY_HRJ]
GO
/****** Object:  Table [dbo].[Client_Temp_Location_Change]    Script Date: 4/18/2024 3:55:11 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_Temp_Location_Change](
	[Actual_Location_in_Input_file] [nvarchar](100) NULL,
	[To_be_changed_Location] [nvarchar](100) NULL
) ON [PRIMARY]
GO
