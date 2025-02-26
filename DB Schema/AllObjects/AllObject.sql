USE [master]
GO
/****** Object:  Database [SYMPHONY_HRJ]    Script Date: 4/18/2024 3:51:28 PM ******/
CREATE DATABASE [SYMPHONY_HRJ]
 CONTAINMENT = NONE
 ON  PRIMARY 
( NAME = N'SYMPHONY_HRJ_Data', FILENAME = N'E:\SQL_SYMPHONY_DATA\SYMPHONY_HRJ_Data.MDF' , SIZE = 149704064KB , MAXSIZE = UNLIMITED, FILEGROWTH = 10%)
 LOG ON 
( NAME = N'SYMPHONY_HRJ_Log', FILENAME = N'E:\SQL_SYMPHONY_DATA\SYMPHONY_HRJ_Log.LDF' , SIZE = 12011584KB , MAXSIZE = 2048GB , FILEGROWTH = 10%)
GO
ALTER DATABASE [SYMPHONY_HRJ] SET COMPATIBILITY_LEVEL = 130
GO
IF (1 = FULLTEXTSERVICEPROPERTY('IsFullTextInstalled'))
begin
EXEC [SYMPHONY_HRJ].[dbo].[sp_fulltext_database] @action = 'enable'
end
GO
ALTER DATABASE [SYMPHONY_HRJ] SET ANSI_NULL_DEFAULT OFF 
GO
ALTER DATABASE [SYMPHONY_HRJ] SET ANSI_NULLS OFF 
GO
ALTER DATABASE [SYMPHONY_HRJ] SET ANSI_PADDING OFF 
GO
ALTER DATABASE [SYMPHONY_HRJ] SET ANSI_WARNINGS OFF 
GO
ALTER DATABASE [SYMPHONY_HRJ] SET ARITHABORT OFF 
GO
ALTER DATABASE [SYMPHONY_HRJ] SET AUTO_CLOSE OFF 
GO
ALTER DATABASE [SYMPHONY_HRJ] SET AUTO_SHRINK OFF 
GO
ALTER DATABASE [SYMPHONY_HRJ] SET AUTO_UPDATE_STATISTICS ON 
GO
ALTER DATABASE [SYMPHONY_HRJ] SET CURSOR_CLOSE_ON_COMMIT OFF 
GO
ALTER DATABASE [SYMPHONY_HRJ] SET CURSOR_DEFAULT  GLOBAL 
GO
ALTER DATABASE [SYMPHONY_HRJ] SET CONCAT_NULL_YIELDS_NULL OFF 
GO
ALTER DATABASE [SYMPHONY_HRJ] SET NUMERIC_ROUNDABORT OFF 
GO
ALTER DATABASE [SYMPHONY_HRJ] SET QUOTED_IDENTIFIER OFF 
GO
ALTER DATABASE [SYMPHONY_HRJ] SET RECURSIVE_TRIGGERS OFF 
GO
ALTER DATABASE [SYMPHONY_HRJ] SET  DISABLE_BROKER 
GO
ALTER DATABASE [SYMPHONY_HRJ] SET AUTO_UPDATE_STATISTICS_ASYNC OFF 
GO
ALTER DATABASE [SYMPHONY_HRJ] SET DATE_CORRELATION_OPTIMIZATION OFF 
GO
ALTER DATABASE [SYMPHONY_HRJ] SET TRUSTWORTHY OFF 
GO
ALTER DATABASE [SYMPHONY_HRJ] SET ALLOW_SNAPSHOT_ISOLATION OFF 
GO
ALTER DATABASE [SYMPHONY_HRJ] SET PARAMETERIZATION SIMPLE 
GO
ALTER DATABASE [SYMPHONY_HRJ] SET READ_COMMITTED_SNAPSHOT OFF 
GO
ALTER DATABASE [SYMPHONY_HRJ] SET HONOR_BROKER_PRIORITY OFF 
GO
ALTER DATABASE [SYMPHONY_HRJ] SET RECOVERY SIMPLE 
GO
ALTER DATABASE [SYMPHONY_HRJ] SET  MULTI_USER 
GO
ALTER DATABASE [SYMPHONY_HRJ] SET PAGE_VERIFY TORN_PAGE_DETECTION  
GO
ALTER DATABASE [SYMPHONY_HRJ] SET DB_CHAINING OFF 
GO
ALTER DATABASE [SYMPHONY_HRJ] SET FILESTREAM( NON_TRANSACTED_ACCESS = OFF ) 
GO
ALTER DATABASE [SYMPHONY_HRJ] SET TARGET_RECOVERY_TIME = 60 SECONDS 
GO
ALTER DATABASE [SYMPHONY_HRJ] SET DELAYED_DURABILITY = DISABLED 
GO
ALTER DATABASE [SYMPHONY_HRJ] SET QUERY_STORE = OFF
GO
USE [SYMPHONY_HRJ]
GO
ALTER DATABASE SCOPED CONFIGURATION SET LEGACY_CARDINALITY_ESTIMATION = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET LEGACY_CARDINALITY_ESTIMATION = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET MAXDOP = 0;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET MAXDOP = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET PARAMETER_SNIFFING = ON;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET PARAMETER_SNIFFING = PRIMARY;
GO
ALTER DATABASE SCOPED CONFIGURATION SET QUERY_OPTIMIZER_HOTFIXES = OFF;
GO
ALTER DATABASE SCOPED CONFIGURATION FOR SECONDARY SET QUERY_OPTIMIZER_HOTFIXES = PRIMARY;
GO
USE [SYMPHONY_HRJ]
GO
/****** Object:  User [NT Service\MSSQLSERVER]    Script Date: 4/18/2024 3:51:29 PM ******/
CREATE USER [NT Service\MSSQLSERVER] FOR LOGIN [NT Service\MSSQLSERVER] WITH DEFAULT_SCHEMA=[dbo]
GO
/****** Object:  User [em1]    Script Date: 4/18/2024 3:51:29 PM ******/
CREATE USER [em1] FOR LOGIN [em1] WITH DEFAULT_SCHEMA=[dbo]
GO
ALTER ROLE [db_owner] ADD MEMBER [NT Service\MSSQLSERVER]
GO
ALTER ROLE [db_owner] ADD MEMBER [em1]
GO
/****** Object:  Table [dbo].[Symphony_AnnuallyDates]    Script Date: 4/18/2024 3:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_AnnuallyDates](
	[annually_date] [datetime] NOT NULL,
	[plantID] [int] NOT NULL,
	[calenderID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Qry_AnnualsList]    Script Date: 4/18/2024 3:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE VIEW [dbo].[Qry_AnnualsList] 
AS
SELECT TOP 100 PERCENT
DATEPART(mm,annually_date) AS month_number,
DATENAME(mm,annually_date) AS month_name,
DATEPART(dd,annually_date) AS month_day
FROM Symphony_AnnuallyDates
ORDER BY month_number,month_day
GO
/****** Object:  Table [dbo].[Symphony_StockLocations]    Script Date: 4/18/2024 3:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_StockLocations](
	[stockLocationID] [int] IDENTITY(-1,1) NOT NULL,
	[stockLocationName] [nvarchar](100) NOT NULL,
	[stockLocationDescription] [nvarchar](1000) NULL,
	[stockLocationType] [tinyint] NOT NULL,
	[calenderID] [int] NOT NULL,
	[defaultOriginID] [int] NULL,
	[slPropertyID1] [int] NULL,
	[slPropertyID2] [int] NULL,
	[slPropertyID3] [int] NULL,
	[slPropertyID4] [int] NULL,
	[slPropertyID5] [int] NULL,
	[slPropertyID6] [int] NULL,
	[slPropertyID7] [int] NULL,
	[slCustom_num1] [decimal](18, 5) NULL,
	[slCustom_num2] [decimal](18, 5) NULL,
	[slCustom_num3] [decimal](18, 5) NULL,
	[slCustom_num4] [decimal](18, 5) NULL,
	[slCustom_num5] [decimal](18, 5) NULL,
	[slCustom_num6] [decimal](18, 5) NULL,
	[slCustom_num7] [decimal](18, 5) NULL,
	[slCustom_num8] [decimal](18, 5) NULL,
	[slCustom_num9] [decimal](18, 5) NULL,
	[slCustom_num10] [decimal](18, 5) NULL,
	[isDeleted] [bit] NOT NULL,
	[shipmentPolicyID] [int] NULL,
	[supplierEmail] [nvarchar](1000) NULL,
	[spaceManagement] [bit] NULL,
	[allocationPriority] [int] NULL,
	[replenishmentPriority] [int] NULL,
	[stopAllocation] [bit] NULL,
	[allowOverAllocation] [bit] NULL,
	[retailCalendarID] [int] NULL,
 CONSTRAINT [PK_Symphony_StockLocations] PRIMARY KEY CLUSTERED 
(
	[stockLocationName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [UK_Symphony_StockLocations] UNIQUE NONCLUSTERED 
(
	[stockLocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_AssortmentGroupSummaryData]    Script Date: 4/18/2024 3:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_AssortmentGroupSummaryData](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[stockLocationID] [int] NOT NULL,
	[assortmentGroupID] [int] NOT NULL,
	[familyCount] [int] NOT NULL,
	[validFamilyCount] [int] NOT NULL,
	[totalInventory] [decimal](18, 5) NOT NULL,
	[inventoryAtSite] [decimal](18, 5) NOT NULL,
 CONSTRAINT [PK_Symphony_Symphony_AssortmentGroupSummaryData] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [UK_Symphony_Symphony_AssortmentGroupSummaryData] UNIQUE NONCLUSTERED 
(
	[stockLocationID] ASC,
	[assortmentGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_StockLocationSkus]    Script Date: 4/18/2024 3:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_StockLocationSkus](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[stockLocationID] [int] NOT NULL,
	[skuID] [int] NOT NULL,
	[skuDescription] [nvarchar](1000) NULL,
	[locationSkuName] [nvarchar](100) NULL,
	[bufferSize] [numeric](18, 5) NOT NULL,
	[coolingInv] [numeric](18, 5) NULL,
	[tmrBufferSizeChange] [numeric](18, 5) NULL,
	[tmrBufferChangeDate] [smalldatetime] NULL,
	[inventoryAtSite] [numeric](18, 5) NOT NULL,
	[inventoryAtTransit] [numeric](18, 5) NOT NULL,
	[inventoryAtTransitPurchasing] [numeric](18, 5) NOT NULL,
	[inventoryAtProduction] [numeric](18, 5) NOT NULL,
	[consumption] [numeric](18, 5) NOT NULL,
	[noConsumption] [bit] NOT NULL,
	[noConsumptionDays] [smallint] NOT NULL,
	[noConsumptionDaysPrevious] [smallint] NOT NULL,
	[noConsumptionDaysToPreviousDecision] [smallint] NOT NULL,
	[lastConsumptionDate] [smalldatetime] NULL,
	[previousConsumptionDate] [smalldatetime] NULL,
	[lastNoConsumptionDecisionDate] [smalldatetime] NULL,
	[totalIn] [numeric](18, 5) NOT NULL,
	[inventoryNeeded] [numeric](18, 5) NOT NULL,
	[updateDate] [smalldatetime] NULL,
	[replenishmentTime] [smallint] NULL,
	[bpSite] [numeric](18, 5) NOT NULL,
	[bpTransit] [numeric](18, 5) NOT NULL,
	[bpProduction] [numeric](18, 5) NOT NULL,
	[siteColor] [tinyint] NOT NULL,
	[transitColor] [tinyint] NOT NULL,
	[productionColor] [tinyint] NOT NULL,
	[isRedReasonNeeded] [bit] NOT NULL,
	[isBlackReasonNeeded] [bit] NOT NULL,
	[isYellowReasonNeeded] [bit] NOT NULL,
	[toReplenish] [int] NOT NULL,
	[sentToReplenishment] [bit] NOT NULL,
	[nextGreenCheckDate] [smalldatetime] NULL,
	[nextRedCheckDate] [smalldatetime] NULL,
	[newBufferSize] [numeric](18, 5) NULL,
	[unitPrice] [numeric](18, 5) NOT NULL,
	[avoidReplenishment] [bit] NOT NULL,
	[blackReason] [nvarchar](100) NULL,
	[redReason] [nvarchar](100) NULL,
	[yellowReason] [nvarchar](100) NULL,
	[skuPropertyID1] [int] NULL,
	[skuPropertyID2] [int] NULL,
	[skuPropertyID3] [int] NULL,
	[skuPropertyID4] [int] NULL,
	[skuPropertyID5] [int] NULL,
	[skuPropertyID6] [int] NULL,
	[skuPropertyID7] [int] NULL,
	[minimumBufferSize] [numeric](18, 5) NOT NULL,
	[originStockLocation] [int] NULL,
	[originSKU] [nvarchar](100) NULL,
	[suggestedReplenishmentAmount] [numeric](18, 5) NOT NULL,
	[replenishmentQuantity] [numeric](18, 5) NOT NULL,
	[saftyStock] [numeric](18, 5) NOT NULL,
	[minimumRequiredBP] [numeric](18, 5) NOT NULL,
	[minimumReplenishment] [numeric](18, 5) NOT NULL,
	[multiplications] [numeric](18, 5) NOT NULL,
	[avoidSeasonality] [bit] NOT NULL,
	[autoReplenishment] [bit] NOT NULL,
	[uomID] [int] NOT NULL,
	[Throughput] [numeric](18, 5) NULL,
	[TVC] [numeric](18, 5) NULL,
	[newRedBlack] [bit] NOT NULL,
	[considered] [tinyint] NOT NULL,
	[isDeleted] [bit] NOT NULL,
	[allowedOverstocking] [numeric](18, 5) NOT NULL,
	[invNeededToStartTmr] [numeric](18, 5) NOT NULL,
	[tooMuchRedWarning] [tinyint] NULL,
	[startDate] [smalldatetime] NOT NULL,
	[recommendationType] [tinyint] NOT NULL,
	[notes] [nvarchar](4000) NULL,
	[bufferManagementPolicy] [smallint] NOT NULL,
	[endOfLifePolicy] [smallint] NULL,
	[endOfLifeStatus] [bit] NOT NULL,
	[greenPenetrationAccumulation] [decimal](18, 5) NOT NULL,
	[redPenetrationAccumulation] [decimal](18, 5) NOT NULL,
	[lastAccumalteDate] [smalldatetime] NOT NULL,
	[lastAccumulation] [decimal](18, 5) NOT NULL,
	[inSeasonality] [bit] NOT NULL,
	[greenOverStocking] [bit] NOT NULL,
	[dbmRecommendationDate] [smalldatetime] NOT NULL,
	[lastAccumaltionColor] [tinyint] NOT NULL,
	[nextGreenOverstockCheckDate] [smalldatetime] NOT NULL,
	[enlargeCoolingPeriodDate] [smalldatetime] NOT NULL,
	[enlargeCoolingPeriod] [bit] NULL,
	[greenPipeDate] [smalldatetime] NOT NULL,
	[averageInLastRepTime] [numeric](18, 5) NOT NULL,
	[TMGInvTransit] [numeric](18, 5) NOT NULL,
	[irrInvAtSite] [numeric](18, 5) NOT NULL,
	[irrInvAtTransit] [numeric](18, 5) NOT NULL,
	[irrInvAtProduction] [numeric](18, 5) NOT NULL,
	[irrConsumption] [numeric](18, 5) NOT NULL,
	[irrTotalIn] [numeric](18, 5) NOT NULL,
	[irrInventoryAtTransitPurchasing] [numeric](18, 5) NOT NULL,
	[shipmentMeasure] [numeric](18, 5) NULL,
	[dailyThroughput] [numeric](18, 5) NULL,
	[custom_num1] [decimal](18, 5) NULL,
	[custom_num2] [decimal](18, 5) NULL,
	[custom_num3] [decimal](18, 5) NULL,
	[custom_num4] [decimal](18, 5) NULL,
	[custom_num5] [decimal](18, 5) NULL,
	[custom_num6] [decimal](18, 5) NULL,
	[custom_num7] [decimal](18, 5) NULL,
	[custom_num8] [decimal](18, 5) NULL,
	[custom_num9] [decimal](18, 5) NULL,
	[custom_num10] [decimal](18, 5) NULL,
	[custom_txt1] [nvarchar](100) NULL,
	[custom_txt2] [nvarchar](100) NULL,
	[custom_txt3] [nvarchar](100) NULL,
	[custom_txt4] [nvarchar](100) NULL,
	[custom_txt5] [nvarchar](100) NULL,
	[custom_txt6] [nvarchar](100) NULL,
	[custom_txt7] [nvarchar](100) NULL,
	[custom_txt8] [nvarchar](100) NULL,
	[custom_txt9] [nvarchar](100) NULL,
	[custom_txt10] [nvarchar](100) NULL,
 CONSTRAINT [PK_Symphony_StockLocationSkus] PRIMARY KEY CLUSTERED 
(
	[stockLocationID] ASC,
	[skuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_AssortmentGroups]    Script Date: 4/18/2024 3:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_AssortmentGroups](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[description] [nvarchar](200) NULL,
 CONSTRAINT [PK_Symphony_AssortmentGroups] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [UK_Symphony_AssortmentGroups] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_LocationAssortmentGroups]    Script Date: 4/18/2024 3:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_LocationAssortmentGroups](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[stockLocationID] [int] NOT NULL,
	[assortmentGroupID] [int] NOT NULL,
	[varietyTarget] [int] NOT NULL,
	[minTarget] [int] NULL,
	[maxTarget] [int] NULL,
	[validFamiliesNum] [int] NOT NULL,
	[notValidFamiliesNum] [int] NOT NULL,
	[notValidFamiliesOverThresholdNum] [int] NOT NULL,
	[varietyGap] [int] NOT NULL,
	[spaceGap] [int] NOT NULL,
	[sentToReplenishNum] [int] NOT NULL,
	[spaceTarget] [int] NULL,
	[gapMode] [smallint] NOT NULL,
	[spaceManaged] [bit] NOT NULL,
	[quantityPerFamily] [decimal](18, 0) NOT NULL,
	[considerVarietyGap] [bit] NOT NULL,
	[alignmentToInventory] [decimal](18, 5) NOT NULL,
	[allocateExistingGroups] [bit] NOT NULL,
	[maximumFamiliesPerGroup] [int] NULL,
	[spaceBP] [decimal](18, 5) NULL,
	[varietyBP] [decimal](18, 5) NULL,
	[agBP] [decimal](18, 5) NULL,
	[totalSpace] [decimal](18, 5) NULL,
	[spaceType] [smallint] NULL,
	[invalidThresholdFactor] [decimal](18, 5) NULL,
	[ignoreNrBuffers] [bit] NOT NULL,
	[defaultDbmPolicy] [int] NULL,
	[dominantSalesEstimation] [smallint] NULL,
	[attributesSetID] [int] NULL,
	[allocationPriority] [decimal](18, 5) NULL,
	[eligibilityRule] [nvarchar](200) NULL,
	[overrideAllocationMethod] [smallint] NULL,
	[limitAllocationToGap] [bit] NULL,
	[isGapCalculatedByVariety] [bit] NULL,
	[isAllocationCompleted] [bit] NULL,
	[agCustom_num1] [decimal](18, 5) NULL,
	[agCustom_num2] [decimal](18, 5) NULL,
	[agCustom_num3] [decimal](18, 5) NULL,
	[agCustom_num4] [decimal](18, 5) NULL,
	[agCustom_num5] [decimal](18, 5) NULL,
	[agCustom_num6] [decimal](18, 5) NULL,
	[agCustom_num7] [decimal](18, 5) NULL,
	[agCustom_num8] [decimal](18, 5) NULL,
	[agCustom_num9] [decimal](18, 5) NULL,
	[agCustom_num10] [decimal](18, 5) NULL,
	[oddmentsRatio] [decimal](18, 5) NULL,
	[enableDTM] [bit] NULL,
	[DTMBenchmark] [decimal](18, 5) NULL,
	[DTMIncreaseThreshold] [decimal](18, 5) NULL,
	[DTMDecreaseThreshold] [decimal](18, 5) NULL,
	[DTMDecileForIncrease] [decimal](18, 5) NULL,
	[DTMDecileForDecrease] [decimal](18, 5) NULL,
	[DTMIncreaseFactor] [decimal](18, 5) NULL,
	[DTMDecreaseFactor] [decimal](18, 5) NULL,
	[newnessThreshold] [int] NULL,
	[newness] [decimal](18, 5) NULL,
 CONSTRAINT [PK_Symphony_LocationAssortmentGroups] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [UK_Symphony_LocationAssortmentGroups] UNIQUE NONCLUSTERED 
(
	[stockLocationID] ASC,
	[assortmentGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_AssortmentGroupConsumptionSummaryData]    Script Date: 4/18/2024 3:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_AssortmentGroupConsumptionSummaryData](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [smalldatetime] NOT NULL,
	[stockLocationID] [int] NOT NULL,
	[assortmentGroupID] [int] NOT NULL,
	[averageConsumptionAG] [decimal](18, 5) NULL,
	[averageConsumptionDG] [decimal](18, 5) NULL,
 CONSTRAINT [PK_Symphony_AssortmentGroupConsumptionSummaryData] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [UK_Symphony_AssortmentGroupConsumptionSummaryData] UNIQUE NONCLUSTERED 
(
	[stockLocationID] ASC,
	[assortmentGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[BI_Retail_AGs]    Script Date: 4/18/2024 3:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE VIEW [dbo].[BI_Retail_AGs] 
AS
select AG.name [AG Name],
AG.id [Assortment Group ID],
SL.stockLocationID [Stock Location ID],
SL.stocklocationname [Stock Location Name],
case when LAG.gapMode=0 then 'Variety'
		when LAG.gapMode=1 then 'Space Over Variety'
		when LAG.gapMode=2 then 'Variety Over Space'
End [Gap Mode],
LAG.maxTarget [AG Max Variety],
LAG.minTarget [AG Min Variety],
LAG.varietyTarget [AG Variety Target],
LAG.spaceTarget [AG Space Target],
LAG.validFamiliesNum [Valid Families],
LAG.notValidFamiliesNum [Invalid Familes],
LAG.notValidFamiliesOverThresholdNum [Expired Families],
(LAG.notValidFamiliesNum - LAG.notValidFamiliesOverThresholdNum) [Newly Invalid Families],
case when LAG.spaceManaged=0 then 'No'
		when LAG.spaceManaged=1 then 'Yes'
End [Space Managed],
AGS.familyCount [Total Families],
AGCS.averageConsumptionAG [AG Average Consumption],
CASE LAG.spaceTarget WHEN 0 THEN 0 ELSE convert(decimal(18,2),round((1 - (SumScope.sumBufferSize/LAG.spaceTarget))*100,1)) END [Buffer Size Penetration (Space)],
CASE LAG.spaceTarget WHEN 0 THEN 0 ELSE convert(decimal(18,2),round((1 - (SumScope.sumInventoryAtSite/LAG.spaceTarget))*100,1)) END [Inventory At Site Penetration (Space)],
CASE LAG.spaceTarget WHEN 0 THEN 0 ELSE convert(decimal(18,2),round((1 - (SumScope.SumInventoryAtPipe/LAG.spaceTarget))*100,1)) END [Inventory At Pipe Penetration (Space)],
convert(decimal(18,2),round(LAG.spaceBP*100,1)) [Space Buffer Penetration],
convert(decimal(18,2),round(LAG.agBP*100,1)) [AG Buffer Penetration],
convert(decimal(18,2),round(LAG.varietyBP*100,1)) [Variety Buffer Peneteration],
			totalSpace [Total Space]
					
from Symphony_LocationAssortmentGroups LAG
join Symphony_AssortmentGroups AG on AG.id=LAG.assortmentGroupID
join Symphony_StockLocations SL on SL.stockLocationID=LAG.stockLocationID
left join Symphony_AssortmentGroupSummaryData AGS on AGS.assortmentGroupID=LAG.assortmentGroupID and AGS.stockLocationID=LAG.stockLocationID
left join Symphony_AssortmentGroupConsumptionSummaryData AGCS on AGCS.assortmentGroupID=LAG.assortmentGroupID and AGCS.stockLocationID=LAG.stockLocationID
left join (
		SELECT	LAG.assortmentGroupID,       
				SLS.stockLocationID,       
				SUM(SLS.inventoryAtSite) AS sumInventoryAtSite,      
				SUM(SLS.bufferSize) AS sumBufferSize,       
				SUM(SLS.inventoryAtSite + SLS.inventoryAtTransit + SLS.inventoryAtProduction) as SumInventoryAtPipe   
		FROM [dbo].[Symphony_StockLocationSkus] SLS   
		INNER JOIN dbo.Symphony_LocationAssortmentGroups LAG 
		ON LAG.stockLocationID = SLS.stockLocationID   
		GROUP BY LAG.assortmentGroupID, SLS.stockLocationID
		) 
		SumScope ON SumScope.assortmentGroupID = LAG.assortmentGroupID AND LAG.stockLocationID = SumScope.stockLocationID 
	where sl.isDeleted=0

GO
/****** Object:  Table [dbo].[Symphony_RetailAgDgConnection]    Script Date: 4/18/2024 3:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_RetailAgDgConnection](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[assortmentGroupID] [int] NOT NULL,
	[displayGroupID] [int] NOT NULL,
 CONSTRAINT [PK_RetailAgDgConnection] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [UK_RetailAgDgConnection] UNIQUE NONCLUSTERED 
(
	[assortmentGroupID] ASC,
	[displayGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_DisplayGroups]    Script Date: 4/18/2024 3:51:29 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_DisplayGroups](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[description] [nvarchar](200) NULL,
 CONSTRAINT [PK_Symphony_DisplayGroups] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [UK_Symphony_DisplayGroups] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[BI_Retail_DG]    Script Date: 4/18/2024 3:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE VIEW [dbo].[BI_Retail_DG] AS
select DG.id [Display Group ID],
DG.name [Display Group Name],
AG.id [Assortment Group ID]
			 
from Symphony_DisplayGroups DG
join Symphony_RetailAgDgConnection AGDG on AGDG.displayGroupID=DG.id
join Symphony_AssortmentGroups AG on AG.id=AGDG.assortmentGroupID

GO
/****** Object:  Table [dbo].[Symphony_SKUs]    Script Date: 4/18/2024 3:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_SKUs](
	[skuID] [int] IDENTITY(1,1) NOT NULL,
	[skuName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Symphony_SKUs] PRIMARY KEY CLUSTERED 
(
	[skuName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [UK_Symphony_SKUs] UNIQUE NONCLUSTERED 
(
	[skuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_MasterSkus]    Script Date: 4/18/2024 3:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_MasterSkus](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[skuID] [int] NOT NULL,
	[skuDescription] [nvarchar](200) NULL,
	[status] [tinyint] NOT NULL,
	[familyID] [int] NULL,
	[familyMemberID] [int] NULL,
	[isPreferred] [bit] NOT NULL,
	[npiQuantity] [int] NOT NULL,
	[uomID] [int] NOT NULL,
	[throughput] [numeric](18, 5) NULL,
	[tvc] [numeric](18, 5) NULL,
	[unitPrice] [numeric](18, 5) NOT NULL,
	[safetyStock] [numeric](18, 5) NULL,
	[bufferManagementPolicyID] [smallint] NOT NULL,
	[groupID] [int] NULL,
	[skuPropertyID1] [int] NULL,
	[skuPropertyID2] [int] NULL,
	[skuPropertyID3] [int] NULL,
	[skuPropertyID4] [int] NULL,
	[skuPropertyID5] [int] NULL,
	[skuPropertyID6] [int] NULL,
	[skuPropertyID7] [int] NULL,
	[custom_num1] [decimal](18, 5) NULL,
	[custom_num2] [decimal](18, 5) NULL,
	[custom_num3] [decimal](18, 5) NULL,
	[custom_num4] [decimal](18, 5) NULL,
	[custom_num5] [decimal](18, 5) NULL,
	[custom_num6] [decimal](18, 5) NULL,
	[custom_num7] [decimal](18, 5) NULL,
	[custom_num8] [decimal](18, 5) NULL,
	[custom_num9] [decimal](18, 5) NULL,
	[custom_num10] [decimal](18, 5) NULL,
	[custom_txt1] [nvarchar](100) NULL,
	[custom_txt2] [nvarchar](100) NULL,
	[custom_txt3] [nvarchar](100) NULL,
	[custom_txt4] [nvarchar](100) NULL,
	[custom_txt5] [nvarchar](100) NULL,
	[custom_txt6] [nvarchar](100) NULL,
	[custom_txt7] [nvarchar](100) NULL,
	[custom_txt8] [nvarchar](100) NULL,
	[custom_txt9] [nvarchar](100) NULL,
	[custom_txt10] [nvarchar](100) NULL,
 CONSTRAINT [PK_Symphony_MasterSkus] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [UK_Symphony_MasterSkus_SKUID] UNIQUE NONCLUSTERED 
(
	[skuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_SkuFamilies]    Script Date: 4/18/2024 3:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_SkuFamilies](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[familyDescription] [nvarchar](150) NULL,
	[creationDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Symphony_SkuFamilies] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [UK_Symphony_SkuFamilies] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_RetailFamilySalesRanking]    Script Date: 4/18/2024 3:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_RetailFamilySalesRanking](
	[familyID] [int] NOT NULL,
	[assortmentGroupID] [int] NOT NULL,
	[propertyItemID] [int] NULL,
	[salesEstimation] [decimal](18, 5) NOT NULL,
	[decile] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_RetailFamilyAgConnection]    Script Date: 4/18/2024 3:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_RetailFamilyAgConnection](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[familyID] [int] NOT NULL,
	[assortmentGroupID] [int] NOT NULL,
	[invalidThreshold] [int] NULL,
 CONSTRAINT [PK_RetailFamilyAgConnection] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [UK_RetailFamilyAgConnection] UNIQUE NONCLUSTERED 
(
	[familyID] ASC,
	[assortmentGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Retail_Location_AG]    Script Date: 4/18/2024 3:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE VIEW [dbo].[Retail_Location_AG] AS
select SF.name [Family],
AG.name [AG Name],
case when LAG.gapMode=0 then 'Variety'
		when LAG.gapMode=1 then 'Space Over Variety'
		when LAG.gapMode=2 then 'Variety Over Space'
End [Gap Mode],
LAG.maxTarget [AG Max Variety],
LAG.minTarget [AG Min Variety],
LAG.varietyTarget [AG Variety Target],
convert(decimal(18,2),round(LAG.spaceBP*100,1)) [AG Buffer Penetration (Space)],
convert(decimal(18,2),round(LAG.varietyBP*100,1)) [AG Buffer Penetration (Variety)],
LAG.spaceTarget [AG Space Target],
LAG.validFamiliesNum [Valid Families],
LAG.notValidFamiliesNum [Invalid Familes],
LAG.notValidFamiliesOverThresholdNum [Expired Families],
(LAG.notValidFamiliesNum - LAG.notValidFamiliesOverThresholdNum) [Newly Invalid Families],
SL.stockLocationName [SL Name],
sku.skuName [SKU Name],
RNK.salesEstimation [Sales Estimation],
RNK.decile [Sales Decile],
LAG.totalSpace [AG's Total Space],
( Select sum(SLSB.bufferSize)
	FROM Symphony_RetailFamilyAgConnection FAG
	INNER JOIN Symphony_MasterSkus MSB
		on FAG.familyID = MSB.familyID
	INNER JOIN Symphony_StockLocationSkus SLSB 
		on MSB.skuID = SLSB.skuID
	where FAG.assortmentGroupID = LAG.assortmentGroupID 
		and SLSB.stockLocationID = LAG.stockLocationID
)[AG's Total Buffer],			    
case when LAG.spaceManaged=0 then 'No'
		when LAG.spaceManaged=1 then 'Yes'
End [Space Managed],
AGS.familyCount [Total Families],
AGS.inventoryAtSite [AG's Total Inv (Site)],
AGS.totalInventory [AG's Total Inv (Pipe)],
AGCS.averageConsumptionAG [AG Average Consumption],
DG.name [DG Name],
AGCS.averageConsumptionDG [DG Average Consumption]
					 		
from Symphony_MasterSkus MS
join Symphony_RetailFamilyAgConnection FAG on FAG.[familyID] = MS.[familyID]
join Symphony_LocationAssortmentGroups LAG on LAG.assortmentGroupID = FAG.assortmentGroupID
join Symphony_StockLocationSkus sls on MS.skuID = sls.skuID and sls.stockLocationID=LAG.stocklocationid 
join Symphony_SkuFamilies SF on SF.id=MS.familyID
join Symphony_AssortmentGroups AG on AG.id=LAG.assortmentGroupID
join Symphony_StockLocations SL on SL.stockLocationID=LAG.stockLocationID
join Symphony_SKUs SKU on SKU.skuID=MS.skuID
left join Symphony_RetailFamilySalesRanking RNK on RNK.familyID=MS.familyID and RNK.propertyItemID is null
left join Symphony_AssortmentGroupSummaryData AGS on AGS.assortmentGroupID=LAG.assortmentGroupID and AGS.stockLocationID=LAG.stockLocationID
left join Symphony_AssortmentGroupConsumptionSummaryData AGCS on AGCS.assortmentGroupID=LAG.assortmentGroupID and AGCS.stockLocationID=LAG.stockLocationID
left join Symphony_RetailAgDgConnection AGDG on AGDG.assortmentGroupID=LAG.assortmentGroupID
left join Symphony_DisplayGroups DG on DG.id = AGDG.displayGroupID
where sl.isDeleted=0

GO
/****** Object:  Table [dbo].[Symphony_UOM]    Script Date: 4/18/2024 3:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_UOM](
	[uomID] [int] IDENTITY(1,1) NOT NULL,
	[uomName] [nvarchar](50) NOT NULL,
	[bufferAccuracy] [int] NOT NULL,
	[inventoryAccuracy] [int] NOT NULL,
	[shipmentsAccuracy] [int] NOT NULL,
	[abbreviatedNotation] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Symphony_UOM] PRIMARY KEY CLUSTERED 
(
	[uomName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [UK_Symphony_UOM_abbreviate] UNIQUE NONCLUSTERED 
(
	[abbreviatedNotation] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [UK_Symphony_UOM_uomID] UNIQUE NONCLUSTERED 
(
	[uomID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_StockLocationPropertyItems]    Script Date: 4/18/2024 3:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_StockLocationPropertyItems](
	[slItemID] [int] IDENTITY(1,1) NOT NULL,
	[slPropertyID] [nvarchar](50) NOT NULL,
	[slItemName] [nvarchar](100) NOT NULL,
	[autoTooMuchRed] [bit] NOT NULL,
	[tooMuchRedFactor] [numeric](21, 2) NOT NULL,
	[autoTooMuchGreen] [bit] NOT NULL,
	[tooMuchGreenFactor] [numeric](21, 2) NOT NULL,
	[autoReplanishment] [bit] NOT NULL,
	[replanishmentFactor] [numeric](21, 2) NOT NULL,
 CONSTRAINT [PK_Symphony_StockLocationPropertyItems] PRIMARY KEY CLUSTERED 
(
	[slPropertyID] ASC,
	[slItemName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [UK_Symphony_StockLocationPropertyItems] UNIQUE NONCLUSTERED 
(
	[slItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_DBMChangePolicies]    Script Date: 4/18/2024 3:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_DBMChangePolicies](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[increaseFactor] [decimal](13, 5) NOT NULL,
	[increaseTrigger] [decimal](13, 5) NOT NULL,
	[decreaseFactor] [decimal](13, 5) NOT NULL,
	[decreaseTrigger] [decimal](13, 5) NOT NULL,
	[redBPLevel] [decimal](13, 5) NOT NULL,
	[greenBPLevel] [decimal](13, 5) NOT NULL,
	[inactiveThreshold] [int] NOT NULL,
	[TMGStopConditionProduction] [int] NOT NULL,
	[consumptionFrequency] [int] NOT NULL,
	[enableAttentions] [int] NOT NULL,
	[mode] [int] NOT NULL,
PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_SKUsPropertyItems]    Script Date: 4/18/2024 3:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_SKUsPropertyItems](
	[skuItemID] [int] IDENTITY(1,1) NOT NULL,
	[skuPropertyID] [nvarchar](50) NOT NULL,
	[skuItemName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Symphony_SKUsPropertyItems] PRIMARY KEY CLUSTERED 
(
	[skuPropertyID] ASC,
	[skuItemName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [UK_Symphony_SKUsPropertyItems] UNIQUE NONCLUSTERED 
(
	[skuItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Retail_SKU_Location_AG]    Script Date: 4/18/2024 3:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE VIEW [dbo].[Retail_SKU_Location_AG] AS
select sls.stockLocationID [Stock Location ID],
sls.skuID [SKU ID],
sku.skuName [SKU Name], 
sls.skuDescription [SKU Description],
sl.stockLocationName [Stock Location Name],
sl.stocklocationdescription [SL Description],
convert(decimal(18,0),sls.bufferSize) [Buffer Size],
convert(decimal(18,0),sls.coolingInv) [Cooling Inventory],
convert(decimal(18,0),sls.inventoryAtSite) [Inventory At Site],
convert(decimal(18,0),sls.inventoryAtTransit) [Inventory At Transit],
convert(decimal(18,0),sls.inventoryAtProduction) [Inventory At Production],
convert(decimal(18,0),sls.consumption) [Consumption],
convert(decimal(18,0),sls.noconsumptiondays) [No Consumption Days],
convert(datetime, convert(int, convert(float, sls.lastConsumptionDate))) [Last Consumption Date],
convert(datetime, convert(int, convert(float, sls.previousConsumptionDate))) [Previous Consumption Date],
sls.totalin [Total In (Inventory)],
convert(datetime, convert(int, convert(float, sls.updateDate))) [SKU's Update Date],
sls.replenishmentTime [Replenishment Time],
convert(decimal(18,2),round(bpSite*100,1)) [Buffer Penetration (Site)],
convert(decimal(18,2),round(bpTransit*100,1)) [Buffer Penetration (Transit)],
convert(decimal(18,2),round(bpProduction*100,1)) [Buffer Penetration (Production)],
case when sitecolor=0 then 'Cyan'
		when siteColor=1 then 'Green'
		when siteColor=2 then 'Yellow'
		When siteColor=3 then 'Red'
		when siteColor=4 then 'Black'
End [Buffer Penetration Color (Site)],
case when transitColor=0 then 'Cyan'
		when transitColor=1 then 'Green'
		when transitColor=2 then 'Yellow'
		When transitColor=3 then 'Red'
		when transitColor=4 then 'Black'
End [Buffer Penetration Color (Transit)],
case when productionColor=0 then 'Cyan'
		when productionColor=1 then 'Green'
		when productionColor=2 then 'Yellow'
		When productionColor=3 then 'Red'
		when productionColor=4 then 'Black'
End [Buffer Penetration Color (Production)],
convert(decimal(18,0),sls.unitPrice) [Unit Price],
Itm1.skuItemName [SKU Property 1],
Itm2.skuItemName [SKU Property 2],
Itm3.skuItemName [SKU Property 3],
Itm4.skuItemName [SKU Property 4],
Itm5.skuItemName [SKU Property 5],
Itm6.skuItemName [SKU Property 6],
Itm7.skuItemName [SKU Property 7],		
SLitm1.slItemName [SL Property 1],
SLitm2.slItemName [SL Property 2],
SLitm3.slItemName [SL Property 3],
SLitm4.slItemName [SL Property 4],
SLitm5.slItemName [SL Property 5],
SLitm6.slItemName [SL Property 6],
SLitm7.slItemName [SL Property 7],
case 
	when SL.stockLocationType=1 then 'Plant'
	when SL.stockLocationType=2 then 'Supplier'
	when SL.stockLocationType=3 then 'Point of Sale'
	when SL.stockLocationType=4 then 'Transparent'
	when SL.stockLocationType=5 then 'Warehouse'
End [Stock location Type],
case 
		When ((sls.nextGreenCheckDate>sls.updateDate) or (sls.nextGreenOverstockCheckDate>sls.updateDate)) then 'Yes'
		Else 'No'
End	[Green Cooling Period?],
convert(decimal(18,0),sls.minimumBufferSize) [Minimum Buffer Size],
originsl.stockLocationName [Origin Stock Location],
convert(decimal(18,0),sls.saftyStock) [Safety Stock],
convert(decimal(18,0),sls.minimumReplenishment) [Minimum Replenishment],
convert(decimal(18,0),sls.multiplications) [Multipications],
case 
	when SLS.avoidSeasonality=1 then 'Yes'
	when SLS.avoidSeasonality=0 then 'No'
	End [Avoid Seasonality?],
				
Case when sls.autoReplenishment=1 then 'Yes'
		when sls.autoReplenishment=0 then 'No'
		End [Auto Replenish?],
uom.uomName [Unit of Measurement],
convert(decimal(18,0),SLS.Throughput) [Throughput],
convert(decimal(18,0),SLS.TVC) [Total Variable Cost],
convert(datetime, convert(int, convert(float, startDate))) [SKU's Start Date],
dbm.name [DBM Policy],
case
	when sls.inSeasonality=1 then 'Yes'
	when sls.inSeasonality=0 then 'No' 
End[In Seasonality?],
sls.custom_num1 [Custom Number 1],
sls.custom_num2 [Custom Number 2],
sls.custom_num3 [Custom Number 3],
sls.custom_num4 [Custom Number 4],
sls.custom_num5 [Custom Number 5],
sls.custom_num6 [Custom Number 6],
sls.custom_num7 [Custom Number 7],
sls.custom_num8 [Custom Number 8],
sls.custom_num9 [Custom Number 9],
sls.custom_num10 [Custom Number 10],
sls.custom_txt1 [Custom Text 1],
sls.custom_txt2 [Custom Text 2],
sls.custom_txt3 [Custom Text 3],
sls.custom_txt4 [Custom Text 4],
sls.custom_txt5 [Custom Text 5],
sls.custom_txt6 [Custom Text 6],
sls.custom_txt7 [Custom Text 7],
sls.custom_txt8 [Custom Text 8],
sls.custom_txt9 [Custom Text 9],
sls.custom_txt10 [Custom Text 10],
SF.name [Family],
AG.name [AG Name],
case when LAG.gapMode=0 then 'Variety'
		when LAG.gapMode=1 then 'Space Over Variety'
		when LAG.gapMode=2 then 'Variety Over Space'
End [Gap Mode],
LAG.maxTarget [AG Max Variety],
LAG.minTarget [AG Min Variety],
LAG.varietyTarget [AG Variety Target],
LAG.spaceTarget [AG Space Target],
LAG.validFamiliesNum [Valid Families],
LAG.notValidFamiliesNum [Invalid Familes],
LAG.notValidFamiliesOverThresholdNum [Expired Families],
(LAG.notValidFamiliesNum - LAG.notValidFamiliesOverThresholdNum) [Newly Invalid Families],
RNK.salesEstimation [Sales Estimation],
RNK.decile [Sales Decile],
case when LAG.spaceManaged=0 then 'No'
		when LAG.spaceManaged=1 then 'Yes'
End [Space Managed],
AGS.familyCount [Total Families],
AGCS.averageConsumptionAG [AG Average Consumption],
DG.name [DG Name],
AGCS.averageConsumptionDG [DG Average Consumption]
							
from Symphony_MasterSkus MS
join Symphony_RetailFamilyAgConnection FAG on FAG.[familyID] = MS.[familyID]
join Symphony_LocationAssortmentGroups LAG on LAG.assortmentGroupID = FAG.assortmentGroupID
join Symphony_StockLocationSkus sls on MS.skuID = sls.skuID and sls.stockLocationID = LAG.stocklocationid 
join Symphony_SkuFamilies SF on SF.id = MS.familyID
join Symphony_AssortmentGroups AG on AG.id = LAG.assortmentGroupID
join Symphony_StockLocations SL on SL.stockLocationID = LAG.stockLocationID
left join Symphony_SKUsPropertyItems Itm1 on sls.skuPropertyID1=Itm1.skuItemID
left join Symphony_SKUsPropertyItems Itm2 on sls.skuPropertyID2=Itm2.skuItemID
left join Symphony_SKUsPropertyItems Itm3 on sls.skuPropertyID3=Itm3.skuItemID
left join Symphony_SKUsPropertyItems Itm4 on sls.skuPropertyID4=Itm4.skuItemID
left join Symphony_SKUsPropertyItems Itm5 on sls.skuPropertyID5=Itm5.skuItemID
left join Symphony_SKUsPropertyItems Itm6 on sls.skuPropertyID6=Itm6.skuItemID
left join Symphony_SKUsPropertyItems Itm7 on sls.skuPropertyID7=Itm7.skuItemID
left join Symphony_StockLocationPropertyItems SLitm1 on sl.slPropertyID1=slitm1.slItemID
left join Symphony_StockLocationPropertyItems SLitm2 on sl.slPropertyID2=slitm2.slItemID
left join Symphony_StockLocationPropertyItems SLitm3 on sl.slPropertyID3=slitm3.slItemID	
left join Symphony_StockLocationPropertyItems SLitm4 on sl.slPropertyID4=slitm4.slItemID
left join Symphony_StockLocationPropertyItems SLitm5 on sl.slPropertyID5=slitm5.slItemID
left join Symphony_StockLocationPropertyItems SLitm6 on sl.slPropertyID6=slitm6.slItemID	
left join Symphony_StockLocationPropertyItems SLitm7 on sl.slPropertyID7=slitm7.slItemID	
left join Symphony_stocklocations Originsl on originsl.stockLocationID=sls.originStockLocation
join Symphony_SKUs SKU on SKU.skuID=MS.skuID
left join Symphony_RetailFamilySalesRanking RNK on RNK.familyID=MS.familyID and RNK.propertyItemID is null
left join Symphony_AssortmentGroupSummaryData AGS on AGS.assortmentGroupID=LAG.assortmentGroupID and AGS.stockLocationID=LAG.stockLocationID
left join Symphony_AssortmentGroupConsumptionSummaryData AGCS on AGCS.assortmentGroupID=LAG.assortmentGroupID and AGCS.stockLocationID=LAG.stockLocationID
left join Symphony_RetailAgDgConnection AGDG on AGDG.assortmentGroupID=LAG.assortmentGroupID
left join Symphony_DisplayGroups DG on DG.id = AGDG.displayGroupID
left join Symphony_UOM UOM on uom.uomID=sls.uomID 
left join Symphony_DBMChangePolicies dbm on dbm.ID=sls.bufferManagementPolicy 
where sl.isDeleted=0


GO
/****** Object:  Table [dbo].[Symphony_StockLocationSkuHistory]    Script Date: 4/18/2024 3:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_StockLocationSkuHistory](
	[stockLocationID] [int] NOT NULL,
	[skuID] [int] NOT NULL,
	[bufferSize] [numeric](18, 5) NULL,
	[inventoryAtSite] [numeric](18, 5) NULL,
	[irrInvAtSite] [numeric](18, 5) NULL,
	[consumption] [numeric](18, 5) NULL,
	[irrConsumption] [numeric](18, 5) NOT NULL,
	[totalIn] [numeric](18, 5) NOT NULL,
	[irrTotalIn] [numeric](18, 5) NOT NULL,
	[updateDate] [smalldatetime] NOT NULL,
	[returned] [numeric](18, 5) NOT NULL,
	[inventoryAtTransit] [numeric](18, 5) NULL,
	[irrInvAtTransit] [numeric](18, 5) NULL,
	[inventoryAtProduction] [numeric](18, 5) NULL,
	[irrInvAtProduction] [numeric](18, 5) NULL,
	[unitPrice] [numeric](18, 5) NULL,
	[throughput] [numeric](18, 5) NULL,
	[tvc] [numeric](18, 5) NULL,
	[avgMonthlyConsumption] [numeric](18, 5) NULL,
	[tempInventoryAtSite] [numeric](18, 5) NULL,
	[worstInventoryAtSite] [numeric](18, 5) NULL,
	[inventoryAtSiteUpdatesNum] [numeric](18, 5) NOT NULL,
	[avgInventoryAtSite] [numeric](18, 5) NULL,
	[bpSite] [numeric](18, 5) NOT NULL,
	[bpTransit] [numeric](18, 5) NOT NULL,
	[bpProduction] [numeric](18, 5) NOT NULL,
	[greenBpLevel] [numeric](18, 5) NOT NULL,
	[redBpLevel] [numeric](18, 5) NOT NULL,
	[safetyStock] [numeric](18, 5) NOT NULL,
	[isDuplicatedRow] [bit] NOT NULL,
	[toIncreaseUpdateNum] [bit] NOT NULL,
	[originStockLocation] [int] NULL,
	[originSKU] [nvarchar](100) NULL,
	[originType] [int] NOT NULL,
	[isDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Symphony_StockLocationSkuHistory] PRIMARY KEY CLUSTERED 
(
	[stockLocationID] ASC,
	[skuID] ASC,
	[updateDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  View [dbo].[Distribution_History]    Script Date: 4/18/2024 3:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE VIEW [dbo].[Distribution_History] 
AS
SELECT 	sl.stockLocationName [Stock Location Name],
His.stockLocationID [Stock Location ID],
His.skuID [SKU ID],
sku.skuName [SKU Name], 
convert(datetime, convert(int, convert(float, His.updateDate))) [SKU's History Date],
Ag.name [AG Name],
DG.name [DG Name],
sls.skuDescription [SKU Description],
sls.Throughput,
convert(decimal(18,0),His.bufferSize) [Buffer Size],
convert(decimal(18,0),His.inventoryAtSite) [Inventory At Site],
convert(decimal(18,0),His.inventoryAtProduction) [Inventory At Production],
convert(decimal(18,0),His.inventoryAtTransit) [Inventory At Transit],
convert(decimal(18,0),His.consumption) [Consumption],
convert(decimal(18,0),His.totalIn) [Total In Qty],
convert(decimal(18,0),His.returned) [Total returned Qty],
convert(decimal(18,0),His.unitPrice) [Unit Price],
convert(decimal(18,2),round(His.bpSite*100,1)) [Buffer Penetration (Site)],
convert(decimal(18,2),round(His.bpTransit*100,1)) [Buffer Penetration (Transit)],
convert(decimal(18,2),round(His.bpProduction*100,1)) [Buffer Penetration (Production)],
originsl.stockLocationName [Origin Stock Location],			
Itm1.skuItemName [SKU Property 1],
Itm2.skuItemName [SKU Property 2],
Itm3.skuItemName [SKU Property 3],
Itm4.skuItemName [SKU Property 4],
Itm5.skuItemName [SKU Property 5],
Itm6.skuItemName [SKU Property 6],
Itm7.skuItemName [SKU Property 7],		
slitm1.slItemName [SL Property 1],
SLitm2.slItemName [SL Property 2],
SLitm3.slItemName [SL Property 3],
SLitm4.slItemName [SL Property 4],
SLitm5.slItemName [SL Property 5],
SLitm6.slItemName [SL Property 6],
SLitm7.slItemName [SL Property 7],
case 
	when SL.stockLocationType=1 then 'Plant'
	when SL.stockLocationType=2 then 'Supplier'
	when SL.stockLocationType=3 then 'Point of Sale'
	when SL.stockLocationType=4 then 'Transparent'
	when SL.stockLocationType=5 then 'Warehouse'
End [Stock location Type],
		
case 
	when His.originType=1 then 'Plant'
	when His.originType=2 then 'Supplier'
	when His.originType=3 then 'Point of Sale'
	when His.originType=4 then 'Transparent'
	when His.originType=5 then 'Warehouse'
End [Origin SL Type],
convert(decimal(18,0),His.safetyStock) [Safety Stock],
sls.custom_num1 [Custom Number 1],
sls.custom_num2 [Custom Number 2],
sls.custom_num3 [Custom Number 3],
sls.custom_num4 [Custom Number 4],
sls.custom_num5 [Custom Number 5],
sls.custom_num6 [Custom Number 6],
sls.custom_num7 [Custom Number 7],
sls.custom_num8 [Custom Number 8],
sls.custom_num9 [Custom Number 9],
sls.custom_num10 [Custom Number 10],
sls.custom_txt1 [Custom Text 1],
sls.custom_txt2 [Custom Text 2],
sls.custom_txt3 [Custom Text 3],
sls.custom_txt4 [Custom Text 4],
sls.custom_txt5 [Custom Text 5],
sls.custom_txt6 [Custom Text 6],
sls.custom_txt7 [Custom Text 7],
sls.custom_txt8 [Custom Text 8],
sls.custom_txt9 [Custom Text 9],
sls.custom_txt10 [Custom Text 10]
		
FROM Symphony_StockLocationSkuHistory His 
join Symphony_StockLocationSkus sls on His.skuID=sls.skuID and His.stockLocationID=sls.stockLocationID
join Symphony_SKUs SKU on SKU.skuID=sls.skuID
join Symphony_StockLocations SL on SL.stockLocationID=sls.stockLocationID
left join Symphony_SKUsPropertyItems Itm1 on sls.skuPropertyID1=Itm1.skuItemID
left join Symphony_SKUsPropertyItems Itm2 on sls.skuPropertyID2=Itm2.skuItemID
left join Symphony_SKUsPropertyItems Itm3 on sls.skuPropertyID3=Itm3.skuItemID
left join Symphony_SKUsPropertyItems Itm4 on sls.skuPropertyID4=Itm4.skuItemID
left join Symphony_SKUsPropertyItems Itm5 on sls.skuPropertyID5=Itm5.skuItemID
left join Symphony_SKUsPropertyItems Itm6 on sls.skuPropertyID6=Itm6.skuItemID
left join Symphony_SKUsPropertyItems Itm7 on sls.skuPropertyID7=Itm7.skuItemID
left join Symphony_StockLocationPropertyItems SLitm1 on sl.slPropertyID1=slitm1.slItemID
left join Symphony_StockLocationPropertyItems SLitm2 on sl.slPropertyID2=slitm2.slItemID
left join Symphony_StockLocationPropertyItems SLitm3 on sl.slPropertyID3=slitm3.slItemID	
left join Symphony_StockLocationPropertyItems SLitm4 on sl.slPropertyID4=slitm4.slItemID
left join Symphony_StockLocationPropertyItems SLitm5 on sl.slPropertyID5=slitm5.slItemID
left join Symphony_StockLocationPropertyItems SLitm6 on sl.slPropertyID6=slitm6.slItemID	
left join Symphony_StockLocationPropertyItems SLitm7 on sl.slPropertyID7=slitm7.slItemID	
left join Symphony_stocklocations Originsl on originsl.stockLocationID=His.originStockLocation
left join Symphony_UOM UOM on uom.uomID=sls.uomID 
left join Symphony_DBMChangePolicies dbm on dbm.ID=sls.bufferManagementPolicy 
left join Symphony_MasterSkus MAS on MAS.skuID=sku.skuID
left join Symphony_RetailFamilyAgConnection FAG on FAG.[familyID] = MAS.[familyID]
left join Symphony_LocationAssortmentGroups LAG on LAG.assortmentGroupID = FAG.assortmentGroupID AND LAG.[stockLocationID] = SL.[stockLocationID]
left join Symphony_AssortmentGroups AG on LAG.assortmentGroupID=AG.id
left join Symphony_RetailAgDgConnection AGDG on AGDG.assortmentGroupID = LAG.assortmentGroupID
left join Symphony_DisplayGroups DG on DG.id=AGDG.displayGroupID
where sls.isDeleted=0 and sl.isDeleted=0
GO
/****** Object:  View [dbo].[BI_StockLocations]    Script Date: 4/18/2024 3:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE VIEW [dbo].[BI_StockLocations] 
AS
select sl.stockLocationName [Stock Location Name],
sl.stockLocationID [Stock Location ID],
sl.stocklocationdescription [SL Description],	
SLitm1.slItemName [SL Property 1],
SLitm2.slItemName [SL Property 2],
SLitm3.slItemName [SL Property 3],
SLitm4.slItemName [SL Property 4],
SLitm5.slItemName [SL Property 5],
SLitm6.slItemName [SL Property 6],
SLitm7.slItemName [SL Property 7],
Case 
	when SL.stockLocationType=1 then 'Plant'
	when SL.stockLocationType=2 then 'Supplier'
	when SL.stockLocationType=3 then 'Point of Sale'
	when SL.stockLocationType=4 then 'Transparent'
	when SL.stockLocationType=5 then 'Warehouse'
End [Stock location Type],
--SL.allocationPriority [Store Priority],
SLorigin.stockLocationName [Default Origin]
				
from Symphony_StockLocations SL 
left join Symphony_StockLocationPropertyItems SLitm1 on sl.slPropertyID1=slitm1.slItemID
left join Symphony_StockLocationPropertyItems SLitm2 on sl.slPropertyID2=slitm2.slItemID
left join Symphony_StockLocationPropertyItems SLitm3 on sl.slPropertyID3=slitm3.slItemID	
left join Symphony_StockLocationPropertyItems SLitm4 on sl.slPropertyID4=slitm4.slItemID
left join Symphony_StockLocationPropertyItems SLitm5 on sl.slPropertyID5=slitm5.slItemID
left join Symphony_StockLocationPropertyItems SLitm6 on sl.slPropertyID6=slitm6.slItemID	
left join Symphony_StockLocationPropertyItems SLitm7 on sl.slPropertyID7=slitm7.slItemID
left join Symphony_StockLocations SLOrigin on SLOrigin.stockLocationID=SL.defaultOriginID
where SL.isDeleted=0
				
GO
/****** Object:  Table [dbo].[ALLFILENAMES]    Script Date: 4/18/2024 3:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[ALLFILENAMES](
	[WHICHPATH] [varchar](255) NULL,
	[WHICHFILE] [varchar](255) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Amonths]    Script Date: 4/18/2024 3:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Amonths](
	[month] [char](4) NULL,
	[monthname] [char](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BATCH_WH]    Script Date: 4/18/2024 3:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BATCH_WH](
	[SKU] [nvarchar](100) NULL,
	[SL] [nvarchar](100) NULL,
	[SLoc] [nvarchar](100) NULL,
	[Stock_at_site] [numeric](18, 5) NULL,
	[Batch] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[BULKACT]    Script Date: 4/18/2024 3:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[BULKACT](
	[RAWDATA] [varchar](8000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[CAmonths]    Script Date: 4/18/2024 3:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[CAmonths](
	[month] [char](4) NULL,
	[monthname] [char](5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[cl_mst]    Script Date: 4/18/2024 3:51:30 PM ******/
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
/****** Object:  Table [dbo].[Client_batchinv]    Script Date: 4/18/2024 3:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_batchinv](
	[Year] [nvarchar](10) NULL,
	[Month] [nvarchar](10) NULL,
	[Day] [nvarchar](10) NULL,
	[SKU] [nvarchar](100) NULL,
	[SL] [nvarchar](100) NULL,
	[INV_Site] [nvarchar](100) NULL,
	[Batch] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client_batchinv_dist]    Script Date: 4/18/2024 3:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_batchinv_dist](
	[Year] [nvarchar](10) NULL,
	[Month] [nvarchar](10) NULL,
	[Day] [nvarchar](10) NULL,
	[SKU] [nvarchar](100) NULL,
	[SL] [nvarchar](100) NULL,
	[INV_Site] [nvarchar](100) NULL,
	[Batch] [nvarchar](100) NULL,
	[Distributor_Item_Name] [nvarchar](300) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client_DAILY_TRANSACTIONS_TEMP_HRJ]    Script Date: 4/18/2024 3:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_DAILY_TRANSACTIONS_TEMP_HRJ](
	[TransID] [nvarchar](200) NULL,
	[SAP_validation] [nvarchar](100) NULL,
	[TransType] [nvarchar](100) NULL,
	[Origin] [nvarchar](100) NULL,
	[Destination] [nvarchar](200) NULL,
	[SKUname] [nvarchar](200) NULL,
	[Quantity] [nvarchar](100) NULL,
	[Year] [nvarchar](10) NULL,
	[Month] [nvarchar](10) NULL,
	[Day] [nvarchar](10) NULL,
	[Doc_date] [nvarchar](100) NULL,
	[Doc_ref] [nvarchar](100) NULL,
	[movement] [nvarchar](100) NULL,
	[adjust] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client_daily_TRANSACTIONS_TEMP_hrj_1]    Script Date: 4/18/2024 3:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_daily_TRANSACTIONS_TEMP_hrj_1](
	[TransID] [nvarchar](200) NULL,
	[SAP_validation] [nvarchar](100) NULL,
	[TransType] [nvarchar](100) NULL,
	[Origin] [nvarchar](100) NULL,
	[Destination] [nvarchar](200) NULL,
	[SKUname] [nvarchar](200) NULL,
	[Quantity] [nvarchar](100) NULL,
	[Year] [nvarchar](10) NULL,
	[Month] [nvarchar](10) NULL,
	[Day] [nvarchar](10) NULL,
	[Doc_date] [nvarchar](100) NULL,
	[Doc_Ref] [nvarchar](100) NOT NULL,
	[movement] [nvarchar](100) NULL,
	[Adjust] [nvarchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client_daily_TRANSACTIONS_TEMP_hrj_1_RMC]    Script Date: 4/18/2024 3:51:30 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_daily_TRANSACTIONS_TEMP_hrj_1_RMC](
	[TransID] [nvarchar](200) NULL,
	[SAP_validation] [nvarchar](100) NULL,
	[TransType] [nvarchar](100) NULL,
	[Origin] [nvarchar](100) NULL,
	[Destination] [nvarchar](200) NULL,
	[SKUname] [nvarchar](200) NULL,
	[Quantity] [nvarchar](100) NULL,
	[Year] [nvarchar](10) NULL,
	[Month] [nvarchar](10) NULL,
	[Day] [nvarchar](10) NULL,
	[Doc_date] [nvarchar](100) NULL,
	[Doc_Ref] [nvarchar](100) NOT NULL,
	[movement] [nvarchar](100) NULL,
	[Adjust] [nvarchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client_DAILY_TRANSACTIONS_TEMP_HRJ_RMC]    Script Date: 4/18/2024 3:51:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_DAILY_TRANSACTIONS_TEMP_HRJ_RMC](
	[TransID] [nvarchar](200) NULL,
	[SAP_validation] [nvarchar](100) NULL,
	[TransType] [nvarchar](100) NULL,
	[Origin] [nvarchar](100) NULL,
	[Destination] [nvarchar](200) NULL,
	[SKUname] [nvarchar](200) NULL,
	[Quantity] [nvarchar](100) NULL,
	[Year] [nvarchar](10) NULL,
	[Month] [nvarchar](10) NULL,
	[Day] [nvarchar](10) NULL,
	[Doc_date] [nvarchar](100) NULL,
	[Doc_ref] [nvarchar](100) NULL,
	[movement] [nvarchar](100) NULL,
	[adjust] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client_DIST_SALE_DATA]    Script Date: 4/18/2024 3:51:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_DIST_SALE_DATA](
	[Distributor_code] [nvarchar](100) NULL,
	[Distributor_Name] [nvarchar](200) NULL,
	[Sold_Party] [nvarchar](300) NULL,
	[HRJ_SKU] [nvarchar](200) NULL,
	[Distributor_Item_name] [nvarchar](300) NULL,
	[Qty] [decimal](38, 4) NULL,
	[Year] [nvarchar](100) NULL,
	[Month] [nvarchar](100) NULL,
	[Day] [nvarchar](100) NULL,
	[Division] [nvarchar](100) NULL,
	[Region] [nvarchar](100) NULL,
	[Business] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client_DIST_SALE_DATA_1]    Script Date: 4/18/2024 3:51:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_DIST_SALE_DATA_1](
	[Distributor_code] [nvarchar](100) NULL,
	[Distributor_Name] [nvarchar](200) NULL,
	[Sold_Party] [nvarchar](300) NULL,
	[HRJ_SKU] [nvarchar](200) NULL,
	[Distributor_Item_name] [nvarchar](300) NULL,
	[Qty] [decimal](10, 2) NULL,
	[Year] [nvarchar](100) NULL,
	[Month] [nvarchar](100) NULL,
	[Day] [nvarchar](100) NULL,
	[gen_mm] [varchar](2) NULL,
	[gen_dd] [varchar](2) NULL,
	[gen_date] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client_Parent_child]    Script Date: 4/18/2024 3:51:31 PM ******/
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
/****** Object:  Table [dbo].[Client_Parent_child_daily_tran]    Script Date: 4/18/2024 3:51:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_Parent_child_daily_tran](
	[Parent] [nvarchar](100) NULL,
	[Child] [nvarchar](100) NULL,
	[Priority] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client_Parent_child_daily_tran_RMC]    Script Date: 4/18/2024 3:51:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_Parent_child_daily_tran_RMC](
	[Parent] [nvarchar](100) NULL,
	[Child] [nvarchar](100) NULL,
	[Priority] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client_Parent_child_OSO]    Script Date: 4/18/2024 3:51:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_Parent_child_OSO](
	[Parent] [nvarchar](100) NULL,
	[Child] [nvarchar](100) NULL,
	[Priority] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client_Parent_child_rmc]    Script Date: 4/18/2024 3:51:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_Parent_child_rmc](
	[Parent] [nvarchar](100) NULL,
	[Child] [nvarchar](100) NULL,
	[Priority] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client_PRODUCTION_TEMP_1]    Script Date: 4/18/2024 3:51:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_PRODUCTION_TEMP_1](
	[WorkID] [nvarchar](150) NULL,
	[Plant] [nvarchar](150) NULL,
	[Customer_Code] [nvarchar](150) NULL,
	[Customer_Name] [nvarchar](150) NULL,
	[SKU] [nvarchar](150) NULL,
	[SKU_Desc] [nvarchar](200) NULL,
	[Qty] [decimal](25, 4) NULL,
	[Order_type] [nvarchar](150) NULL,
	[SO_Year] [nvarchar](10) NULL,
	[SO_Month] [nvarchar](10) NULL,
	[SO_Date] [nvarchar](10) NULL,
	[Due_Year] [nvarchar](10) NULL,
	[Due_Month] [nvarchar](10) NULL,
	[Due_Date] [nvarchar](10) NULL,
	[Net_Price] [nvarchar](100) NULL,
	[Year] [nvarchar](10) NULL,
	[Month] [nvarchar](10) NULL,
	[Day] [nvarchar](10) NULL,
	[DC] [nvarchar](20) NULL,
	[Vendor_Code] [nvarchar](150) NULL,
	[Vendor_Name] [nvarchar](150) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client_Replenishemnt_rev]    Script Date: 4/18/2024 3:51:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_Replenishemnt_rev](
	[Stock Location] [nvarchar](100) NULL,
	[SKU] [nvarchar](100) NULL,
	[Replenishment Quantity] [decimal](20, 0) NULL,
	[Origin Stock Location] [nvarchar](100) NULL,
	[VPP] [decimal](20, 2) NULL,
	[BP Color] [varchar](6) NULL,
	[Buffer Size] [decimal](20, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client_Replenishment]    Script Date: 4/18/2024 3:51:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_Replenishment](
	[SL] [nvarchar](100) NOT NULL,
	[SKU] [nvarchar](100) NOT NULL,
	[Repl_Qty] [decimal](20, 0) NULL,
	[Origin_SL] [nvarchar](100) NOT NULL,
	[VPP] [decimal](20, 2) NULL,
	[BP Color] [varchar](6) NULL,
	[Buffer Size] [decimal](20, 0) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client_STATUS_Dist_ftp_t1]    Script Date: 4/18/2024 3:51:31 PM ******/
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
/****** Object:  Table [dbo].[Client_STATUS_TEMP]    Script Date: 4/18/2024 3:51:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_STATUS_TEMP](
	[SKU] [nvarchar](100) NULL,
	[SL] [nvarchar](100) NULL,
	[Year] [nvarchar](10) NULL,
	[Month] [nvarchar](10) NULL,
	[Day] [nvarchar](10) NULL,
	[INV_Site] [decimal](20, 4) NULL,
	[Inv_Transit] [decimal](20, 4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client_STATUS_TEMP_1]    Script Date: 4/18/2024 3:51:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_STATUS_TEMP_1](
	[SKU] [nvarchar](100) NULL,
	[SL] [nvarchar](100) NULL,
	[year] [int] NULL,
	[Month] [int] NULL,
	[Day] [int] NULL,
	[Inv_site] [varchar](1) NOT NULL,
	[Inv_Transit] [decimal](38, 4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client_STATUS_TEMP_1_RMC]    Script Date: 4/18/2024 3:51:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_STATUS_TEMP_1_RMC](
	[SKU] [nvarchar](100) NULL,
	[SL] [nvarchar](100) NULL,
	[year] [int] NULL,
	[Month] [int] NULL,
	[Day] [int] NULL,
	[Inv_site] [decimal](38, 4) NULL,
	[Inv_Transit] [decimal](38, 4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client_STATUS_TEMP_12]    Script Date: 4/18/2024 3:51:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_STATUS_TEMP_12](
	[SKU] [nvarchar](100) NULL,
	[SL] [nvarchar](100) NULL,
	[SLoc] [nvarchar](100) NULL,
	[Year] [nvarchar](10) NULL,
	[Month] [nvarchar](10) NULL,
	[Day] [nvarchar](10) NULL,
	[INV_Site] [nvarchar](100) NULL,
	[Inv_Transit] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client_STATUS_TEMP_2]    Script Date: 4/18/2024 3:51:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_STATUS_TEMP_2](
	[SKU] [nvarchar](100) NULL,
	[Stock_Location] [nvarchar](100) NULL,
	[Year] [nvarchar](10) NULL,
	[Month] [nvarchar](10) NULL,
	[Date] [nvarchar](10) NULL,
	[Inv_at_site_Qty] [varchar](1) NOT NULL,
	[Inv_at_transit_Qty] [decimal](38, 3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client_STATUS_TEMP_5]    Script Date: 4/18/2024 3:51:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_STATUS_TEMP_5](
	[SKU] [nvarchar](100) NULL,
	[Stock_Location] [nvarchar](100) NULL,
	[Year] [nvarchar](10) NULL,
	[Month] [nvarchar](10) NULL,
	[Date] [nvarchar](10) NULL,
	[Inv_at_site_Qty] [decimal](38, 3) NULL,
	[Inv_at_transit_Qty] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client_Status_Temp_combined]    Script Date: 4/18/2024 3:51:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_Status_Temp_combined](
	[SKU] [nvarchar](100) NULL,
	[Stock_Location] [nvarchar](100) NULL,
	[Year] [nvarchar](10) NULL,
	[Month] [nvarchar](10) NULL,
	[Date] [nvarchar](10) NULL,
	[Inv_at_Site_Qty] [nvarchar](30) NULL,
	[Inv_at_Transit_qty] [nvarchar](30) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client_Status_Temp_combined_1]    Script Date: 4/18/2024 3:51:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_Status_Temp_combined_1](
	[SKU] [nvarchar](100) NULL,
	[Stock_Location] [nvarchar](100) NULL,
	[Year] [nvarchar](10) NULL,
	[Month] [nvarchar](10) NULL,
	[Date] [nvarchar](10) NULL,
	[Inv_at_Site_Qty] [nvarchar](30) NULL,
	[Inv_at_Transit_qty] [nvarchar](30) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client_Status_Temp_combined_n1]    Script Date: 4/18/2024 3:51:31 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_Status_Temp_combined_n1](
	[SKU] [nvarchar](100) NULL,
	[Stock_Location] [nvarchar](100) NULL,
	[Year] [nvarchar](10) NULL,
	[Month] [nvarchar](10) NULL,
	[Date] [nvarchar](10) NULL,
	[Inv_at_Site_Qty] [nvarchar](30) NULL,
	[Inv_at_Transit_qty] [nvarchar](30) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client_Status_Temp_combined_n1_1]    Script Date: 4/18/2024 3:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_Status_Temp_combined_n1_1](
	[SKU] [nvarchar](100) NULL,
	[Stock_Location] [nvarchar](100) NULL,
	[Year] [nvarchar](10) NULL,
	[Month] [nvarchar](10) NULL,
	[Date] [nvarchar](10) NULL,
	[Inv_at_Site_Qty] [nvarchar](30) NULL,
	[Inv_at_Transit_qty] [nvarchar](30) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client_STATUS_TEMP_Dist_ftp]    Script Date: 4/18/2024 3:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_STATUS_TEMP_Dist_ftp](
	[SKU] [nvarchar](100) NULL,
	[SL] [nvarchar](100) NULL,
	[Year] [nvarchar](10) NULL,
	[Month] [nvarchar](10) NULL,
	[Day] [nvarchar](10) NULL,
	[INV_Site] [nvarchar](100) NULL,
	[Inv_Transit] [nvarchar](100) NULL,
	[Dist_SKU] [nvarchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client_STATUS_TEMP_Dist_ftp_mts_update]    Script Date: 4/18/2024 3:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_STATUS_TEMP_Dist_ftp_mts_update](
	[SKU] [nvarchar](100) NULL,
	[SL] [nvarchar](100) NULL,
	[Year] [nvarchar](10) NULL,
	[Month] [nvarchar](10) NULL,
	[Day] [nvarchar](10) NULL,
	[INV_Site] [nvarchar](100) NULL,
	[Inv_Transit] [nvarchar](100) NULL,
	[Dist_SKU] [nvarchar](500) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client_STATUS_TEMP_Excep]    Script Date: 4/18/2024 3:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_STATUS_TEMP_Excep](
	[SKU] [nvarchar](100) NULL,
	[SL] [nvarchar](100) NULL,
	[Year] [nvarchar](10) NULL,
	[Month] [nvarchar](10) NULL,
	[Day] [nvarchar](10) NULL,
	[INV_Site] [nvarchar](100) NULL,
	[Inv_Transit] [nvarchar](100) NULL,
	[Dist_code] [nvarchar](400) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client_STATUS_TEMP_RM]    Script Date: 4/18/2024 3:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_STATUS_TEMP_RM](
	[SKU] [nvarchar](100) NULL,
	[Stock_Location] [nvarchar](100) NULL,
	[Year] [nvarchar](10) NULL,
	[Month] [nvarchar](10) NULL,
	[Date] [nvarchar](10) NULL,
	[INV_at_Site_Qty] [nvarchar](100) NULL,
	[Inv_at_Transit_qty] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client_STATUS_TEMP_RM_1]    Script Date: 4/18/2024 3:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_STATUS_TEMP_RM_1](
	[SKU] [nvarchar](100) NULL,
	[Stock_Location] [nvarchar](100) NULL,
	[Year] [nvarchar](10) NULL,
	[Month] [nvarchar](10) NULL,
	[Date] [nvarchar](10) NULL,
	[INV_at_Site_Qty] [nvarchar](100) NULL,
	[Inv_at_Transit_qty] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client_STATUS_TEMP_RMC]    Script Date: 4/18/2024 3:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_STATUS_TEMP_RMC](
	[SKU] [nvarchar](100) NULL,
	[SL] [nvarchar](100) NULL,
	[Year] [nvarchar](10) NULL,
	[Month] [nvarchar](10) NULL,
	[Day] [nvarchar](10) NULL,
	[INV_Site] [decimal](20, 4) NULL,
	[Inv_Transit] [decimal](20, 4) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client_table_transanctions_csvout]    Script Date: 4/18/2024 3:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_table_transanctions_csvout](
	[Type] [varchar](10) NULL,
	[SourceStockLocation_id] [varchar](50) NULL,
	[SourceStockLocation_Name] [varchar](200) NULL,
	[DestinationStockLocation_id] [varchar](50) NULL,
	[DestinationStockLocation_Name] [varchar](200) NULL,
	[Adjust_inventory] [int] NULL,
	[SKU_id] [varchar](50) NULL,
	[SKU_Name] [varchar](200) NULL,
	[Quantity] [varchar](50) NULL,
	[CustomerOrderID] [varchar](20) NULL,
	[ReportedDateYear] [int] NULL,
	[ReportedDateMonth] [int] NULL,
	[ReportedDateDay] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[client_temp_batch_inv]    Script Date: 4/18/2024 3:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[client_temp_batch_inv](
	[SKU] [nvarchar](100) NULL,
	[SL] [nvarchar](100) NULL,
	[batch] [nvarchar](100) NULL,
	[year] [nvarchar](10) NULL,
	[month] [nvarchar](10) NULL,
	[Date] [nvarchar](10) NULL,
	[Inv_at_site_Qty] [decimal](20, 3) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client_temp_Calendar_1]    Script Date: 4/18/2024 3:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_temp_Calendar_1](
	[DAYY] [nvarchar](100) NULL,
	[DAYY_1] [int] NULL,
	[STORE] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client_Temp_Location_Change]    Script Date: 4/18/2024 3:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_Temp_Location_Change](
	[Actual_Location_in_Input_file] [nvarchar](100) NULL,
	[To_be_changed_Location] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client_Temp_UpdateSKUs_HRJ_Pendi_1]    Script Date: 4/18/2024 3:51:32 PM ******/
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
/****** Object:  Table [dbo].[Client_Temp_UpdateSKUs_HRJ_Pendi_2]    Script Date: 4/18/2024 3:51:32 PM ******/
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
/****** Object:  Table [dbo].[Client_Temp_UpdateSKUs_HRJ_Pendi_3]    Script Date: 4/18/2024 3:51:32 PM ******/
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
/****** Object:  Table [dbo].[client_temp_WO_detail]    Script Date: 4/18/2024 3:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[client_temp_WO_detail](
	[Client_SL] [nvarchar](100) NOT NULL,
	[Plant] [nvarchar](100) NULL,
	[skuName] [nvarchar](100) NULL,
	[Parent_code] [nvarchar](100) NULL,
	[quantity] [numeric](18, 5) NULL,
	[bufferColor] [tinyint] NULL,
	[woid] [nvarchar](50) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client_Trans_TEMP_Dist_ftp]    Script Date: 4/18/2024 3:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_Trans_TEMP_Dist_ftp](
	[TransID] [nvarchar](100) NULL,
	[SAP_validation] [nvarchar](100) NULL,
	[TransType] [nvarchar](10) NULL,
	[Origin] [nvarchar](100) NULL,
	[Destination] [nvarchar](100) NULL,
	[SKUName] [nvarchar](100) NULL,
	[Quantity] [decimal](10, 4) NULL,
	[Year] [nvarchar](10) NULL,
	[Month] [nvarchar](10) NULL,
	[Day] [nvarchar](10) NULL,
	[Doc_date] [nvarchar](100) NULL,
	[Doc_ref] [nvarchar](100) NULL,
	[movement] [nvarchar](100) NULL,
	[adjust] [nvarchar](100) NULL,
	[Dist_SKU] [nvarchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client_Trans_TEMP_Dist_ftpdata]    Script Date: 4/18/2024 3:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_Trans_TEMP_Dist_ftpdata](
	[TransID] [nvarchar](100) NULL,
	[SAP_validation] [nvarchar](100) NOT NULL,
	[TransType] [nvarchar](10) NULL,
	[Origin] [nvarchar](100) NULL,
	[Destination] [nvarchar](100) NULL,
	[SKUName] [nvarchar](100) NULL,
	[Quantity] [decimal](10, 4) NULL,
	[year] [int] NULL,
	[Month] [int] NULL,
	[Day] [int] NULL,
	[Doc_date] [nvarchar](100) NOT NULL,
	[Doc_ref] [nvarchar](100) NULL,
	[movement] [nvarchar](100) NOT NULL,
	[adjust] [nvarchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client_TRANSACTIONS_TEMP]    Script Date: 4/18/2024 3:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_TRANSACTIONS_TEMP](
	[TransID] [nvarchar](100) NULL,
	[SAP_validation] [nvarchar](100) NULL,
	[TransType] [nvarchar](100) NULL,
	[Origin] [nvarchar](100) NULL,
	[Destination] [nvarchar](100) NULL,
	[SKUName] [nvarchar](100) NULL,
	[Quantity] [numeric](18, 5) NULL,
	[Year] [nvarchar](10) NULL,
	[Month] [nvarchar](10) NULL,
	[Day] [nvarchar](10) NULL,
	[Doc_date] [nvarchar](100) NULL,
	[Doc_ref] [nvarchar](100) NULL,
	[movement] [nvarchar](100) NULL,
	[adjust] [nvarchar](100) NULL,
	[Dist_name] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client_TRANSACTIONS_TEMP_ftp]    Script Date: 4/18/2024 3:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_TRANSACTIONS_TEMP_ftp](
	[TransID] [nvarchar](200) NULL,
	[SAP_validation] [nvarchar](100) NULL,
	[TransType] [nvarchar](100) NULL,
	[Origin] [nvarchar](100) NULL,
	[Destination] [nvarchar](200) NULL,
	[SKUname] [nvarchar](200) NULL,
	[Quantity] [numeric](18, 5) NULL,
	[Year] [nvarchar](10) NULL,
	[Month] [nvarchar](10) NULL,
	[Day] [nvarchar](10) NULL,
	[Doc_date] [nvarchar](100) NULL,
	[Doc_ref] [nvarchar](100) NULL,
	[movement] [nvarchar](100) NULL,
	[adjust] [nvarchar](100) NULL,
	[Dist_name] [nvarchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client_TRANSACTIONS_TEMP_ftpdata]    Script Date: 4/18/2024 3:51:32 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Client_TRANSACTIONS_TEMP_ftpdata](
	[TransID] [nvarchar](200) NULL,
	[SAP_validation] [nvarchar](100) NULL,
	[TransType] [nvarchar](100) NULL,
	[Origin] [nvarchar](100) NULL,
	[Destination] [nvarchar](200) NULL,
	[SKUname] [nvarchar](200) NULL,
	[Quantity] [numeric](18, 5) NULL,
	[Year] [nvarchar](10) NULL,
	[Month] [nvarchar](10) NULL,
	[Day] [nvarchar](10) NULL,
	[Doc_date] [nvarchar](100) NULL,
	[Doc_ref] [nvarchar](100) NULL,
	[movement] [nvarchar](100) NULL,
	[adjust] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Client_VendorEmailTable]    Script Date: 4/18/2024 3:51:33 PM ******/
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
/****** Object:  Table [dbo].[Dealer_wise_Data]    Script Date: 4/18/2024 3:51:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Dealer_wise_Data](
	[Region] [nvarchar](100) NULL,
	[Dealer code] [nvarchar](100) NOT NULL,
	[Customer_Name] [nvarchar](1000) NULL,
	[HRJ SKU code] [nvarchar](100) NULL,
	[HRJ Parent SKU code] [nvarchar](100) NULL,
	[HRJ SKU Description] [nvarchar](1000) NULL,
	[Dealer's SKU Description] [nvarchar](100) NULL,
	[Division] [nvarchar](100) NULL,
	[bufferSize] [numeric](18, 5) NOT NULL,
	[inventoryAtSite] [numeric](18, 5) NOT NULL,
	[InventoryAtTransit] [numeric](18, 5) NOT NULL,
	[Suggested Replenishment Qty] [numeric](18, 5) NOT NULL,
	[Suggested Replenishment Qty in M2] [numeric](29, 8) NOT NULL,
	[Parent code SiteColor] [varchar](6) NULL,
	[Parent code TransitColor] [varchar](6) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Final_List]    Script Date: 4/18/2024 3:51:33 PM ******/
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
/****** Object:  Table [dbo].[HRJ_EmailData_Send]    Script Date: 4/18/2024 3:51:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[HRJ_EmailData_Send](
	[Region] [nvarchar](100) NULL,
	[Dealer code] [nvarchar](100) NOT NULL,
	[Customer_Name] [nvarchar](1000) NULL,
	[HRJ SKU code] [nvarchar](100) NULL,
	[HRJ Parent SKU code] [nvarchar](100) NULL,
	[HRJ SKU Description] [nvarchar](1000) NULL,
	[Dealer's SKU Description] [nvarchar](100) NULL,
	[Division] [nvarchar](100) NULL,
	[bufferSize] [nvarchar](100) NULL,
	[inventoryAtSite] [nvarchar](100) NULL,
	[InventoryAtTransit] [nvarchar](100) NULL,
	[Suggested Replenishment Qty] [nvarchar](100) NULL,
	[Suggested Replenishment Qty in M2] [nvarchar](100) NULL,
	[Parent code SiteColor] [nvarchar](100) NULL,
	[Parent code TransitColor] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[newTempTable1]    Script Date: 4/18/2024 3:51:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[newTempTable1](
	[RowNo] [bigint] NULL,
	[ID1] [int] NULL,
	[splitMonth] [varchar](50) NULL,
	[count] [int] NULL,
	[skuId] [varchar](50) NULL,
	[Annual_Bdgt] [bigint] NULL,
	[Current_Bdgt] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[newTempTable2]    Script Date: 4/18/2024 3:51:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[newTempTable2](
	[ID1] [int] NULL,
	[splitMonth] [varchar](50) NULL,
	[Fin_month] [int] NULL,
	[count] [int] NULL,
	[skuId] [varchar](50) NULL,
	[Annual_Bdgt] [bigint] NULL,
	[Current_Bdgt] [bigint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Parent_Child_Checked]    Script Date: 4/18/2024 3:51:33 PM ******/
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
/****** Object:  Table [dbo].[SA_sku_sl_data]    Script Date: 4/18/2024 3:51:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SA_sku_sl_data](
	[stockLocationID] [int] NOT NULL,
	[skuID] [int] NOT NULL,
	[originStockLocation] [int] NULL,
	[inventoryAtTransit] [numeric](18, 5) NOT NULL,
	[inventoryAtSite] [numeric](18, 5) NOT NULL,
	[inventoryAtProduction] [numeric](18, 5) NOT NULL,
	[inventoryNeeded] [numeric](18, 5) NOT NULL,
	[replenishmentQuantity] [numeric](18, 5) NOT NULL,
	[toReplenish] [int] NOT NULL,
	[sentToReplenishment] [bit] NOT NULL,
	[avoidReplenishment] [bit] NOT NULL,
	[bufferSize] [numeric](18, 5) NOT NULL,
	[replenishmentPriority] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[SFtempTable]    Script Date: 4/18/2024 3:51:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[SFtempTable](
	[stockLocationID] [int] NULL,
	[familyID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_AccessItems]    Script Date: 4/18/2024 3:51:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_AccessItems](
	[AccessItemID] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[GroupID] [decimal](18, 0) NULL,
	[Type] [int] NULL,
	[Permission] [int] NULL,
	[DataFilterDisplayString] [nvarchar](3900) NULL,
	[DataFilterSerialized] [image] NULL,
 CONSTRAINT [PK_Symphony_AccessItems] PRIMARY KEY CLUSTERED 
(
	[AccessItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_AGsProperty]    Script Date: 4/18/2024 3:51:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_AGsProperty](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[agPropertyID] [nvarchar](50) NOT NULL,
	[agPropertyName] [nvarchar](100) NULL,
	[agPropertyDescription] [nvarchar](1000) NULL,
	[propType] [tinyint] NOT NULL,
	[autoAddNewItem] [bit] NOT NULL,
 CONSTRAINT [PK_Symphony_AGsProperty] PRIMARY KEY CLUSTERED 
(
	[agPropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_AllocationMatrixPropertiesOrder]    Script Date: 4/18/2024 3:51:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_AllocationMatrixPropertiesOrder](
	[propertyId] [nvarchar](50) NULL,
	[propertyType] [tinyint] NULL,
	[position] [tinyint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_AssortmentGroupHistory]    Script Date: 4/18/2024 3:51:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_AssortmentGroupHistory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[date] [smalldatetime] NOT NULL,
	[stockLocationID] [int] NOT NULL,
	[displayGroupID] [int] NULL,
	[assortmentGroupID] [int] NOT NULL,
	[familyCount] [int] NOT NULL,
	[validFamilyCount] [int] NOT NULL,
	[expiredInvalidFamilyCount] [int] NOT NULL,
	[varietyTarget] [int] NOT NULL,
	[minTarget] [int] NULL,
	[maxTarget] [int] NULL,
	[averageConsumptionAG] [decimal](18, 5) NULL,
	[averageConsumptionDG] [decimal](18, 5) NULL,
	[totalInventory] [decimal](18, 5) NULL,
	[inventoryAtSite] [decimal](18, 5) NULL,
	[varietyGap] [int] NOT NULL,
	[spaceTarget] [int] NULL,
	[validFamiliesConsumption] [decimal](18, 5) NULL,
	[newlyInvalidFamConsumption] [decimal](18, 5) NULL,
	[expiredInvalidFamConsumption] [decimal](18, 5) NULL,
 CONSTRAINT [PK_Symphony_Symphony_AssortmentGroupHistory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [UK_Symphony_Symphony_AssortmentGroupHistory_SL_AG] UNIQUE NONCLUSTERED 
(
	[date] ASC,
	[stockLocationID] ASC,
	[assortmentGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_AssortmentGroupVarietyRecommendations]    Script Date: 4/18/2024 3:51:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_AssortmentGroupVarietyRecommendations](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[updateDate] [smalldatetime] NOT NULL,
	[creationDate] [smalldatetime] NOT NULL,
	[stockLocationID] [int] NOT NULL,
	[displayGroupID] [int] NULL,
	[assortmentGroupID] [int] NOT NULL,
	[inSeasonality] [bit] NOT NULL,
	[recommendedVarietyTarget] [int] NULL,
	[recommendedSpaceTarget] [int] NULL,
	[status] [tinyint] NOT NULL,
	[recommendationType] [tinyint] NOT NULL,
	[eventType] [smallint] NULL,
	[salesPerformance] [decimal](18, 5) NULL,
	[DTMBenchmark] [decimal](18, 5) NULL,
	[increaseVariety] [tinyint] NULL,
	[suggestedVarietyTarget] [int] NULL,
	[calculatedVarietyTarget] [int] NULL,
 CONSTRAINT [PK_Symphony_AssortmentGroupVarietyRecommendations] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [UK_Symphony_AssortmentGroupVarietyRecommendations] UNIQUE NONCLUSTERED 
(
	[stockLocationID] ASC,
	[assortmentGroupID] ASC,
	[eventType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_AssortmentReplenishmentRecommendations]    Script Date: 4/18/2024 3:51:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_AssortmentReplenishmentRecommendations](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[parentID] [int] NULL,
	[hasChildren] [bit] NOT NULL,
	[originalLocationCatalogID] [int] NOT NULL,
	[originalInventoryNeeded] [decimal](18, 5) NOT NULL,
	[originalDaysAtStockLocation] [int] NOT NULL,
	[locationCatalogID] [int] NOT NULL,
	[isConfirmed] [bit] NOT NULL,
	[inventoryNeeded] [decimal](18, 5) NOT NULL,
	[inventoryInPipeline] [decimal](18, 5) NOT NULL,
	[replenishmentModeID] [tinyint] NOT NULL,
	[showInReport] [bit] NOT NULL,
	[creationDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Symphony_AssortmentReplenishmentRecommendations] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_AssortmentReplenishmentRecommendationsTmp]    Script Date: 4/18/2024 3:51:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_AssortmentReplenishmentRecommendationsTmp](
	[skuID] [int] NOT NULL,
	[stockLocationID] [int] NOT NULL,
	[locationCatalogID] [int] NOT NULL,
	[inventoryNeeded] [decimal](18, 5) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_AssortmentReplenishmentTracking]    Script Date: 4/18/2024 3:51:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_AssortmentReplenishmentTracking](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[skuID] [int] NOT NULL,
	[stockLocationID] [int] NOT NULL,
	[receivedDate] [smalldatetime] NULL,
	[orderedDate] [smalldatetime] NOT NULL,
	[quantity] [decimal](18, 5) NOT NULL,
	[inventoryNeeded] [decimal](18, 5) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_Aux_AssortmentGroupsNewness]    Script Date: 4/18/2024 3:51:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_Aux_AssortmentGroupsNewness](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[stockLocationID] [int] NOT NULL,
	[assortmentGroupID] [int] NOT NULL,
	[newNess] [decimal](18, 5) NULL,
 CONSTRAINT [PK_Symphony_Aux_AssortmentGroupsNewness] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_Aux_DisplayGroupFamilies]    Script Date: 4/18/2024 3:51:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_Aux_DisplayGroupFamilies](
	[skuID] [int] NULL,
	[familyID] [int] NULL,
	[displayGroupID] [int] NULL,
	[assortmentGroupID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_Aux_RetailFamilyStockLocation]    Script Date: 4/18/2024 3:51:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_Aux_RetailFamilyStockLocation](
	[familyID] [int] NULL,
	[familyDescription] [nvarchar](150) NULL,
	[stockLocationID] [int] NOT NULL,
	[assortmentGroupID] [int] NULL,
	[displayGroupID] [int] NULL,
	[SLSOrigLoc] [int] NULL,
	[slPropertyID1] [int] NULL,
	[slPropertyID2] [int] NULL,
	[slPropertyID3] [int] NULL,
	[slPropertyID4] [int] NULL,
	[slPropertyID5] [int] NULL,
	[slPropertyID6] [int] NULL,
	[slPropertyID7] [int] NULL,
	[AGTarget] [int] NULL,
	[AGSpaceTarget] [int] NULL,
	[SumInventoryAtPipe] [numeric](18, 5) NOT NULL,
	[SumBufferSize] [numeric](18, 5) NOT NULL,
	[SumInventoryAtSite] [numeric](18, 5) NOT NULL,
	[TotalSpace] [numeric](18, 5) NOT NULL,
	[groupID] [int] NULL,
	[DisplaySkus] [int] NULL,
	[ShelfAge] [smallint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_Aux_RetailStockLocationSku]    Script Date: 4/18/2024 3:51:33 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_Aux_RetailStockLocationSku](
	[slsID] [bigint] NOT NULL,
	[stockLocationID] [int] NOT NULL,
	[displayGroupID] [int] NULL,
	[assortmentGroupID] [int] NULL,
	[familyID] [int] NULL,
	[skuID] [int] NOT NULL,
	[decile] [int] NULL,
	[salesEstimation] [decimal](18, 5) NULL,
	[monthlyConsumption] [decimal](18, 5) NULL,
 CONSTRAINT [PK_Aux_RetailStockLocationSku] PRIMARY KEY CLUSTERED 
(
	[slsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_Aux_SalesRankingSLPropertyItems]    Script Date: 4/18/2024 3:51:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_Aux_SalesRankingSLPropertyItems](
	[ID] [int] IDENTITY(-1,1) NOT NULL,
	[stockLocationID] [int] NOT NULL,
	[propertyItemID] [int] NULL,
 CONSTRAINT [PK_Aux_SalesRankingSLPropertyItems] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_Aux_SLSkusToReplenishment]    Script Date: 4/18/2024 3:51:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_Aux_SLSkusToReplenishment](
	[stockLocationID] [int] NULL,
	[skuID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_BufferSizeTraceability]    Script Date: 4/18/2024 3:51:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_BufferSizeTraceability](
	[bufferSizeTraceabilityID] [int] IDENTITY(1,1) NOT NULL,
	[userName] [nvarchar](100) NULL,
	[algorithmReportName] [tinyint] NULL,
	[stockLocationID] [int] NULL,
	[skuID] [int] NULL,
	[uomID] [int] NULL,
	[date] [smalldatetime] NULL,
	[oldBufferSize] [numeric](18, 5) NULL,
	[symphonySuggestedBufferSize] [numeric](18, 5) NULL,
	[requestedNewBufferSize] [numeric](18, 5) NULL,
	[newBufferSize] [numeric](18, 5) NULL,
	[rejectionReason] [tinyint] NULL,
	[isAvoidedBufferChange] [bit] NOT NULL,
	[tooMuchRedWarning] [tinyint] NULL,
	[eventName] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Index [IDX_Symphony_BufferSizeTraceability]    Script Date: 4/18/2024 3:51:34 PM ******/
CREATE CLUSTERED INDEX [IDX_Symphony_BufferSizeTraceability] ON [dbo].[Symphony_BufferSizeTraceability]
(
	[stockLocationID] ASC,
	[skuID] ASC,
	[date] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_BuildNumber]    Script Date: 4/18/2024 3:51:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_BuildNumber](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[updateDate] [smalldatetime] NOT NULL,
	[dbBuildNumber] [nvarchar](100) NULL,
	[serverBuildNumber] [nvarchar](100) NULL,
	[webDbBuildNumber] [nvarchar](100) NULL,
	[webBuildNumber] [nvarchar](100) NULL,
 CONSTRAINT [PK_Symphony_BuildNumber] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_CalcSLFamily]    Script Date: 4/18/2024 3:51:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_CalcSLFamily](
	[stockLocationID] [int] NOT NULL,
	[familyid] [int] NOT NULL,
 CONSTRAINT [PK_Symphony_CalcSLFamily] PRIMARY KEY CLUSTERED 
(
	[stockLocationID] ASC,
	[familyid] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_Calendar]    Script Date: 4/18/2024 3:51:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_Calendar](
	[CalendarID] [int] IDENTITY(1,1) NOT NULL,
	[CalendarName] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Calendar] PRIMARY KEY CLUSTERED 
(
	[CalendarID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_CalendarAnnualyDays]    Script Date: 4/18/2024 3:51:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_CalendarAnnualyDays](
	[CalendarID] [int] NOT NULL,
	[Month] [int] NOT NULL,
	[day] [int] NOT NULL,
 CONSTRAINT [PK_CalendarAnnualyDays] PRIMARY KEY CLUSTERED 
(
	[CalendarID] ASC,
	[Month] ASC,
	[day] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_CalendarDays]    Script Date: 4/18/2024 3:51:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_CalendarDays](
	[CalendarID] [int] NOT NULL,
	[nonWorkingDay] [datetime] NOT NULL,
 CONSTRAINT [PK_CalendarDays] PRIMARY KEY CLUSTERED 
(
	[CalendarID] ASC,
	[nonWorkingDay] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_Calendars]    Script Date: 4/18/2024 3:51:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_Calendars](
	[calenderID] [int] IDENTITY(1,1) NOT NULL,
	[calenderName] [nvarchar](100) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_CalendarWeeklyDays]    Script Date: 4/18/2024 3:51:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_CalendarWeeklyDays](
	[CalendarID] [int] NOT NULL,
	[DayOfWeek] [nvarchar](20) NOT NULL,
 CONSTRAINT [PK_CalendarWeeklyDays] PRIMARY KEY CLUSTERED 
(
	[CalendarID] ASC,
	[DayOfWeek] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_CatalogSkus]    Script Date: 4/18/2024 3:51:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_CatalogSkus](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[skuID] [int] NOT NULL,
	[skuDescription] [nvarchar](100) NULL,
	[uomID] [int] NOT NULL,
	[categoryID] [int] NOT NULL,
	[skuGroupID] [int] NULL,
	[updateDate] [smalldatetime] NOT NULL,
	[skuPropertyID1] [int] NULL,
	[skuPropertyID2] [int] NULL,
	[skuPropertyID3] [int] NULL,
	[skuPropertyID4] [int] NULL,
	[skuPropertyID5] [int] NULL,
	[skuPropertyID6] [int] NULL,
	[skuPropertyID7] [int] NULL,
	[custom_num1] [decimal](18, 5) NULL,
	[custom_num2] [decimal](18, 5) NULL,
	[custom_num3] [decimal](18, 5) NULL,
	[custom_num4] [decimal](18, 5) NULL,
	[custom_num5] [decimal](18, 5) NULL,
	[custom_num6] [decimal](18, 5) NULL,
	[custom_num7] [decimal](18, 5) NULL,
	[custom_num8] [decimal](18, 5) NULL,
	[custom_num9] [decimal](18, 5) NULL,
	[custom_num10] [decimal](18, 5) NULL,
	[custom_txt1] [nvarchar](100) NULL,
	[custom_txt2] [nvarchar](100) NULL,
	[custom_txt3] [nvarchar](100) NULL,
	[custom_txt4] [nvarchar](100) NULL,
	[custom_txt5] [nvarchar](100) NULL,
	[custom_txt6] [nvarchar](100) NULL,
	[custom_txt7] [nvarchar](100) NULL,
	[custom_txt8] [nvarchar](100) NULL,
	[custom_txt9] [nvarchar](100) NULL,
	[custom_txt10] [nvarchar](100) NULL,
 CONSTRAINT [PK_Symphony_CatalogSkus] PRIMARY KEY CLUSTERED 
(
	[skuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_Categories]    Script Date: 4/18/2024 3:51:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_Categories](
	[categoryID] [int] IDENTITY(1,1) NOT NULL,
	[categoryName] [nvarchar](100) NOT NULL,
	[categoryDescription] [nvarchar](200) NULL,
 CONSTRAINT [PK_Symphony_Categories] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_CCRs]    Script Date: 4/18/2024 3:51:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_CCRs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[ccrName] [nvarchar](50) NOT NULL,
	[plantID] [int] NOT NULL,
	[regularMinBar] [float] NULL,
	[regularMaxBar] [float] NULL,
	[fastMinBar] [float] NULL,
	[fastMaxBar] [float] NULL,
	[superFastMinBar] [float] NULL,
	[superFastMaxBar] [float] NULL,
	[reservedMTS] [float] NOT NULL,
	[reservedFast] [float] NOT NULL,
	[reservedSuperFast] [float] NOT NULL,
	[reservedStrategic] [float] NOT NULL,
	[redBlackMaxBar] [float] NULL,
	[redBlackMinBar] [float] NULL,
	[workingHoursSunday] [float] NOT NULL,
	[workingHoursMonday] [float] NOT NULL,
	[workingHoursTuesday] [float] NOT NULL,
	[workingHoursWednesday] [float] NOT NULL,
	[workingHoursThursday] [float] NOT NULL,
	[workingHoursFriday] [float] NOT NULL,
	[workingHoursSaturday] [float] NOT NULL,
	[firstAvailableDate] [smalldatetime] NULL,
	[elevationTime] [int] NULL,
	[elevationAlertBuffer] [int] NULL,
	[elevationAlertBP] [numeric](21, 5) NULL,
	[elevationAlertBufferRed] [numeric](21, 5) NULL,
	[tractionHorizon] [int] NULL,
	[executionHorizon] [int] NULL,
	[superFastLongHorizon] [int] NOT NULL,
	[fastLongHorizon] [int] NOT NULL,
	[standardLongHorizon] [int] NOT NULL,
	[mtsLongHorizon] [int] NOT NULL,
	[strategicLongHorizon] [int] NOT NULL,
 CONSTRAINT [PK_Symphony_CCRs] PRIMARY KEY CLUSTERED 
(
	[ccrName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_ClientOrder]    Script Date: 4/18/2024 3:51:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_ClientOrder](
	[clientOrderID] [nvarchar](50) NOT NULL,
	[clientOrderDescription] [nvarchar](100) NULL,
	[clientSaleOrderID] [nvarchar](50) NULL,
	[skuID] [int] NOT NULL,
	[destinationID] [int] NOT NULL,
	[client] [nvarchar](100) NULL,
	[clientDescription] [nvarchar](50) NULL,
	[dueDate] [smalldatetime] NULL,
	[orderPrice] [numeric](21, 5) NULL,
	[orderTVC] [numeric](21, 5) NULL,
	[orderThroughput] [numeric](21, 5) NULL,
	[quantity] [numeric](21, 5) NULL,
	[reportedDate] [smalldatetime] NULL,
	[orderRoute] [varbinary](max) NULL,
	[timeBuffer] [int] NULL,
	[currentOrderPosition] [smallint] NOT NULL,
	[isCurrentTransactionOut] [bit] NOT NULL,
	[uomID] [int] NULL,
	[bufferPenetration] [numeric](21, 5) NOT NULL,
	[bpColor] [tinyint] NOT NULL,
	[notes] [nvarchar](500) NULL,
	[notesReplenishment] [nvarchar](4000) NULL,
	[waitingForDelivery] [bit] NOT NULL,
	[status] [tinyint] NOT NULL,
	[needToProduceRepOrder] [smallint] NULL,
	[quantityToReplenish] [numeric](21, 5) NULL,
	[replinshmentDestination] [int] NULL,
	[replinshmentSource] [int] NULL,
	[sentToReplenishment] [bit] NOT NULL,
	[toReplenish] [int] NOT NULL,
	[avoidReplenishment] [bit] NOT NULL,
	[productuionDueDate] [smalldatetime] NULL,
	[Symphony_ClientOrder] [int] NULL,
	[skuLifeCycleStatus] [tinyint] NULL,
 CONSTRAINT [PK_Symphony_ClientOrder] PRIMARY KEY CLUSTERED 
(
	[clientOrderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_ConformanceViolationCounts]    Script Date: 4/18/2024 3:51:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_ConformanceViolationCounts](
	[filterID] [int] NOT NULL,
	[violationType] [smallint] NOT NULL,
	[totalCount] [int] NULL,
	[violationsCount] [int] NOT NULL,
	[updateDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Symphony_ConformanceViolationCounts] PRIMARY KEY CLUSTERED 
(
	[filterID] ASC,
	[violationType] ASC,
	[updateDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_ConnectionLog]    Script Date: 4/18/2024 3:51:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_ConnectionLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[loginDate] [datetime] NULL,
	[logoutDate] [datetime] NULL,
	[IP] [nvarchar](100) NULL,
	[userName] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_ConsumptionSummaries]    Script Date: 4/18/2024 3:51:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_ConsumptionSummaries](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[skuID] [int] NOT NULL,
	[stockLocationID] [int] NOT NULL,
	[year] [smallint] NOT NULL,
	[month] [tinyint] NOT NULL,
	[consumption] [decimal](18, 5) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_ConsumptionSummariesEx]    Script Date: 4/18/2024 3:51:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_ConsumptionSummariesEx](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[rowType] [tinyint] NOT NULL,
	[skuID] [int] NOT NULL,
	[regionID] [int] NULL,
	[stockLocationID] [smallint] NULL,
	[stockLocationCount] [int] NULL,
	[year] [smallint] NOT NULL,
	[month] [tinyint] NOT NULL,
	[consumption] [decimal](18, 5) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_ConsumptionSummariesTemp]    Script Date: 4/18/2024 3:51:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_ConsumptionSummariesTemp](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[skuID] [int] NOT NULL,
	[stockLocationID] [int] NOT NULL,
	[year] [smallint] NOT NULL,
	[month] [tinyint] NOT NULL,
	[consumption] [decimal](18, 5) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_CustomReports]    Script Date: 4/18/2024 3:51:34 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_CustomReports](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NULL,
	[description] [nvarchar](100) NULL,
	[query] [nvarchar](max) NULL,
	[userID] [int] NULL,
	[userName] [nvarchar](400) NULL,
	[date] [smalldatetime] NULL,
	[export] [tinyint] NULL,
	[outputName] [nvarchar](100) NULL,
	[outputFolder] [nvarchar](250) NULL,
 CONSTRAINT [PK_Symphony_CustomReports] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_CustomReportsUsers]    Script Date: 4/18/2024 3:51:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_CustomReportsUsers](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[userID] [int] NOT NULL,
	[reportID] [int] NOT NULL,
	[assigned] [tinyint] NULL,
 CONSTRAINT [PK_Symphony_CustomReportsUsers_1] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_DailyDBMRecommendationReaction]    Script Date: 4/18/2024 3:51:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_DailyDBMRecommendationReaction](
	[stockLocationID] [int] NOT NULL,
	[skuID] [int] NOT NULL,
	[react] [bit] NOT NULL,
	[disappear] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_dailyMtoLtReport]    Script Date: 4/18/2024 3:51:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_dailyMtoLtReport](
	[finishDate] [smalldatetime] NOT NULL,
	[plantID] [int] NOT NULL,
	[productionFamily] [int] NOT NULL,
	[actualLeadTime] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_DailySkuAgeTrackingDates]    Script Date: 4/18/2024 3:51:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_DailySkuAgeTrackingDates](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[skuID] [int] NOT NULL,
	[stockLocationID] [int] NOT NULL,
	[inDate] [smalldatetime] NOT NULL,
	[quantity] [decimal](18, 5) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_DashboardItemLinks]    Script Date: 4/18/2024 3:51:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_DashboardItemLinks](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dashboardID] [int] NOT NULL,
	[dashboardItemID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_DashboardItems]    Script Date: 4/18/2024 3:51:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_DashboardItems](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[typeID] [int] NOT NULL,
	[referencedID] [int] NULL,
	[referencedTypeID] [int] NULL,
	[filterType] [int] NULL,
	[filterSql] [nvarchar](max) NULL,
	[filterText] [nvarchar](max) NULL,
	[filterArray] [varbinary](max) NULL,
 CONSTRAINT [PK_Symphony_DashboardItems] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_Dashboards]    Script Date: 4/18/2024 3:51:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_Dashboards](
	[id] [int] NOT NULL,
	[type] [int] NOT NULL,
	[name] [nvarchar](100) NULL,
	[userID] [decimal](18, 0) NOT NULL,
	[filterArray] [varbinary](max) NULL,
	[filterType] [int] NOT NULL,
	[filterSql] [nvarchar](max) NULL,
	[filterText] [nvarchar](max) NULL,
 CONSTRAINT [PK_Symphony_Dashboards] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[userID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_DashboardWarnings]    Script Date: 4/18/2024 3:51:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_DashboardWarnings](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dashboardID] [int] NOT NULL,
	[dashboardItemID] [int] NULL,
	[updateDate] [datetime] NOT NULL,
	[changeType] [int] NOT NULL,
	[isHandled] [bit] NULL,
	[message] [nvarchar](1000) NULL,
 CONSTRAINT [PK_Symphony_DashboardWarnings] PRIMARY KEY CLUSTERED 
(
	[id] ASC,
	[dashboardID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_DataChanged]    Script Date: 4/18/2024 3:51:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_DataChanged](
	[type] [tinyint] NOT NULL,
	[tableName] [nvarchar](100) NOT NULL,
	[triggerName] [nvarchar](150) NOT NULL,
	[lastDataChange] [datetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_DataLog]    Script Date: 4/18/2024 3:51:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_DataLog](
	[ConvertDate] [datetime] NOT NULL,
	[ConvertFrom] [nvarchar](1000) NULL,
	[ConvertTo] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_DBMAttentions]    Script Date: 4/18/2024 3:51:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_DBMAttentions](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[stockLocationID] [int] NOT NULL,
	[skuID] [int] NOT NULL,
	[recommendationType] [tinyint] NOT NULL,
	[oldBufferSize] [numeric](18, 5) NOT NULL,
	[bufferSizeAfterChange] [numeric](18, 5) NOT NULL,
	[tooMuchRedWarning] [tinyint] NULL,
	[updateDate] [smalldatetime] NULL,
 CONSTRAINT [PK_Symphony_DBMAttentions] PRIMARY KEY CLUSTERED 
(
	[stockLocationID] ASC,
	[skuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_DBMExpiredHistory]    Script Date: 4/18/2024 3:51:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_DBMExpiredHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[stockLocationID] [int] NOT NULL,
	[skuID] [int] NOT NULL,
	[recommendationType] [tinyint] NOT NULL,
	[oldBufferSize] [numeric](18, 5) NOT NULL,
	[recommendedBufferSize] [numeric](18, 5) NULL,
	[tooMuchRedWarning] [tinyint] NULL,
	[updateDate] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_DBMPerformanceHistory]    Script Date: 4/18/2024 3:51:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_DBMPerformanceHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[dashboardItemID] [int] NOT NULL,
	[updateDate] [datetime] NOT NULL,
	[numberOpen] [int] NULL,
	[numberReact] [int] NULL,
	[numberNotAppliedChanged] [int] NULL,
	[numberNotAppliedTimePass] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Index [indx_DBMPerformanceHistory]    Script Date: 4/18/2024 3:51:35 PM ******/
CREATE CLUSTERED INDEX [indx_DBMPerformanceHistory] ON [dbo].[Symphony_DBMPerformanceHistory]
(
	[updateDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_DefaultImage]    Script Date: 4/18/2024 3:51:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_DefaultImage](
	[defaultImage] [varbinary](max) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_DeleteMtsQueue]    Script Date: 4/18/2024 3:51:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_DeleteMtsQueue](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[stockLocationID] [int] NOT NULL,
	[skuID] [int] NOT NULL,
	[updateDate] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_DeleteMtsQueueTmp]    Script Date: 4/18/2024 3:51:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_DeleteMtsQueueTmp](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[stockLocationID] [int] NOT NULL,
	[skuID] [int] NOT NULL,
	[updateDate] [smalldatetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_DGsProperty]    Script Date: 4/18/2024 3:51:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_DGsProperty](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[dgPropertyID] [nvarchar](50) NOT NULL,
	[dgPropertyName] [nvarchar](100) NULL,
	[dgPropertyDescription] [nvarchar](1000) NULL,
	[propType] [tinyint] NOT NULL,
	[autoAddNewItem] [bit] NOT NULL,
 CONSTRAINT [PK_Symphony_DGsProperty] PRIMARY KEY CLUSTERED 
(
	[dgPropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_DisplayGroupSummaryData]    Script Date: 4/18/2024 3:51:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_DisplayGroupSummaryData](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[stockLocationID] [int] NOT NULL,
	[displayGroupID] [int] NULL,
	[totalInventory] [int] NULL,
	[totalCost] [decimal](18, 5) NULL,
	[existingAGs] [int] NULL,
 CONSTRAINT [PK_Symphony_Symphony_DisplayGroupSummaryData] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [UK_Symphony_Symphony_DisplayGroupSummaryData] UNIQUE NONCLUSTERED 
(
	[stockLocationID] ASC,
	[displayGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_DisplayGroupSummaryDataHistory]    Script Date: 4/18/2024 3:51:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_DisplayGroupSummaryDataHistory](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[stockLocationID] [int] NOT NULL,
	[displayGroupID] [int] NULL,
	[minQuantity] [int] NULL,
	[maxQuantity] [int] NULL,
	[minCost] [decimal](18, 5) NULL,
	[maxCost] [decimal](18, 5) NULL,
	[totalInventory] [int] NULL,
	[totalCost] [decimal](18, 5) NULL,
	[existingAGs] [int] NULL,
	[measureDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Symphony_Symphony_DisplayGroupSummaryDataHistory] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [UK_Symphony_Symphony_DisplayGroupSummaryDataHistory] UNIQUE NONCLUSTERED 
(
	[measureDate] ASC,
	[stockLocationID] ASC,
	[displayGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_DPLM_Actions]    Script Date: 4/18/2024 3:51:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_DPLM_Actions](
	[stockLocationID] [int] NULL,
	[familyID] [int] NULL,
	[actionsDate] [smalldatetime] NULL,
	[calculationDate] [smalldatetime] NULL,
	[currentStateID] [int] NULL,
	[previousStateID] [int] NULL,
	[ruleId] [int] NULL,
	[actionText] [nvarchar](max) NULL,
	[conditionText] [nvarchar](max) NULL,
	[actionStatus] [tinyint] NULL,
	[ruleType] [tinyint] NULL,
	[isIndependent] [bit] NULL,
	[automatic] [bit] NULL,
	[userID] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_DPLM_ActionsDeleted]    Script Date: 4/18/2024 3:51:35 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_DPLM_ActionsDeleted](
	[ID] [int] NOT NULL,
	[policyID] [int] NULL,
	[stateNumber] [int] NOT NULL,
	[stateName] [nvarchar](100) NULL,
	[stateDescription] [nvarchar](200) NULL,
	[stateWaitingPeriod] [smallint] NULL,
	[ruleId] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_DPLM_ActionsHistory]    Script Date: 4/18/2024 3:51:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_DPLM_ActionsHistory](
	[stockLocationID] [int] NULL,
	[familyID] [int] NULL,
	[actionsDate] [smalldatetime] NULL,
	[calculationDate] [smalldatetime] NULL,
	[currentStateID] [int] NULL,
	[previousStateID] [int] NULL,
	[ruleId] [int] NULL,
	[actionText] [nvarchar](max) NULL,
	[conditionText] [nvarchar](max) NULL,
	[actionStatus] [tinyint] NULL,
	[ruleType] [tinyint] NULL,
	[isIndependent] [bit] NULL,
	[automatic] [bit] NULL,
	[userID] [int] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_DPLM_AssortmentGroupPolicy]    Script Date: 4/18/2024 3:51:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_DPLM_AssortmentGroupPolicy](
	[assortmentGroupID] [int] NOT NULL,
	[policyID] [int] NOT NULL,
	[currentStateID] [int] NULL,
 CONSTRAINT [PK_Symphony_DPLM_AssortmentGroupPolicy] PRIMARY KEY CLUSTERED 
(
	[assortmentGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_DPLM_BufferWorking_Table]    Script Date: 4/18/2024 3:51:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_DPLM_BufferWorking_Table](
	[stockLocationID] [int] NOT NULL,
	[skuID] [int] NOT NULL,
	[newBufferSize] [decimal](18, 5) NULL,
 CONSTRAINT [PK_Symphony_DPLM_BufferWorking_Table] PRIMARY KEY CLUSTERED 
(
	[stockLocationID] ASC,
	[skuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_DPLM_Log]    Script Date: 4/18/2024 3:51:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_DPLM_Log](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[policyID] [int] NULL,
	[policyName] [nvarchar](150) NULL,
	[stateID] [int] NULL,
	[stateName] [nvarchar](150) NULL,
	[calculationDate] [datetime] NULL,
	[error] [nvarchar](350) NULL,
 CONSTRAINT [PK_Symphony_DPLM_Log] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_DPLM_Policies]    Script Date: 4/18/2024 3:51:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_DPLM_Policies](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[policyName] [nvarchar](100) NULL,
	[policyDescription] [nvarchar](200) NULL,
	[policyDefaultState] [int] NOT NULL,
	[policyIsDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Symphony_DPLM_Policies] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_DPLM_PoliciesRules]    Script Date: 4/18/2024 3:51:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_DPLM_PoliciesRules](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[policyStateID] [int] NOT NULL,
	[Independent] [bit] NOT NULL,
	[ConditionOriginal] [nvarchar](max) NULL,
	[targetState] [int] NULL,
	[automatic] [bit] NULL,
	[actions] [nvarchar](max) NULL,
	[stateMaster] [bit] NULL,
	[orderByChildren] [int] NULL,
	[conditionDescription] [nvarchar](max) NULL,
	[actionDescription] [nvarchar](max) NULL,
 CONSTRAINT [PK_Symphony_DPLM_PoliciesRules] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_DPLM_PoliciesStates]    Script Date: 4/18/2024 3:51:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_DPLM_PoliciesStates](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[policyID] [int] NOT NULL,
	[stateNumber] [int] NOT NULL,
	[stateName] [nvarchar](100) NULL,
	[stateDescription] [nvarchar](200) NULL,
	[stateWaitingPeriod] [smallint] NULL,
 CONSTRAINT [PK_Symphony_DPLM_PoliciesStates] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_DPLM_SLFamilyPolicyAssociation]    Script Date: 4/18/2024 3:51:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_DPLM_SLFamilyPolicyAssociation](
	[stockLocationID] [int] NOT NULL,
	[familyID] [int] NOT NULL,
	[policyID] [int] NOT NULL,
	[currentStateID] [int] NULL,
 CONSTRAINT [PK_Symphony_DPLM_SLFamilyPolicyAssociation] PRIMARY KEY CLUSTERED 
(
	[stockLocationID] ASC,
	[familyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_DPLM_SlFamTable]    Script Date: 4/18/2024 3:51:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_DPLM_SlFamTable](
	[stockLocationID] [int] NULL,
	[familyID] [int] NULL,
	[assortmentGroupID] [int] NULL,
	[newPolicyID] [int] NULL,
	[newStateID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_DPLM_StockLocationFamilyPolicy]    Script Date: 4/18/2024 3:51:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_DPLM_StockLocationFamilyPolicy](
	[stockLocationID] [int] NOT NULL,
	[familyID] [int] NOT NULL,
	[policyID] [int] NOT NULL,
	[currentStateID] [int] NULL,
	[previousStateID] [int] NULL,
	[stateStartDate] [smalldatetime] NULL,
	[automatic] [bit] NOT NULL,
	[nextStateID] [int] NULL,
	[dependentRule] [int] NULL,
	[independentRules] [nvarchar](100) NULL,
	[changeStateRule] [int] NULL,
	[newPolicyID] [int] NULL,
	[newStateID] [int] NULL,
	[changingAttributeTable] [bit] NULL,
 CONSTRAINT [PK_Symphony_DPLM_StockLocationFamilyPolicy] PRIMARY KEY CLUSTERED 
(
	[stockLocationID] ASC,
	[familyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_DPLM_StockLocationFamilyPolicy_temp]    Script Date: 4/18/2024 3:51:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_DPLM_StockLocationFamilyPolicy_temp](
	[stockLocationID] [int] NULL,
	[familyID] [int] NULL,
	[assortmentGroupID] [int] NULL,
	[newPolicyID] [int] NULL,
	[newStateID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_DPLM_WeekRecalculateDays]    Script Date: 4/18/2024 3:51:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_DPLM_WeekRecalculateDays](
	[day] [smallint] NULL,
	[calcDay] [bit] NULL,
	[calcDisDay] [bit] NULL,
	[nameWeekDays] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_DPLM_Working_Action_Param_Table]    Script Date: 4/18/2024 3:51:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_DPLM_Working_Action_Param_Table](
	[stockLocationID] [int] NOT NULL,
	[familyID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_DPLM_WorkingCalculatedParameters_Table]    Script Date: 4/18/2024 3:51:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_DPLM_WorkingCalculatedParameters_Table](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[stockLocationID] [int] NOT NULL,
	[familyID] [int] NOT NULL,
	[policyID] [int] NOT NULL,
	[stateID] [int] NOT NULL,
	[functionConn] [nvarchar](50) NULL,
	[parametersConn] [nvarchar](50) NULL,
	[calculationDate] [smalldatetime] NULL,
	[paramValInt16] [smallint] NULL,
	[paramValInt32] [int] NULL,
	[paramValInt64] [bigint] NULL,
	[paramValDecimal] [decimal](18, 5) NULL,
	[paramValDateTime] [smalldatetime] NULL,
	[paramValBit] [bit] NULL,
	[paramValString] [nvarchar](100) NULL,
 CONSTRAINT [PK_Symphony_DPLM_WorkingCalculatedParameters_Table] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_DPLM_WorkingPolicy_Table]    Script Date: 4/18/2024 3:51:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_DPLM_WorkingPolicy_Table](
	[stockLocationID] [int] NOT NULL,
	[familyID] [int] NOT NULL,
	[policyID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_DTMCalculationTrace]    Script Date: 4/18/2024 3:51:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_DTMCalculationTrace](
	[stockLocationID] [int] NOT NULL,
	[assortmentGroupID] [int] NOT NULL,
	[DTMEligibility] [tinyint] NULL,
	[AGEligibility] [tinyint] NULL,
	[DTMBenchmark] [decimal](18, 5) NULL,
	[increaseIdx] [int] NULL,
	[decreaseIdx] [int] NULL,
	[DTMBenchmarkIncr] [decimal](18, 5) NULL,
	[DTMBenchmarkDecr] [decimal](18, 5) NULL,
	[salesPerformanceIncrease] [decimal](18, 5) NULL,
	[salesPerformanceDecrease] [decimal](18, 5) NULL,
	[date] [smalldatetime] NULL,
	[dailyEligible] [tinyint] NULL,
	[validFamilyCount] [int] NULL,
	[validFamilyConsumption] [decimal](18, 5) NULL,
	[averageRange] [decimal](18, 5) NULL,
	[totalSales] [decimal](18, 5) NULL,
	[quantityPerFamily] [decimal](18, 5) NULL,
	[oddmentsRatio] [decimal](18, 5) NULL,
	[varietyTarget] [int] NULL,
	[familyID] [int] NULL,
	[familyConsumption] [decimal](18, 5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_EndOfLifePolicies]    Script Date: 4/18/2024 3:51:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_EndOfLifePolicies](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](150) NOT NULL,
	[policyDescription] [nvarchar](150) NULL,
	[eolDate] [smalldatetime] NULL,
	[analysisPeriod] [int] NULL,
	[quantityTrigger] [decimal](18, 5) NULL,
	[disableBuffer] [bit] NULL,
	[stopReplenishment] [bit] NULL,
	[applyToAllFamily] [bit] NULL,
 CONSTRAINT [PK_Symphony_EndOfLifePolicies] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [UK_Symphony_EndOfLifePolicies] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_EndOfLifeRecommmendations]    Script Date: 4/18/2024 3:51:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_EndOfLifeRecommmendations](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[skuID] [int] NOT NULL,
	[stockLocationID] [int] NOT NULL,
	[reason] [tinyint] NOT NULL,
	[status] [tinyint] NOT NULL,
	[creationDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Symphony_EndOfLifeRecommmendations] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [UK_Symphony_EndOfLifeRecommmendations] UNIQUE NONCLUSTERED 
(
	[stockLocationID] ASC,
	[skuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_EndOfLifeRejectedRecommmendations]    Script Date: 4/18/2024 3:51:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_EndOfLifeRejectedRecommmendations](
	[id] [int] NOT NULL,
	[skuID] [int] NOT NULL,
	[stockLocationID] [int] NOT NULL,
	[reason] [tinyint] NOT NULL,
	[status] [tinyint] NOT NULL,
	[creationDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Symphony_EndOfLifeRejectedRecommmendations] PRIMARY KEY CLUSTERED 
(
	[stockLocationID] ASC,
	[skuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_ExpeditingFilter]    Script Date: 4/18/2024 3:51:36 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_ExpeditingFilter](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[filterType] [int] NULL,
	[DataFilterDisplayString] [nvarchar](3900) NULL,
	[DataFilterSerialized] [varbinary](max) NULL,
	[dataFilterType] [int] NULL,
	[dataFilterSql] [nvarchar](max) NULL,
	[isBrowsable] [bit] NOT NULL,
	[creationDate] [smalldatetime] NOT NULL,
	[createdBy] [nvarchar](400) NULL,
	[description] [nvarchar](400) NULL,
	[timePeriod4Email] [tinyint] NULL,
 CONSTRAINT [PK_Symphony_ExpeditingFilter] UNIQUE NONCLUSTERED 
(
	[name] ASC,
	[filterType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_ExpeditingFilterColorStatistics]    Script Date: 4/18/2024 3:51:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_ExpeditingFilterColorStatistics](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[filterID] [int] NOT NULL,
	[numberCyans] [int] NULL,
	[numberGreens] [int] NULL,
	[numberYellows] [int] NULL,
	[numberReds] [int] NULL,
	[numberBlacks] [int] NULL,
	[updateDate] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_ExpeditingFilterMeasuresData]    Script Date: 4/18/2024 3:51:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_ExpeditingFilterMeasuresData](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[filterID] [int] NOT NULL,
	[measureTypeID] [int] NOT NULL,
	[measureData] [decimal](23, 5) NULL,
	[measureDate] [smalldatetime] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_ExpeditingFilterPerUsers]    Script Date: 4/18/2024 3:51:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_ExpeditingFilterPerUsers](
	[userID] [int] NOT NULL,
	[expFilterID] [int] NOT NULL,
 CONSTRAINT [PK_Symphony_ExpeditingFilterPerUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC,
	[expFilterID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_FamilyImages]    Script Date: 4/18/2024 3:51:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_FamilyImages](
	[familyID] [int] NOT NULL,
	[skuID] [int] NOT NULL,
	[skuName] [nvarchar](100) NULL,
	[hasImage] [bit] NOT NULL,
 CONSTRAINT [PK_Symphony_FamilyImages] PRIMARY KEY CLUSTERED 
(
	[familyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_FamilyValidationResults]    Script Date: 4/18/2024 3:51:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_FamilyValidationResults](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[stockLocationID] [int] NOT NULL,
	[assortmentGroupID] [int] NULL,
	[familyID] [int] NOT NULL,
	[isValid] [bit] NOT NULL,
	[lastInvalidThreshold] [int] NOT NULL,
	[lastInvalidationDate] [smalldatetime] NULL,
	[isInvalidOverThreshold] [bit] NULL,
	[isDead] [bit] NOT NULL,
 CONSTRAINT [PK_Symphony_FamilyValidationResults] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [UK_Symphony_FamilyValidationResults] UNIQUE NONCLUSTERED 
(
	[stockLocationID] ASC,
	[familyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_FileLoadingDates]    Script Date: 4/18/2024 3:51:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_FileLoadingDates](
	[loadingDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_FileLoadingStatus]    Script Date: 4/18/2024 3:51:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_FileLoadingStatus](
	[loadingDate] [datetime] NULL,
	[LastSuccessLoadingDate] [datetime] NULL,
	[LastSuccessRecalculate] [datetime] NULL,
	[isLoadFinishedSuccessfully] [bit] NOT NULL,
	[isLoadContaintedErrors] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_FileStructure]    Script Date: 4/18/2024 3:51:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_FileStructure](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[file_name] [nvarchar](50) NOT NULL,
	[field_name] [nvarchar](50) NOT NULL,
	[field_alias] [nvarchar](50) NULL,
	[display_name] [nvarchar](150) NOT NULL,
	[field_position] [int] NULL,
	[defaultPosition] [int] NULL,
	[field_type] [nvarchar](50) NULL,
	[participate] [bit] NOT NULL,
	[default_value] [nvarchar](50) NULL,
	[mandatory] [bit] NOT NULL,
	[groupingName] [nvarchar](50) NULL,
	[groupFieldName] [nvarchar](50) NULL,
	[groupDisplayName] [nvarchar](50) NULL,
	[isDummy] [bit] NOT NULL,
	[defaultValueField] [nvarchar](50) NULL,
	[avoidWhenUpdate] [bit] NOT NULL,
	[isKeyForInsert] [bit] NOT NULL,
	[idType] [int] NOT NULL,
	[idLicense] [int] NOT NULL,
	[symFieldType] [tinyint] NOT NULL,
	[stopInputOnError] [bit] NOT NULL,
	[maxLength] [int] NULL,
 CONSTRAINT [PK_Symphony_FileStructure] PRIMARY KEY CLUSTERED 
(
	[file_name] ASC,
	[field_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_FileStructureGlobal]    Script Date: 4/18/2024 3:51:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_FileStructureGlobal](
	[file_name] [nvarchar](50) NOT NULL,
	[displayName] [nvarchar](100) NOT NULL,
	[separator] [nvarchar](2) NOT NULL,
	[disregardedFirstLine] [bit] NOT NULL,
	[inputTableName] [nvarchar](100) NULL,
	[quarantineTableName] [nvarchar](100) NULL,
	[reportedDateFieldName] [nvarchar](50) NULL,
	[isInternal] [bit] NULL,
 CONSTRAINT [PK_Symphony_FileStructureGlobal] PRIMARY KEY CLUSTERED 
(
	[file_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_FileStructureGroups]    Script Date: 4/18/2024 3:51:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_FileStructureGroups](
	[groupID] [int] IDENTITY(1,1) NOT NULL,
	[parentGroupID] [int] NULL,
	[groupName] [nvarchar](100) NULL,
	[isFileStructure] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_Globals]    Script Date: 4/18/2024 3:51:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_Globals](
	[flag_name] [nvarchar](100) NOT NULL,
	[flag_value] [nvarchar](200) NULL,
 CONSTRAINT [PK_Symphony_Globals] PRIMARY KEY CLUSTERED 
(
	[flag_name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_GridViews]    Script Date: 4/18/2024 3:51:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_GridViews](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[viewName] [nvarchar](50) NOT NULL,
	[formName] [nvarchar](50) NOT NULL,
	[userName] [nvarchar](50) NOT NULL,
	[viewType] [int] NOT NULL,
	[viewDescription] [nvarchar](100) NULL,
	[fileData] [image] NOT NULL,
	[isActive] [bit] NOT NULL,
	[orderIndex] [int] NULL,
	[DataFilterDisplayString] [nvarchar](3900) NULL,
	[DataFilterSerialized] [image] NULL,
	[email] [nvarchar](1000) NULL,
	[createdBy] [nvarchar](100) NULL,
	[createdDate] [smalldatetime] NOT NULL,
	[assignToMe] [bit] NULL,
	[isPublic] [bit] NOT NULL,
	[setAsOriginalView] [bit] NULL,
	[isWebView] [bit] NOT NULL,
 CONSTRAINT [PK_Symphony_GridViews] PRIMARY KEY CLUSTERED 
(
	[viewName] ASC,
	[formName] ASC,
	[userName] ASC,
	[isWebView] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_GridViewsAssign]    Script Date: 4/18/2024 3:51:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_GridViewsAssign](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[formName] [nvarchar](50) NOT NULL,
	[userName] [nvarchar](50) NOT NULL,
	[viewID] [int] NULL,
	[isActive] [bit] NOT NULL,
	[assignToMe] [bit] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_Symphony_GridViewsAssign]    Script Date: 4/18/2024 3:51:37 PM ******/
CREATE CLUSTERED INDEX [IDX_Symphony_GridViewsAssign] ON [dbo].[Symphony_GridViewsAssign]
(
	[userName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_Groups]    Script Date: 4/18/2024 3:51:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_Groups](
	[GroupID] [decimal](18, 0) NOT NULL,
	[Name] [nvarchar](50) NULL,
	[Description] [nvarchar](100) NULL,
	[isFixed] [bit] NOT NULL,
	[moduleID] [int] NOT NULL,
 CONSTRAINT [PK_Symphony_Groups] PRIMARY KEY CLUSTERED 
(
	[GroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [UK_Symphony_Groups] UNIQUE NONCLUSTERED 
(
	[Name] ASC,
	[moduleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_HBTGradation]    Script Date: 4/18/2024 3:51:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_HBTGradation](
	[familyID] [int] NOT NULL,
	[assortmentGroupID] [int] NOT NULL,
	[HBTSegmentID_AG] [int] NULL,
	[HBTSegmentID_DG] [int] NULL,
	[HBTSegmentID_Universe] [int] NULL,
 CONSTRAINT [PK_Symphony_HBTGradation] PRIMARY KEY CLUSTERED 
(
	[familyID] ASC,
	[assortmentGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_HBTSegments]    Script Date: 4/18/2024 3:51:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_HBTSegments](
	[segmentID] [int] IDENTITY(1,1) NOT NULL,
	[segmentName] [nvarchar](100) NOT NULL,
	[segmentType] [tinyint] NULL,
	[segmentRange] [decimal](18, 5) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_Images]    Script Date: 4/18/2024 3:51:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_Images](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[skuID] [int] NOT NULL,
	[image] [varbinary](max) NOT NULL,
 CONSTRAINT [PK_Symphony_Images] PRIMARY KEY CLUSTERED 
(
	[skuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputAgeTracking]    Script Date: 4/18/2024 3:51:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputAgeTracking](
	[skuName] [nvarchar](100) NULL,
	[stockLocationName] [nvarchar](100) NULL,
	[inDate] [smalldatetime] NULL,
	[quantity] [int] NULL,
	[reportedDate] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputAgeTrackingQuarantine]    Script Date: 4/18/2024 3:51:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputAgeTrackingQuarantine](
	[skuName] [nvarchar](100) NULL,
	[stockLocationName] [nvarchar](100) NULL,
	[inDate] [smalldatetime] NULL,
	[quantity] [int] NULL,
	[reportedDate] [smalldatetime] NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputAttributesAGTargetsSet]    Script Date: 4/18/2024 3:51:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputAttributesAGTargetsSet](
	[setName] [nvarchar](200) NULL,
	[attributePriority] [int] NULL,
	[attributeName] [nvarchar](100) NULL,
	[attributeValue] [nvarchar](100) NULL,
	[distributionType] [nvarchar](100) NULL,
	[minDistribution] [decimal](18, 5) NULL,
	[reportedDate] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputAttributesAGTargetsSetQuarantine]    Script Date: 4/18/2024 3:51:37 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputAttributesAGTargetsSetQuarantine](
	[setName] [nvarchar](200) NULL,
	[attributePriority] [int] NULL,
	[attributeName] [nvarchar](100) NULL,
	[attributeValue] [nvarchar](100) NULL,
	[distributionType] [nvarchar](100) NULL,
	[minDistribution] [decimal](18, 5) NULL,
	[reportedDate] [smalldatetime] NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputCatalogSkus]    Script Date: 4/18/2024 3:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputCatalogSkus](
	[skuName] [nvarchar](100) NULL,
	[skuDescription] [nvarchar](100) NULL,
	[uomName] [nvarchar](50) NULL,
	[categoryName] [nvarchar](50) NULL,
	[skuGroupName] [nvarchar](100) NULL,
	[reportedDate] [datetime] NULL,
	[skuPropertyID1] [nvarchar](100) NULL,
	[skuPropertyID2] [nvarchar](100) NULL,
	[skuPropertyID3] [nvarchar](100) NULL,
	[skuPropertyID4] [nvarchar](100) NULL,
	[skuPropertyID5] [nvarchar](100) NULL,
	[skuPropertyID6] [nvarchar](100) NULL,
	[skuPropertyID7] [nvarchar](100) NULL,
	[custom_num1] [decimal](18, 5) NULL,
	[custom_num2] [decimal](18, 5) NULL,
	[custom_num3] [decimal](18, 5) NULL,
	[custom_num4] [decimal](18, 5) NULL,
	[custom_num5] [decimal](18, 5) NULL,
	[custom_num6] [decimal](18, 5) NULL,
	[custom_num7] [decimal](18, 5) NULL,
	[custom_num8] [decimal](18, 5) NULL,
	[custom_num9] [decimal](18, 5) NULL,
	[custom_num10] [decimal](18, 5) NULL,
	[custom_txt1] [nvarchar](100) NULL,
	[custom_txt2] [nvarchar](100) NULL,
	[custom_txt3] [nvarchar](100) NULL,
	[custom_txt4] [nvarchar](100) NULL,
	[custom_txt5] [nvarchar](100) NULL,
	[custom_txt6] [nvarchar](100) NULL,
	[custom_txt7] [nvarchar](100) NULL,
	[custom_txt8] [nvarchar](100) NULL,
	[custom_txt9] [nvarchar](100) NULL,
	[custom_txt10] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputCatalogSkusQuarantine]    Script Date: 4/18/2024 3:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputCatalogSkusQuarantine](
	[skuName] [nvarchar](100) NULL,
	[skuDescription] [nvarchar](100) NULL,
	[uomName] [nvarchar](50) NULL,
	[categoryName] [nvarchar](50) NULL,
	[skuGroupName] [nvarchar](100) NULL,
	[reportedDate] [datetime] NULL,
	[skuPropertyID1] [nvarchar](100) NULL,
	[skuPropertyID2] [nvarchar](100) NULL,
	[skuPropertyID3] [nvarchar](100) NULL,
	[skuPropertyID4] [nvarchar](100) NULL,
	[skuPropertyID5] [nvarchar](100) NULL,
	[skuPropertyID6] [nvarchar](100) NULL,
	[skuPropertyID7] [nvarchar](100) NULL,
	[custom_num1] [decimal](18, 5) NULL,
	[custom_num2] [decimal](18, 5) NULL,
	[custom_num3] [decimal](18, 5) NULL,
	[custom_num4] [decimal](18, 5) NULL,
	[custom_num5] [decimal](18, 5) NULL,
	[custom_num6] [decimal](18, 5) NULL,
	[custom_num7] [decimal](18, 5) NULL,
	[custom_num8] [decimal](18, 5) NULL,
	[custom_num9] [decimal](18, 5) NULL,
	[custom_num10] [decimal](18, 5) NULL,
	[custom_txt1] [nvarchar](100) NULL,
	[custom_txt2] [nvarchar](100) NULL,
	[custom_txt3] [nvarchar](100) NULL,
	[custom_txt4] [nvarchar](100) NULL,
	[custom_txt5] [nvarchar](100) NULL,
	[custom_txt6] [nvarchar](100) NULL,
	[custom_txt7] [nvarchar](100) NULL,
	[custom_txt8] [nvarchar](100) NULL,
	[custom_txt9] [nvarchar](100) NULL,
	[custom_txt10] [nvarchar](100) NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputCategories]    Script Date: 4/18/2024 3:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputCategories](
	[categoryName] [nvarchar](100) NULL,
	[categoryDescription] [nvarchar](200) NULL,
	[reportedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputCategoriesQuarantine]    Script Date: 4/18/2024 3:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputCategoriesQuarantine](
	[categoryName] [nvarchar](100) NULL,
	[categoryDescription] [nvarchar](200) NULL,
	[reportedDate] [datetime] NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputClientOrder]    Script Date: 4/18/2024 3:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputClientOrder](
	[clientOrderID] [nvarchar](50) NULL,
	[clientOrderDescription] [nvarchar](100) NULL,
	[clientSaleOrderID] [nvarchar](50) NULL,
	[skuName] [nvarchar](100) NULL,
	[destinationStockLocation] [nvarchar](100) NULL,
	[client] [nvarchar](100) NULL,
	[clientDescription] [nvarchar](50) NULL,
	[dueDate] [datetime] NULL,
	[orderPrice] [numeric](21, 5) NULL,
	[orderTVC] [numeric](21, 5) NULL,
	[orderThroughput] [numeric](21, 5) NULL,
	[quantity] [numeric](21, 5) NULL,
	[reportedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputClientOrderQuarantine]    Script Date: 4/18/2024 3:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputClientOrderQuarantine](
	[clientOrderID] [nvarchar](50) NULL,
	[clientOrderDescription] [nvarchar](100) NULL,
	[clientSaleOrderID] [nvarchar](50) NULL,
	[skuName] [nvarchar](100) NULL,
	[destinationStockLocation] [nvarchar](100) NULL,
	[client] [nvarchar](100) NULL,
	[clientDescription] [nvarchar](50) NULL,
	[dueDate] [datetime] NULL,
	[orderPrice] [numeric](21, 5) NULL,
	[orderTVC] [numeric](21, 5) NULL,
	[orderThroughput] [numeric](21, 5) NULL,
	[quantity] [numeric](21, 5) NULL,
	[reportedDate] [datetime] NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputConsolidatedTransactions]    Script Date: 4/18/2024 3:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputConsolidatedTransactions](
	[stockLocationName] [nvarchar](100) NULL,
	[locationSkuName] [nvarchar](100) NULL,
	[inTransaction] [numeric](21, 5) NULL,
	[outTransaction] [numeric](21, 5) NULL,
	[inventoryAtHand] [numeric](21, 5) NULL,
	[returned] [numeric](21, 5) NULL,
	[clientOrderID] [nvarchar](50) NULL,
	[skuType] [nvarchar](50) NULL,
	[sellingPrice] [numeric](21, 5) NULL,
	[reportedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputConsolidatedTransactionsQuarantine]    Script Date: 4/18/2024 3:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputConsolidatedTransactionsQuarantine](
	[stockLocationName] [nvarchar](100) NULL,
	[locationSkuName] [nvarchar](100) NULL,
	[inTransaction] [numeric](21, 5) NULL,
	[outTransaction] [numeric](21, 5) NULL,
	[inventoryAtHand] [numeric](21, 5) NULL,
	[returned] [numeric](21, 5) NULL,
	[clientOrderID] [nvarchar](50) NULL,
	[skuType] [nvarchar](50) NULL,
	[sellingPrice] [numeric](21, 5) NULL,
	[reportedDate] [datetime] NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputConsumptionSummaries]    Script Date: 4/18/2024 3:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputConsumptionSummaries](
	[skuName] [nvarchar](100) NULL,
	[stockLocationName] [nvarchar](100) NULL,
	[year] [smallint] NULL,
	[month] [tinyint] NULL,
	[consumption] [decimal](18, 5) NULL,
	[reportedDate] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputConsumptionSummariesQuarantine]    Script Date: 4/18/2024 3:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputConsumptionSummariesQuarantine](
	[skuName] [nvarchar](100) NULL,
	[stockLocationName] [nvarchar](100) NULL,
	[year] [smallint] NULL,
	[month] [tinyint] NULL,
	[consumption] [decimal](18, 5) NULL,
	[reportedDate] [smalldatetime] NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputDBMPolicies]    Script Date: 4/18/2024 3:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputDBMPolicies](
	[name] [nvarchar](50) NULL,
	[increaseFactor] [decimal](13, 5) NULL,
	[increaseTrigger] [decimal](13, 5) NULL,
	[decreaseFactor] [decimal](13, 5) NULL,
	[decreaseTrigger] [decimal](13, 5) NULL,
	[redBPLevel] [decimal](13, 5) NULL,
	[greenBPLevel] [decimal](13, 5) NULL,
	[inactiveThreshold] [int] NULL,
	[consumptionFrequency] [int] NULL,
	[enableAttentions] [nvarchar](50) NULL,
	[mode] [nvarchar](50) NULL,
	[reportedDate] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputDBMPoliciesQuarantine]    Script Date: 4/18/2024 3:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputDBMPoliciesQuarantine](
	[name] [nvarchar](50) NULL,
	[increaseFactor] [decimal](13, 5) NULL,
	[increaseTrigger] [decimal](13, 5) NULL,
	[decreaseFactor] [decimal](13, 5) NULL,
	[decreaseTrigger] [decimal](13, 5) NULL,
	[redBPLevel] [decimal](13, 5) NULL,
	[greenBPLevel] [decimal](13, 5) NULL,
	[inactiveThreshold] [int] NULL,
	[consumptionFrequency] [int] NULL,
	[enableAttentions] [nvarchar](50) NULL,
	[mode] [nvarchar](50) NULL,
	[reportedDate] [smalldatetime] NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputDeleteAttributesAgSet]    Script Date: 4/18/2024 3:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputDeleteAttributesAgSet](
	[setName] [nvarchar](200) NULL,
	[reportedDate] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputDeleteAttributesAgSetQuarantine]    Script Date: 4/18/2024 3:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputDeleteAttributesAgSetQuarantine](
	[setName] [nvarchar](200) NULL,
	[reportedDate] [smalldatetime] NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputDeleteCatalogSkus]    Script Date: 4/18/2024 3:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputDeleteCatalogSkus](
	[skuName] [nvarchar](100) NULL,
	[reportedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputDeleteCatalogSkusQuarantine]    Script Date: 4/18/2024 3:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputDeleteCatalogSkusQuarantine](
	[skuName] [nvarchar](100) NULL,
	[reportedDate] [datetime] NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputDeleteCategories]    Script Date: 4/18/2024 3:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputDeleteCategories](
	[categoryName] [nvarchar](100) NULL,
	[reportedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputDeleteCategoriesQuarantine]    Script Date: 4/18/2024 3:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputDeleteCategoriesQuarantine](
	[categoryName] [nvarchar](100) NULL,
	[reportedDate] [datetime] NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputDeleteEligibleFamilies]    Script Date: 4/18/2024 3:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputDeleteEligibleFamilies](
	[family] [nvarchar](100) NULL,
	[reportedDate] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputDeleteEligibleFamiliesQuarantine]    Script Date: 4/18/2024 3:51:38 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputDeleteEligibleFamiliesQuarantine](
	[family] [nvarchar](100) NULL,
	[reportedDate] [smalldatetime] NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputDeleteFamilyAg]    Script Date: 4/18/2024 3:51:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputDeleteFamilyAg](
	[familyName] [nvarchar](100) NULL,
	[assortmentGroupName] [nvarchar](100) NULL,
	[reportedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputDeleteFamilyAgQuarantine]    Script Date: 4/18/2024 3:51:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputDeleteFamilyAgQuarantine](
	[familyName] [nvarchar](100) NULL,
	[assortmentGroupName] [nvarchar](100) NULL,
	[reportedDate] [datetime] NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputDeleteISTPolicies]    Script Date: 4/18/2024 3:51:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputDeleteISTPolicies](
	[stockLocationName] [nvarchar](100) NULL,
	[skuName] [nvarchar](100) NULL,
	[reportedDate] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputDeleteISTPoliciesQuarantine]    Script Date: 4/18/2024 3:51:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputDeleteISTPoliciesQuarantine](
	[stockLocationName] [nvarchar](100) NULL,
	[skuName] [nvarchar](100) NULL,
	[reportedDate] [smalldatetime] NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputDeleteLocationAssortmentGroups]    Script Date: 4/18/2024 3:51:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputDeleteLocationAssortmentGroups](
	[stockLocationName] [nvarchar](100) NULL,
	[assortmentGroupName] [nvarchar](100) NULL,
	[reportedDate] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputDeleteLocationAssortmentGroupsQuarantine]    Script Date: 4/18/2024 3:51:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputDeleteLocationAssortmentGroupsQuarantine](
	[stockLocationName] [nvarchar](100) NULL,
	[assortmentGroupName] [nvarchar](100) NULL,
	[reportedDate] [smalldatetime] NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputDeleteLocationCatalogSkus]    Script Date: 4/18/2024 3:51:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputDeleteLocationCatalogSkus](
	[skuName] [nvarchar](100) NULL,
	[stockLocationName] [nvarchar](100) NULL,
	[reportedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputDeleteLocationCatalogSkusQuarantine]    Script Date: 4/18/2024 3:51:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputDeleteLocationCatalogSkusQuarantine](
	[skuName] [nvarchar](100) NULL,
	[stockLocationName] [nvarchar](100) NULL,
	[reportedDate] [datetime] NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputDeleteLocationCategories]    Script Date: 4/18/2024 3:51:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputDeleteLocationCategories](
	[categoryName] [nvarchar](100) NULL,
	[stockLocationName] [nvarchar](100) NULL,
	[reportedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputDeleteLocationCategoriesQuarantine]    Script Date: 4/18/2024 3:51:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputDeleteLocationCategoriesQuarantine](
	[categoryName] [nvarchar](100) NULL,
	[stockLocationName] [nvarchar](100) NULL,
	[reportedDate] [datetime] NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputDeleteLocationDisplayGroups]    Script Date: 4/18/2024 3:51:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputDeleteLocationDisplayGroups](
	[stockLocationName] [nvarchar](100) NULL,
	[displayGroupName] [nvarchar](100) NULL,
	[reportedDate] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputDeleteLocationDisplayGroupsQuarantine]    Script Date: 4/18/2024 3:51:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputDeleteLocationDisplayGroupsQuarantine](
	[stockLocationName] [nvarchar](100) NULL,
	[displayGroupName] [nvarchar](100) NULL,
	[reportedDate] [smalldatetime] NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputDeleteLocationFamilyAttributes]    Script Date: 4/18/2024 3:51:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputDeleteLocationFamilyAttributes](
	[familyName] [nvarchar](100) NULL,
	[stockLocationName] [nvarchar](100) NULL,
	[reportedDate] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputDeleteLocationFamilyAttributesQuarantine]    Script Date: 4/18/2024 3:51:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputDeleteLocationFamilyAttributesQuarantine](
	[familyName] [nvarchar](100) NULL,
	[stockLocationName] [nvarchar](100) NULL,
	[reportedDate] [smalldatetime] NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputDeleteMasterSkus]    Script Date: 4/18/2024 3:51:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputDeleteMasterSkus](
	[skuName] [nvarchar](100) NULL,
	[reportedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputDeleteMasterSkusQuarantine]    Script Date: 4/18/2024 3:51:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputDeleteMasterSkusQuarantine](
	[skuName] [nvarchar](100) NULL,
	[reportedDate] [datetime] NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputDeleteMTO]    Script Date: 4/18/2024 3:51:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputDeleteMTO](
	[stockLocationName] [nvarchar](100) NULL,
	[skuName] [nvarchar](100) NULL,
	[reportDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputDeleteMTOQuarantine]    Script Date: 4/18/2024 3:51:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputDeleteMTOQuarantine](
	[stockLocationName] [nvarchar](100) NULL,
	[skuName] [nvarchar](100) NULL,
	[reportDate] [datetime] NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputDeleteMTS]    Script Date: 4/18/2024 3:51:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputDeleteMTS](
	[stockLocationName] [nvarchar](100) NULL,
	[skuName] [nvarchar](100) NULL,
	[reportDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputDeleteMTSQuarantine]    Script Date: 4/18/2024 3:51:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputDeleteMTSQuarantine](
	[stockLocationName] [nvarchar](100) NULL,
	[skuName] [nvarchar](100) NULL,
	[reportDate] [datetime] NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputDeleteNPISetMembers]    Script Date: 4/18/2024 3:51:39 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputDeleteNPISetMembers](
	[npiSetID] [int] NULL,
	[npiSetName] [nvarchar](100) NULL,
	[familyMemberID] [int] NULL,
	[familyMemberName] [nvarchar](100) NULL,
	[reportedDate] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputDeleteNPISetMembersQuarantine]    Script Date: 4/18/2024 3:51:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputDeleteNPISetMembersQuarantine](
	[npiSetID] [int] NULL,
	[npiSetName] [nvarchar](100) NULL,
	[familyMemberID] [int] NULL,
	[familyMemberName] [nvarchar](100) NULL,
	[reportedDate] [smalldatetime] NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputDeleteSkuFamily]    Script Date: 4/18/2024 3:51:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputDeleteSkuFamily](
	[familyName] [nvarchar](100) NULL,
	[reportedDate] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputDeleteSkuFamilyQuarantine]    Script Date: 4/18/2024 3:51:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputDeleteSkuFamilyQuarantine](
	[familyName] [nvarchar](100) NULL,
	[reportedDate] [smalldatetime] NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputDeleteSL]    Script Date: 4/18/2024 3:51:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputDeleteSL](
	[stockLocationName] [nvarchar](100) NULL,
	[reportDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputDeleteSLQuarantine]    Script Date: 4/18/2024 3:51:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputDeleteSLQuarantine](
	[stockLocationName] [nvarchar](100) NULL,
	[reportDate] [datetime] NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputDplmPolicies]    Script Date: 4/18/2024 3:51:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputDplmPolicies](
	[policyName] [nvarchar](100) NULL,
	[stateName] [nvarchar](100) NULL,
	[stateNumber] [int] NULL,
	[stateWaitingPeriod] [int] NULL,
	[isDefaultSate] [bit] NULL,
	[independent] [bit] NULL,
	[targetState] [int] NULL,
	[conditionOriginal] [nvarchar](max) NULL,
	[actions] [nvarchar](max) NULL,
	[automatic] [bit] NULL,
	[orderByChildren] [int] NULL,
	[stateMaster] [bit] NULL,
	[reportedDate] [smalldatetime] NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputDPLMPoliciesAG]    Script Date: 4/18/2024 3:51:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputDPLMPoliciesAG](
	[assortmentGroupName] [nvarchar](100) NULL,
	[policyName] [nvarchar](100) NULL,
	[currentState] [int] NULL,
	[reportedDate] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputDPLMPoliciesAGQuarantine]    Script Date: 4/18/2024 3:51:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputDPLMPoliciesAGQuarantine](
	[assortmentGroupName] [nvarchar](100) NULL,
	[policyName] [nvarchar](100) NULL,
	[currentState] [int] NULL,
	[reportedDate] [smalldatetime] NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputDPLMPoliciesFamilies]    Script Date: 4/18/2024 3:51:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputDPLMPoliciesFamilies](
	[stockLocationName] [nvarchar](100) NULL,
	[familyName] [nvarchar](100) NULL,
	[policyName] [nvarchar](100) NULL,
	[currentState] [int] NULL,
	[reportedDate] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputDPLMPoliciesFamiliesQuarantine]    Script Date: 4/18/2024 3:51:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputDPLMPoliciesFamiliesQuarantine](
	[stockLocationName] [nvarchar](100) NULL,
	[familyName] [nvarchar](100) NULL,
	[policyName] [nvarchar](100) NULL,
	[currentState] [int] NULL,
	[reportedDate] [smalldatetime] NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputDplmPoliciesQuarantine]    Script Date: 4/18/2024 3:51:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputDplmPoliciesQuarantine](
	[policyName] [nvarchar](100) NULL,
	[stateName] [nvarchar](100) NULL,
	[stateNumber] [int] NULL,
	[stateWaitingPeriod] [int] NULL,
	[isDefaultSate] [bit] NULL,
	[independent] [bit] NULL,
	[targetState] [int] NULL,
	[conditionOriginal] [nvarchar](max) NULL,
	[actions] [nvarchar](max) NULL,
	[automatic] [bit] NULL,
	[orderByChildren] [int] NULL,
	[stateMaster] [bit] NULL,
	[reportedDate] [smalldatetime] NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputDPLMPoliciesSkus]    Script Date: 4/18/2024 3:51:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputDPLMPoliciesSkus](
	[stockLocationName] [nvarchar](100) NULL,
	[skuName] [nvarchar](100) NULL,
	[policyName] [nvarchar](100) NULL,
	[currentState] [int] NULL,
	[reportedDate] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputDPLMPoliciesSkusQuarantine]    Script Date: 4/18/2024 3:51:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputDPLMPoliciesSkusQuarantine](
	[stockLocationName] [nvarchar](100) NULL,
	[skuName] [nvarchar](100) NULL,
	[policyName] [nvarchar](100) NULL,
	[currentState] [int] NULL,
	[reportedDate] [smalldatetime] NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputEligibleFamilies]    Script Date: 4/18/2024 3:51:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputEligibleFamilies](
	[family] [nvarchar](100) NULL,
	[slPropertyID1] [nvarchar](1000) NULL,
	[slPropertyID2] [nvarchar](1000) NULL,
	[slPropertyID3] [nvarchar](1000) NULL,
	[slPropertyID4] [nvarchar](1000) NULL,
	[slPropertyID5] [nvarchar](1000) NULL,
	[slPropertyID6] [nvarchar](1000) NULL,
	[slPropertyID7] [nvarchar](1000) NULL,
	[reportedDate] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputEligibleFamiliesQuarantine]    Script Date: 4/18/2024 3:51:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputEligibleFamiliesQuarantine](
	[family] [nvarchar](100) NULL,
	[slPropertyID1] [nvarchar](1000) NULL,
	[slPropertyID2] [nvarchar](1000) NULL,
	[slPropertyID3] [nvarchar](1000) NULL,
	[slPropertyID4] [nvarchar](1000) NULL,
	[slPropertyID5] [nvarchar](1000) NULL,
	[slPropertyID6] [nvarchar](1000) NULL,
	[slPropertyID7] [nvarchar](1000) NULL,
	[reportedDate] [smalldatetime] NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputEolPolicies]    Script Date: 4/18/2024 3:51:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputEolPolicies](
	[name] [nvarchar](150) NULL,
	[policyDescription] [nvarchar](150) NULL,
	[eolDate] [smalldatetime] NULL,
	[analysisPeriod] [int] NULL,
	[quantityTrigger] [decimal](18, 5) NULL,
	[disableBuffer] [bit] NULL,
	[stopReplenishment] [bit] NULL,
	[applyToAllFamily] [bit] NULL,
	[reportedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputEolPoliciesQuarantine]    Script Date: 4/18/2024 3:51:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputEolPoliciesQuarantine](
	[name] [nvarchar](150) NULL,
	[policyDescription] [nvarchar](150) NULL,
	[eolDate] [smalldatetime] NULL,
	[analysisPeriod] [int] NULL,
	[quantityTrigger] [decimal](18, 5) NULL,
	[disableBuffer] [bit] NULL,
	[stopReplenishment] [bit] NULL,
	[applyToAllFamily] [bit] NULL,
	[reportedDate] [datetime] NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputFamilySalesEstimation]    Script Date: 4/18/2024 3:51:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputFamilySalesEstimation](
	[familyName] [nvarchar](100) NULL,
	[assortmentGroupName] [nvarchar](100) NULL,
	[propertyValue] [nvarchar](100) NULL,
	[salesEstimation] [decimal](18, 5) NULL,
	[reportedDate] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputFamilySalesEstimationQuarantine]    Script Date: 4/18/2024 3:51:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputFamilySalesEstimationQuarantine](
	[familyName] [nvarchar](100) NULL,
	[assortmentGroupName] [nvarchar](100) NULL,
	[propertyValue] [nvarchar](100) NULL,
	[salesEstimation] [decimal](18, 5) NULL,
	[reportedDate] [smalldatetime] NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputFG]    Script Date: 4/18/2024 3:51:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputFG](
	[plant] [nvarchar](100) NULL,
	[skuName] [nvarchar](100) NULL,
	[quantity] [numeric](21, 5) NULL,
	[woid] [nvarchar](50) NULL,
	[orderType] [nvarchar](50) NULL,
	[shippingDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputFGQuarantine]    Script Date: 4/18/2024 3:51:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputFGQuarantine](
	[plant] [nvarchar](100) NULL,
	[skuName] [nvarchar](100) NULL,
	[quantity] [numeric](21, 5) NULL,
	[woid] [nvarchar](50) NULL,
	[orderType] [nvarchar](50) NULL,
	[shippingDate] [datetime] NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputISTPolicies]    Script Date: 4/18/2024 3:51:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputISTPolicies](
	[stockLocationName] [nvarchar](100) NULL,
	[skuName] [nvarchar](100) NULL,
	[istClusterName] [nvarchar](50) NULL,
	[allottedIstInventory] [nvarchar](100) NULL,
	[reportedDate] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputISTPoliciesQuarantine]    Script Date: 4/18/2024 3:51:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputISTPoliciesQuarantine](
	[stockLocationName] [nvarchar](100) NULL,
	[skuName] [nvarchar](100) NULL,
	[istClusterName] [nvarchar](50) NULL,
	[allottedIstInventory] [nvarchar](100) NULL,
	[reportedDate] [smalldatetime] NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputLocationAssortmentGroups]    Script Date: 4/18/2024 3:51:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputLocationAssortmentGroups](
	[stockLocationName] [nvarchar](100) NULL,
	[displayGroupName] [nvarchar](100) NULL,
	[assortmentGroupName] [nvarchar](100) NULL,
	[assortmentGroupDescription] [nvarchar](200) NULL,
	[varietyTarget] [int] NULL,
	[minTarget] [int] NULL,
	[maxTarget] [int] NULL,
	[spaceTarget] [int] NULL,
	[gapMode] [nvarchar](100) NULL,
	[spaceManaged] [bit] NULL,
	[quantityPerFamily] [decimal](18, 5) NULL,
	[considerVarietyGap] [bit] NULL,
	[alignmentToInventory] [decimal](18, 5) NULL,
	[reportedDate] [smalldatetime] NULL,
	[allocateExistingGroups] [bit] NULL,
	[maximumFamiliesPerGroup] [int] NULL,
	[spaceType] [nvarchar](100) NULL,
	[invalidThresholdFactor] [decimal](18, 5) NULL,
	[ignoreNrBuffers] [bit] NULL,
	[defaultDbmPolicy] [int] NULL,
	[dominantSalesEstimation] [smallint] NULL,
	[attributesSetName] [nvarchar](200) NULL,
	[allocationPriority] [decimal](18, 5) NULL,
	[eligibilityRule] [nvarchar](200) NULL,
	[overrideAllocationMethod] [nvarchar](100) NULL,
	[limitAllocationToGap] [bit] NULL,
	[agCustom_num1] [decimal](18, 5) NULL,
	[agCustom_num2] [decimal](18, 5) NULL,
	[agCustom_num3] [decimal](18, 5) NULL,
	[agCustom_num4] [decimal](18, 5) NULL,
	[agCustom_num5] [decimal](18, 5) NULL,
	[agCustom_num6] [decimal](18, 5) NULL,
	[agCustom_num7] [decimal](18, 5) NULL,
	[agCustom_num8] [decimal](18, 5) NULL,
	[agCustom_num9] [decimal](18, 5) NULL,
	[agCustom_num10] [decimal](18, 5) NULL,
	[oddmentsRatio] [decimal](18, 5) NULL,
	[enableDTM] [bit] NULL,
	[DTMBenchmark] [decimal](18, 5) NULL,
	[DTMIncreaseThreshold] [decimal](18, 5) NULL,
	[DTMDecreaseThreshold] [decimal](18, 5) NULL,
	[DTMDecileForIncrease] [decimal](18, 5) NULL,
	[DTMDecileForDecrease] [decimal](18, 5) NULL,
	[DTMIncreaseFactor] [decimal](18, 5) NULL,
	[DTMDecreaseFactor] [decimal](18, 5) NULL,
	[newnessThreshold] [int] NULL,
	[newness] [decimal](18, 5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputLocationAssortmentGroupsQuarantine]    Script Date: 4/18/2024 3:51:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputLocationAssortmentGroupsQuarantine](
	[stockLocationName] [nvarchar](100) NULL,
	[displayGroupName] [nvarchar](100) NULL,
	[assortmentGroupName] [nvarchar](100) NULL,
	[assortmentGroupDescription] [nvarchar](200) NULL,
	[varietyTarget] [int] NULL,
	[minTarget] [int] NULL,
	[maxTarget] [int] NULL,
	[spaceTarget] [int] NULL,
	[gapMode] [nvarchar](100) NULL,
	[spaceManaged] [bit] NULL,
	[quantityPerFamily] [decimal](18, 5) NULL,
	[considerVarietyGap] [bit] NULL,
	[alignmentToInventory] [decimal](18, 5) NULL,
	[reportedDate] [smalldatetime] NULL,
	[allocateExistingGroups] [bit] NULL,
	[maximumFamiliesPerGroup] [int] NULL,
	[spaceType] [nvarchar](100) NULL,
	[invalidThresholdFactor] [decimal](18, 5) NULL,
	[ignoreNrBuffers] [bit] NULL,
	[defaultDbmPolicy] [int] NULL,
	[dominantSalesEstimation] [smallint] NULL,
	[attributesSetName] [nvarchar](200) NULL,
	[allocationPriority] [decimal](18, 5) NULL,
	[eligibilityRule] [nvarchar](200) NULL,
	[overrideAllocationMethod] [nvarchar](100) NULL,
	[limitAllocationToGap] [bit] NULL,
	[agCustom_num1] [decimal](18, 5) NULL,
	[agCustom_num2] [decimal](18, 5) NULL,
	[agCustom_num3] [decimal](18, 5) NULL,
	[agCustom_num4] [decimal](18, 5) NULL,
	[agCustom_num5] [decimal](18, 5) NULL,
	[agCustom_num6] [decimal](18, 5) NULL,
	[agCustom_num7] [decimal](18, 5) NULL,
	[agCustom_num8] [decimal](18, 5) NULL,
	[agCustom_num9] [decimal](18, 5) NULL,
	[agCustom_num10] [decimal](18, 5) NULL,
	[oddmentsRatio] [decimal](18, 5) NULL,
	[enableDTM] [bit] NULL,
	[DTMBenchmark] [decimal](18, 5) NULL,
	[DTMIncreaseThreshold] [decimal](18, 5) NULL,
	[DTMDecreaseThreshold] [decimal](18, 5) NULL,
	[DTMDecileForIncrease] [decimal](18, 5) NULL,
	[DTMDecileForDecrease] [decimal](18, 5) NULL,
	[DTMIncreaseFactor] [decimal](18, 5) NULL,
	[DTMDecreaseFactor] [decimal](18, 5) NULL,
	[newnessThreshold] [int] NULL,
	[newness] [decimal](18, 5) NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputLocationCatalogSkus]    Script Date: 4/18/2024 3:51:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputLocationCatalogSkus](
	[skuName] [nvarchar](100) NULL,
	[stockLocationName] [nvarchar](100) NULL,
	[originStockLocation] [nvarchar](100) NULL,
	[replenishmentType] [nvarchar](50) NULL,
	[maxPipeline] [int] NULL,
	[reportedDate] [datetime] NULL,
	[minimumReplenishment] [int] NULL,
	[lastBatchReplenishment] [decimal](18, 5) NULL,
	[replenishmentMultiplications] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputLocationCatalogSkusQuarantine]    Script Date: 4/18/2024 3:51:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputLocationCatalogSkusQuarantine](
	[skuName] [nvarchar](100) NULL,
	[stockLocationName] [nvarchar](100) NULL,
	[originStockLocation] [nvarchar](100) NULL,
	[replenishmentType] [nvarchar](50) NULL,
	[maxPipeline] [int] NULL,
	[reportedDate] [datetime] NULL,
	[minimumReplenishment] [int] NULL,
	[lastBatchReplenishment] [decimal](18, 5) NULL,
	[replenishmentMultiplications] [int] NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputLocationCategories]    Script Date: 4/18/2024 3:51:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputLocationCategories](
	[categoryName] [nvarchar](100) NULL,
	[stockLocationName] [nvarchar](100) NULL,
	[normLevel] [int] NULL,
	[reportedDate] [datetime] NULL,
	[siteNormLevel] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputLocationCategoriesQuarantine]    Script Date: 4/18/2024 3:51:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputLocationCategoriesQuarantine](
	[categoryName] [nvarchar](100) NULL,
	[stockLocationName] [nvarchar](100) NULL,
	[normLevel] [int] NULL,
	[reportedDate] [datetime] NULL,
	[siteNormLevel] [int] NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputLocationDisplayGroups]    Script Date: 4/18/2024 3:51:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputLocationDisplayGroups](
	[stockLocationName] [nvarchar](100) NULL,
	[displayGroupName] [nvarchar](100) NULL,
	[displayGroupDescription] [nvarchar](200) NULL,
	[minQuantity] [int] NULL,
	[maxQuantity] [int] NULL,
	[minCost] [decimal](18, 5) NULL,
	[maxCost] [decimal](18, 5) NULL,
	[reportedDate] [smalldatetime] NULL,
	[dgCustom_num1] [decimal](18, 5) NULL,
	[dgCustom_num2] [decimal](18, 5) NULL,
	[dgCustom_num3] [decimal](18, 5) NULL,
	[dgCustom_num4] [decimal](18, 5) NULL,
	[dgCustom_num5] [decimal](18, 5) NULL,
	[dgCustom_num6] [decimal](18, 5) NULL,
	[dgCustom_num7] [decimal](18, 5) NULL,
	[dgCustom_num8] [decimal](18, 5) NULL,
	[dgCustom_num9] [decimal](18, 5) NULL,
	[dgCustom_num10] [decimal](18, 5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputLocationDisplayGroupsQuarantine]    Script Date: 4/18/2024 3:51:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputLocationDisplayGroupsQuarantine](
	[stockLocationName] [nvarchar](100) NULL,
	[displayGroupName] [nvarchar](100) NULL,
	[displayGroupDescription] [nvarchar](200) NULL,
	[minQuantity] [int] NULL,
	[maxQuantity] [int] NULL,
	[minCost] [decimal](18, 5) NULL,
	[maxCost] [decimal](18, 5) NULL,
	[reportedDate] [smalldatetime] NULL,
	[dgCustom_num1] [decimal](18, 5) NULL,
	[dgCustom_num2] [decimal](18, 5) NULL,
	[dgCustom_num3] [decimal](18, 5) NULL,
	[dgCustom_num4] [decimal](18, 5) NULL,
	[dgCustom_num5] [decimal](18, 5) NULL,
	[dgCustom_num6] [decimal](18, 5) NULL,
	[dgCustom_num7] [decimal](18, 5) NULL,
	[dgCustom_num8] [decimal](18, 5) NULL,
	[dgCustom_num9] [decimal](18, 5) NULL,
	[dgCustom_num10] [decimal](18, 5) NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputLocationFamilyAttributes]    Script Date: 4/18/2024 3:51:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputLocationFamilyAttributes](
	[familyName] [nvarchar](100) NULL,
	[stockLocationName] [nvarchar](100) NULL,
	[originStockLocationName] [nvarchar](100) NULL,
	[replenishmentTime] [smallint] NULL,
	[invalidFamilyThreshold] [smallint] NULL,
	[npiSetName] [nvarchar](100) NULL,
	[avoidRefreshment] [bit] NULL,
	[imposedValidation] [nvarchar](20) NULL,
	[bufferUtilizationLimitPrec] [int] NULL,
	[startAllocatingOn] [smalldatetime] NULL,
	[reportedDate] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputLocationFamilyAttributesQuarantine]    Script Date: 4/18/2024 3:51:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputLocationFamilyAttributesQuarantine](
	[familyName] [nvarchar](100) NULL,
	[stockLocationName] [nvarchar](100) NULL,
	[originStockLocationName] [nvarchar](100) NULL,
	[replenishmentTime] [smallint] NULL,
	[invalidFamilyThreshold] [smallint] NULL,
	[npiSetName] [nvarchar](100) NULL,
	[avoidRefreshment] [bit] NULL,
	[imposedValidation] [nvarchar](20) NULL,
	[bufferUtilizationLimitPrec] [int] NULL,
	[startAllocatingOn] [smalldatetime] NULL,
	[reportedDate] [smalldatetime] NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputMarketFamilies]    Script Date: 4/18/2024 3:51:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputMarketFamilies](
	[familyName] [nvarchar](100) NULL,
	[description] [nvarchar](100) NULL,
	[standardLeadTime] [int] NULL,
	[reportedDate] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputMarketFamiliesQuarantine]    Script Date: 4/18/2024 3:51:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputMarketFamiliesQuarantine](
	[familyName] [nvarchar](100) NULL,
	[description] [nvarchar](100) NULL,
	[standardLeadTime] [int] NULL,
	[reportedDate] [smalldatetime] NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputMasterSkus]    Script Date: 4/18/2024 3:51:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputMasterSkus](
	[skuName] [nvarchar](100) NULL,
	[skuDescription] [nvarchar](200) NULL,
	[status] [nvarchar](50) NULL,
	[familyName] [nvarchar](100) NULL,
	[familyMember] [nvarchar](100) NULL,
	[npiQuantity] [int] NULL,
	[unitPrice] [numeric](21, 5) NULL,
	[throughput] [numeric](21, 5) NULL,
	[tvc] [numeric](21, 5) NULL,
	[safetyStock] [numeric](21, 5) NULL,
	[bufferManagementPolicyID] [smallint] NULL,
	[uomName] [nvarchar](100) NULL,
	[reportedDate] [smalldatetime] NULL,
	[skuPropertyID1] [nvarchar](100) NULL,
	[skuPropertyID2] [nvarchar](100) NULL,
	[skuPropertyID3] [nvarchar](100) NULL,
	[skuPropertyID4] [nvarchar](100) NULL,
	[skuPropertyID5] [nvarchar](100) NULL,
	[skuPropertyID6] [nvarchar](100) NULL,
	[skuPropertyID7] [nvarchar](100) NULL,
	[custom_num1] [decimal](18, 5) NULL,
	[custom_num2] [decimal](18, 5) NULL,
	[custom_num3] [decimal](18, 5) NULL,
	[custom_num4] [decimal](18, 5) NULL,
	[custom_num5] [decimal](18, 5) NULL,
	[custom_num6] [decimal](18, 5) NULL,
	[custom_num7] [decimal](18, 5) NULL,
	[custom_num8] [decimal](18, 5) NULL,
	[custom_num9] [decimal](18, 5) NULL,
	[custom_num10] [decimal](18, 5) NULL,
	[custom_txt1] [nvarchar](150) NULL,
	[custom_txt2] [nvarchar](150) NULL,
	[custom_txt3] [nvarchar](150) NULL,
	[custom_txt4] [nvarchar](150) NULL,
	[custom_txt5] [nvarchar](150) NULL,
	[custom_txt6] [nvarchar](150) NULL,
	[custom_txt7] [nvarchar](150) NULL,
	[custom_txt8] [nvarchar](150) NULL,
	[custom_txt9] [nvarchar](150) NULL,
	[custom_txt10] [nvarchar](150) NULL,
	[groupID] [int] NULL,
	[isPreferred] [bit] NULL,
	[familyDescription] [nvarchar](150) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputMasterSkusQuarantine]    Script Date: 4/18/2024 3:51:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputMasterSkusQuarantine](
	[skuName] [nvarchar](100) NULL,
	[skuDescription] [nvarchar](200) NULL,
	[status] [nvarchar](50) NULL,
	[familyName] [nvarchar](100) NULL,
	[familyMember] [nvarchar](100) NULL,
	[npiQuantity] [int] NULL,
	[unitPrice] [numeric](21, 5) NULL,
	[throughput] [numeric](21, 5) NULL,
	[tvc] [numeric](21, 5) NULL,
	[safetyStock] [numeric](21, 5) NULL,
	[bufferManagementPolicyID] [smallint] NULL,
	[uomName] [nvarchar](100) NULL,
	[reportedDate] [smalldatetime] NULL,
	[skuPropertyID1] [nvarchar](100) NULL,
	[skuPropertyID2] [nvarchar](100) NULL,
	[skuPropertyID3] [nvarchar](100) NULL,
	[skuPropertyID4] [nvarchar](100) NULL,
	[skuPropertyID5] [nvarchar](100) NULL,
	[skuPropertyID6] [nvarchar](100) NULL,
	[skuPropertyID7] [nvarchar](100) NULL,
	[custom_num1] [decimal](18, 5) NULL,
	[custom_num2] [decimal](18, 5) NULL,
	[custom_num3] [decimal](18, 5) NULL,
	[custom_num4] [decimal](18, 5) NULL,
	[custom_num5] [decimal](18, 5) NULL,
	[custom_num6] [decimal](18, 5) NULL,
	[custom_num7] [decimal](18, 5) NULL,
	[custom_num8] [decimal](18, 5) NULL,
	[custom_num9] [decimal](18, 5) NULL,
	[custom_num10] [decimal](18, 5) NULL,
	[custom_txt1] [nvarchar](150) NULL,
	[custom_txt2] [nvarchar](150) NULL,
	[custom_txt3] [nvarchar](150) NULL,
	[custom_txt4] [nvarchar](150) NULL,
	[custom_txt5] [nvarchar](150) NULL,
	[custom_txt6] [nvarchar](150) NULL,
	[custom_txt7] [nvarchar](150) NULL,
	[custom_txt8] [nvarchar](150) NULL,
	[custom_txt9] [nvarchar](150) NULL,
	[custom_txt10] [nvarchar](150) NULL,
	[groupID] [int] NULL,
	[isPreferred] [bit] NULL,
	[familyDescription] [nvarchar](150) NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputMaterialsStockLocations]    Script Date: 4/18/2024 3:51:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputMaterialsStockLocations](
	[plantName] [nvarchar](100) NULL,
	[stockLocationName] [nvarchar](100) NULL,
	[skuName] [nvarchar](100) NULL,
	[reportedDate] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputMaterialsStockLocationsQuarantine]    Script Date: 4/18/2024 3:51:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputMaterialsStockLocationsQuarantine](
	[plantName] [nvarchar](100) NULL,
	[stockLocationName] [nvarchar](100) NULL,
	[skuName] [nvarchar](100) NULL,
	[reportedDate] [smalldatetime] NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputNewMtoSku]    Script Date: 4/18/2024 3:51:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputNewMtoSku](
	[stockLocationName] [nvarchar](100) NULL,
	[locationSkuName] [nvarchar](100) NULL,
	[skuName] [nvarchar](100) NULL,
	[skuDescription] [nvarchar](1000) NULL,
	[timeBuffer] [int] NULL,
	[originStockLocation] [nvarchar](100) NULL,
	[inventoryAtSite] [numeric](21, 5) NULL,
	[inventoryAtTransit] [numeric](21, 5) NULL,
	[inventoryAtTransitPurchasing] [numeric](21, 5) NULL,
	[inventoryAtProduction] [numeric](21, 5) NULL,
	[unitPrice] [numeric](21, 5) NULL,
	[throughput] [numeric](21, 5) NULL,
	[tvc] [numeric](21, 5) NULL,
	[uomID] [nvarchar](50) NULL,
	[autoReplenishment] [bit] NULL,
	[skuPropertyID1] [nvarchar](100) NULL,
	[skuPropertyID2] [nvarchar](100) NULL,
	[skuPropertyID3] [nvarchar](100) NULL,
	[skuPropertyID4] [nvarchar](100) NULL,
	[skuPropertyID5] [nvarchar](100) NULL,
	[skuPropertyID6] [nvarchar](100) NULL,
	[skuPropertyID7] [nvarchar](100) NULL,
	[reportedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputNewMtoSkuQuarantine]    Script Date: 4/18/2024 3:51:41 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputNewMtoSkuQuarantine](
	[stockLocationName] [nvarchar](100) NULL,
	[locationSkuName] [nvarchar](100) NULL,
	[skuName] [nvarchar](100) NULL,
	[skuDescription] [nvarchar](1000) NULL,
	[timeBuffer] [int] NULL,
	[originStockLocation] [nvarchar](100) NULL,
	[inventoryAtSite] [numeric](21, 5) NULL,
	[inventoryAtTransit] [numeric](21, 5) NULL,
	[inventoryAtTransitPurchasing] [numeric](21, 5) NULL,
	[inventoryAtProduction] [numeric](21, 5) NULL,
	[unitPrice] [numeric](21, 5) NULL,
	[throughput] [numeric](21, 5) NULL,
	[tvc] [numeric](21, 5) NULL,
	[uomID] [nvarchar](50) NULL,
	[autoReplenishment] [bit] NULL,
	[skuPropertyID1] [nvarchar](100) NULL,
	[skuPropertyID2] [nvarchar](100) NULL,
	[skuPropertyID3] [nvarchar](100) NULL,
	[skuPropertyID4] [nvarchar](100) NULL,
	[skuPropertyID5] [nvarchar](100) NULL,
	[skuPropertyID6] [nvarchar](100) NULL,
	[skuPropertyID7] [nvarchar](100) NULL,
	[reportedDate] [datetime] NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputNewSku]    Script Date: 4/18/2024 3:51:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputNewSku](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[stockLocationID] [nvarchar](100) NULL,
	[locationSkuName] [nvarchar](100) NULL,
	[skuID] [nvarchar](100) NULL,
	[skuDescription] [nvarchar](1000) NULL,
	[originStockLocation] [nvarchar](100) NULL,
	[originSKU] [nvarchar](100) NULL,
	[bufferSize] [numeric](21, 5) NULL,
	[minimumBufferSize] [numeric](21, 5) NULL,
	[replenishmentTime] [int] NULL,
	[inventoryAtSite] [numeric](21, 5) NULL,
	[inventoryAtTransit] [numeric](21, 5) NULL,
	[inventoryAtProduction] [numeric](21, 5) NULL,
	[unitPrice] [numeric](21, 5) NULL,
	[Throughput] [numeric](21, 5) NULL,
	[TVC] [numeric](21, 5) NULL,
	[saftyStock] [numeric](21, 5) NULL,
	[minimumRequiredBP] [numeric](21, 5) NULL,
	[minimumReplenishment] [numeric](21, 5) NULL,
	[multiplications] [numeric](21, 5) NULL,
	[uomID] [nvarchar](100) NULL,
	[avoidReplenishment] [bit] NULL,
	[avoidSeasonality] [bit] NULL,
	[autoReplenishment] [bit] NULL,
	[skuPropertyID1] [nvarchar](100) NULL,
	[skuPropertyID2] [nvarchar](100) NULL,
	[skuPropertyID3] [nvarchar](100) NULL,
	[skuPropertyID4] [nvarchar](100) NULL,
	[skuPropertyID5] [nvarchar](100) NULL,
	[skuPropertyID6] [nvarchar](100) NULL,
	[skuPropertyID7] [nvarchar](100) NULL,
	[reportedDate] [datetime] NULL,
	[bufferManagementPolicy] [int] NULL,
	[endOfLifePolicy] [nvarchar](150) NULL,
	[endOfLifeStatus] [bit] NULL,
	[irrInvAtSite] [numeric](18, 5) NULL,
	[irrInvAtTransit] [numeric](18, 5) NULL,
	[irrInvAtProduction] [numeric](18, 5) NULL,
	[shipmentMeasure] [numeric](18, 5) NULL,
	[custom_num1] [decimal](18, 5) NULL,
	[custom_num2] [decimal](18, 5) NULL,
	[custom_num3] [decimal](18, 5) NULL,
	[custom_num4] [decimal](18, 5) NULL,
	[custom_num5] [decimal](18, 5) NULL,
	[custom_num6] [decimal](18, 5) NULL,
	[custom_num7] [decimal](18, 5) NULL,
	[custom_num8] [decimal](18, 5) NULL,
	[custom_num9] [decimal](18, 5) NULL,
	[custom_num10] [decimal](18, 5) NULL,
	[custom_txt1] [nvarchar](100) NULL,
	[custom_txt2] [nvarchar](100) NULL,
	[custom_txt3] [nvarchar](100) NULL,
	[custom_txt4] [nvarchar](100) NULL,
	[custom_txt5] [nvarchar](100) NULL,
	[custom_txt6] [nvarchar](100) NULL,
	[custom_txt7] [nvarchar](100) NULL,
	[custom_txt8] [nvarchar](100) NULL,
	[custom_txt9] [nvarchar](100) NULL,
	[custom_txt10] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Index [IDX_Symphony_InputNewSku]    Script Date: 4/18/2024 3:51:42 PM ******/
CREATE UNIQUE CLUSTERED INDEX [IDX_Symphony_InputNewSku] ON [dbo].[Symphony_InputNewSku]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputNewSkuQuarantine]    Script Date: 4/18/2024 3:51:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputNewSkuQuarantine](
	[stockLocationID] [nvarchar](100) NULL,
	[locationSkuName] [nvarchar](100) NULL,
	[skuID] [nvarchar](100) NULL,
	[skuDescription] [nvarchar](1000) NULL,
	[originStockLocation] [nvarchar](100) NULL,
	[originSKU] [nvarchar](100) NULL,
	[bufferSize] [numeric](21, 5) NULL,
	[minimumBufferSize] [numeric](21, 5) NULL,
	[replenishmentTime] [int] NULL,
	[inventoryAtSite] [numeric](21, 5) NULL,
	[inventoryAtTransit] [numeric](21, 5) NULL,
	[inventoryAtProduction] [numeric](21, 5) NULL,
	[unitPrice] [numeric](21, 5) NULL,
	[Throughput] [numeric](21, 5) NULL,
	[TVC] [numeric](21, 5) NULL,
	[saftyStock] [numeric](21, 5) NULL,
	[minimumRequiredBP] [numeric](21, 5) NULL,
	[minimumReplenishment] [numeric](21, 5) NULL,
	[multiplications] [numeric](21, 5) NULL,
	[uomID] [nvarchar](100) NULL,
	[avoidReplenishment] [bit] NULL,
	[avoidSeasonality] [bit] NULL,
	[autoReplenishment] [bit] NULL,
	[skuPropertyID1] [nvarchar](100) NULL,
	[skuPropertyID2] [nvarchar](100) NULL,
	[skuPropertyID3] [nvarchar](100) NULL,
	[skuPropertyID4] [nvarchar](100) NULL,
	[skuPropertyID5] [nvarchar](100) NULL,
	[skuPropertyID6] [nvarchar](100) NULL,
	[skuPropertyID7] [nvarchar](100) NULL,
	[reportedDate] [datetime] NULL,
	[bufferManagementPolicy] [int] NULL,
	[endOfLifePolicy] [nvarchar](150) NULL,
	[endOfLifeStatus] [bit] NULL,
	[irrInvAtSite] [numeric](18, 5) NULL,
	[irrInvAtTransit] [numeric](18, 5) NULL,
	[irrInvAtProduction] [numeric](18, 5) NULL,
	[shipmentMeasure] [numeric](18, 5) NULL,
	[custom_num1] [decimal](18, 5) NULL,
	[custom_num2] [decimal](18, 5) NULL,
	[custom_num3] [decimal](18, 5) NULL,
	[custom_num4] [decimal](18, 5) NULL,
	[custom_num5] [decimal](18, 5) NULL,
	[custom_num6] [decimal](18, 5) NULL,
	[custom_num7] [decimal](18, 5) NULL,
	[custom_num8] [decimal](18, 5) NULL,
	[custom_num9] [decimal](18, 5) NULL,
	[custom_num10] [decimal](18, 5) NULL,
	[custom_txt1] [nvarchar](100) NULL,
	[custom_txt2] [nvarchar](100) NULL,
	[custom_txt3] [nvarchar](100) NULL,
	[custom_txt4] [nvarchar](100) NULL,
	[custom_txt5] [nvarchar](100) NULL,
	[custom_txt6] [nvarchar](100) NULL,
	[custom_txt7] [nvarchar](100) NULL,
	[custom_txt8] [nvarchar](100) NULL,
	[custom_txt9] [nvarchar](100) NULL,
	[custom_txt10] [nvarchar](100) NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputNewStockLocation]    Script Date: 4/18/2024 3:51:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputNewStockLocation](
	[stockLocationName] [nvarchar](100) NULL,
	[stockLocationDescription] [nvarchar](1000) NULL,
	[stockLocationType] [nvarchar](50) NULL,
	[isPlant] [bit] NULL,
	[isVendor] [bit] NULL,
	[isTransparent] [bit] NULL,
	[spaceManagement] [bit] NULL,
	[shipmentPolicyID] [nvarchar](1000) NULL,
	[supplierEmail] [nvarchar](1000) NULL,
	[defaultOrigin] [nvarchar](100) NULL,
	[allocationPriority] [int] NULL,
	[replenishmentPriority] [int] NULL,
	[stopAllocation] [bit] NULL,
	[slPropertyID1] [nvarchar](100) NULL,
	[slPropertyID2] [nvarchar](100) NULL,
	[slPropertyID3] [nvarchar](100) NULL,
	[slPropertyID4] [nvarchar](100) NULL,
	[slPropertyID5] [nvarchar](100) NULL,
	[slPropertyID6] [nvarchar](100) NULL,
	[slPropertyID7] [nvarchar](100) NULL,
	[reportedDate] [datetime] NULL,
	[slCustom_num1] [decimal](18, 5) NULL,
	[slCustom_num2] [decimal](18, 5) NULL,
	[slCustom_num3] [decimal](18, 5) NULL,
	[slCustom_num4] [decimal](18, 5) NULL,
	[slCustom_num5] [decimal](18, 5) NULL,
	[slCustom_num6] [decimal](18, 5) NULL,
	[slCustom_num7] [decimal](18, 5) NULL,
	[slCustom_num8] [decimal](18, 5) NULL,
	[slCustom_num9] [decimal](18, 5) NULL,
	[slCustom_num10] [decimal](18, 5) NULL,
	[allowOverAllocation] [bit] NULL,
	[retailCalendarID] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputNewStockLocationQuarantine]    Script Date: 4/18/2024 3:51:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputNewStockLocationQuarantine](
	[stockLocationName] [nvarchar](100) NULL,
	[stockLocationDescription] [nvarchar](1000) NULL,
	[stockLocationType] [nvarchar](50) NULL,
	[isPlant] [bit] NULL,
	[isVendor] [bit] NULL,
	[isTransparent] [bit] NULL,
	[spaceManagement] [bit] NULL,
	[shipmentPolicyID] [nvarchar](1000) NULL,
	[supplierEmail] [nvarchar](1000) NULL,
	[defaultOrigin] [nvarchar](100) NULL,
	[allocationPriority] [int] NULL,
	[replenishmentPriority] [int] NULL,
	[stopAllocation] [bit] NULL,
	[slPropertyID1] [nvarchar](100) NULL,
	[slPropertyID2] [nvarchar](100) NULL,
	[slPropertyID3] [nvarchar](100) NULL,
	[slPropertyID4] [nvarchar](100) NULL,
	[slPropertyID5] [nvarchar](100) NULL,
	[slPropertyID6] [nvarchar](100) NULL,
	[slPropertyID7] [nvarchar](100) NULL,
	[reportedDate] [datetime] NULL,
	[slCustom_num1] [decimal](18, 5) NULL,
	[slCustom_num2] [decimal](18, 5) NULL,
	[slCustom_num3] [decimal](18, 5) NULL,
	[slCustom_num4] [decimal](18, 5) NULL,
	[slCustom_num5] [decimal](18, 5) NULL,
	[slCustom_num6] [decimal](18, 5) NULL,
	[slCustom_num7] [decimal](18, 5) NULL,
	[slCustom_num8] [decimal](18, 5) NULL,
	[slCustom_num9] [decimal](18, 5) NULL,
	[slCustom_num10] [decimal](18, 5) NULL,
	[allowOverAllocation] [bit] NULL,
	[retailCalendarID] [nvarchar](50) NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputNPISetMembers]    Script Date: 4/18/2024 3:51:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputNPISetMembers](
	[npiSetID] [int] NULL,
	[npiSetName] [nvarchar](100) NULL,
	[familyMemberID] [int] NULL,
	[familyMemberName] [nvarchar](100) NULL,
	[npiQuantity] [int] NULL,
	[reportedDate] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputNPISetMembersQuarantine]    Script Date: 4/18/2024 3:51:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputNPISetMembersQuarantine](
	[npiSetID] [int] NULL,
	[npiSetName] [nvarchar](100) NULL,
	[familyMemberID] [int] NULL,
	[familyMemberName] [nvarchar](100) NULL,
	[npiQuantity] [int] NULL,
	[reportedDate] [smalldatetime] NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputProduction]    Script Date: 4/18/2024 3:51:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputProduction](
	[plant] [nvarchar](100) NULL,
	[client] [nvarchar](100) NULL,
	[clientDescription] [nvarchar](100) NULL,
	[skuName] [nvarchar](100) NULL,
	[quantity] [numeric](21, 5) NULL,
	[productionFamily] [nvarchar](100) NULL,
	[woid] [nvarchar](50) NULL,
	[orderDesc] [nvarchar](100) NULL,
	[saleOrderId] [nvarchar](50) NULL,
	[orderType] [nvarchar](50) NULL,
	[dueDate] [datetime] NULL,
	[workCenter] [nvarchar](50) NULL,
	[sellingPrice] [numeric](21, 5) NULL,
	[releaseDate] [datetime] NULL,
	[componentID] [nvarchar](50) NULL,
	[woPropertyID1] [nvarchar](100) NULL,
	[woPropertyID2] [nvarchar](100) NULL,
	[woPropertyID3] [nvarchar](100) NULL,
	[woPropertyID4] [nvarchar](100) NULL,
	[woPropertyID5] [nvarchar](100) NULL,
	[woPropertyID6] [nvarchar](100) NULL,
	[woPropertyID7] [nvarchar](100) NULL,
	[woPropertyID8] [nvarchar](100) NULL,
	[woPropertyID9] [nvarchar](100) NULL,
	[woPropertyID10] [nvarchar](100) NULL,
	[woPropertyID11] [nvarchar](100) NULL,
	[woPropertyID12] [nvarchar](100) NULL,
	[woPropertyID13] [nvarchar](100) NULL,
	[woPropertyID14] [nvarchar](100) NULL,
	[woPropertyID15] [nvarchar](100) NULL,
	[woPropertyID16] [nvarchar](100) NULL,
	[woPropertyID17] [nvarchar](100) NULL,
	[woPropertyID18] [nvarchar](100) NULL,
	[woPropertyID19] [nvarchar](100) NULL,
	[woPropertyID20] [nvarchar](100) NULL,
	[woCustom_num1] [decimal](18, 5) NULL,
	[woCustom_num2] [decimal](18, 5) NULL,
	[woCustom_num3] [decimal](18, 5) NULL,
	[woCustom_num4] [decimal](18, 5) NULL,
	[woCustom_num5] [decimal](18, 5) NULL,
	[woCustom_num6] [decimal](18, 5) NULL,
	[woCustom_num7] [decimal](18, 5) NULL,
	[woCustom_num8] [decimal](18, 5) NULL,
	[woCustom_num9] [decimal](18, 5) NULL,
	[woCustom_num10] [decimal](18, 5) NULL,
	[woCustom_txt1] [nvarchar](100) NULL,
	[woCustom_txt2] [nvarchar](100) NULL,
	[woCustom_txt3] [nvarchar](100) NULL,
	[woCustom_txt4] [nvarchar](100) NULL,
	[woCustom_txt5] [nvarchar](100) NULL,
	[woCustom_txt6] [nvarchar](100) NULL,
	[woCustom_txt7] [nvarchar](100) NULL,
	[woCustom_txt8] [nvarchar](100) NULL,
	[woCustom_txt9] [nvarchar](100) NULL,
	[woCustom_txt10] [nvarchar](100) NULL,
	[skuDesc] [nvarchar](1000) NULL,
	[reportedDate] [datetime] NULL,
	[percentDone] [decimal](18, 5) NULL,
	[throughput] [decimal](18, 5) NULL,
	[tvc] [decimal](18, 5) NULL,
	[clientOrderID] [nvarchar](50) NULL,
	[sequence] [decimal](18, 5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputProductionFamilies]    Script Date: 4/18/2024 3:51:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputProductionFamilies](
	[plantName] [nvarchar](100) NULL,
	[familyName] [nvarchar](100) NULL,
	[bufferSize] [int] NULL,
	[percentTouchTime] [decimal](9, 5) NULL,
	[flowDictatorName] [nvarchar](50) NULL,
	[allowForLongTravelTime] [bit] NULL,
	[productionLeadTimePrec] [int] NULL,
	[bufferFactor] [decimal](9, 5) NULL,
	[safetyFactor] [decimal](9, 5) NULL,
	[thersholdFactor] [decimal](9, 5) NULL,
	[reportedDate] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputProductionFamiliesQuarantine]    Script Date: 4/18/2024 3:51:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputProductionFamiliesQuarantine](
	[plantName] [nvarchar](100) NULL,
	[familyName] [nvarchar](100) NULL,
	[bufferSize] [int] NULL,
	[percentTouchTime] [decimal](9, 5) NULL,
	[flowDictatorName] [nvarchar](50) NULL,
	[allowForLongTravelTime] [bit] NULL,
	[productionLeadTimePrec] [int] NULL,
	[bufferFactor] [decimal](9, 5) NULL,
	[safetyFactor] [decimal](9, 5) NULL,
	[thersholdFactor] [decimal](9, 5) NULL,
	[reportedDate] [smalldatetime] NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputProductionMCRs]    Script Date: 4/18/2024 3:51:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputProductionMCRs](
	[ccrName] [nvarchar](50) NULL,
	[plantName] [nvarchar](100) NULL,
	[superFastMaxBar] [float] NULL,
	[superFastMinBar] [float] NULL,
	[redBlackMaxBar] [float] NULL,
	[redBlackMinBar] [float] NULL,
	[reservedSuperFast] [float] NULL,
	[reservedFast] [float] NULL,
	[reservedStrategic] [float] NULL,
	[reservedMTS] [float] NULL,
	[workingHoursSunday] [float] NULL,
	[workingHoursMonday] [float] NULL,
	[workingHoursTuesday] [float] NULL,
	[workingHoursWednesday] [float] NULL,
	[workingHoursThursday] [float] NULL,
	[workingHoursFriday] [float] NULL,
	[workingHoursSaturday] [float] NULL,
	[tractionHorizon] [int] NULL,
	[executionHorizon] [int] NULL,
	[superFastLongHorizon] [int] NULL,
	[fastLongHorizon] [int] NULL,
	[standardLongHorizon] [int] NULL,
	[mtsLongHorizon] [int] NULL,
	[strategicLongHorizon] [int] NULL,
	[reportedDate] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputProductionMCRsQuarantine]    Script Date: 4/18/2024 3:51:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputProductionMCRsQuarantine](
	[ccrName] [nvarchar](50) NULL,
	[plantName] [nvarchar](100) NULL,
	[superFastMaxBar] [float] NULL,
	[superFastMinBar] [float] NULL,
	[redBlackMaxBar] [float] NULL,
	[redBlackMinBar] [float] NULL,
	[reservedSuperFast] [float] NULL,
	[reservedFast] [float] NULL,
	[reservedStrategic] [float] NULL,
	[reservedMTS] [float] NULL,
	[workingHoursSunday] [float] NULL,
	[workingHoursMonday] [float] NULL,
	[workingHoursTuesday] [float] NULL,
	[workingHoursWednesday] [float] NULL,
	[workingHoursThursday] [float] NULL,
	[workingHoursFriday] [float] NULL,
	[workingHoursSaturday] [float] NULL,
	[tractionHorizon] [int] NULL,
	[executionHorizon] [int] NULL,
	[superFastLongHorizon] [int] NULL,
	[fastLongHorizon] [int] NULL,
	[standardLongHorizon] [int] NULL,
	[mtsLongHorizon] [int] NULL,
	[strategicLongHorizon] [int] NULL,
	[reportedDate] [smalldatetime] NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputProductionQuarantine]    Script Date: 4/18/2024 3:51:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputProductionQuarantine](
	[plant] [nvarchar](100) NULL,
	[client] [nvarchar](100) NULL,
	[clientDescription] [nvarchar](100) NULL,
	[skuName] [nvarchar](100) NULL,
	[quantity] [numeric](21, 5) NULL,
	[productionFamily] [nvarchar](100) NULL,
	[woid] [nvarchar](50) NULL,
	[orderDesc] [nvarchar](100) NULL,
	[saleOrderId] [nvarchar](50) NULL,
	[orderType] [nvarchar](50) NULL,
	[dueDate] [datetime] NULL,
	[workCenter] [nvarchar](50) NULL,
	[sellingPrice] [numeric](21, 5) NULL,
	[releaseDate] [datetime] NULL,
	[componentID] [nvarchar](50) NULL,
	[woPropertyID1] [nvarchar](100) NULL,
	[woPropertyID2] [nvarchar](100) NULL,
	[woPropertyID3] [nvarchar](100) NULL,
	[woPropertyID4] [nvarchar](100) NULL,
	[woPropertyID5] [nvarchar](100) NULL,
	[woPropertyID6] [nvarchar](100) NULL,
	[woPropertyID7] [nvarchar](100) NULL,
	[woPropertyID8] [nvarchar](100) NULL,
	[woPropertyID9] [nvarchar](100) NULL,
	[woPropertyID10] [nvarchar](100) NULL,
	[woPropertyID11] [nvarchar](100) NULL,
	[woPropertyID12] [nvarchar](100) NULL,
	[woPropertyID13] [nvarchar](100) NULL,
	[woPropertyID14] [nvarchar](100) NULL,
	[woPropertyID15] [nvarchar](100) NULL,
	[woPropertyID16] [nvarchar](100) NULL,
	[woPropertyID17] [nvarchar](100) NULL,
	[woPropertyID18] [nvarchar](100) NULL,
	[woPropertyID19] [nvarchar](100) NULL,
	[woPropertyID20] [nvarchar](100) NULL,
	[woCustom_num1] [decimal](18, 5) NULL,
	[woCustom_num2] [decimal](18, 5) NULL,
	[woCustom_num3] [decimal](18, 5) NULL,
	[woCustom_num4] [decimal](18, 5) NULL,
	[woCustom_num5] [decimal](18, 5) NULL,
	[woCustom_num6] [decimal](18, 5) NULL,
	[woCustom_num7] [decimal](18, 5) NULL,
	[woCustom_num8] [decimal](18, 5) NULL,
	[woCustom_num9] [decimal](18, 5) NULL,
	[woCustom_num10] [decimal](18, 5) NULL,
	[woCustom_txt1] [nvarchar](100) NULL,
	[woCustom_txt2] [nvarchar](100) NULL,
	[woCustom_txt3] [nvarchar](100) NULL,
	[woCustom_txt4] [nvarchar](100) NULL,
	[woCustom_txt5] [nvarchar](100) NULL,
	[woCustom_txt6] [nvarchar](100) NULL,
	[woCustom_txt7] [nvarchar](100) NULL,
	[woCustom_txt8] [nvarchar](100) NULL,
	[woCustom_txt9] [nvarchar](100) NULL,
	[woCustom_txt10] [nvarchar](100) NULL,
	[skuDesc] [nvarchar](1000) NULL,
	[reportedDate] [datetime] NULL,
	[percentDone] [decimal](18, 5) NULL,
	[throughput] [decimal](18, 5) NULL,
	[tvc] [decimal](18, 5) NULL,
	[clientOrderID] [nvarchar](50) NULL,
	[sequence] [decimal](18, 5) NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputProjects]    Script Date: 4/18/2024 3:51:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputProjects](
	[projectID] [nvarchar](50) NULL,
	[projectName] [nvarchar](100) NULL,
	[projectTemplate] [nvarchar](100) NULL,
	[projectGroup] [nvarchar](100) NULL,
	[projectManager] [nvarchar](100) NULL,
	[projectDueDate] [datetime] NULL,
	[reportedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputProjectsQuarantine]    Script Date: 4/18/2024 3:51:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputProjectsQuarantine](
	[projectID] [nvarchar](50) NULL,
	[projectName] [nvarchar](100) NULL,
	[projectTemplate] [nvarchar](100) NULL,
	[projectGroup] [nvarchar](100) NULL,
	[projectManager] [nvarchar](100) NULL,
	[projectDueDate] [datetime] NULL,
	[reportedDate] [datetime] NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputPurchasing]    Script Date: 4/18/2024 3:51:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputPurchasing](
	[stockLocationName] [nvarchar](100) NULL,
	[skuName] [nvarchar](100) NULL,
	[quantity] [numeric](21, 5) NULL,
	[orderID] [nvarchar](50) NULL,
	[supplierID] [nvarchar](50) NULL,
	[supplierDescription] [nvarchar](50) NULL,
	[timeBuffer] [int] NULL,
	[orderPrice] [numeric](21, 5) NULL,
	[orderDate] [datetime] NULL,
	[orderType] [nvarchar](50) NULL,
	[skuDescription] [nvarchar](1000) NULL,
	[promisedDueDate] [datetime] NULL,
	[purchasingPropertyID1] [nvarchar](100) NULL,
	[purchasingPropertyID2] [nvarchar](100) NULL,
	[purchasingPropertyID3] [nvarchar](100) NULL,
	[purchasingPropertyID4] [nvarchar](100) NULL,
	[purchasingPropertyID5] [nvarchar](100) NULL,
	[purchasingPropertyID6] [nvarchar](100) NULL,
	[purchasingPropertyID7] [nvarchar](100) NULL,
	[reportedDate] [datetime] NULL,
	[neededDate] [datetime] NULL,
	[isShipped] [bit] NULL,
	[clientOrderID] [nvarchar](50) NULL,
	[supplierSkuName] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputPurchasingQuarantine]    Script Date: 4/18/2024 3:51:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputPurchasingQuarantine](
	[stockLocationName] [nvarchar](100) NULL,
	[skuName] [nvarchar](100) NULL,
	[quantity] [numeric](21, 5) NULL,
	[orderID] [nvarchar](50) NULL,
	[supplierID] [nvarchar](50) NULL,
	[supplierDescription] [nvarchar](50) NULL,
	[timeBuffer] [int] NULL,
	[orderPrice] [numeric](21, 5) NULL,
	[orderDate] [datetime] NULL,
	[orderType] [nvarchar](50) NULL,
	[skuDescription] [nvarchar](1000) NULL,
	[promisedDueDate] [datetime] NULL,
	[purchasingPropertyID1] [nvarchar](100) NULL,
	[purchasingPropertyID2] [nvarchar](100) NULL,
	[purchasingPropertyID3] [nvarchar](100) NULL,
	[purchasingPropertyID4] [nvarchar](100) NULL,
	[purchasingPropertyID5] [nvarchar](100) NULL,
	[purchasingPropertyID6] [nvarchar](100) NULL,
	[purchasingPropertyID7] [nvarchar](100) NULL,
	[reportedDate] [datetime] NULL,
	[neededDate] [datetime] NULL,
	[isShipped] [bit] NULL,
	[clientOrderID] [nvarchar](50) NULL,
	[supplierSkuName] [nvarchar](100) NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputQuoteRequests]    Script Date: 4/18/2024 3:51:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputQuoteRequests](
	[skuName] [nvarchar](100) NULL,
	[quantity] [numeric](21, 5) NULL,
	[reportedDate] [datetime] NULL,
	[orderID] [nvarchar](50) NULL,
	[marketFamily] [nvarchar](100) NULL,
	[productionFamily] [nvarchar](100) NULL,
	[uomName] [nvarchar](50) NULL,
	[plant] [nvarchar](100) NULL,
	[largeOrderBuffer] [numeric](21, 5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputQuoteRequestsQuarantine]    Script Date: 4/18/2024 3:51:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputQuoteRequestsQuarantine](
	[skuName] [nvarchar](100) NULL,
	[quantity] [numeric](21, 5) NULL,
	[reportedDate] [datetime] NULL,
	[orderID] [nvarchar](50) NULL,
	[marketFamily] [nvarchar](100) NULL,
	[productionFamily] [nvarchar](100) NULL,
	[uomName] [nvarchar](50) NULL,
	[plant] [nvarchar](100) NULL,
	[largeOrderBuffer] [numeric](21, 5) NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputRetailAgDg]    Script Date: 4/18/2024 3:51:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputRetailAgDg](
	[assortmentGroupName] [nvarchar](100) NULL,
	[displayGroupName] [nvarchar](100) NULL,
	[reportedDate] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputRetailAgDgQuarantine]    Script Date: 4/18/2024 3:51:42 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputRetailAgDgQuarantine](
	[assortmentGroupName] [nvarchar](100) NULL,
	[displayGroupName] [nvarchar](100) NULL,
	[reportedDate] [smalldatetime] NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputRetailFamilyAg]    Script Date: 4/18/2024 3:51:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputRetailFamilyAg](
	[familyName] [nvarchar](100) NULL,
	[assortmentGroupName] [nvarchar](100) NULL,
	[agDescription] [nvarchar](150) NULL,
	[invalidThreshold] [int] NULL,
	[reportedDate] [smalldatetime] NULL,
	[familyDescription] [nvarchar](150) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputRetailFamilyAgQuarantine]    Script Date: 4/18/2024 3:51:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputRetailFamilyAgQuarantine](
	[familyName] [nvarchar](100) NULL,
	[assortmentGroupName] [nvarchar](100) NULL,
	[agDescription] [nvarchar](150) NULL,
	[invalidThreshold] [int] NULL,
	[reportedDate] [smalldatetime] NULL,
	[familyDescription] [nvarchar](150) NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputSeasonalityEvents]    Script Date: 4/18/2024 3:51:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputSeasonalityEvents](
	[name] [nvarchar](100) NULL,
	[eventGroup] [nvarchar](100) NULL,
	[eventType] [nvarchar](100) NULL,
	[reportedDate] [datetime] NULL,
	[startDate] [datetime] NULL,
	[endDate] [datetime] NULL,
	[resizeValue] [decimal](18, 2) NULL,
	[resizeMethod] [nvarchar](50) NULL,
	[updateSteps] [int] NULL,
	[recurrence] [nvarchar](50) NULL,
	[status] [nvarchar](50) NULL,
	[autoAccept] [bit] NULL,
	[displayGroupName] [nvarchar](100) NULL,
	[assortmentGroupName] [nvarchar](100) NULL,
	[familyName] [nvarchar](100) NULL,
	[stockLocationName] [nvarchar](100) NULL,
	[slPropertyID1] [nvarchar](100) NULL,
	[slPropertyID2] [nvarchar](100) NULL,
	[slPropertyID3] [nvarchar](100) NULL,
	[slPropertyID4] [nvarchar](100) NULL,
	[slPropertyID5] [nvarchar](100) NULL,
	[slPropertyID6] [nvarchar](100) NULL,
	[slPropertyID7] [nvarchar](100) NULL,
	[skuName] [nvarchar](100) NULL,
	[bufferSize] [nvarchar](50) NULL,
	[skuPropertyID1] [nvarchar](100) NULL,
	[skuPropertyID2] [nvarchar](100) NULL,
	[skuPropertyID3] [nvarchar](100) NULL,
	[skuPropertyID4] [nvarchar](100) NULL,
	[skuPropertyID5] [nvarchar](100) NULL,
	[skuPropertyID6] [nvarchar](100) NULL,
	[skuPropertyID7] [nvarchar](100) NULL,
	[custom_txt1] [nvarchar](100) NULL,
	[custom_txt2] [nvarchar](100) NULL,
	[custom_txt3] [nvarchar](100) NULL,
	[custom_txt4] [nvarchar](100) NULL,
	[custom_txt5] [nvarchar](100) NULL,
	[custom_txt6] [nvarchar](100) NULL,
	[custom_txt7] [nvarchar](100) NULL,
	[custom_txt8] [nvarchar](100) NULL,
	[custom_txt9] [nvarchar](100) NULL,
	[custom_txt10] [nvarchar](100) NULL,
	[custom_num1] [decimal](18, 5) NULL,
	[custom_num2] [decimal](18, 5) NULL,
	[custom_num3] [decimal](18, 5) NULL,
	[custom_num4] [decimal](18, 5) NULL,
	[custom_num5] [decimal](18, 5) NULL,
	[custom_num6] [decimal](18, 5) NULL,
	[custom_num7] [decimal](18, 5) NULL,
	[custom_num8] [decimal](18, 5) NULL,
	[custom_num9] [decimal](18, 5) NULL,
	[custom_num10] [decimal](18, 5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputSeasonalityEventsQuarantine]    Script Date: 4/18/2024 3:51:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputSeasonalityEventsQuarantine](
	[name] [nvarchar](100) NULL,
	[eventGroup] [nvarchar](100) NULL,
	[eventType] [nvarchar](100) NULL,
	[reportedDate] [datetime] NULL,
	[startDate] [datetime] NULL,
	[endDate] [datetime] NULL,
	[resizeValue] [decimal](18, 2) NULL,
	[resizeMethod] [nvarchar](50) NULL,
	[updateSteps] [int] NULL,
	[recurrence] [nvarchar](50) NULL,
	[status] [nvarchar](50) NULL,
	[autoAccept] [bit] NULL,
	[displayGroupName] [nvarchar](100) NULL,
	[assortmentGroupName] [nvarchar](100) NULL,
	[familyName] [nvarchar](100) NULL,
	[stockLocationName] [nvarchar](100) NULL,
	[slPropertyID1] [nvarchar](100) NULL,
	[slPropertyID2] [nvarchar](100) NULL,
	[slPropertyID3] [nvarchar](100) NULL,
	[slPropertyID4] [nvarchar](100) NULL,
	[slPropertyID5] [nvarchar](100) NULL,
	[slPropertyID6] [nvarchar](100) NULL,
	[slPropertyID7] [nvarchar](100) NULL,
	[skuName] [nvarchar](100) NULL,
	[bufferSize] [nvarchar](50) NULL,
	[skuPropertyID1] [nvarchar](100) NULL,
	[skuPropertyID2] [nvarchar](100) NULL,
	[skuPropertyID3] [nvarchar](100) NULL,
	[skuPropertyID4] [nvarchar](100) NULL,
	[skuPropertyID5] [nvarchar](100) NULL,
	[skuPropertyID6] [nvarchar](100) NULL,
	[skuPropertyID7] [nvarchar](100) NULL,
	[custom_txt1] [nvarchar](100) NULL,
	[custom_txt2] [nvarchar](100) NULL,
	[custom_txt3] [nvarchar](100) NULL,
	[custom_txt4] [nvarchar](100) NULL,
	[custom_txt5] [nvarchar](100) NULL,
	[custom_txt6] [nvarchar](100) NULL,
	[custom_txt7] [nvarchar](100) NULL,
	[custom_txt8] [nvarchar](100) NULL,
	[custom_txt9] [nvarchar](100) NULL,
	[custom_txt10] [nvarchar](100) NULL,
	[custom_num1] [decimal](18, 5) NULL,
	[custom_num2] [decimal](18, 5) NULL,
	[custom_num3] [decimal](18, 5) NULL,
	[custom_num4] [decimal](18, 5) NULL,
	[custom_num5] [decimal](18, 5) NULL,
	[custom_num6] [decimal](18, 5) NULL,
	[custom_num7] [decimal](18, 5) NULL,
	[custom_num8] [decimal](18, 5) NULL,
	[custom_num9] [decimal](18, 5) NULL,
	[custom_num10] [decimal](18, 5) NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputSkuLifeCycle]    Script Date: 4/18/2024 3:51:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputSkuLifeCycle](
	[eventID] [nvarchar](100) NULL,
	[startDate] [datetime] NULL,
	[skuName] [nvarchar](100) NULL,
	[stockLocation] [nvarchar](100) NULL,
	[bufferSize] [decimal](18, 0) NULL,
	[reportedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputSkuLifeCycleQuarantine]    Script Date: 4/18/2024 3:51:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputSkuLifeCycleQuarantine](
	[eventID] [nvarchar](100) NULL,
	[startDate] [datetime] NULL,
	[skuName] [nvarchar](100) NULL,
	[stockLocation] [nvarchar](100) NULL,
	[bufferSize] [decimal](18, 0) NULL,
	[reportedDate] [datetime] NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputSkuProcurementData]    Script Date: 4/18/2024 3:51:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputSkuProcurementData](
	[supplier] [nvarchar](100) NULL,
	[stockLocation] [nvarchar](100) NULL,
	[skuName] [nvarchar](100) NULL,
	[supplierLeadTime] [int] NULL,
	[timeProtection] [int] NULL,
	[quantityProtection] [numeric](21, 5) NULL,
	[minimumOrderQuantity] [numeric](21, 5) NULL,
	[orderMultiplications] [numeric](21, 5) NULL,
	[lastBatchReplenishment] [numeric](21, 5) NULL,
	[additionalTimeTillArrival] [int] NULL,
	[isDefaultSupplier] [bit] NULL,
	[supplierSKUName] [nvarchar](100) NULL,
	[reportDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputSkuProcurementDataQuarantine]    Script Date: 4/18/2024 3:51:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputSkuProcurementDataQuarantine](
	[supplier] [nvarchar](100) NULL,
	[stockLocation] [nvarchar](100) NULL,
	[skuName] [nvarchar](100) NULL,
	[supplierLeadTime] [int] NULL,
	[timeProtection] [int] NULL,
	[quantityProtection] [numeric](21, 5) NULL,
	[minimumOrderQuantity] [numeric](21, 5) NULL,
	[orderMultiplications] [numeric](21, 5) NULL,
	[lastBatchReplenishment] [numeric](21, 5) NULL,
	[additionalTimeTillArrival] [int] NULL,
	[isDefaultSupplier] [bit] NULL,
	[supplierSKUName] [nvarchar](100) NULL,
	[reportDate] [datetime] NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputSkuProductionData]    Script Date: 4/18/2024 3:51:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputSkuProductionData](
	[plant] [nvarchar](100) NULL,
	[skuName] [nvarchar](100) NULL,
	[productionFamily] [nvarchar](100) NULL,
	[marketFamily] [nvarchar](100) NULL,
	[reportDate] [datetime] NULL,
	[expectedYield] [decimal](18, 5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputSkuProductionDataQuarantine]    Script Date: 4/18/2024 3:51:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputSkuProductionDataQuarantine](
	[plant] [nvarchar](100) NULL,
	[skuName] [nvarchar](100) NULL,
	[productionFamily] [nvarchar](100) NULL,
	[marketFamily] [nvarchar](100) NULL,
	[reportDate] [datetime] NULL,
	[expectedYield] [decimal](18, 5) NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputSkusBom]    Script Date: 4/18/2024 3:51:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputSkusBom](
	[skuName] [nvarchar](100) NULL,
	[plantName] [nvarchar](100) NULL,
	[masterSkuName] [nvarchar](100) NULL,
	[quantity] [decimal](21, 5) NULL,
	[reportedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputSkusBomQuarantine]    Script Date: 4/18/2024 3:51:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputSkusBomQuarantine](
	[skuName] [nvarchar](100) NULL,
	[plantName] [nvarchar](100) NULL,
	[masterSkuName] [nvarchar](100) NULL,
	[quantity] [decimal](21, 5) NULL,
	[reportedDate] [datetime] NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputStatus]    Script Date: 4/18/2024 3:51:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputStatus](
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[stockLocationName] [nvarchar](100) NULL,
	[skuName] [nvarchar](100) NULL,
	[inventoryOnTheWay] [numeric](21, 5) NULL,
	[inventoryAtHand] [numeric](21, 5) NULL,
	[skuType] [nvarchar](50) NULL,
	[reportDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Index [IDX_Symphony_InputStatus]    Script Date: 4/18/2024 3:51:43 PM ******/
CREATE UNIQUE CLUSTERED INDEX [IDX_Symphony_InputStatus] ON [dbo].[Symphony_InputStatus]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputStatusQuarantine]    Script Date: 4/18/2024 3:51:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputStatusQuarantine](
	[stockLocationName] [nvarchar](100) NULL,
	[skuName] [nvarchar](100) NULL,
	[inventoryOnTheWay] [numeric](21, 5) NULL,
	[inventoryAtHand] [numeric](21, 5) NULL,
	[skuType] [nvarchar](50) NULL,
	[reportDate] [datetime] NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputStockLocationsAdjacent]    Script Date: 4/18/2024 3:51:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputStockLocationsAdjacent](
	[stockLocationID1] [nvarchar](100) NULL,
	[stockLocationID2] [nvarchar](100) NULL,
	[inD1toD2NotNeeded] [bit] NULL,
	[inD2toD1NotNeeded] [bit] NULL,
	[reportedDate] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputStockLocationsAdjacentQuarantine]    Script Date: 4/18/2024 3:51:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputStockLocationsAdjacentQuarantine](
	[stockLocationID1] [nvarchar](100) NULL,
	[stockLocationID2] [nvarchar](100) NULL,
	[inD1toD2NotNeeded] [bit] NULL,
	[inD2toD1NotNeeded] [bit] NULL,
	[reportedDate] [smalldatetime] NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputTransaction]    Script Date: 4/18/2024 3:51:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputTransaction](
	[fromStockLocation] [nvarchar](100) NULL,
	[originSKU] [nvarchar](100) NULL,
	[toStockLocation] [nvarchar](100) NULL,
	[skuName] [nvarchar](100) NULL,
	[transactionType] [nvarchar](100) NULL,
	[quantity] [numeric](21, 5) NULL,
	[shippingDate] [datetime] NULL,
	[transactionId] [nvarchar](100) NULL,
	[matchingTransactionId] [nvarchar](100) NULL,
	[clientOrderID] [nvarchar](50) NULL,
	[adjust] [bit] NULL,
	[sellingPrice] [numeric](21, 5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputTransactionQuarantine]    Script Date: 4/18/2024 3:51:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputTransactionQuarantine](
	[fromStockLocation] [nvarchar](100) NULL,
	[originSKU] [nvarchar](100) NULL,
	[toStockLocation] [nvarchar](100) NULL,
	[skuName] [nvarchar](100) NULL,
	[transactionType] [nvarchar](100) NULL,
	[quantity] [numeric](21, 5) NULL,
	[shippingDate] [datetime] NULL,
	[transactionId] [nvarchar](100) NULL,
	[matchingTransactionId] [nvarchar](100) NULL,
	[clientOrderID] [nvarchar](50) NULL,
	[adjust] [bit] NULL,
	[sellingPrice] [numeric](21, 5) NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputUpdateSKUs]    Script Date: 4/18/2024 3:51:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputUpdateSKUs](
	[stockLocationID] [nvarchar](100) NULL,
	[skuID] [nvarchar](100) NULL,
	[skuDescription] [nvarchar](1000) NULL,
	[originStockLocation] [nvarchar](100) NULL,
	[originSKU] [nvarchar](100) NULL,
	[locationSkuName] [nvarchar](100) NULL,
	[replenishmentTime] [int] NULL,
	[unitPrice] [numeric](21, 5) NULL,
	[Throughput] [numeric](21, 5) NULL,
	[TVC] [numeric](21, 5) NULL,
	[minimumReplenishment] [numeric](21, 5) NULL,
	[minimumRequiredBP] [numeric](21, 5) NULL,
	[multiplications] [numeric](21, 5) NULL,
	[uomID] [nvarchar](100) NULL,
	[avoidReplenishment] [bit] NULL,
	[autoReplenishment] [bit] NULL,
	[shipmentMeasure] [numeric](18, 5) NULL,
	[skuPropertyID1] [nvarchar](100) NULL,
	[skuPropertyID2] [nvarchar](100) NULL,
	[skuPropertyID3] [nvarchar](100) NULL,
	[skuPropertyID4] [nvarchar](100) NULL,
	[skuPropertyID5] [nvarchar](100) NULL,
	[skuPropertyID6] [nvarchar](100) NULL,
	[skuPropertyID7] [nvarchar](100) NULL,
	[custom_txt1] [nvarchar](100) NULL,
	[custom_txt2] [nvarchar](100) NULL,
	[custom_txt3] [nvarchar](100) NULL,
	[custom_txt4] [nvarchar](100) NULL,
	[custom_txt5] [nvarchar](100) NULL,
	[custom_txt6] [nvarchar](100) NULL,
	[custom_txt7] [nvarchar](100) NULL,
	[custom_txt8] [nvarchar](100) NULL,
	[custom_txt9] [nvarchar](100) NULL,
	[custom_txt10] [nvarchar](100) NULL,
	[custom_num1] [decimal](18, 5) NULL,
	[custom_num2] [decimal](18, 5) NULL,
	[custom_num3] [decimal](18, 5) NULL,
	[custom_num4] [decimal](18, 5) NULL,
	[custom_num5] [decimal](18, 5) NULL,
	[custom_num6] [decimal](18, 5) NULL,
	[custom_num7] [decimal](18, 5) NULL,
	[custom_num8] [decimal](18, 5) NULL,
	[custom_num9] [decimal](18, 5) NULL,
	[custom_num10] [decimal](18, 5) NULL,
	[reportedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputUpdateSKUsQuarantine]    Script Date: 4/18/2024 3:51:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputUpdateSKUsQuarantine](
	[stockLocationID] [nvarchar](100) NULL,
	[skuID] [nvarchar](100) NULL,
	[skuDescription] [nvarchar](1000) NULL,
	[originStockLocation] [nvarchar](100) NULL,
	[originSKU] [nvarchar](100) NULL,
	[locationSkuName] [nvarchar](100) NULL,
	[replenishmentTime] [int] NULL,
	[unitPrice] [numeric](21, 5) NULL,
	[Throughput] [numeric](21, 5) NULL,
	[TVC] [numeric](21, 5) NULL,
	[minimumReplenishment] [numeric](21, 5) NULL,
	[minimumRequiredBP] [numeric](21, 5) NULL,
	[multiplications] [numeric](21, 5) NULL,
	[uomID] [nvarchar](100) NULL,
	[avoidReplenishment] [bit] NULL,
	[autoReplenishment] [bit] NULL,
	[shipmentMeasure] [numeric](18, 5) NULL,
	[skuPropertyID1] [nvarchar](100) NULL,
	[skuPropertyID2] [nvarchar](100) NULL,
	[skuPropertyID3] [nvarchar](100) NULL,
	[skuPropertyID4] [nvarchar](100) NULL,
	[skuPropertyID5] [nvarchar](100) NULL,
	[skuPropertyID6] [nvarchar](100) NULL,
	[skuPropertyID7] [nvarchar](100) NULL,
	[custom_txt1] [nvarchar](100) NULL,
	[custom_txt2] [nvarchar](100) NULL,
	[custom_txt3] [nvarchar](100) NULL,
	[custom_txt4] [nvarchar](100) NULL,
	[custom_txt5] [nvarchar](100) NULL,
	[custom_txt6] [nvarchar](100) NULL,
	[custom_txt7] [nvarchar](100) NULL,
	[custom_txt8] [nvarchar](100) NULL,
	[custom_txt9] [nvarchar](100) NULL,
	[custom_txt10] [nvarchar](100) NULL,
	[custom_num1] [decimal](18, 5) NULL,
	[custom_num2] [decimal](18, 5) NULL,
	[custom_num3] [decimal](18, 5) NULL,
	[custom_num4] [decimal](18, 5) NULL,
	[custom_num5] [decimal](18, 5) NULL,
	[custom_num6] [decimal](18, 5) NULL,
	[custom_num7] [decimal](18, 5) NULL,
	[custom_num8] [decimal](18, 5) NULL,
	[custom_num9] [decimal](18, 5) NULL,
	[custom_num10] [decimal](18, 5) NULL,
	[reportedDate] [datetime] NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputValidationRules]    Script Date: 4/18/2024 3:51:43 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputValidationRules](
	[stockLocationName] [nvarchar](100) NULL,
	[displayGroup] [nvarchar](100) NULL,
	[assortmentGroup] [nvarchar](100) NULL,
	[family] [nvarchar](100) NULL,
	[familyMember] [nvarchar](100) NULL,
	[minimalQuantity] [int] NULL,
	[bufferSizePrec] [decimal](18, 5) NULL,
	[reportedDate] [smalldatetime] NULL,
	[minimumPreferredCount] [int] NULL,
	[minimumMembersCount] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputValidationRulesQuarantine]    Script Date: 4/18/2024 3:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputValidationRulesQuarantine](
	[stockLocationName] [nvarchar](100) NULL,
	[displayGroup] [nvarchar](100) NULL,
	[assortmentGroup] [nvarchar](100) NULL,
	[family] [nvarchar](100) NULL,
	[familyMember] [nvarchar](100) NULL,
	[minimalQuantity] [int] NULL,
	[bufferSizePrec] [decimal](18, 5) NULL,
	[reportedDate] [smalldatetime] NULL,
	[minimumPreferredCount] [int] NULL,
	[minimumMembersCount] [int] NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputWorkload]    Script Date: 4/18/2024 3:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputWorkload](
	[woid] [nvarchar](50) NULL,
	[skuName] [nvarchar](100) NULL,
	[plant] [nvarchar](100) NULL,
	[mcrName] [nvarchar](50) NULL,
	[quantityBefore] [numeric](21, 5) NULL,
	[quantityAt] [numeric](21, 5) NULL,
	[unitsPerHour] [numeric](21, 5) NULL,
	[componentID] [nvarchar](50) NULL,
	[reportedDate] [datetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_InputWorkloadQuarantine]    Script Date: 4/18/2024 3:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_InputWorkloadQuarantine](
	[woid] [nvarchar](50) NULL,
	[skuName] [nvarchar](100) NULL,
	[plant] [nvarchar](100) NULL,
	[mcrName] [nvarchar](50) NULL,
	[quantityBefore] [numeric](21, 5) NULL,
	[quantityAt] [numeric](21, 5) NULL,
	[unitsPerHour] [numeric](21, 5) NULL,
	[componentID] [nvarchar](50) NULL,
	[reportedDate] [datetime] NULL,
	[id] [bigint] IDENTITY(1,1) NOT NULL,
	[type] [nvarchar](50) NULL,
	[loadingDate] [datetime] NULL,
	[quarantineReason] [nvarchar](500) NULL,
	[actualLineContent] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_ISTCluster]    Script Date: 4/18/2024 3:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_ISTCluster](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[Name] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_ISTComplianceHistory]    Script Date: 4/18/2024 3:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_ISTComplianceHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[orderID] [nvarchar](100) NOT NULL,
	[stockLocationID] [int] NOT NULL,
	[supplierID] [int] NOT NULL,
	[skuID] [int] NOT NULL,
	[quantity] [numeric](18, 5) NOT NULL,
	[orderPrice] [numeric](21, 5) NULL,
	[orderDate] [smalldatetime] NULL,
	[promisedDueDate] [smalldatetime] NULL,
	[purchasingPropertyID1] [int] NULL,
	[purchasingPropertyID2] [int] NULL,
	[purchasingPropertyID3] [int] NULL,
	[purchasingPropertyID4] [int] NULL,
	[purchasingPropertyID5] [int] NULL,
	[purchasingPropertyID6] [int] NULL,
	[purchasingPropertyID7] [int] NULL,
	[closeDate] [smalldatetime] NOT NULL,
	[completionDate] [smalldatetime] NULL,
	[unitsReceived] [int] NULL,
	[statusCode] [tinyint] NULL,
 CONSTRAINT [PK_Symphony_ISTComplianceHistory] PRIMARY KEY CLUSTERED 
(
	[skuID] ASC,
	[stockLocationID] ASC,
	[orderID] ASC,
	[supplierID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_ISTComplianceStatus]    Script Date: 4/18/2024 3:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_ISTComplianceStatus](
	[statusCode] [int] NULL,
	[statusDisplayName] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_ISTPolicy]    Script Date: 4/18/2024 3:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_ISTPolicy](
	[skuID] [int] NOT NULL,
	[stockLocationID] [int] NOT NULL,
	[inventoryAllotment] [int] NOT NULL,
	[clusterID] [int] NOT NULL,
 CONSTRAINT [PK_Symphony_ISTPolicy] PRIMARY KEY CLUSTERED 
(
	[stockLocationID] ASC,
	[skuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_ISTRecommendations]    Script Date: 4/18/2024 3:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_ISTRecommendations](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[skuID] [int] NOT NULL,
	[stockLocationID] [int] NOT NULL,
	[originStockLocationID] [int] NOT NULL,
	[replenishmentQuantity] [decimal](18, 5) NOT NULL,
	[suggestedReplenishmentQuantity] [decimal](18, 5) NOT NULL,
	[toReplenish] [int] NOT NULL,
	[sentToReplenishment] [bit] NOT NULL,
 CONSTRAINT [PK_Symphony_ISTRecommendations] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_LastIDs]    Script Date: 4/18/2024 3:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_LastIDs](
	[tableName] [nvarchar](100) NOT NULL,
	[lastID] [int] NOT NULL,
 CONSTRAINT [PK_Simulation_lastIDs] PRIMARY KEY CLUSTERED 
(
	[tableName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_LastMeasuresStatus]    Script Date: 4/18/2024 3:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_LastMeasuresStatus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[dashboardItemID] [int] NOT NULL,
	[value] [decimal](23, 5) NULL,
	[valueType] [int] NULL,
	[stringValue] [nvarchar](200) NULL,
 CONSTRAINT [PK_Symphony_LastMeasuresStatus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC,
	[dashboardItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_LoadRecalculateInput]    Script Date: 4/18/2024 3:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_LoadRecalculateInput](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[logEntryID] [int] NULL,
	[inputObjectID] [int] NULL,
	[inputObjectName] [nvarchar](200) NULL,
	[loadDuration] [int] NULL,
	[statusID] [int] NULL,
	[totalRows] [int] NULL,
	[inputType] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_LoadRecalculateLog]    Script Date: 4/18/2024 3:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_LoadRecalculateLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[startDate] [datetime] NULL,
	[totalFiles] [int] NULL,
	[totalTables] [int] NULL,
	[totalRows] [int] NULL,
	[totalTime] [datetime] NULL,
	[loadTime] [datetime] NULL,
	[recalculateTime] [datetime] NULL,
	[slHistoryRows] [int] NULL,
	[slHistoryFrag] [decimal](5, 2) NULL,
	[mtsRows] [int] NULL,
	[mtsFrag] [decimal](5, 2) NULL,
	[DBVersion] [nvarchar](50) NULL,
	[quarantineRowsTotal] [int] NULL,
	[warningRowsTotal] [int] NULL,
	[isLoadSuccessful] [bit] NULL,
	[sourceID] [int] NULL,
	[totalPhysicalMemory] [int] NULL,
	[availablePhysicalMemoryStart] [int] NULL,
	[availablePhysicalMemoryEnd] [int] NULL,
 CONSTRAINT [PK_Symphony_LoadRecalculateLog] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_LoadRecalculateTrace]    Script Date: 4/18/2024 3:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_LoadRecalculateTrace](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[logEntryID] [int] NULL,
	[routineDescription] [nvarchar](50) NULL,
	[runtimeVarName] [nvarchar](50) NULL,
	[runtimeVarValue] [nvarchar](50) NULL,
	[classID] [int] NULL,
	[routineID] [int] NULL,
	[startTime] [datetime] NULL,
	[totalTime] [datetime] NULL,
	[isSuccessful] [bit] NULL,
	[NID] [int] NULL,
	[PID] [int] NULL,
	[duration] [decimal](12, 2) NULL,
	[samples] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_LocationAssortmentGroupsSkuIDs]    Script Date: 4/18/2024 3:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_LocationAssortmentGroupsSkuIDs](
	[stockLocationID] [int] NULL,
	[assortmentGroupID] [int] NULL,
	[gapMode] [int] NULL,
	[skuID] [int] NULL,
	[originStockLocationID] [int] NULL,
	[ignoreNrBuffers] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_LocationAssortmentGroupsTmpData]    Script Date: 4/18/2024 3:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_LocationAssortmentGroupsTmpData](
	[stockLocationID] [int] NOT NULL,
	[assortmentGroupID] [int] NOT NULL,
	[validFamiliesNum] [int] NOT NULL,
	[notValidFamiliesNum] [int] NOT NULL,
	[notValidFamiliesOverThresholdNum] [int] NOT NULL,
	[gapMode] [smallint] NULL,
 CONSTRAINT [UK_Symphony_LocationAssortmentGroupsTmpData] UNIQUE CLUSTERED 
(
	[stockLocationID] ASC,
	[assortmentGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_LocationAssortmentGroupsTmpSpaceData]    Script Date: 4/18/2024 3:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_LocationAssortmentGroupsTmpSpaceData](
	[stockLocationID] [int] NOT NULL,
	[assortmentGroupID] [int] NOT NULL,
	[gapMode] [smallint] NULL,
	[sumBuffer] [decimal](18, 5) NULL,
	[sumInventory] [decimal](18, 5) NULL,
	[sumMaxInventoryBuffer] [decimal](18, 5) NULL,
 CONSTRAINT [UK_Symphony_LocationAssortmentGroupsTmpSpaceData] UNIQUE CLUSTERED 
(
	[stockLocationID] ASC,
	[assortmentGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_LocationCatalogSkus]    Script Date: 4/18/2024 3:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_LocationCatalogSkus](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[skuID] [int] NOT NULL,
	[stockLocationID] [int] NOT NULL,
	[originStockLocationID] [int] NOT NULL,
	[replenishmentTypeID] [tinyint] NOT NULL,
	[maxPipeline] [decimal](18, 5) NOT NULL,
	[updateDate] [smalldatetime] NOT NULL,
	[minimumReplenishment] [decimal](18, 0) NULL,
	[lastBatchReplenishment] [decimal](18, 5) NULL,
	[replenishmentMultiplications] [decimal](18, 0) NULL,
 CONSTRAINT [PK_Symphony_LocationCatalogSkus] PRIMARY KEY CLUSTERED 
(
	[skuID] ASC,
	[stockLocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_LocationCategories]    Script Date: 4/18/2024 3:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_LocationCategories](
	[categoryID] [int] NOT NULL,
	[stockLocationID] [int] NOT NULL,
	[normLevel] [decimal](18, 5) NOT NULL,
	[siteNormLevel] [int] NULL,
	[updateDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Symphony_LocationCategories] PRIMARY KEY CLUSTERED 
(
	[categoryID] ASC,
	[stockLocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_LocationDisplayGroupRecommendations]    Script Date: 4/18/2024 3:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_LocationDisplayGroupRecommendations](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[stockLocationID] [int] NOT NULL,
	[displayGroupID] [int] NOT NULL,
	[eventType] [int] NOT NULL,
	[newMinCost] [decimal](18, 0) NULL,
	[newMaxCost] [decimal](18, 0) NULL,
	[newMinQuantity] [int] NULL,
	[newMaxQuantity] [int] NULL,
	[recommendationType] [tinyint] NOT NULL,
	[inSeasonality] [bit] NOT NULL,
 CONSTRAINT [PK_Symphony_LocationDisplayGroupRecommendations] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [UK_Symphony_LocationDisplayGroupRecommendations] UNIQUE NONCLUSTERED 
(
	[stockLocationID] ASC,
	[displayGroupID] ASC,
	[eventType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_LocationDisplayGroups]    Script Date: 4/18/2024 3:51:44 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_LocationDisplayGroups](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[stockLocationID] [int] NOT NULL,
	[displayGroupID] [int] NOT NULL,
	[minQuantity] [int] NULL,
	[maxQuantity] [int] NULL,
	[minCost] [decimal](18, 5) NULL,
	[maxCost] [decimal](18, 5) NULL,
	[dgCustom_num1] [decimal](18, 5) NULL,
	[dgCustom_num2] [decimal](18, 5) NULL,
	[dgCustom_num3] [decimal](18, 5) NULL,
	[dgCustom_num4] [decimal](18, 5) NULL,
	[dgCustom_num5] [decimal](18, 5) NULL,
	[dgCustom_num6] [decimal](18, 5) NULL,
	[dgCustom_num7] [decimal](18, 5) NULL,
	[dgCustom_num8] [decimal](18, 5) NULL,
	[dgCustom_num9] [decimal](18, 5) NULL,
	[dgCustom_num10] [decimal](18, 5) NULL,
 CONSTRAINT [PK_Symphony_LocationDisplayGroups] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [UK_Symphony_LocationDisplayGroups] UNIQUE NONCLUSTERED 
(
	[stockLocationID] ASC,
	[displayGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_LocationEligibleFamilies]    Script Date: 4/18/2024 3:51:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_LocationEligibleFamilies](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[familyID] [int] NOT NULL,
	[ruleNumber] [tinyint] NOT NULL,
	[slProperty1] [nvarchar](1000) NULL,
	[slProperty2] [nvarchar](1000) NULL,
	[slProperty3] [nvarchar](1000) NULL,
	[slProperty4] [nvarchar](1000) NULL,
	[slProperty5] [nvarchar](1000) NULL,
	[slProperty6] [nvarchar](1000) NULL,
	[slProperty7] [nvarchar](1000) NULL,
	[slPropertyCodes1] [nvarchar](1000) NULL,
	[slPropertyCodes2] [nvarchar](1000) NULL,
	[slPropertyCodes3] [nvarchar](1000) NULL,
	[slPropertyCodes4] [nvarchar](1000) NULL,
	[slPropertyCodes5] [nvarchar](1000) NULL,
	[slPropertyCodes6] [nvarchar](1000) NULL,
	[slPropertyCodes7] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_LocationEligibleFamiliesResult]    Script Date: 4/18/2024 3:51:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_LocationEligibleFamiliesResult](
	[familyID] [int] NOT NULL,
	[stockLocationID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_LocationFamilyAttributes]    Script Date: 4/18/2024 3:51:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_LocationFamilyAttributes](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[familyID] [int] NOT NULL,
	[stockLocationID] [int] NOT NULL,
	[originStockLocationID] [int] NULL,
	[replenishmentTime] [smallint] NULL,
	[invalidFamilyThreshold] [smallint] NULL,
	[npiSetID] [int] NULL,
	[avoidRefreshment] [bit] NOT NULL,
	[imposedValidation] [tinyint] NOT NULL,
	[bufferUtilizationLimitPrec] [int] NULL,
	[startAllocatingOn] [smalldatetime] NULL,
 CONSTRAINT [PK_Symphony_LocationFamilyAttributes] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_LocationFamilyValidDays]    Script Date: 4/18/2024 3:51:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_LocationFamilyValidDays](
	[familyID] [int] NOT NULL,
	[stockLocationID] [int] NOT NULL,
	[updateDate] [smalldatetime] NOT NULL,
	[wasValid] [bit] NOT NULL,
	[hadConsumption] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_Log]    Script Date: 4/18/2024 3:51:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_Log](
	[logDate] [datetime] NULL,
	[messageGenerator] [nvarchar](100) NULL,
	[messageType] [nvarchar](100) NULL,
	[mainType] [nvarchar](100) NULL,
	[secondType] [nvarchar](100) NULL,
	[messageText] [nvarchar](100) NULL,
	[skuID] [int] NULL,
	[stockLocationID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_MarketFamilies]    Script Date: 4/18/2024 3:51:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_MarketFamilies](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[familyName] [nvarchar](100) NOT NULL,
	[description] [nvarchar](100) NULL,
	[standardLeadTime] [int] NOT NULL,
 CONSTRAINT [PK_MarketFamilies] PRIMARY KEY NONCLUSTERED 
(
	[familyName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [UK_MarketFamilies_ID] UNIQUE NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_MaterialsStockLocations]    Script Date: 4/18/2024 3:51:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_MaterialsStockLocations](
	[plantID] [int] NOT NULL,
	[stockLocationID] [int] NOT NULL,
	[skuID] [int] NOT NULL,
 CONSTRAINT [PK_Symphony_MaterialsStockLocations] PRIMARY KEY CLUSTERED 
(
	[skuID] DESC,
	[plantID] ASC,
	[stockLocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_McrEvents]    Script Date: 4/18/2024 3:51:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_McrEvents](
	[McrEventsID] [int] IDENTITY(1,1) NOT NULL,
	[eventName] [nvarchar](100) NOT NULL,
	[creatorID] [int] NULL,
	[creatorName] [nvarchar](100) NULL,
	[plantID] [int] NOT NULL,
	[mcrName] [nvarchar](100) NOT NULL,
	[startDate] [smalldatetime] NOT NULL,
	[endDate] [smalldatetime] NOT NULL,
	[capacityPercentages] [int] NOT NULL,
	[recurrence] [int] NOT NULL,
 CONSTRAINT [PK_Symphony_McrEvents] PRIMARY KEY CLUSTERED 
(
	[McrEventsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_Measures]    Script Date: 4/18/2024 3:51:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_Measures](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](50) NOT NULL,
	[isBrowsable] [bit] NOT NULL,
	[orderIndex] [int] NULL,
	[measureType] [int] NULL,
	[calcDay] [int] NOT NULL,
	[frequency] [int] NULL,
	[lastCalcDate] [datetime] NULL,
	[filterType] [int] NULL,
	[creationDate] [smalldatetime] NOT NULL,
	[createdBy] [nvarchar](400) NULL,
	[description] [nvarchar](400) NULL,
	[DataFilterDisplayString] [nvarchar](3900) NULL,
	[DataFilterSerialized] [image] NULL,
	[timePeriod4Email] [tinyint] NULL,
 CONSTRAINT [PK_Symphony_Measures] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_MeasuresDailyInOut]    Script Date: 4/18/2024 3:51:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_MeasuresDailyInOut](
	[measureID] [int] NOT NULL,
	[inValue] [decimal](23, 5) NULL,
	[outValue] [decimal](23, 5) NULL,
	[wipValue] [decimal](23, 5) NULL,
	[updateDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Symphony_MeasuresDailyInOut] PRIMARY KEY CLUSTERED 
(
	[measureID] ASC,
	[updateDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_MeasuresData]    Script Date: 4/18/2024 3:51:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_MeasuresData](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[measuresID] [int] NOT NULL,
	[measureDate] [datetime] NULL,
	[data] [numeric](23, 5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_MeasuresInOut]    Script Date: 4/18/2024 3:51:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_MeasuresInOut](
	[measureID] [int] NOT NULL,
	[inValue] [decimal](23, 5) NULL,
	[outValue] [decimal](23, 5) NULL,
	[wipValue] [decimal](23, 5) NULL,
	[measureDate] [smalldatetime] NOT NULL,
	[earliestDateMTS] [smalldatetime] NULL,
	[earliestDateMTO] [smalldatetime] NULL,
 CONSTRAINT [PK_Symphony_MeasuresInOut] PRIMARY KEY CLUSTERED 
(
	[measureID] ASC,
	[measureDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_MeasuresPerUsers]    Script Date: 4/18/2024 3:51:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_MeasuresPerUsers](
	[userID] [int] NOT NULL,
	[measuresID] [int] NOT NULL,
 CONSTRAINT [PK_Symphony_MeasuresPerUsers] PRIMARY KEY CLUSTERED 
(
	[userID] ASC,
	[measuresID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_MetadataInputRoleColumnMap]    Script Date: 4/18/2024 3:51:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_MetadataInputRoleColumnMap](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[roleID] [int] NOT NULL,
	[tableName] [nvarchar](100) NOT NULL,
	[columnName] [nvarchar](100) NOT NULL,
	[autoCreate] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_MetadataRoles]    Script Date: 4/18/2024 3:51:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_MetadataRoles](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[tableName] [nvarchar](100) NOT NULL,
	[columnName] [nvarchar](100) NOT NULL,
	[keyColumnName] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_MRsLoad]    Script Date: 4/18/2024 3:51:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_MRsLoad](
	[woid] [nvarchar](50) NOT NULL,
	[plantID] [int] NULL,
	[skuID] [int] NULL,
	[MRName] [nvarchar](50) NULL,
	[b4MR] [numeric](18, 5) NULL,
	[atMR] [numeric](18, 5) NULL,
	[unitsPerHour] [numeric](18, 5) NULL,
	[componentID] [nvarchar](50) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IND_Symphony_MRsLoad]    Script Date: 4/18/2024 3:51:45 PM ******/
CREATE CLUSTERED INDEX [IND_Symphony_MRsLoad] ON [dbo].[Symphony_MRsLoad]
(
	[componentID] ASC,
	[MRName] ASC,
	[woid] ASC,
	[plantID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_MtoLtReport]    Script Date: 4/18/2024 3:51:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_MtoLtReport](
	[plantID] [int] NOT NULL,
	[productionFamily] [int] NOT NULL,
	[dateYear] [int] NOT NULL,
	[dateWeek] [int] NOT NULL,
	[sumLT] [int] NOT NULL,
	[countLT] [int] NOT NULL,
	[minLT] [decimal](18, 5) NULL,
	[maxLT] [decimal](18, 5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_MTOSkus]    Script Date: 4/18/2024 3:51:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_MTOSkus](
	[stockLocationID] [int] NOT NULL,
	[skuID] [int] NOT NULL,
	[skuDescription] [nvarchar](1000) NULL,
	[locationSkuName] [nvarchar](100) NULL,
	[originStockLocation] [int] NULL,
	[inventoryAtSite] [numeric](18, 5) NULL,
	[inventoryAtTransit] [numeric](18, 5) NULL,
	[inventoryAtTransitPurchasing] [numeric](18, 5) NULL,
	[inventoryAtProduction] [numeric](18, 5) NULL,
	[consumption] [numeric](18, 5) NOT NULL,
	[totalIn] [numeric](18, 5) NOT NULL,
	[timeBuffer] [int] NOT NULL,
	[unitPrice] [numeric](18, 5) NULL,
	[throughput] [numeric](18, 5) NULL,
	[tvc] [numeric](18, 5) NULL,
	[dailyThroughput] [numeric](18, 5) NULL,
	[updateDate] [smalldatetime] NULL,
	[uomID] [int] NULL,
	[autoReplenishment] [bit] NOT NULL,
	[skuPropertyID1] [int] NULL,
	[skuPropertyID2] [int] NULL,
	[skuPropertyID3] [int] NULL,
	[skuPropertyID4] [int] NULL,
	[skuPropertyID5] [int] NULL,
	[skuPropertyID6] [int] NULL,
	[skuPropertyID7] [int] NULL,
	[custom_num1] [decimal](18, 5) NULL,
	[custom_num2] [decimal](18, 5) NULL,
	[custom_num3] [decimal](18, 5) NULL,
	[custom_num4] [decimal](18, 5) NULL,
	[custom_num5] [decimal](18, 5) NULL,
	[custom_num6] [decimal](18, 5) NULL,
	[custom_num7] [decimal](18, 5) NULL,
	[custom_num8] [decimal](18, 5) NULL,
	[custom_num9] [decimal](18, 5) NULL,
	[custom_num10] [decimal](18, 5) NULL,
	[custom_txt1] [nvarchar](100) NULL,
	[custom_txt2] [nvarchar](100) NULL,
	[custom_txt3] [nvarchar](100) NULL,
	[custom_txt4] [nvarchar](100) NULL,
	[custom_txt5] [nvarchar](100) NULL,
	[custom_txt6] [nvarchar](100) NULL,
	[custom_txt7] [nvarchar](100) NULL,
	[custom_txt8] [nvarchar](100) NULL,
	[custom_txt9] [nvarchar](100) NULL,
	[custom_txt10] [nvarchar](100) NULL,
	[isDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Symphony_MTOSkus] PRIMARY KEY CLUSTERED 
(
	[stockLocationID] ASC,
	[skuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_MTOSkusHistory]    Script Date: 4/18/2024 3:51:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_MTOSkusHistory](
	[stockLocationID] [int] NOT NULL,
	[skuID] [int] NOT NULL,
	[bufferSize] [numeric](18, 5) NULL,
	[inventoryAtSite] [numeric](18, 5) NULL,
	[consumption] [numeric](18, 5) NULL,
	[totalIn] [numeric](18, 5) NULL,
	[updateDate] [smalldatetime] NOT NULL,
	[returned] [numeric](18, 5) NOT NULL,
	[inventoryAtTransit] [numeric](18, 5) NULL,
	[inventoryAtProduction] [numeric](18, 5) NULL,
	[unitPrice] [numeric](18, 5) NULL,
	[throughput] [numeric](18, 5) NULL,
	[tvc] [numeric](18, 5) NULL,
	[tempInventoryAtSite] [numeric](18, 5) NULL,
	[worstInventoryAtSite] [numeric](18, 5) NULL,
	[inventoryAtSiteUpdatesNum] [numeric](18, 5) NOT NULL,
	[avgInventoryAtSite] [numeric](18, 5) NULL,
	[isDuplicatedRow] [bit] NOT NULL,
	[toIncreaseUpdateNum] [bit] NOT NULL,
	[isDeleted] [bit] NOT NULL,
 CONSTRAINT [PK_Symphony_MTOSkusHistory] PRIMARY KEY CLUSTERED 
(
	[stockLocationID] ASC,
	[skuID] ASC,
	[updateDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_MTOSkusInflow]    Script Date: 4/18/2024 3:51:45 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_MTOSkusInflow](
	[stockLocationID] [int] NOT NULL,
	[skuID] [int] NOT NULL,
	[inflowAmount] [numeric](21, 5) NULL,
	[InflowDate] [datetime] NULL,
	[transactionID] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_MTOSkusOutflow]    Script Date: 4/18/2024 3:51:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_MTOSkusOutflow](
	[stockLocationID] [int] NOT NULL,
	[skuID] [int] NOT NULL,
	[outflowAmount] [numeric](21, 5) NULL,
	[outflowDate] [datetime] NULL,
	[transactionID] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_MTSColorDistribution]    Script Date: 4/18/2024 3:51:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_MTSColorDistribution](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[filterID] [int] NOT NULL,
	[filterType] [int] NULL,
	[numberCyans] [int] NULL,
	[numberGreens] [int] NULL,
	[numberYellows] [int] NULL,
	[numberReds] [int] NULL,
	[numberBlacks] [int] NULL,
	[updateDate] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_NPISetMembers]    Script Date: 4/18/2024 3:51:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_NPISetMembers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[npiSetID] [int] NOT NULL,
	[familyMemberID] [int] NOT NULL,
	[npiQuantity] [int] NOT NULL,
 CONSTRAINT [PK_Symphony_NPISetMembers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_NPISets]    Script Date: 4/18/2024 3:51:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_NPISets](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Symphony_NPISets] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_ParentSDCEvents]    Script Date: 4/18/2024 3:51:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_ParentSDCEvents](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
	[filterType] [int] NOT NULL,
	[filterSql] [nvarchar](max) NOT NULL,
	[filterText] [nvarchar](max) NOT NULL,
	[filterArray] [varbinary](max) NOT NULL,
	[date] [smalldatetime] NOT NULL,
	[resizeMethod] [int] NOT NULL,
	[resizeValue] [numeric](18, 2) NOT NULL,
	[recurrence] [int] NOT NULL,
	[creationDate] [smalldatetime] NOT NULL,
	[createdBy] [nvarchar](400) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_PercentSkuFamilyAvailability]    Script Date: 4/18/2024 3:51:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_PercentSkuFamilyAvailability](
	[dashboardItemID] [int] NOT NULL,
	[familyCount] [int] NOT NULL,
	[validFamilyCount] [int] NOT NULL,
	[percentSkuFamilyAvailability] [decimal](18, 5) NOT NULL,
	[measureDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Symphony_PercentSkuFamilyAvailability] PRIMARY KEY CLUSTERED 
(
	[dashboardItemID] ASC,
	[measureDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_plannedLoadBreakDown]    Script Date: 4/18/2024 3:51:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_plannedLoadBreakDown](
	[itemID] [int] IDENTITY(1,1) NOT NULL,
	[mcrName] [nvarchar](50) NULL,
	[plantID] [int] NULL,
	[woid] [nvarchar](50) NULL,
	[componentID] [nvarchar](50) NULL,
	[workLoadPrecentage] [numeric](18, 5) NULL,
	[workLoadHours] [numeric](18, 5) NULL,
	[isSuperFast] [bit] NOT NULL,
	[isPlanned] [bit] NOT NULL,
	[periodIndex] [int] NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IND_Symphony_plannedLoadBreakDown]    Script Date: 4/18/2024 3:51:46 PM ******/
CREATE CLUSTERED INDEX [IND_Symphony_plannedLoadBreakDown] ON [dbo].[Symphony_plannedLoadBreakDown]
(
	[mcrName] ASC,
	[woid] ASC,
	[componentID] ASC,
	[plantID] ASC,
	[isSuperFast] ASC,
	[isPlanned] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_PlannedLoadHistory]    Script Date: 4/18/2024 3:51:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_PlannedLoadHistory](
	[updateDate] [smalldatetime] NOT NULL,
	[numberOfUpdates] [int] NOT NULL,
	[mcrName] [nvarchar](50) NOT NULL,
	[plantID] [int] NULL,
	[superFastCapacity] [numeric](21, 5) NULL,
	[superFastMtsLoad] [numeric](21, 5) NULL,
	[superFastStrategicLoad] [numeric](21, 5) NULL,
	[superFastStandardLoad] [numeric](21, 5) NULL,
	[superFastSuperFastLoad] [numeric](21, 5) NULL,
	[superFastFastLoad] [numeric](21, 5) NULL,
	[superFastReservedLoad] [numeric](21, 5) NULL,
	[superFastRedLoad] [numeric](21, 5) NULL,
	[superFastBlackLoad] [numeric](21, 5) NULL,
	[superFastPlanned] [numeric](21, 5) NULL,
	[superFastPresent] [numeric](21, 5) NULL,
	[ratioSuperFastMtsLoadOfPlanned] [numeric](21, 5) NULL,
	[ratioSuperFastStrateigcLoadOfPlanned] [numeric](21, 5) NULL,
	[ratioSuperFastStandardLoadOfPlanned] [numeric](21, 5) NULL,
	[ratioSuperFastSuperFastLoadOfPlanned] [numeric](21, 5) NULL,
	[ratioSuperFastReservedLoadOfPlanned] [numeric](21, 5) NULL,
	[ratioSuperFastRedLoadOfPlanned] [numeric](21, 5) NULL,
	[ratioSuperFastBlackLoadOfPlanned] [numeric](21, 5) NULL,
	[ratioSuperFastFastLoadOfPlanned] [numeric](21, 5) NULL,
	[bufferSlackRate] [numeric](21, 5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_plannedLoadLongHorizon]    Script Date: 4/18/2024 3:51:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_plannedLoadLongHorizon](
	[itemID] [int] IDENTITY(1,1) NOT NULL,
	[mcrName] [nvarchar](50) NULL,
	[plantID] [int] NULL,
	[period] [int] NULL,
	[periodLoad] [numeric](21, 5) NULL,
	[periodCapacity] [numeric](21, 5) NULL,
	[startDate] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_plannedLoadSFHorizon]    Script Date: 4/18/2024 3:51:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_plannedLoadSFHorizon](
	[itemID] [int] IDENTITY(1,1) NOT NULL,
	[mcrName] [nvarchar](50) NULL,
	[plantID] [int] NULL,
	[superFastPresentLoad] [numeric](21, 5) NULL,
	[superFastPlannedLoadLoad] [numeric](21, 5) NULL,
	[superFastAvilable] [numeric](21, 5) NULL,
	[superFastPlannedLoadCyan] [numeric](21, 5) NULL,
	[superFastPlannedLoadGreen] [numeric](21, 5) NULL,
	[superFastPlannedLoadYellow] [numeric](21, 5) NULL,
	[superFastPlannedLoadRed] [numeric](21, 5) NULL,
	[superFastPlannedLoadBlack] [numeric](21, 5) NULL,
	[SFHorizonStrategic] [numeric](21, 5) NULL,
	[SFHorizonStandard] [numeric](21, 5) NULL,
	[SFHorizonMts] [numeric](21, 5) NULL,
	[SFHorizonFast] [numeric](21, 5) NULL,
	[SFHorizonSuperFast] [numeric](21, 5) NULL,
	[SFHorizonMtsNoReleaseDate] [numeric](21, 5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_PriorityViolationCounts]    Script Date: 4/18/2024 3:51:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_PriorityViolationCounts](
	[filterID] [int] NOT NULL,
	[plantID] [int] NOT NULL,
	[workCenter] [nvarchar](50) NOT NULL,
	[updateDate] [smalldatetime] NOT NULL,
	[violationsCount] [int] NOT NULL,
 CONSTRAINT [PK_Symphony_PriorityViolationCounts] PRIMARY KEY CLUSTERED 
(
	[filterID] ASC,
	[updateDate] ASC,
	[plantID] ASC,
	[workCenter] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_ProcessDates]    Script Date: 4/18/2024 3:51:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_ProcessDates](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[dayOfWeek] [int] NOT NULL,
	[processTypeID] [int] NOT NULL,
	[lastProcessDate] [smalldatetime] NOT NULL,
 CONSTRAINT [PK_Symphony_ProcessDates] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [UK_Symphony_ProcessDates] UNIQUE NONCLUSTERED 
(
	[lastProcessDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_ProductionCalendarNonWorkingDays]    Script Date: 4/18/2024 3:51:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_ProductionCalendarNonWorkingDays](
	[nonWorkingDayID] [int] IDENTITY(1,1) NOT NULL,
	[nonWorkingDay] [datetime] NULL,
	[plantID] [int] NOT NULL,
	[calenderID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_ProductionFamilies]    Script Date: 4/18/2024 3:51:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_ProductionFamilies](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[plant] [int] NOT NULL,
	[familyName] [nvarchar](100) NOT NULL,
	[bufferSize] [int] NOT NULL,
	[percentTouchTime] [decimal](9, 5) NOT NULL,
	[flowDictatorID] [int] NULL,
	[allowForLongTravelTime] [bit] NOT NULL,
	[productionLeadTimePrec] [int] NULL,
	[bufferFactor] [decimal](9, 5) NOT NULL,
	[safetyFactor] [decimal](9, 5) NOT NULL,
	[thersholdFactor] [decimal](9, 5) NOT NULL,
 CONSTRAINT [PK_ProductionFamilies] PRIMARY KEY NONCLUSTERED 
(
	[plant] ASC,
	[familyName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [UK_ProductionFamilies_ID] UNIQUE NONCLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_ProductionManufacturingSkus]    Script Date: 4/18/2024 3:51:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_ProductionManufacturingSkus](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[taskID] [int] NOT NULL,
	[plantID] [int] NOT NULL,
	[skuID] [int] NOT NULL,
	[skuDescription] [nvarchar](100) NULL,
	[quantity] [decimal](21, 5) NULL,
 CONSTRAINT [PK_Symphony_ProductionManufacturingSkus] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_ProductionQuotes]    Script Date: 4/18/2024 3:51:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_ProductionQuotes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[orderID] [nvarchar](100) NULL,
	[plantID] [int] NOT NULL,
	[quotedDueDate] [datetime] NOT NULL,
	[earliestDueDate] [datetime] NOT NULL,
	[skuID] [int] NULL,
	[skuDescription] [nvarchar](100) NULL,
	[marketFamily] [int] NULL,
	[productionFamily] [int] NULL,
	[quantity] [numeric](18, 5) NOT NULL,
	[bufferSize] [numeric](18, 5) NOT NULL,
	[leadTime] [int] NOT NULL,
	[issueDate] [smalldatetime] NULL,
	[expireDate] [smalldatetime] NULL,
	[status] [int] NOT NULL,
	[orderSize] [int] NULL,
	[uomID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Index [IDX_Symphony_ProductionQuotes]    Script Date: 4/18/2024 3:51:46 PM ******/
CREATE CLUSTERED INDEX [IDX_Symphony_ProductionQuotes] ON [dbo].[Symphony_ProductionQuotes]
(
	[status] ASC,
	[plantID] ASC,
	[skuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_ProductionWorkCenterGroup]    Script Date: 4/18/2024 3:51:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_ProductionWorkCenterGroup](
	[workCenterGroup] [nvarchar](50) NOT NULL,
	[workCenter] [nvarchar](50) NOT NULL,
 CONSTRAINT [PK_Symphony_SBWorkCenterGroups] PRIMARY KEY CLUSTERED 
(
	[workCenterGroup] ASC,
	[workCenter] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_ProjectGroups ]    Script Date: 4/18/2024 3:51:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_ProjectGroups ](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[groupName] [nvarchar](100) NOT NULL,
	[groupDescription] [nvarchar](100) NULL,
	[calanderGroupID] [int] NULL,
	[quota] [int] NOT NULL,
	[groupBufferPrec] [int] NOT NULL,
 CONSTRAINT [PK_Symphony_ProjectGroups ] PRIMARY KEY CLUSTERED 
(
	[groupName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_Projects]    Script Date: 4/18/2024 3:51:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_Projects](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[projectID] [nvarchar](50) NOT NULL,
	[projectName] [nvarchar](100) NOT NULL,
	[currentTask] [int] NULL,
	[dueDate] [smalldatetime] NOT NULL,
	[currentTaskFinishDate] [smalldatetime] NULL,
	[currentTaskStartDate] [smalldatetime] NULL,
	[progressPercentage] [numeric](11, 5) NULL,
	[projectBP] [numeric](11, 5) NULL,
	[templateID] [int] NOT NULL,
	[groupID] [int] NOT NULL,
	[projectManager] [nvarchar](100) NULL,
	[notes] [nvarchar](400) NULL,
	[createdDate] [smalldatetime] NULL,
	[recomendedDate] [smalldatetime] NULL,
	[isActive] [bit] NOT NULL,
	[isFinish] [bit] NOT NULL,
	[allWoRelease] [bit] NOT NULL,
	[lastUpdate] [smalldatetime] NULL,
 CONSTRAINT [PK_Symphony_Projects] PRIMARY KEY CLUSTERED 
(
	[projectID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_ProjectTasks]    Script Date: 4/18/2024 3:51:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_ProjectTasks](
	[ID] [int] NOT NULL,
	[templateID] [int] NOT NULL,
	[taskName] [nvarchar](100) NOT NULL,
	[taskDuration] [int] NOT NULL,
	[taskOrder] [int] NOT NULL,
 CONSTRAINT [PK_Symphony_ProjectTasks] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_ProjectTemplates]    Script Date: 4/18/2024 3:51:46 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_ProjectTemplates](
	[ID] [int] NOT NULL,
	[templateName] [nvarchar](100) NOT NULL,
	[templateDescription] [nvarchar](100) NULL,
 CONSTRAINT [PK_Symphony_ProjectTemplates] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [UK_Symphony_ProjectTemplates] UNIQUE NONCLUSTERED 
(
	[templateName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_PurchaseBufferClass]    Script Date: 4/18/2024 3:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_PurchaseBufferClass](
	[bufferName] [nvarchar](50) NOT NULL,
	[bufferSize] [int] NOT NULL,
 CONSTRAINT [PK_Symphony_PurchaseBufferClass] PRIMARY KEY CLUSTERED 
(
	[bufferName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_PurchasingNotes]    Script Date: 4/18/2024 3:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_PurchasingNotes](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[PurchaseOrderID] [int] NOT NULL,
	[stockLocationID] [int] NOT NULL,
	[skuID] [int] NOT NULL,
	[orderType] [tinyint] NOT NULL,
	[note] [nvarchar](1000) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_PurchasingOrder]    Script Date: 4/18/2024 3:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_PurchasingOrder](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[stockLocationID] [int] NOT NULL,
	[skuID] [int] NOT NULL,
	[skuDescription] [nvarchar](1000) NULL,
	[quantity] [numeric](18, 5) NOT NULL,
	[orderID] [nvarchar](100) NOT NULL,
	[clientOrderID] [nvarchar](50) NULL,
	[supplierID] [int] NOT NULL,
	[bufferSize] [numeric](18, 5) NULL,
	[isToOrder] [bit] NOT NULL,
	[orderPrice] [numeric](21, 5) NULL,
	[orderDate] [smalldatetime] NULL,
	[promisedDueDate] [smalldatetime] NULL,
	[bufferPenetration] [numeric](18, 5) NULL,
	[bufferColor] [tinyint] NOT NULL,
	[inputSuspicion] [bit] NOT NULL,
	[virtualStockLevel] [numeric](18, 5) NULL,
	[bufferDueDate] [smalldatetime] NULL,
	[considered] [bit] NOT NULL,
	[newRedBlack] [bit] NOT NULL,
	[calculateDueDate] [smalldatetime] NULL,
	[oldBufferColor] [tinyint] NOT NULL,
	[neededDate] [smalldatetime] NULL,
	[isShipped] [bit] NOT NULL,
	[supplierSkuName] [nvarchar](100) NULL,
	[note] [nvarchar](1000) NULL,
	[needsMatch] [bit] NOT NULL,
	[purchasingPropertyID1] [int] NULL,
	[purchasingPropertyID2] [int] NULL,
	[purchasingPropertyID3] [int] NULL,
	[purchasingPropertyID4] [int] NULL,
	[purchasingPropertyID5] [int] NULL,
	[purchasingPropertyID6] [int] NULL,
	[purchasingPropertyID7] [int] NULL,
	[isISTOrder] [bit] NULL,
 CONSTRAINT [PK_Symphony_PurchasingOrder] PRIMARY KEY CLUSTERED 
(
	[skuID] ASC,
	[stockLocationID] ASC,
	[orderID] ASC,
	[isToOrder] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_PurchasingOrderPrev]    Script Date: 4/18/2024 3:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_PurchasingOrderPrev](
	[ID] [int] NULL,
	[stockLocationID] [int] NOT NULL,
	[skuID] [int] NOT NULL,
	[skuDescription] [nvarchar](1000) NULL,
	[quantity] [numeric](18, 5) NOT NULL,
	[orderID] [nvarchar](100) NOT NULL,
	[clientOrderID] [nvarchar](50) NULL,
	[supplierID] [int] NOT NULL,
	[bufferSize] [numeric](18, 5) NULL,
	[isToOrder] [bit] NULL,
	[orderPrice] [numeric](21, 5) NULL,
	[orderDate] [smalldatetime] NULL,
	[promisedDueDate] [smalldatetime] NULL,
	[bufferPenetration] [numeric](18, 5) NULL,
	[bufferColor] [tinyint] NOT NULL,
	[inputSuspicion] [bit] NOT NULL,
	[virtualStockLevel] [numeric](18, 5) NULL,
	[bufferDueDate] [smalldatetime] NULL,
	[considered] [bit] NOT NULL,
	[newRedBlack] [bit] NOT NULL,
	[calculateDueDate] [smalldatetime] NULL,
	[oldBufferColor] [tinyint] NOT NULL,
	[neededDate] [smalldatetime] NULL,
	[isShipped] [bit] NOT NULL,
	[supplierSkuName] [nvarchar](100) NULL,
	[note] [nvarchar](1000) NULL,
	[needsMatch] [bit] NOT NULL,
	[purchasingPropertyID1] [int] NULL,
	[purchasingPropertyID2] [int] NULL,
	[purchasingPropertyID3] [int] NULL,
	[purchasingPropertyID4] [int] NULL,
	[purchasingPropertyID5] [int] NULL,
	[purchasingPropertyID6] [int] NULL,
	[purchasingPropertyID7] [int] NULL,
	[isISTOrder] [bit] NULL,
 CONSTRAINT [PK_Symphony_PurchasingOrderPrev] PRIMARY KEY CLUSTERED 
(
	[skuID] ASC,
	[stockLocationID] ASC,
	[orderID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_PurchasingProperty]    Script Date: 4/18/2024 3:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_PurchasingProperty](
	[purchasingPropertyID] [nvarchar](50) NOT NULL,
	[purchasingPropertyName] [nvarchar](100) NULL,
	[purchasingPropertyDescription] [nvarchar](1000) NULL,
	[autoAddNewItem] [bit] NOT NULL,
 CONSTRAINT [PK_Symphony_PurchasingProperty] PRIMARY KEY CLUSTERED 
(
	[purchasingPropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_PurchasingPropertyItems]    Script Date: 4/18/2024 3:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_PurchasingPropertyItems](
	[purchasingItemID] [int] IDENTITY(1,1) NOT NULL,
	[purchasingPropertyID] [nvarchar](50) NOT NULL,
	[purchasingItemName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Symphony_PurchasingPropertyItems] PRIMARY KEY CLUSTERED 
(
	[purchasingPropertyID] ASC,
	[purchasingItemName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [UK_Symphony_PurchasingPropertyItems] UNIQUE NONCLUSTERED 
(
	[purchasingItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_PurchasingRecommendation]    Script Date: 4/18/2024 3:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_PurchasingRecommendation](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[stockLocationID] [int] NOT NULL,
	[skuID] [int] NOT NULL,
	[woid] [nvarchar](50) NOT NULL,
	[clientOrderID] [nvarchar](50) NULL,
	[note] [nvarchar](1000) NULL,
	[noteID] [int] NULL,
	[quantity] [numeric](18, 5) NOT NULL,
	[suggestedQuantity] [numeric](18, 5) NOT NULL,
	[supplierID] [int] NOT NULL,
	[orderType] [tinyint] NOT NULL,
	[creationDate] [smalldatetime] NOT NULL,
	[sentToReplenishment] [bit] NOT NULL,
	[isAwaitsConfirmation] [bit] NOT NULL,
	[showInReport] [bit] NOT NULL,
	[isConfirmed] [bit] NOT NULL,
	[earliestOrderDate] [smalldatetime] NULL,
	[latestOrderDate] [smalldatetime] NULL,
	[needDate] [smalldatetime] NULL,
	[issueDate] [smalldatetime] NULL,
	[submissionDate] [smalldatetime] NULL,
	[bufferColor] [tinyint] NOT NULL,
	[virtualStockLevel] [numeric](18, 5) NULL,
	[virtualBufferPenetration] [numeric](18, 5) NULL,
	[daysLate] [int] NULL,
	[inventoryNeeded] [numeric](18, 5) NOT NULL,
	[orderID] [nvarchar](100) NULL,
	[orderPrice] [decimal](21, 5) NULL,
	[promisedDueDate] [smalldatetime] NULL,
	[isDeleted] [bit] NOT NULL,
	[prPropertyID1] [int] NULL,
	[prPropertyID2] [int] NULL,
	[prPropertyID3] [int] NULL,
	[prPropertyID4] [int] NULL,
	[prPropertyID5] [int] NULL,
	[prPropertyID6] [int] NULL,
	[prPropertyID7] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_PurchasingRecommendationProperty]    Script Date: 4/18/2024 3:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_PurchasingRecommendationProperty](
	[propertyID] [nvarchar](50) NOT NULL,
	[propertyName] [nvarchar](50) NULL,
	[propertyDescription] [nvarchar](1000) NULL,
	[autoAddNewItem] [bit] NOT NULL,
 CONSTRAINT [PK_Symphony_PurchasingRecommendationProperty] PRIMARY KEY CLUSTERED 
(
	[propertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_PurchasingRecommendationPropertyItems]    Script Date: 4/18/2024 3:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_PurchasingRecommendationPropertyItems](
	[itemID] [int] IDENTITY(1,1) NOT NULL,
	[propertyID] [nvarchar](50) NOT NULL,
	[itemName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Symphony_PurchasingRecommendationPropertyItems] PRIMARY KEY CLUSTERED 
(
	[propertyID] ASC,
	[itemName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [UK_Symphony_PurchasingRecommendationPropertyItems] UNIQUE NONCLUSTERED 
(
	[itemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_QuoteRequest]    Script Date: 4/18/2024 3:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_QuoteRequest](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[orderID] [nvarchar](100) NULL,
	[tmpSkuName] [nvarchar](100) NULL,
	[skuName] [nvarchar](100) NULL,
	[quantity] [decimal](18, 5) NULL,
	[quantityAtPlant] [decimal](18, 5) NULL,
	[marketFamilyName] [nvarchar](100) NULL,
	[productionFamilyName] [nvarchar](100) NULL,
	[marketFamily] [int] NULL,
	[productionFamily] [int] NULL,
	[isBigOrder] [bit] NULL,
	[skuDescription] [nvarchar](1000) NULL,
	[sourceStockLocationID] [int] NULL,
	[sourceStockLocationName] [nvarchar](100) NULL,
	[destinationStockLocationID] [int] NULL,
	[destinationStockLocationName] [nvarchar](100) NULL,
	[quotedDueDate] [smalldatetime] NULL,
	[firstAvailableDueDate] [smalldatetime] NULL,
	[SLT] [int] NULL,
	[bufferSize] [decimal](18, 0) NULL,
	[mcrID] [int] NULL,
	[expireDate] [smalldatetime] NULL,
	[skuID] [int] NULL,
	[uomID] [int] NULL,
	[calculationResult] [int] NULL,
	[requestResult] [int] NULL,
	[notes] [nvarchar](50) NULL,
	[supplyRoute] [nvarchar](100) NULL,
	[userUomID] [int] NULL,
	[userQuantity] [decimal](18, 5) NULL,
	[status] [nvarchar](100) NULL,
 CONSTRAINT [PK_Symphony_QuoteRequest] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_ReasonsMtsSku]    Script Date: 4/18/2024 3:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_ReasonsMtsSku](
	[reasonID] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[reason] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Symphony_ReasonsMtsSku] PRIMARY KEY CLUSTERED 
(
	[reason] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_ReasonsSB]    Script Date: 4/18/2024 3:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_ReasonsSB](
	[reasonID] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[reason] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_SBReasons] PRIMARY KEY CLUSTERED 
(
	[reason] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_ReasonsSBRope]    Script Date: 4/18/2024 3:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_ReasonsSBRope](
	[reasonID] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[reason] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_SBRopeReasons] PRIMARY KEY CLUSTERED 
(
	[reason] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_ReasonsTooMuchDeviation]    Script Date: 4/18/2024 3:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_ReasonsTooMuchDeviation](
	[reasonID] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[reason] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Symphony_ReasonsTooMuchDeviation] PRIMARY KEY CLUSTERED 
(
	[reason] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_RecommendationsHistory]    Script Date: 4/18/2024 3:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_RecommendationsHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[stockLocationID] [int] NULL,
	[skuID] [int] NULL,
	[createDate] [smalldatetime] NULL,
	[bufferPolicyID] [int] NULL,
	[lastAccumulation] [numeric](18, 5) NULL,
	[lastBPSite] [numeric](18, 5) NULL,
	[recommendationType] [tinyint] NULL,
	[recommendationWarning] [tinyint] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_ReplenishmentDistributionLog]    Script Date: 4/18/2024 3:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_ReplenishmentDistributionLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[stockLocationID] [int] NOT NULL,
	[skuID] [int] NOT NULL,
	[replenishmentQuantity] [numeric](18, 5) NOT NULL,
	[bpProduction] [numeric](18, 5) NOT NULL,
	[inventoryNeeded] [numeric](18, 5) NOT NULL,
	[bufferSize] [numeric](18, 5) NULL,
	[originStockLocation] [int] NULL,
	[originSKU] [nvarchar](100) NULL,
	[productionColor] [tinyint] NOT NULL,
	[userName] [nvarchar](100) NULL,
	[updateDate] [smalldatetime] NOT NULL,
	[clientOrderID] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_ReplenishmentPerformanceHistory]    Script Date: 4/18/2024 3:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_ReplenishmentPerformanceHistory](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[dashboardItemID] [int] NOT NULL,
	[updateDate] [datetime] NOT NULL,
	[totalBuffers] [int] NULL,
	[numberNonfilled] [int] NULL,
	[numberOverfilled] [int] NULL,
	[grade] [numeric](21, 5) NULL
) ON [PRIMARY]
GO
/****** Object:  Index [indx_ReplenishmentPerformanceHistory]    Script Date: 4/18/2024 3:51:47 PM ******/
CREATE CLUSTERED INDEX [indx_ReplenishmentPerformanceHistory] ON [dbo].[Symphony_ReplenishmentPerformanceHistory]
(
	[updateDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_ReplenishmentProductionLog]    Script Date: 4/18/2024 3:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_ReplenishmentProductionLog](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[stockLocationID] [int] NOT NULL,
	[skuID] [int] NOT NULL,
	[replenishmentQuantity] [numeric](18, 5) NOT NULL,
	[bpProduction] [numeric](18, 5) NOT NULL,
	[inventoryNeeded] [numeric](18, 5) NOT NULL,
	[bufferSize] [numeric](18, 5) NULL,
	[originStockLocation] [int] NULL,
	[originSKU] [nvarchar](100) NULL,
	[productionColor] [tinyint] NOT NULL,
	[userName] [nvarchar](100) NULL,
	[updateDate] [smalldatetime] NOT NULL,
	[clientOrderID] [nvarchar](50) NULL,
	[projectID] [nvarchar](50) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_ReportGroups]    Script Date: 4/18/2024 3:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_ReportGroups](
	[reportGroupID] [decimal](18, 0) NOT NULL,
	[reportGroupName] [nvarchar](100) NULL,
	[reportGroupDescription] [nvarchar](200) NULL,
 CONSTRAINT [PK_Symphony_ReportGroups] PRIMARY KEY CLUSTERED 
(
	[reportGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [UK_Symphony_ReportGroups] UNIQUE NONCLUSTERED 
(
	[reportGroupName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_ReportsManagementSharing]    Script Date: 4/18/2024 3:51:47 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_ReportsManagementSharing](
	[reportType] [tinyint] NOT NULL,
	[reportID] [int] NOT NULL,
	[reportSharingType] [tinyint] NOT NULL,
	[displayString] [nvarchar](4000) NULL,
	[serializedData] [varbinary](max) NULL,
 CONSTRAINT [PK_Symphony_ReportsManagementSharing] PRIMARY KEY CLUSTERED 
(
	[reportType] ASC,
	[reportID] ASC,
	[reportSharingType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_ReportsSharingData]    Script Date: 4/18/2024 3:51:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_ReportsSharingData](
	[reportID] [int] NOT NULL,
	[reportType] [tinyint] NOT NULL,
	[reportSubType] [int] NULL,
	[lastEmailed] [smalldatetime] NULL,
	[lastExported] [smalldatetime] NULL,
 CONSTRAINT [PK_Symphony_ReportsSharingData] PRIMARY KEY CLUSTERED 
(
	[reportType] ASC,
	[reportID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_RetailAllocationRequest]    Script Date: 4/18/2024 3:51:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_RetailAllocationRequest](
	[originID] [int] NULL,
	[destinationID] [int] NOT NULL,
	[familyID] [int] NOT NULL,
	[requestStatus] [tinyint] NOT NULL,
	[sentToReplenishment] [bit] NOT NULL,
	[bySystem] [bit] NOT NULL,
	[totalNPI] [int] NULL,
	[groupID] [int] NULL,
	[optionalRequest] [bit] NOT NULL,
	[allocationRecommendationType] [tinyint] NULL,
	[userSelection] [tinyint] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Index [I_Symphony_RetailAllocationRequest]    Script Date: 4/18/2024 3:51:48 PM ******/
CREATE CLUSTERED INDEX [I_Symphony_RetailAllocationRequest] ON [dbo].[Symphony_RetailAllocationRequest]
(
	[destinationID] ASC,
	[familyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_RetailAllocationTrace]    Script Date: 4/18/2024 3:51:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_RetailAllocationTrace](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[AssortmentGroup] [int] NULL,
	[StorePriority] [int] NULL,
	[StoreID] [int] NULL,
	[FamilyID] [int] NULL,
	[BP] [decimal](18, 5) NULL,
	[LayerPercentage] [decimal](18, 5) NULL,
	[Gap] [int] NULL,
	[SEBP] [decimal](18, 5) NULL,
	[IsAllocated] [int] NULL,
	[isOptional] [bit] NULL,
	[reason] [nvarchar](200) NULL,
	[attName] [nvarchar](200) NULL,
	[attValue] [nvarchar](200) NULL,
	[attPriority] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_RetailAttributesAGTargetsSet]    Script Date: 4/18/2024 3:51:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_RetailAttributesAGTargetsSet](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[setID] [int] NOT NULL,
	[attributePriority] [int] NULL,
	[attributeName] [nvarchar](100) NULL,
	[attributeValue] [nvarchar](100) NULL,
	[distributionType] [int] NULL,
	[minDistribution] [decimal](18, 5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_RetailAttributesAGTargetsSetIDs]    Script Date: 4/18/2024 3:51:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_RetailAttributesAGTargetsSetIDs](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[setName] [nvarchar](200) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_RetailColorDistribution]    Script Date: 4/18/2024 3:51:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_RetailColorDistribution](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[measureID] [int] NOT NULL,
	[measureType] [smallint] NULL,
	[measureClass] [smallint] NULL,
	[numberCyans] [int] NULL,
	[numberGreens] [int] NULL,
	[numberReds] [int] NULL,
	[measureDate] [smalldatetime] NULL,
 CONSTRAINT [PK_Symphony_RetailColorDistribution] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [UK_Symphony_RetailColorDistribution] UNIQUE NONCLUSTERED 
(
	[measureID] ASC,
	[measureType] ASC,
	[measureDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_RetailFamiliesLocationData]    Script Date: 4/18/2024 3:51:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_RetailFamiliesLocationData](
	[stockLocationID] [int] NOT NULL,
	[familyID] [int] NOT NULL,
	[NumFamiliesAtSite] [int] NOT NULL,
	[NumFamiliesAtPipe] [int] NOT NULL,
	[NumAllocatedRequests] [int] NOT NULL,
	[NumFamiliesAtSiteBUL] [int] NOT NULL,
	[NumFamiliesInPipeBUL] [int] NOT NULL,
 CONSTRAINT [PK_Symphony_RetailFamiliesLocationData] PRIMARY KEY CLUSTERED 
(
	[stockLocationID] ASC,
	[familyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_RetailFamilyMasterData]    Script Date: 4/18/2024 3:51:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_RetailFamilyMasterData](
	[familyID] [int] NOT NULL,
	[skuPropertyID1] [int] NULL,
	[skuPropertyID2] [int] NULL,
	[skuPropertyID3] [int] NULL,
	[skuPropertyID4] [int] NULL,
	[skuPropertyID5] [int] NULL,
	[skuPropertyID6] [int] NULL,
	[skuPropertyID7] [int] NULL,
	[custom_num1] [decimal](18, 5) NULL,
	[custom_num2] [decimal](18, 5) NULL,
	[custom_num3] [decimal](18, 5) NULL,
	[custom_num4] [decimal](18, 5) NULL,
	[custom_num5] [decimal](18, 5) NULL,
	[custom_num6] [decimal](18, 5) NULL,
	[custom_num7] [decimal](18, 5) NULL,
	[custom_num8] [decimal](18, 5) NULL,
	[custom_num9] [decimal](18, 5) NULL,
	[custom_num10] [decimal](18, 5) NULL,
	[custom_txt1] [nvarchar](100) NULL,
	[custom_txt2] [nvarchar](100) NULL,
	[custom_txt3] [nvarchar](100) NULL,
	[custom_txt4] [nvarchar](100) NULL,
	[custom_txt5] [nvarchar](100) NULL,
	[custom_txt6] [nvarchar](100) NULL,
	[custom_txt7] [nvarchar](100) NULL,
	[custom_txt8] [nvarchar](100) NULL,
	[custom_txt9] [nvarchar](100) NULL,
	[custom_txt10] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_RetailLocationGroupsData]    Script Date: 4/18/2024 3:51:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_RetailLocationGroupsData](
	[stockLocationId] [int] NOT NULL,
	[groupID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_SalesRateFamily]    Script Date: 4/18/2024 3:51:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_SalesRateFamily](
	[stockLocationID] [int] NOT NULL,
	[familyID] [int] NOT NULL,
	[consumption] [decimal](18, 5) NULL,
	[validDays] [decimal](18, 5) NULL,
	[saleRate] [decimal](18, 5) NOT NULL,
	[isLeaf] [bit] NOT NULL,
	[whCandidate] [bit] NOT NULL,
	[coverage] [decimal](18, 5) NOT NULL,
	[week1consumption] [decimal](18, 5) NULL,
	[week1validDays] [decimal](18, 5) NULL,
	[week2consumption] [decimal](18, 5) NULL,
	[week2validDays] [decimal](18, 5) NULL,
	[week3consumption] [decimal](18, 5) NULL,
	[week3validDays] [decimal](18, 5) NULL,
	[week4consumption] [decimal](18, 5) NULL,
	[week4validDays] [decimal](18, 5) NULL,
 CONSTRAINT [PK_Symphony_SalesRateFamily] PRIMARY KEY CLUSTERED 
(
	[stockLocationID] ASC,
	[familyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_SalesRateSku]    Script Date: 4/18/2024 3:51:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_SalesRateSku](
	[stockLocationID] [int] NOT NULL,
	[skuID] [int] NOT NULL,
	[consumption] [decimal](18, 5) NOT NULL,
	[validDays] [decimal](18, 5) NOT NULL,
	[saleRate] [decimal](18, 5) NOT NULL,
	[isLeaf] [bit] NOT NULL,
	[whCandidate] [bit] NOT NULL,
	[coverage] [decimal](18, 5) NOT NULL,
	[week1consumption] [decimal](18, 5) NOT NULL,
	[week1validDays] [decimal](18, 5) NOT NULL,
	[week2consumption] [decimal](18, 5) NOT NULL,
	[week2validDays] [decimal](18, 5) NOT NULL,
	[week3consumption] [decimal](18, 5) NOT NULL,
	[week3validDays] [decimal](18, 5) NOT NULL,
	[week4consumption] [decimal](18, 5) NOT NULL,
	[week4validDays] [decimal](18, 5) NOT NULL,
	[lastCalculationDate] [smalldatetime] NULL,
 CONSTRAINT [PK_Symphony_SalesRateSku] PRIMARY KEY CLUSTERED 
(
	[stockLocationID] ASC,
	[skuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_SalesRateTempFamily]    Script Date: 4/18/2024 3:51:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_SalesRateTempFamily](
	[stockLocationID] [int] NOT NULL,
	[familyID] [int] NOT NULL,
	[consumption] [decimal](18, 5) NOT NULL,
	[validDays] [decimal](18, 5) NOT NULL,
	[isLeaf] [bit] NOT NULL,
	[whCandidate] [bit] NOT NULL,
	[inventoryTotal] [decimal](18, 5) NOT NULL,
	[saleRate] [decimal](18, 5) NOT NULL,
 CONSTRAINT [PK_Symphony_SalesRateTempFamily] PRIMARY KEY CLUSTERED 
(
	[stockLocationID] ASC,
	[familyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_SalesRateTempSku]    Script Date: 4/18/2024 3:51:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_SalesRateTempSku](
	[stockLocationID] [int] NOT NULL,
	[skuID] [int] NOT NULL,
	[consumption] [decimal](18, 5) NOT NULL,
	[validDays] [decimal](18, 5) NOT NULL,
	[isLeaf] [bit] NOT NULL,
	[whCandidate] [bit] NOT NULL,
	[inventoryTotal] [decimal](18, 5) NOT NULL,
	[saleRate] [decimal](18, 5) NOT NULL,
 CONSTRAINT [PK_Symphony_SalesRateTempSku] PRIMARY KEY CLUSTERED 
(
	[stockLocationID] ASC,
	[skuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_SBPPareto]    Script Date: 4/18/2024 3:51:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_SBPPareto](
	[reasonDate] [smalldatetime] NULL,
	[reason] [nvarchar](100) NOT NULL,
	[woid] [nvarchar](50) NULL,
	[componentID] [nvarchar](50) NULL,
	[plantID] [int] NULL,
	[skuID] [int] NULL,
	[workCenter] [nvarchar](50) NULL,
	[clientName] [nvarchar](100) NOT NULL,
	[clientDescription] [nvarchar](1000) NULL,
	[woPropertyID1] [int] NULL,
	[woPropertyID2] [int] NULL,
	[woPropertyID3] [int] NULL,
	[woPropertyID4] [int] NULL,
	[woPropertyID5] [int] NULL,
	[woPropertyID6] [int] NULL,
	[woPropertyID7] [int] NULL,
	[woPropertyID8] [int] NULL,
	[woPropertyID9] [int] NULL,
	[woPropertyID10] [int] NULL,
	[woPropertyID11] [int] NULL,
	[woPropertyID12] [int] NULL,
	[woPropertyID13] [int] NULL,
	[woPropertyID14] [int] NULL,
	[woPropertyID15] [int] NULL,
	[woPropertyID16] [int] NULL,
	[woPropertyID17] [int] NULL,
	[woPropertyID18] [int] NULL,
	[woPropertyID19] [int] NULL,
	[woPropertyID20] [int] NULL,
	[woCustom_num1] [decimal](18, 5) NULL,
	[woCustom_num2] [decimal](18, 5) NULL,
	[woCustom_num3] [decimal](18, 5) NULL,
	[woCustom_num4] [decimal](18, 5) NULL,
	[woCustom_num5] [decimal](18, 5) NULL,
	[woCustom_num6] [decimal](18, 5) NULL,
	[woCustom_num7] [decimal](18, 5) NULL,
	[woCustom_num8] [decimal](18, 5) NULL,
	[woCustom_num9] [decimal](18, 5) NULL,
	[woCustom_num10] [decimal](18, 5) NULL,
	[woCustom_txt1] [nvarchar](100) NULL,
	[woCustom_txt2] [nvarchar](100) NULL,
	[woCustom_txt3] [nvarchar](100) NULL,
	[woCustom_txt4] [nvarchar](100) NULL,
	[woCustom_txt5] [nvarchar](100) NULL,
	[woCustom_txt6] [nvarchar](100) NULL,
	[woCustom_txt7] [nvarchar](100) NULL,
	[woCustom_txt8] [nvarchar](100) NULL,
	[woCustom_txt9] [nvarchar](100) NULL,
	[woCustom_txt10] [nvarchar](100) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [indx_SBPPareto]    Script Date: 4/18/2024 3:51:48 PM ******/
CREATE CLUSTERED INDEX [indx_SBPPareto] ON [dbo].[Symphony_SBPPareto]
(
	[reason] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_SBPParetoTMP]    Script Date: 4/18/2024 3:51:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_SBPParetoTMP](
	[reasonDate] [smalldatetime] NULL,
	[reason] [nvarchar](100) NOT NULL,
	[woid] [nvarchar](50) NULL,
	[componentID] [nvarchar](50) NULL,
	[plantID] [int] NULL,
	[skuID] [int] NULL,
	[workCenter] [nvarchar](50) NULL,
	[clientName] [nvarchar](100) NOT NULL,
	[clientDescription] [nvarchar](1000) NULL,
	[woPropertyID1] [int] NULL,
	[woPropertyID2] [int] NULL,
	[woPropertyID3] [int] NULL,
	[woPropertyID4] [int] NULL,
	[woPropertyID5] [int] NULL,
	[woPropertyID6] [int] NULL,
	[woPropertyID7] [int] NULL,
	[woPropertyID8] [int] NULL,
	[woPropertyID9] [int] NULL,
	[woPropertyID10] [int] NULL,
	[woPropertyID11] [int] NULL,
	[woPropertyID12] [int] NULL,
	[woPropertyID13] [int] NULL,
	[woPropertyID14] [int] NULL,
	[woPropertyID15] [int] NULL,
	[woPropertyID16] [int] NULL,
	[woPropertyID17] [int] NULL,
	[woPropertyID18] [int] NULL,
	[woPropertyID19] [int] NULL,
	[woPropertyID20] [int] NULL,
	[woCustom_num1] [decimal](18, 5) NULL,
	[woCustom_num2] [decimal](18, 5) NULL,
	[woCustom_num3] [decimal](18, 5) NULL,
	[woCustom_num4] [decimal](18, 5) NULL,
	[woCustom_num5] [decimal](18, 5) NULL,
	[woCustom_num6] [decimal](18, 5) NULL,
	[woCustom_num7] [decimal](18, 5) NULL,
	[woCustom_num8] [decimal](18, 5) NULL,
	[woCustom_num9] [decimal](18, 5) NULL,
	[woCustom_num10] [decimal](18, 5) NULL,
	[woCustom_txt1] [nvarchar](100) NULL,
	[woCustom_txt2] [nvarchar](100) NULL,
	[woCustom_txt3] [nvarchar](100) NULL,
	[woCustom_txt4] [nvarchar](100) NULL,
	[woCustom_txt5] [nvarchar](100) NULL,
	[woCustom_txt6] [nvarchar](100) NULL,
	[woCustom_txt7] [nvarchar](100) NULL,
	[woCustom_txt8] [nvarchar](100) NULL,
	[woCustom_txt9] [nvarchar](100) NULL,
	[woCustom_txt10] [nvarchar](100) NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [indx_SBPParetoTMP]    Script Date: 4/18/2024 3:51:48 PM ******/
CREATE CLUSTERED INDEX [indx_SBPParetoTMP] ON [dbo].[Symphony_SBPParetoTMP]
(
	[reason] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_SBRopeViolations]    Script Date: 4/18/2024 3:51:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_SBRopeViolations](
	[reasonDate] [smalldatetime] NULL,
	[reason] [nvarchar](100) NULL,
	[woid] [nvarchar](50) NULL,
	[componentID] [nvarchar](100) NOT NULL,
	[isToOrder] [bit] NOT NULL,
	[plantID] [int] NULL,
	[skuID] [int] NULL,
	[workCenter] [nvarchar](50) NULL,
	[clientName] [nvarchar](100) NOT NULL,
	[clientDescription] [nvarchar](1000) NULL,
	[woPropertyID1] [int] NULL,
	[woPropertyID2] [int] NULL,
	[woPropertyID3] [int] NULL,
	[woPropertyID4] [int] NULL,
	[woPropertyID5] [int] NULL,
	[woPropertyID6] [int] NULL,
	[woPropertyID7] [int] NULL,
	[woPropertyID8] [int] NULL,
	[woPropertyID9] [int] NULL,
	[woPropertyID10] [int] NULL,
	[woPropertyID11] [int] NULL,
	[woPropertyID12] [int] NULL,
	[woPropertyID13] [int] NULL,
	[woPropertyID14] [int] NULL,
	[woPropertyID15] [int] NULL,
	[woPropertyID16] [int] NULL,
	[woPropertyID17] [int] NULL,
	[woPropertyID18] [int] NULL,
	[woPropertyID19] [int] NULL,
	[woPropertyID20] [int] NULL,
	[woCustom_num1] [decimal](18, 5) NULL,
	[woCustom_num2] [decimal](18, 5) NULL,
	[woCustom_num3] [decimal](18, 5) NULL,
	[woCustom_num4] [decimal](18, 5) NULL,
	[woCustom_num5] [decimal](18, 5) NULL,
	[woCustom_num6] [decimal](18, 5) NULL,
	[woCustom_num7] [decimal](18, 5) NULL,
	[woCustom_num8] [decimal](18, 5) NULL,
	[woCustom_num9] [decimal](18, 5) NULL,
	[woCustom_num10] [decimal](18, 5) NULL,
	[woCustom_txt1] [nvarchar](100) NULL,
	[woCustom_txt2] [nvarchar](100) NULL,
	[woCustom_txt3] [nvarchar](100) NULL,
	[woCustom_txt4] [nvarchar](100) NULL,
	[woCustom_txt5] [nvarchar](100) NULL,
	[woCustom_txt6] [nvarchar](100) NULL,
	[woCustom_txt7] [nvarchar](100) NULL,
	[woCustom_txt8] [nvarchar](100) NULL,
	[woCustom_txt9] [nvarchar](100) NULL,
	[woCustom_txt10] [nvarchar](100) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_SBRSalesOrderColorDistribution]    Script Date: 4/18/2024 3:51:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_SBRSalesOrderColorDistribution](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[filterID] [int] NOT NULL,
	[numberCyans] [int] NULL,
	[numberGreens] [int] NULL,
	[numberYellows] [int] NULL,
	[numberReds] [int] NULL,
	[numberBlacks] [int] NULL,
	[updateDate] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_SBsColorDistribution]    Script Date: 4/18/2024 3:51:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_SBsColorDistribution](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[filterID] [int] NOT NULL,
	[numberCyans] [int] NULL,
	[numberGreens] [int] NULL,
	[numberYellows] [int] NULL,
	[numberReds] [int] NULL,
	[numberBlacks] [int] NULL,
	[updateDate] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_SBsWONoBufferSlackColorDistribution]    Script Date: 4/18/2024 3:51:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_SBsWONoBufferSlackColorDistribution](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[filterID] [int] NOT NULL,
	[numberCyans] [int] NULL,
	[numberGreens] [int] NULL,
	[numberYellows] [int] NULL,
	[numberReds] [int] NULL,
	[numberBlacks] [int] NULL,
	[updateDate] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_SBTypes]    Script Date: 4/18/2024 3:51:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_SBTypes](
	[bufferName] [nvarchar](50) NOT NULL,
	[bufferSize] [int] NOT NULL,
 CONSTRAINT [PK_Symphony_SBTypes] PRIMARY KEY CLUSTERED 
(
	[bufferName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_Seasonality]    Script Date: 4/18/2024 3:51:48 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_Seasonality](
	[seasonalityID] [int] IDENTITY(1,1) NOT NULL,
	[parentID] [int] NULL,
	[priority] [decimal](9, 5) NULL,
	[eventGroup] [nvarchar](100) NULL,
	[eventType] [tinyint] NOT NULL,
	[eventState] [tinyint] NOT NULL,
	[name] [nvarchar](100) NULL,
	[itemID] [int] NULL,
	[stockLocationID] [int] NULL,
	[status] [int] NULL,
	[startDate] [smalldatetime] NULL,
	[endDate] [smalldatetime] NULL,
	[resizeMethod] [int] NULL,
	[resizeValue] [numeric](18, 2) NOT NULL,
	[stepResizeValue] [numeric](18, 2) NULL,
	[updateSteps] [int] NULL,
	[currentStep] [int] NULL,
	[recurrence] [int] NULL,
	[targetBuffer] [numeric](18, 2) NULL,
	[extraAmount] [numeric](18, 2) NULL,
	[originalBuffer] [numeric](18, 5) NULL,
	[isHandled] [bit] NOT NULL,
	[nextChangeDate] [smalldatetime] NULL,
	[DataFilterDisplayString] [nvarchar](max) NULL,
	[DataFilterSerialized] [varbinary](max) NULL,
	[autoAccept] [bit] NOT NULL,
 CONSTRAINT [PK_Symphony_Seasonality] PRIMARY KEY CLUSTERED 
(
	[seasonalityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_SeasonalityEventsTmp]    Script Date: 4/18/2024 3:51:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_SeasonalityEventsTmp](
	[seasonalityID] [int] IDENTITY(1,1) NOT NULL,
	[parentID] [int] NULL,
	[priority] [decimal](9, 5) NULL,
	[eventGroup] [nvarchar](100) NULL,
	[eventType] [tinyint] NOT NULL,
	[eventState] [tinyint] NOT NULL,
	[name] [nvarchar](100) NULL,
	[itemID] [int] NULL,
	[stockLocationID] [int] NULL,
	[status] [int] NULL,
	[startDate] [smalldatetime] NULL,
	[endDate] [smalldatetime] NULL,
	[resizeMethod] [int] NULL,
	[resizeValue] [numeric](18, 2) NOT NULL,
	[stepResizeValue] [numeric](18, 2) NULL,
	[updateSteps] [int] NULL,
	[currentStep] [int] NULL,
	[recurrence] [int] NULL,
	[targetBuffer] [numeric](18, 2) NULL,
	[extraAmount] [numeric](18, 2) NULL,
	[originalBuffer] [numeric](18, 5) NULL,
	[isHandled] [bit] NOT NULL,
	[nextChangeDate] [smalldatetime] NULL,
	[DataFilterDisplayString] [nvarchar](max) NULL,
	[DataFilterSerialized] [varbinary](max) NULL,
	[autoAccept] [bit] NOT NULL,
 CONSTRAINT [PK_Symphony_SeasonalityEventsTmp] PRIMARY KEY CLUSTERED 
(
	[seasonalityID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_ShipmentPolicies]    Script Date: 4/18/2024 3:51:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_ShipmentPolicies](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[policyName] [nvarchar](50) NULL,
	[policyDescription] [nvarchar](50) NULL,
	[maxConstraint] [numeric](18, 5) NULL,
	[minConstraint] [numeric](18, 5) NULL,
	[multiplication] [numeric](18, 5) NULL,
	[lastBatch] [int] NULL,
	[customReplenishFrequency] [bit] NOT NULL,
	[useSunday] [bit] NOT NULL,
	[useMonday] [bit] NOT NULL,
	[useTuesday] [bit] NOT NULL,
	[useWednesday] [bit] NOT NULL,
	[useThursday] [bit] NOT NULL,
	[useFriday] [bit] NOT NULL,
	[useSaturday] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_SkuAgeTrackingDates]    Script Date: 4/18/2024 3:51:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_SkuAgeTrackingDates](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[skuID] [int] NOT NULL,
	[stockLocationID] [int] NOT NULL,
	[inDate] [smalldatetime] NOT NULL,
	[quantity] [decimal](18, 5) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_SkuFamiliesMonthlyConsumption]    Script Date: 4/18/2024 3:51:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_SkuFamiliesMonthlyConsumption](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[stockLocationID] [int] NOT NULL,
	[familyID] [int] NOT NULL,
	[updateDate] [smalldatetime] NOT NULL,
	[monthlyConsumption] [decimal](18, 5) NULL,
 CONSTRAINT [PK_Symphony_SkuFamiliesMonthlyConsumption] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [UK_Symphony_SkuFamiliesMonthlyConsumption] UNIQUE NONCLUSTERED 
(
	[stockLocationID] ASC,
	[familyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_SkuFamiliesValidationReducedRuleCandidates]    Script Date: 4/18/2024 3:51:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_SkuFamiliesValidationReducedRuleCandidates](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[skuID] [int] NULL,
	[familyID] [int] NULL,
	[familyMemberID] [int] NULL,
	[changeSourceID] [tinyint] NULL,
	[minimumInventory] [decimal](18, 5) NULL,
	[minimumPercentBufferSize] [decimal](18, 5) NULL,
 CONSTRAINT [PK_Symphony_SkuFamiliesValidationReducedRuleCandidates] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_SkuFamiliesValidationReducedRules]    Script Date: 4/18/2024 3:51:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_SkuFamiliesValidationReducedRules](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[skuID] [int] NOT NULL,
	[familyID] [int] NULL,
	[familyMemberID] [int] NULL,
	[minimumInventory] [decimal](18, 5) NOT NULL,
	[minimumPercentBufferSize] [decimal](18, 5) NOT NULL,
	[membersRulesNumber] [int] NULL,
 CONSTRAINT [PK_Symphony_SkuFamiliesValidationReducedRules] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_SkuFamiliesValidationRules]    Script Date: 4/18/2024 3:51:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_SkuFamiliesValidationRules](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[stockLocationID] [int] NULL,
	[displayGroupID] [int] NULL,
	[assortmentGroupID] [int] NULL,
	[familyID] [int] NULL,
	[familyMemberID] [int] NULL,
	[minimumInventory] [decimal](18, 5) NOT NULL,
	[minimumPercentBufferSize] [decimal](18, 5) NOT NULL,
	[minimumPreferredCount] [int] NOT NULL,
	[minimumMembersCount] [int] NOT NULL,
 CONSTRAINT [PK_Symphony_SkuFamiliesValidationRules] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_SkuFamilyMembers]    Script Date: 4/18/2024 3:51:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_SkuFamilyMembers](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[name] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Symphony_SkuFamilyMembers] PRIMARY KEY CLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [UK_Symphony_SkuFamilyMembers] UNIQUE NONCLUSTERED 
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_SkuGroups]    Script Date: 4/18/2024 3:51:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_SkuGroups](
	[skuGroupID] [int] IDENTITY(1,1) NOT NULL,
	[skuGroupName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Symphony_SkuGroups] PRIMARY KEY CLUSTERED 
(
	[skuGroupID] ASC,
	[skuGroupName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [UK_Symphony_SkuGroups] UNIQUE NONCLUSTERED 
(
	[skuGroupName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_SKUInventoryAtSiteGraphTemp]    Script Date: 4/18/2024 3:51:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_SKUInventoryAtSiteGraphTemp](
	[inventoryAtSite] [numeric](18, 5) NULL,
	[safetyStock] [numeric](18, 5) NULL,
	[worstInventoryAtSite] [numeric](18, 5) NULL,
	[consumption] [numeric](18, 5) NULL,
	[redLevel] [numeric](18, 5) NULL,
	[yellowLevel] [numeric](18, 5) NULL,
	[greenLevel] [numeric](18, 5) NULL,
	[updateDate] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_SkuLifeCycleEvents]    Script Date: 4/18/2024 3:51:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_SkuLifeCycleEvents](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[eventID] [nvarchar](50) NOT NULL,
	[startDate] [datetime] NOT NULL,
	[skuID] [int] NOT NULL,
	[stockLocationID] [int] NOT NULL,
	[bufferSize] [decimal](18, 0) NOT NULL,
	[eventStatus] [tinyint] NULL,
	[creationDate] [datetime] NOT NULL,
	[uomID] [int] NOT NULL,
 CONSTRAINT [PK_SSymphony_SkuLifeCycleEvents] PRIMARY KEY CLUSTERED 
(
	[eventID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_SkuProcurementData]    Script Date: 4/18/2024 3:51:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_SkuProcurementData](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[supplierID] [int] NOT NULL,
	[stockLocationID] [int] NOT NULL,
	[skuName] [nvarchar](100) NOT NULL,
	[supplierLeadTime] [int] NOT NULL,
	[timeProtection] [int] NOT NULL,
	[quantityProtection] [numeric](18, 5) NOT NULL,
	[minimumOrderQuantity] [numeric](18, 5) NOT NULL,
	[orderMultiplications] [numeric](18, 5) NOT NULL,
	[lastBatchReplenishment] [numeric](18, 5) NOT NULL,
	[additionalTimeTillArrival] [int] NOT NULL,
	[isDefaultSupplier] [bit] NOT NULL,
	[supplierSKUName] [nvarchar](100) NULL,
 CONSTRAINT [PK_Symphony_SkuProcurementData] PRIMARY KEY CLUSTERED 
(
	[supplierID] ASC,
	[stockLocationID] ASC,
	[skuName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [UK_Symphony_SkuProcurementData] UNIQUE NONCLUSTERED 
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_SkuRegionalSalesRanking]    Script Date: 4/18/2024 3:51:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_SkuRegionalSalesRanking](
	[skuID] [int] NOT NULL,
	[regionID] [int] NOT NULL,
	[rank] [decimal](18, 5) NOT NULL,
	[consumption] [decimal](18, 5) NOT NULL,
 CONSTRAINT [PK_Symphony_SkuRegionalSalesRanking] PRIMARY KEY CLUSTERED 
(
	[skuID] ASC,
	[regionID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_SkuSalesRanking]    Script Date: 4/18/2024 3:51:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_SkuSalesRanking](
	[skuID] [int] NOT NULL,
	[rank] [decimal](18, 5) NOT NULL,
	[consumption] [decimal](18, 5) NOT NULL,
 CONSTRAINT [PK_Symphony_SkuSalesRanking] PRIMARY KEY CLUSTERED 
(
	[skuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_SkusBom]    Script Date: 4/18/2024 3:51:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_SkusBom](
	[plantID] [int] NOT NULL,
	[masterSkuID] [int] NOT NULL,
	[skuID] [int] NOT NULL,
	[quantity] [decimal](18, 5) NOT NULL,
 CONSTRAINT [PK_Symphony_SkusBom] PRIMARY KEY CLUSTERED 
(
	[plantID] ASC,
	[masterSkuID] ASC,
	[skuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_SKUsProperty]    Script Date: 4/18/2024 3:51:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_SKUsProperty](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[skuPropertyID] [nvarchar](50) NOT NULL,
	[skuPropertyName] [nvarchar](100) NULL,
	[skuPropertyDescription] [nvarchar](1000) NULL,
	[propType] [tinyint] NOT NULL,
	[autoAddNewItem] [bit] NOT NULL,
 CONSTRAINT [PK_Symphony_SKUsProperty] PRIMARY KEY CLUSTERED 
(
	[skuPropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_slsKeys]    Script Date: 4/18/2024 3:51:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_slsKeys](
	[stockLocationID] [int] NOT NULL,
	[skuID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_SmallBuffersHistoryState]    Script Date: 4/18/2024 3:51:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_SmallBuffersHistoryState](
	[smallBufferSize] [decimal](18, 5) NULL,
	[hasHistory] [bit] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_StockLocationBPBlacks]    Script Date: 4/18/2024 3:51:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_StockLocationBPBlacks](
	[stockLocationID] [int] NULL,
	[skuID] [int] NULL,
	[reasonDate] [smalldatetime] NULL,
	[reason] [nvarchar](100) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [indx_StockLocationBPBlacks]    Script Date: 4/18/2024 3:51:49 PM ******/
CREATE CLUSTERED INDEX [indx_StockLocationBPBlacks] ON [dbo].[Symphony_StockLocationBPBlacks]
(
	[reason] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_StockLocationBPBlacksTemp]    Script Date: 4/18/2024 3:51:49 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_StockLocationBPBlacksTemp](
	[reason] [nvarchar](100) NULL,
	[countBlacks] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_StockLocationBPGraphTemp]    Script Date: 4/18/2024 3:51:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_StockLocationBPGraphTemp](
	[reason] [nvarchar](100) NULL,
	[reasonCount] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_StockLocationBPReds]    Script Date: 4/18/2024 3:51:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_StockLocationBPReds](
	[stockLocationID] [int] NULL,
	[skuID] [int] NULL,
	[reasonDate] [smalldatetime] NULL,
	[reason] [nvarchar](100) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [indx_StockLocationBPReds]    Script Date: 4/18/2024 3:51:50 PM ******/
CREATE CLUSTERED INDEX [indx_StockLocationBPReds] ON [dbo].[Symphony_StockLocationBPReds]
(
	[reason] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_StockLocationBPRedsTemp]    Script Date: 4/18/2024 3:51:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_StockLocationBPRedsTemp](
	[reason] [nvarchar](100) NULL,
	[countReds] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_StockLocationBPYellows]    Script Date: 4/18/2024 3:51:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_StockLocationBPYellows](
	[stockLocationID] [int] NULL,
	[skuID] [int] NULL,
	[reasonDate] [smalldatetime] NULL,
	[reason] [nvarchar](100) NOT NULL
) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [indx_StockLocationBPYellows]    Script Date: 4/18/2024 3:51:50 PM ******/
CREATE CLUSTERED INDEX [indx_StockLocationBPYellows] ON [dbo].[Symphony_StockLocationBPYellows]
(
	[reason] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_StockLocationProperty]    Script Date: 4/18/2024 3:51:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_StockLocationProperty](
	[id] [int] IDENTITY(1,1) NOT NULL,
	[slPropertyID] [nvarchar](50) NOT NULL,
	[slPropertyName] [nvarchar](100) NULL,
	[slPropertyDescription] [nvarchar](1000) NULL,
	[propType] [tinyint] NOT NULL,
	[autoAddNewItem] [bit] NOT NULL,
	[isResponsibleTooMuchRed] [bit] NOT NULL,
	[isResponsibleTooMuchGreen] [bit] NOT NULL,
	[isResponsibleReplanishment] [bit] NOT NULL,
 CONSTRAINT [PK_Symphony_StockLocationProperty] PRIMARY KEY CLUSTERED 
(
	[slPropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_StockLocationsAdjacent]    Script Date: 4/18/2024 3:51:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_StockLocationsAdjacent](
	[stockLocationID1] [int] NOT NULL,
	[stockLocationID2] [int] NOT NULL,
	[inD1toD2NotNeeded] [bit] NOT NULL,
	[inD2toD1NotNeeded] [bit] NOT NULL,
 CONSTRAINT [PK_Symphony_StockLocationsAdjacent] PRIMARY KEY CLUSTERED 
(
	[stockLocationID1] ASC,
	[stockLocationID2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_StockLocationSkusProductionData]    Script Date: 4/18/2024 3:51:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_StockLocationSkusProductionData](
	[stockLocationID] [int] NOT NULL,
	[skuID] [int] NOT NULL,
	[productionFamily] [int] NULL,
	[marketFamily] [int] NULL,
	[expectedYield] [decimal](18, 5) NOT NULL,
 CONSTRAINT [PK_Symphony_StockLocationSkusProductionData] PRIMARY KEY CLUSTERED 
(
	[stockLocationID] ASC,
	[skuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_StockLocationsReporting]    Script Date: 4/18/2024 3:51:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_StockLocationsReporting](
	[stockLocationID] [int] NOT NULL,
	[transactionInReportDate] [smalldatetime] NULL,
	[transactionOutReportDate] [smalldatetime] NULL,
 CONSTRAINT [PK_Symphony_StockLocationsReporting] PRIMARY KEY CLUSTERED 
(
	[stockLocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_TmpLocationFamilyConsumption]    Script Date: 4/18/2024 3:51:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_TmpLocationFamilyConsumption](
	[stockLocationID] [int] NOT NULL,
	[familyID] [int] NOT NULL,
	[consumption] [decimal](18, 5) NULL,
 CONSTRAINT [PK_Symphony_TmpLocationFamilyConsumption] PRIMARY KEY CLUSTERED 
(
	[stockLocationID] ASC,
	[familyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_TmpLocationFamilysku]    Script Date: 4/18/2024 3:51:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_TmpLocationFamilysku](
	[stockLocationID] [int] NULL,
	[familyID] [int] NULL,
	[skuID] [int] NULL,
	[validDayCount] [int] NULL,
	[updatedate] [smalldatetime] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_TMPLocationFamilyValidDayCount]    Script Date: 4/18/2024 3:51:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_TMPLocationFamilyValidDayCount](
	[stockLocationID] [int] NOT NULL,
	[familyID] [int] NOT NULL,
	[validDayCount] [int] NULL,
 CONSTRAINT [PK_Symphony_TMPLocationFamilyValidDayCount] PRIMARY KEY CLUSTERED 
(
	[stockLocationID] ASC,
	[familyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_tmpMtsKey]    Script Date: 4/18/2024 3:51:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_tmpMtsKey](
	[stockLocationID] [int] NOT NULL,
	[skuID] [int] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_Transactions]    Script Date: 4/18/2024 3:51:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_Transactions](
	[transactionIdentity] [int] IDENTITY(1,1) NOT NULL,
	[transactionID] [nvarchar](50) NOT NULL,
	[transactionType] [tinyint] NOT NULL,
	[sender] [int] NOT NULL,
	[receiver] [int] NOT NULL,
	[skuID] [int] NOT NULL,
	[originSKUID] [int] NOT NULL,
	[quantity] [numeric](18, 5) NOT NULL,
	[reportedDate] [smalldatetime] NOT NULL,
	[matchingTransactionID] [nvarchar](50) NULL,
	[sendFromMts] [bit] NOT NULL,
	[receiveToMts] [bit] NOT NULL,
	[wasHandled] [bit] NOT NULL,
	[clientOrderID] [nvarchar](50) NULL,
	[adjust] [bit] NULL,
	[sellingPrice] [numeric](18, 5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_TransparentLocations]    Script Date: 4/18/2024 3:51:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_TransparentLocations](
	[transparentLocationID] [int] NOT NULL,
	[destinationLocationID] [int] NOT NULL,
	[routeOrder] [int] NOT NULL,
 CONSTRAINT [PK_Symphony_TransparentLocations] PRIMARY KEY CLUSTERED 
(
	[transparentLocationID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_TVDPurchasingOrder]    Script Date: 4/18/2024 3:51:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_TVDPurchasingOrder](
	[stockLocationID] [int] NOT NULL,
	[skuID] [int] NOT NULL,
	[supplierID] [int] NOT NULL,
	[orderID] [nvarchar](100) NOT NULL,
	[orderPrice] [numeric](21, 5) NULL,
	[quantity] [numeric](18, 5) NULL,
	[updateDate] [smalldatetime] NULL,
	[bufferSize] [numeric](18, 5) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_TVDWorkOrders]    Script Date: 4/18/2024 3:51:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_TVDWorkOrders](
	[plantID] [int] NOT NULL,
	[woid] [nvarchar](50) NOT NULL,
	[skuID] [int] NOT NULL,
	[stockLocationName] [nvarchar](100) NULL,
	[stockLocationDesc] [nvarchar](1000) NULL,
	[updateDate] [smalldatetime] NOT NULL,
	[quantity] [numeric](18, 5) NULL,
	[pricePerOrder] [numeric](21, 5) NULL,
	[dueDate] [smalldatetime] NULL,
	[bufferSize] [numeric](18, 5) NULL,
	[sellingOrder] [nvarchar](50) NULL,
	[woDescription] [nvarchar](100) NULL,
	[woPropertyID1] [int] NULL,
	[woPropertyID2] [int] NULL,
	[woPropertyID3] [int] NULL,
	[woPropertyID4] [int] NULL,
	[woPropertyID5] [int] NULL,
	[woPropertyID6] [int] NULL,
	[woPropertyID7] [int] NULL,
	[woPropertyID8] [int] NULL,
	[woPropertyID9] [int] NULL,
	[woPropertyID10] [int] NULL,
	[woPropertyID11] [int] NULL,
	[woPropertyID12] [int] NULL,
	[woPropertyID13] [int] NULL,
	[woPropertyID14] [int] NULL,
	[woPropertyID15] [int] NULL,
	[woPropertyID16] [int] NULL,
	[woPropertyID17] [int] NULL,
	[woPropertyID18] [int] NULL,
	[woPropertyID19] [int] NULL,
	[woPropertyID20] [int] NULL,
 CONSTRAINT [PK_Symphony_TVDWorkOrders] PRIMARY KEY CLUSTERED 
(
	[plantID] ASC,
	[woid] ASC,
	[skuID] ASC,
	[updateDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_UOMConversions]    Script Date: 4/18/2024 3:51:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_UOMConversions](
	[uomID1] [int] NOT NULL,
	[uomID2] [int] NOT NULL,
	[fromNumerator] [numeric](18, 2) NULL,
	[toDenominator] [numeric](18, 2) NULL,
 CONSTRAINT [PK_Symphony_UOMConversions] PRIMARY KEY CLUSTERED 
(
	[uomID1] ASC,
	[uomID2] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_UserGroups]    Script Date: 4/18/2024 3:51:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_UserGroups](
	[userGroupsID] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[userPasswordID] [decimal](18, 0) NOT NULL,
	[groupID] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_Symphony_UserGroups] PRIMARY KEY CLUSTERED 
(
	[userGroupsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [UK_Symphony_UserPasswordGroup] UNIQUE NONCLUSTERED 
(
	[userPasswordID] ASC,
	[groupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_UserPassword]    Script Date: 4/18/2024 3:51:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_UserPassword](
	[userPasswordID] [decimal](18, 0) NOT NULL,
	[userPassword] [nvarchar](100) NOT NULL,
	[userDescription] [nvarchar](100) NULL,
	[userEmail] [nvarchar](320) NOT NULL,
	[isSymphony] [bit] NOT NULL,
	[moduleID] [int] NOT NULL,
 CONSTRAINT [PK_Symphony_UserPassword_ID] PRIMARY KEY CLUSTERED 
(
	[userPasswordID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [UK_Symphony_UserPassword] UNIQUE NONCLUSTERED 
(
	[userPassword] ASC,
	[moduleID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_UserReportGroups]    Script Date: 4/18/2024 3:51:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_UserReportGroups](
	[userReportGroupsID] [decimal](18, 0) IDENTITY(1,1) NOT NULL,
	[userPasswordID] [decimal](18, 0) NOT NULL,
	[reportGroupID] [decimal](18, 0) NOT NULL,
 CONSTRAINT [PK_Symphony_UserReportGroups] PRIMARY KEY CLUSTERED 
(
	[userReportGroupsID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [UK_Symphony_UserPasswordReportGroup] UNIQUE NONCLUSTERED 
(
	[userPasswordID] ASC,
	[reportGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_WeeklyDays]    Script Date: 4/18/2024 3:51:50 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_WeeklyDays](
	[year_number] [int] NOT NULL,
	[dayName] [nvarchar](50) NOT NULL,
	[isNonWorkingDay] [bit] NOT NULL,
	[plantID] [int] NOT NULL,
	[calenderID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_WorkOrders]    Script Date: 4/18/2024 3:51:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_WorkOrders](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[woid] [nvarchar](50) NOT NULL,
	[stockLocationName] [nvarchar](100) NOT NULL,
	[skuID] [int] NOT NULL,
	[plantID] [int] NOT NULL,
	[componentID] [nvarchar](100) NOT NULL,
	[isToOrder] [bit] NOT NULL,
	[quantity] [numeric](18, 5) NULL,
	[dueDate] [datetime] NULL,
	[materialReleaseScheduledDate] [smalldatetime] NULL,
	[materialReleaseActualDate] [smalldatetime] NULL,
	[bufferPenetration] [numeric](18, 5) NULL,
	[bufferColor] [tinyint] NULL,
	[bufferSize] [numeric](18, 5) NULL,
	[lastReason] [nvarchar](100) NULL,
	[lastReasonDate] [smalldatetime] NULL,
	[ropeViolation] [bit] NOT NULL,
	[virtualStockLevel] [numeric](18, 5) NULL,
	[isRopeViolationReasonNeeded] [bit] NOT NULL,
	[isFinished] [bit] NOT NULL,
	[workCenter] [nvarchar](50) NULL,
	[description] [nvarchar](100) NULL,
	[saleOrderID] [nvarchar](50) NULL,
	[sellingPrice] [numeric](21, 5) NULL,
	[woPropertyID1] [int] NULL,
	[woPropertyID2] [int] NULL,
	[woPropertyID3] [int] NULL,
	[woPropertyID4] [int] NULL,
	[woPropertyID5] [int] NULL,
	[woPropertyID6] [int] NULL,
	[woPropertyID7] [int] NULL,
	[woPropertyID8] [int] NULL,
	[woPropertyID9] [int] NULL,
	[woPropertyID10] [int] NULL,
	[woPropertyID11] [int] NULL,
	[woPropertyID12] [int] NULL,
	[woPropertyID13] [int] NULL,
	[woPropertyID14] [int] NULL,
	[woPropertyID15] [int] NULL,
	[woPropertyID16] [int] NULL,
	[woPropertyID17] [int] NULL,
	[woPropertyID18] [int] NULL,
	[woPropertyID19] [int] NULL,
	[woPropertyID20] [int] NULL,
	[woCustom_num1] [decimal](18, 5) NULL,
	[woCustom_num2] [decimal](18, 5) NULL,
	[woCustom_num3] [decimal](18, 5) NULL,
	[woCustom_num4] [decimal](18, 5) NULL,
	[woCustom_num5] [decimal](18, 5) NULL,
	[woCustom_num6] [decimal](18, 5) NULL,
	[woCustom_num7] [decimal](18, 5) NULL,
	[woCustom_num8] [decimal](18, 5) NULL,
	[woCustom_num9] [decimal](18, 5) NULL,
	[woCustom_num10] [decimal](18, 5) NULL,
	[woCustom_txt1] [nvarchar](100) NULL,
	[woCustom_txt2] [nvarchar](100) NULL,
	[woCustom_txt3] [nvarchar](100) NULL,
	[woCustom_txt4] [nvarchar](100) NULL,
	[woCustom_txt5] [nvarchar](100) NULL,
	[woCustom_txt6] [nvarchar](100) NULL,
	[woCustom_txt7] [nvarchar](100) NULL,
	[woCustom_txt8] [nvarchar](100) NULL,
	[woCustom_txt9] [nvarchar](100) NULL,
	[woCustom_txt10] [nvarchar](100) NULL,
	[newRedBlack] [bit] NOT NULL,
	[considered] [int] NOT NULL,
	[oldColor] [tinyint] NOT NULL,
	[prevColor] [tinyint] NOT NULL,
	[stockLocationDesc] [nvarchar](1000) NULL,
	[SkuDesc] [nvarchar](1000) NULL,
	[bufferSlack] [numeric](18, 5) NULL,
	[bufferColorWithoutSlack] [tinyint] NULL,
	[bufferPenetrationWithoutSlack] [numeric](18, 5) NULL,
	[orderType] [tinyint] NULL,
	[inputSuspicion] [bit] NOT NULL,
	[notes] [nvarchar](300) NULL,
	[isPhantom] [bit] NOT NULL,
	[phantomExpireDate] [smalldatetime] NULL,
	[lastRecalculation] [smalldatetime] NULL,
	[percentDone] [decimal](18, 5) NULL,
	[initialBufferPenetration] [decimal](18, 5) NULL,
	[initialBPAtCurrentWC] [decimal](18, 5) NULL,
	[productionFamily] [int] NULL,
	[throughput] [decimal](18, 5) NULL,
	[tvc] [decimal](18, 5) NULL,
	[uomID] [int] NULL,
	[clientOrderID] [nvarchar](50) NULL,
	[sequence] [decimal](18, 5) NULL,
	[toReleaseMtaCapacity] [bit] NOT NULL,
	[orderScale] [int] NULL,
 CONSTRAINT [PK_Symphony_WorkOrders] PRIMARY KEY CLUSTERED 
(
	[plantID] ASC,
	[woid] ASC,
	[componentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_workOrders4Projects]    Script Date: 4/18/2024 3:51:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_workOrders4Projects](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[plantID] [int] NOT NULL,
	[skuID] [int] NOT NULL,
	[skuDesc] [nvarchar](100) NULL,
	[quantity] [decimal](21, 5) NOT NULL,
	[dueDate] [smalldatetime] NULL,
	[prevDueDate] [smalldatetime] NULL,
	[projectID] [nvarchar](50) NOT NULL,
	[taskOrder] [int] NULL,
	[timeBuffer] [int] NULL,
	[woid] [nvarchar](50) NULL,
	[bufferPenetration] [numeric](18, 5) NULL,
	[bufferColor] [tinyint] NULL,
	[sentToReplenishment] [bit] NOT NULL,
	[releaseToFloor] [bit] NOT NULL,
	[dueDateChanged] [bit] NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_WorkOrdersDDP]    Script Date: 4/18/2024 3:51:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_WorkOrdersDDP](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[woid] [nvarchar](50) NOT NULL,
	[skuID] [int] NOT NULL,
	[plantID] [int] NOT NULL,
	[isToOrder] [bit] NOT NULL,
	[quantity] [numeric](18, 5) NULL,
	[dueDate] [smalldatetime] NULL,
	[finishDate] [smalldatetime] NULL,
	[materialReleaseActualDate] [smalldatetime] NULL,
	[bufferPenetration] [numeric](18, 5) NULL,
	[bufferColor] [int] NULL,
	[bufferSize] [numeric](18, 5) NULL,
	[productionFamily] [int] NULL,
	[isFinished] [bit] NOT NULL,
	[orderType] [tinyint] NULL,
	[woPropertyID1] [int] NULL,
	[woPropertyID2] [int] NULL,
	[woPropertyID3] [int] NULL,
	[woPropertyID4] [int] NULL,
	[woPropertyID5] [int] NULL,
	[woPropertyID6] [int] NULL,
	[woPropertyID7] [int] NULL,
	[woPropertyID8] [int] NULL,
	[woPropertyID9] [int] NULL,
	[woPropertyID10] [int] NULL,
	[woPropertyID11] [int] NULL,
	[woPropertyID12] [int] NULL,
	[woPropertyID13] [int] NULL,
	[woPropertyID14] [int] NULL,
	[woPropertyID15] [int] NULL,
	[woPropertyID16] [int] NULL,
	[woPropertyID17] [int] NULL,
	[woPropertyID18] [int] NULL,
	[woPropertyID19] [int] NULL,
	[woPropertyID20] [int] NULL,
 CONSTRAINT [PK_Symphony_WorkOrdersDDP] PRIMARY KEY CLUSTERED 
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_WorkOrdersPrev]    Script Date: 4/18/2024 3:51:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_WorkOrdersPrev](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[woid] [nvarchar](50) NOT NULL,
	[stockLocationName] [nvarchar](100) NOT NULL,
	[skuID] [int] NOT NULL,
	[plantID] [int] NOT NULL,
	[componentID] [nvarchar](100) NOT NULL,
	[isToOrder] [bit] NOT NULL,
	[quantity] [numeric](18, 5) NULL,
	[dueDate] [datetime] NULL,
	[materialReleaseScheduledDate] [smalldatetime] NULL,
	[materialReleaseActualDate] [smalldatetime] NULL,
	[bufferPenetration] [numeric](18, 5) NULL,
	[bufferColor] [tinyint] NULL,
	[bufferSize] [numeric](18, 5) NULL,
	[lastReason] [nvarchar](100) NULL,
	[lastReasonDate] [smalldatetime] NULL,
	[ropeViolation] [bit] NOT NULL,
	[virtualStockLevel] [numeric](18, 5) NULL,
	[isRopeViolationReasonNeeded] [bit] NOT NULL,
	[isFinished] [bit] NOT NULL,
	[workCenter] [nvarchar](50) NULL,
	[description] [nvarchar](100) NULL,
	[saleOrderID] [nvarchar](50) NULL,
	[sellingPrice] [numeric](21, 5) NULL,
	[woPropertyID1] [int] NULL,
	[woPropertyID2] [int] NULL,
	[woPropertyID3] [int] NULL,
	[woPropertyID4] [int] NULL,
	[woPropertyID5] [int] NULL,
	[woPropertyID6] [int] NULL,
	[woPropertyID7] [int] NULL,
	[woPropertyID8] [int] NULL,
	[woPropertyID9] [int] NULL,
	[woPropertyID10] [int] NULL,
	[woPropertyID11] [int] NULL,
	[woPropertyID12] [int] NULL,
	[woPropertyID13] [int] NULL,
	[woPropertyID14] [int] NULL,
	[woPropertyID15] [int] NULL,
	[woPropertyID16] [int] NULL,
	[woPropertyID17] [int] NULL,
	[woPropertyID18] [int] NULL,
	[woPropertyID19] [int] NULL,
	[woPropertyID20] [int] NULL,
	[woCustom_num1] [decimal](18, 5) NULL,
	[woCustom_num2] [decimal](18, 5) NULL,
	[woCustom_num3] [decimal](18, 5) NULL,
	[woCustom_num4] [decimal](18, 5) NULL,
	[woCustom_num5] [decimal](18, 5) NULL,
	[woCustom_num6] [decimal](18, 5) NULL,
	[woCustom_num7] [decimal](18, 5) NULL,
	[woCustom_num8] [decimal](18, 5) NULL,
	[woCustom_num9] [decimal](18, 5) NULL,
	[woCustom_num10] [decimal](18, 5) NULL,
	[woCustom_txt1] [nvarchar](100) NULL,
	[woCustom_txt2] [nvarchar](100) NULL,
	[woCustom_txt3] [nvarchar](100) NULL,
	[woCustom_txt4] [nvarchar](100) NULL,
	[woCustom_txt5] [nvarchar](100) NULL,
	[woCustom_txt6] [nvarchar](100) NULL,
	[woCustom_txt7] [nvarchar](100) NULL,
	[woCustom_txt8] [nvarchar](100) NULL,
	[woCustom_txt9] [nvarchar](100) NULL,
	[woCustom_txt10] [nvarchar](100) NULL,
	[newRedBlack] [bit] NOT NULL,
	[considered] [int] NOT NULL,
	[oldColor] [tinyint] NOT NULL,
	[prevColor] [tinyint] NOT NULL,
	[stockLocationDesc] [nvarchar](1000) NULL,
	[SkuDesc] [nvarchar](1000) NULL,
	[bufferSlack] [numeric](18, 5) NULL,
	[bufferColorWithoutSlack] [tinyint] NULL,
	[bufferPenetrationWithoutSlack] [numeric](18, 5) NULL,
	[orderType] [tinyint] NULL,
	[inputSuspicion] [bit] NOT NULL,
	[notes] [nvarchar](300) NULL,
	[isPhantom] [bit] NOT NULL,
	[phantomExpireDate] [smalldatetime] NULL,
	[lastRecalculation] [smalldatetime] NULL,
	[percentDone] [decimal](18, 5) NULL,
	[initialBufferPenetration] [decimal](18, 5) NULL,
	[initialBPAtCurrentWC] [decimal](18, 5) NULL,
	[productionFamily] [int] NULL,
	[throughput] [decimal](18, 5) NULL,
	[tvc] [decimal](18, 5) NULL,
	[uomID] [int] NULL,
	[clientOrderID] [nvarchar](50) NULL,
	[sequence] [decimal](18, 5) NULL,
	[toReleaseMtaCapacity] [bit] NOT NULL,
	[orderScale] [int] NULL,
 CONSTRAINT [PK_Symphony_WorkOrdersPrev] PRIMARY KEY CLUSTERED 
(
	[plantID] ASC,
	[woid] ASC,
	[componentID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_WorkOrdersProperty]    Script Date: 4/18/2024 3:51:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_WorkOrdersProperty](
	[ID] [int] IDENTITY(1,1) NOT NULL,
	[woPropertyID] [nvarchar](50) NOT NULL,
	[woPropertyName] [nvarchar](100) NULL,
	[woPropertyDescription] [nvarchar](1000) NULL,
	[propType] [tinyint] NOT NULL,
	[autoAddNewItem] [bit] NOT NULL,
 CONSTRAINT [PK_Symphony_WorkOrdersProperty] PRIMARY KEY CLUSTERED 
(
	[woPropertyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[Symphony_WorkOrdersPropertyItems]    Script Date: 4/18/2024 3:51:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[Symphony_WorkOrdersPropertyItems](
	[woItemID] [int] IDENTITY(1,1) NOT NULL,
	[woPropertyID] [nvarchar](50) NOT NULL,
	[woItemName] [nvarchar](100) NOT NULL,
 CONSTRAINT [PK_Symphony_WorkOrdersPropertyItems] PRIMARY KEY CLUSTERED 
(
	[woPropertyID] ASC,
	[woItemName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY],
 CONSTRAINT [UK_Symphony_WorkOrdersPropertyItems] UNIQUE NONCLUSTERED 
(
	[woItemID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, IGNORE_DUP_KEY = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_cluster_master]    Script Date: 4/18/2024 3:51:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_cluster_master](
	[cm_id] [int] IDENTITY(101,1) NOT NULL,
	[cm_dist_name] [nvarchar](200) NULL,
	[cm_ret_name] [nvarchar](200) NULL,
	[cm_cl_code] [nvarchar](10) NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_DiskAndLicDetail]    Script Date: 4/18/2024 3:51:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_DiskAndLicDetail](
	[ItemName] [nvarchar](max) NULL,
	[ItemValue] [nvarchar](500) NULL,
	[Type] [nvarchar](100) NULL,
	[UpdateDate] [date] NULL,
	[ItemCalValue] [nvarchar](500) NULL
) ON [PRIMARY] TEXTIMAGE_ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_rpt_dist_buff_stk_eff]    Script Date: 4/18/2024 3:51:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_rpt_dist_buff_stk_eff](
	[r2_id] [int] IDENTITY(1,1) NOT NULL,
	[r2_dist_code] [nvarchar](50) NULL,
	[r2_distname] [nvarchar](100) NULL,
	[r2_distregn] [nvarchar](100) NULL,
	[r2_city] [nvarchar](100) NULL,
	[r2_sku_buff] [float] NULL,
	[r2_sku_buff_stk1] [float] NULL,
	[r2_bfrsku_sold_dist] [float] NULL,
	[r2_buff_eff_perc_sku_sold_vs_buff_sku] [float] NULL,
	[r2_buff_eff_perc_sku_sold_vs_buff_sku_1] [float] NULL,
	[r2_nosku_mapped_sold] [float] NULL,
	[r2_nosku_mapped_hav_stk1] [float] NULL,
	[r2_Stk_eff_perc_sku_sold_vs_stk_sku] [float] NULL,
	[r2_sales_person] [nvarchar](100) NULL,
	[ind01] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_rpt_dist_intrans_excp]    Script Date: 4/18/2024 3:51:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_rpt_dist_intrans_excp](
	[r2_id] [int] IDENTITY(1,1) NOT NULL,
	[r2_dist_code] [nvarchar](50) NULL,
	[r2_distname] [nvarchar](100) NULL,
	[r2_distregn] [nvarchar](100) NULL,
	[r2_city] [nvarchar](100) NULL,
	[r2_sl_id] [int] NULL,
	[r2_trans_date] [datetime] NULL,
	[r2_inv_date] [datetime] NULL,
	[r2_intrans_days] [int] NULL,
	[r2_deal_sku] [nvarchar](50) NULL,
	[r2_hrj_sku] [nvarchar](50) NULL,
	[r2_qty] [float] NULL,
	[r2_sales_person] [nvarchar](100) NULL,
	[ind01] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_rpt_dist_nil_trans_exp]    Script Date: 4/18/2024 3:51:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_rpt_dist_nil_trans_exp](
	[r2_id] [int] IDENTITY(1,1) NOT NULL,
	[r2_dist_code] [nvarchar](50) NULL,
	[r2_distname] [nvarchar](100) NULL,
	[r2_distregn] [nvarchar](100) NULL,
	[r2_city] [nvarchar](100) NULL,
	[r2_sl_id] [int] NULL,
	[r2_lastrec_date] [datetime] NULL,
	[r2_no_of_days_lasttrans] [int] NULL,
	[r2_sales_person] [nvarchar](100) NULL,
	[ind01] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_rpt_dist_nonmta_excp]    Script Date: 4/18/2024 3:51:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_rpt_dist_nonmta_excp](
	[r2_id] [int] IDENTITY(1,1) NOT NULL,
	[r2_dist_code] [nvarchar](50) NULL,
	[r2_distname] [nvarchar](100) NULL,
	[r2_distregn] [nvarchar](100) NULL,
	[r2_city] [nvarchar](100) NULL,
	[r2_sl_id] [int] NULL,
	[r2_trans_date] [datetime] NULL,
	[r2_deal_sku] [nvarchar](50) NULL,
	[r2_hrj_sku] [nvarchar](50) NULL,
	[r2_sales_person] [nvarchar](100) NULL,
	[ind01] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_rpt_dist_unmapped_excp]    Script Date: 4/18/2024 3:51:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_rpt_dist_unmapped_excp](
	[r2_id] [int] IDENTITY(1,1) NOT NULL,
	[r2_dist_code] [nvarchar](50) NULL,
	[r2_distname] [nvarchar](100) NULL,
	[r2_distregn] [nvarchar](100) NULL,
	[r2_city] [nvarchar](100) NULL,
	[r2_sl_id] [int] NULL,
	[r2_trans_date] [datetime] NULL,
	[r2_deal_sku] [nvarchar](50) NULL,
	[r2_hrj_sku] [nvarchar](50) NULL,
	[r2_sales_person] [nvarchar](100) NULL,
	[ind01] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_SA_output]    Script Date: 4/18/2024 3:51:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_SA_output](
	[sno] [int] IDENTITY(1,1) NOT NULL,
	[skuid] [nvarchar](50) NULL,
	[slid] [nvarchar](50) NULL,
	[sl_priority] [int] NULL,
	[salrate_priority] [int] NULL,
	[tot_req_qty] [float] NULL,
	[buffersize] [float] NULL,
	[batch_size] [float] NULL,
	[tot_alloc_qty] [float] NULL,
	[exp_35] [float] NULL,
	[alloc_35] [float] NULL,
	[exp_50] [float] NULL,
	[alloc_50] [float] NULL,
	[exp_75] [float] NULL,
	[alloc_75] [float] NULL,
	[exp_100] [float] NULL,
	[alloc_100] [float] NULL,
	[ind01] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_SA_stkat_altorigin]    Script Date: 4/18/2024 3:51:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_SA_stkat_altorigin](
	[sno] [int] IDENTITY(1,1) NOT NULL,
	[skuid] [nvarchar](50) NULL,
	[slid] [nvarchar](50) NULL,
	[stock_at_site] [float] NULL,
	[balc_stk] [float] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[tb_SA_stockreq]    Script Date: 4/18/2024 3:51:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[tb_SA_stockreq](
	[skuid] [nvarchar](50) NULL,
	[slid] [nvarchar](50) NULL,
	[sl_priority] [int] NULL,
	[salrate_priority] [int] NULL,
	[inv_needed] [float] NULL,
	[buffersize] [float] NULL,
	[batch_size] [float] NULL,
	[alt_src_origin] [int] NULL,
	[ind01] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[temp_delete]    Script Date: 4/18/2024 3:51:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[temp_delete](
	[stockLocationID] [int] NULL,
	[skuID] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[TMP_StockLocationSkuHistory_46453252bf154ba79cdd692dd514d571]    Script Date: 4/18/2024 3:51:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[TMP_StockLocationSkuHistory_46453252bf154ba79cdd692dd514d571](
	[stockLocationID] [int] NOT NULL,
	[skuID] [int] NOT NULL,
	[updateDate] [smalldatetime] NOT NULL,
	[inventoryAtSite] [numeric](18, 5) NULL,
	[inventoryAtTransit] [numeric](18, 5) NULL,
	[totalIn] [numeric](18, 5) NOT NULL,
	[consumption] [numeric](18, 5) NULL,
	[irrInvAtSite] [numeric](18, 5) NULL,
	[irrInvAtTransit] [numeric](18, 5) NULL,
	[irrTotalIn] [numeric](18, 5) NOT NULL,
	[returned] [numeric](18, 5) NOT NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[To_be_allocated]    Script Date: 4/18/2024 3:51:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[To_be_allocated](
	[SL] [nvarchar](40) NULL,
	[SKU] [nvarchar](40) NULL,
	[Req_Qty] [int] NULL,
	[Origin] [nvarchar](40) NULL,
	[Checked] [int] NULL,
	[Allocated] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Table [dbo].[WHSE_Stock_Checked]    Script Date: 4/18/2024 3:51:51 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE TABLE [dbo].[WHSE_Stock_Checked](
	[Whse] [nvarchar](40) NULL,
	[SKU] [nvarchar](40) NULL,
	[Qty] [int] NULL,
	[Allocated] [int] NULL,
	[Checked] [int] NULL
) ON [PRIMARY]
GO
/****** Object:  Index [IND_Symphony_AssortmentReplenishmentRecommendations_1]    Script Date: 4/18/2024 3:51:52 PM ******/
CREATE NONCLUSTERED INDEX [IND_Symphony_AssortmentReplenishmentRecommendations_1] ON [dbo].[Symphony_AssortmentReplenishmentRecommendations]
(
	[locationCatalogID] ASC,
	[showInReport] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [IDX_Aux_SLSkusToReplenishment]    Script Date: 4/18/2024 3:51:52 PM ******/
CREATE NONCLUSTERED INDEX [IDX_Aux_SLSkusToReplenishment] ON [dbo].[Symphony_Aux_SLSkusToReplenishment]
(
	[stockLocationID] ASC,
	[skuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [IND_Symphony_DBMAttentions_Date]    Script Date: 4/18/2024 3:51:52 PM ******/
CREATE NONCLUSTERED INDEX [IND_Symphony_DBMAttentions_Date] ON [dbo].[Symphony_DBMAttentions]
(
	[updateDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_Symphony_DBMChangePolicies_Name]    Script Date: 4/18/2024 3:51:52 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_Symphony_DBMChangePolicies_Name] ON [dbo].[Symphony_DBMChangePolicies]
(
	[name] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [IND_Symphony_DBMExpiredHistory_Date]    Script Date: 4/18/2024 3:51:52 PM ******/
CREATE NONCLUSTERED INDEX [IND_Symphony_DBMExpiredHistory_Date] ON [dbo].[Symphony_DBMExpiredHistory]
(
	[updateDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [DplmActionIndex]    Script Date: 4/18/2024 3:51:52 PM ******/
CREATE NONCLUSTERED INDEX [DplmActionIndex] ON [dbo].[Symphony_DPLM_Actions]
(
	[stockLocationID] ASC,
	[familyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [DplmActionHistoryIndex]    Script Date: 4/18/2024 3:51:52 PM ******/
CREATE NONCLUSTERED INDEX [DplmActionHistoryIndex] ON [dbo].[Symphony_DPLM_ActionsHistory]
(
	[stockLocationID] ASC,
	[familyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [CalculatedIndex]    Script Date: 4/18/2024 3:51:52 PM ******/
CREATE NONCLUSTERED INDEX [CalculatedIndex] ON [dbo].[Symphony_DPLM_WorkingCalculatedParameters_Table]
(
	[stockLocationID] ASC,
	[familyID] ASC,
	[policyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [IDX_Symphony_EndOfLifeRecommmendations]    Script Date: 4/18/2024 3:51:52 PM ******/
CREATE NONCLUSTERED INDEX [IDX_Symphony_EndOfLifeRecommmendations] ON [dbo].[Symphony_EndOfLifeRecommmendations]
(
	[status] ASC,
	[creationDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_Symphony_InputNewSkuReportedDate]    Script Date: 4/18/2024 3:51:52 PM ******/
CREATE NONCLUSTERED INDEX [IDX_Symphony_InputNewSkuReportedDate] ON [dbo].[Symphony_InputNewSku]
(
	[reportedDate] ASC
)
INCLUDE ( 	[stockLocationID],
	[skuID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [IDX_Symphony_ISTRecommendations]    Script Date: 4/18/2024 3:51:52 PM ******/
CREATE NONCLUSTERED INDEX [IDX_Symphony_ISTRecommendations] ON [dbo].[Symphony_ISTRecommendations]
(
	[stockLocationID] ASC,
	[skuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [IND_Symphony_LocationCatalogSkus_1]    Script Date: 4/18/2024 3:51:52 PM ******/
CREATE NONCLUSTERED INDEX [IND_Symphony_LocationCatalogSkus_1] ON [dbo].[Symphony_LocationCatalogSkus]
(
	[id] ASC,
	[stockLocationID] ASC,
	[skuID] ASC,
	[replenishmentTypeID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [I_Symphony_LocationFamilyAttributes]    Script Date: 4/18/2024 3:51:52 PM ******/
CREATE NONCLUSTERED INDEX [I_Symphony_LocationFamilyAttributes] ON [dbo].[Symphony_LocationFamilyAttributes]
(
	[familyID] ASC,
	[stockLocationID] ASC
)
INCLUDE ( 	[originStockLocationID],
	[npiSetID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [IDX_MasterSkus_familyID]    Script Date: 4/18/2024 3:51:52 PM ******/
CREATE NONCLUSTERED INDEX [IDX_MasterSkus_familyID] ON [dbo].[Symphony_MasterSkus]
(
	[familyID] ASC
)
INCLUDE ( 	[skuID],
	[familyMemberID]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [IDX_Symphony_MTO_NC]    Script Date: 4/18/2024 3:51:52 PM ******/
CREATE NONCLUSTERED INDEX [IDX_Symphony_MTO_NC] ON [dbo].[Symphony_MTOSkus]
(
	[skuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [UK_Symphony_MTOSkus]    Script Date: 4/18/2024 3:51:52 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [UK_Symphony_MTOSkus] ON [dbo].[Symphony_MTOSkus]
(
	[stockLocationID] ASC,
	[locationSkuName] ASC
)
WHERE ([isDeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [IND_Symphony_MTOSkusHistory_Date]    Script Date: 4/18/2024 3:51:52 PM ******/
CREATE NONCLUSTERED INDEX [IND_Symphony_MTOSkusHistory_Date] ON [dbo].[Symphony_MTOSkusHistory]
(
	[updateDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [IX_Symphony_ProductionManufacturingSkus]    Script Date: 4/18/2024 3:51:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_Symphony_ProductionManufacturingSkus] ON [dbo].[Symphony_ProductionManufacturingSkus]
(
	[taskID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [IDX_Symphony_ProductionQuotesID]    Script Date: 4/18/2024 3:51:52 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_Symphony_ProductionQuotesID] ON [dbo].[Symphony_ProductionQuotes]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [indx_Projects_Name]    Script Date: 4/18/2024 3:51:52 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [indx_Projects_Name] ON [dbo].[Symphony_Projects]
(
	[projectName] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [IDX_Symphony_PurchasingOrder_ID]    Script Date: 4/18/2024 3:51:52 PM ******/
CREATE NONCLUSTERED INDEX [IDX_Symphony_PurchasingOrder_ID] ON [dbo].[Symphony_PurchasingOrder]
(
	[ID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [idx_Symphony_PurchasingRecommendation]    Script Date: 4/18/2024 3:51:52 PM ******/
CREATE NONCLUSTERED INDEX [idx_Symphony_PurchasingRecommendation] ON [dbo].[Symphony_PurchasingRecommendation]
(
	[orderType] ASC
)
INCLUDE ( 	[stockLocationID],
	[skuID],
	[inventoryNeeded]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [IX_Symphony_RecommendationsHistory_Date]    Script Date: 4/18/2024 3:51:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_Symphony_RecommendationsHistory_Date] ON [dbo].[Symphony_RecommendationsHistory]
(
	[createDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [I_Symphony_RetailAllocationRequest_Origin]    Script Date: 4/18/2024 3:51:52 PM ******/
CREATE NONCLUSTERED INDEX [I_Symphony_RetailAllocationRequest_Origin] ON [dbo].[Symphony_RetailAllocationRequest]
(
	[originID] ASC,
	[destinationID] ASC,
	[familyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [IDX_Symphony_RetailColorDistribution]    Script Date: 4/18/2024 3:51:52 PM ******/
CREATE NONCLUSTERED INDEX [IDX_Symphony_RetailColorDistribution] ON [dbo].[Symphony_RetailColorDistribution]
(
	[measureID] ASC,
	[measureType] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [IDX_RetailFamilyAg_assortmentGroupID]    Script Date: 4/18/2024 3:51:52 PM ******/
CREATE NONCLUSTERED INDEX [IDX_RetailFamilyAg_assortmentGroupID] ON [dbo].[Symphony_RetailFamilyAgConnection]
(
	[assortmentGroupID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [I_Symphony_RetailFamilySalesRanking_ familyID]    Script Date: 4/18/2024 3:51:52 PM ******/
CREATE NONCLUSTERED INDEX [I_Symphony_RetailFamilySalesRanking_ familyID] ON [dbo].[Symphony_RetailFamilySalesRanking]
(
	[familyID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [IDX_Symphony_Seasonality_delete]    Script Date: 4/18/2024 3:51:52 PM ******/
CREATE NONCLUSTERED INDEX [IDX_Symphony_Seasonality_delete] ON [dbo].[Symphony_Seasonality]
(
	[parentID] ASC,
	[recurrence] ASC,
	[endDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [IDX_Symphony_Seasonality_Status]    Script Date: 4/18/2024 3:51:52 PM ******/
CREATE NONCLUSTERED INDEX [IDX_Symphony_Seasonality_Status] ON [dbo].[Symphony_Seasonality]
(
	[stockLocationID] ASC,
	[itemID] ASC,
	[status] ASC
)
INCLUDE ( 	[startDate],
	[endDate]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [IX_Symphony_SeasonalityEventsTmp_Priority]    Script Date: 4/18/2024 3:51:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_Symphony_SeasonalityEventsTmp_Priority] ON [dbo].[Symphony_SeasonalityEventsTmp]
(
	[priority] DESC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [IDX_ReduceRuleSkuID]    Script Date: 4/18/2024 3:51:52 PM ******/
CREATE NONCLUSTERED INDEX [IDX_ReduceRuleSkuID] ON [dbo].[Symphony_SkuFamiliesValidationReducedRules]
(
	[skuID] ASC
)
INCLUDE ( 	[familyMemberID],
	[minimumInventory],
	[minimumPercentBufferSize]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [IDX_Symphony_SkuFamiliesValidationRules]    Script Date: 4/18/2024 3:51:52 PM ******/
CREATE NONCLUSTERED INDEX [IDX_Symphony_SkuFamiliesValidationRules] ON [dbo].[Symphony_SkuFamiliesValidationRules]
(
	[stockLocationID] ASC
)
INCLUDE ( 	[displayGroupID],
	[assortmentGroupID],
	[familyID],
	[familyMemberID],
	[minimumInventory],
	[minimumPercentBufferSize],
	[minimumPreferredCount],
	[minimumMembersCount]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [IND_Symphony_StockLocationSkuHistory_Date]    Script Date: 4/18/2024 3:51:52 PM ******/
CREATE NONCLUSTERED INDEX [IND_Symphony_StockLocationSkuHistory_Date] ON [dbo].[Symphony_StockLocationSkuHistory]
(
	[updateDate] ASC
)
INCLUDE ( 	[stockLocationID],
	[skuID],
	[consumption],
	[inventoryAtSite]) WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = OFF, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [IDX_Symphony_StockLocationSkuEndOfLifePolicy]    Script Date: 4/18/2024 3:51:52 PM ******/
CREATE NONCLUSTERED INDEX [IDX_Symphony_StockLocationSkuEndOfLifePolicy] ON [dbo].[Symphony_StockLocationSkus]
(
	[endOfLifePolicy] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [IDX_Symphony_StockLocationSkus_ID]    Script Date: 4/18/2024 3:51:52 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IDX_Symphony_StockLocationSkus_ID] ON [dbo].[Symphony_StockLocationSkus]
(
	[id] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [IND_Symphony_StockLocationSkus_isDeleted]    Script Date: 4/18/2024 3:51:52 PM ******/
CREATE NONCLUSTERED INDEX [IND_Symphony_StockLocationSkus_isDeleted] ON [dbo].[Symphony_StockLocationSkus]
(
	[isDeleted] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IND_Unique_LocationSkuName]    Script Date: 4/18/2024 3:51:52 PM ******/
CREATE UNIQUE NONCLUSTERED INDEX [IND_Unique_LocationSkuName] ON [dbo].[Symphony_StockLocationSkus]
(
	[stockLocationID] ASC,
	[locationSkuName] ASC
)
WHERE ([isDeleted]=(0))
WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, IGNORE_DUP_KEY = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
/****** Object:  Index [IX_Symphony_StockLocationSkus]    Script Date: 4/18/2024 3:51:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_Symphony_StockLocationSkus] ON [dbo].[Symphony_StockLocationSkus]
(
	[stockLocationID] ASC,
	[skuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IX_Symphony_TVDWorkOrders]    Script Date: 4/18/2024 3:51:52 PM ******/
CREATE NONCLUSTERED INDEX [IX_Symphony_TVDWorkOrders] ON [dbo].[Symphony_TVDWorkOrders]
(
	[plantID] ASC,
	[woid] ASC,
	[skuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IND_Symphony_WorkOrders_SKU]    Script Date: 4/18/2024 3:51:52 PM ******/
CREATE NONCLUSTERED INDEX [IND_Symphony_WorkOrders_SKU] ON [dbo].[Symphony_WorkOrders]
(
	[stockLocationName] ASC,
	[skuID] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
SET ANSI_PADDING ON
GO
/****** Object:  Index [IDX_Symphony_WorkOrdersDDP_NC]    Script Date: 4/18/2024 3:51:52 PM ******/
CREATE NONCLUSTERED INDEX [IDX_Symphony_WorkOrdersDDP_NC] ON [dbo].[Symphony_WorkOrdersDDP]
(
	[woid] ASC,
	[plantID] ASC,
	[dueDate] ASC
)WITH (PAD_INDEX = OFF, STATISTICS_NORECOMPUTE = OFF, SORT_IN_TEMPDB = OFF, DROP_EXISTING = OFF, ONLINE = OFF, ALLOW_ROW_LOCKS = ON, ALLOW_PAGE_LOCKS = ON, FILLFACTOR = 90) ON [PRIMARY]
GO
ALTER TABLE [dbo].[Client_VendorEmailTable] ADD  DEFAULT ((0)) FOR [ind01]
GO
ALTER TABLE [dbo].[Symphony_AGsProperty] ADD  DEFAULT ((0)) FOR [propType]
GO
ALTER TABLE [dbo].[Symphony_AGsProperty] ADD  DEFAULT ((0)) FOR [autoAddNewItem]
GO
ALTER TABLE [dbo].[Symphony_AnnuallyDates] ADD  DEFAULT (getdate()) FOR [annually_date]
GO
ALTER TABLE [dbo].[Symphony_AnnuallyDates] ADD  DEFAULT ((-1)) FOR [plantID]
GO
ALTER TABLE [dbo].[Symphony_AnnuallyDates] ADD  DEFAULT ((-1)) FOR [calenderID]
GO
ALTER TABLE [dbo].[Symphony_AssortmentGroupHistory] ADD  DEFAULT ((0)) FOR [varietyGap]
GO
ALTER TABLE [dbo].[Symphony_AssortmentGroupSummaryData] ADD  DEFAULT ((0)) FOR [inventoryAtSite]
GO
ALTER TABLE [dbo].[Symphony_AssortmentGroupVarietyRecommendations] ADD  DEFAULT ((0)) FOR [inSeasonality]
GO
ALTER TABLE [dbo].[Symphony_AssortmentReplenishmentRecommendations] ADD  DEFAULT ((0)) FOR [hasChildren]
GO
ALTER TABLE [dbo].[Symphony_AssortmentReplenishmentRecommendations] ADD  DEFAULT ((0)) FOR [isConfirmed]
GO
ALTER TABLE [dbo].[Symphony_AssortmentReplenishmentRecommendations] ADD  DEFAULT ((1)) FOR [showInReport]
GO
ALTER TABLE [dbo].[Symphony_BufferSizeTraceability] ADD  DEFAULT ((0)) FOR [isAvoidedBufferChange]
GO
ALTER TABLE [dbo].[Symphony_CCRs] ADD  DEFAULT ((0)) FOR [reservedMTS]
GO
ALTER TABLE [dbo].[Symphony_CCRs] ADD  DEFAULT ((0)) FOR [reservedFast]
GO
ALTER TABLE [dbo].[Symphony_CCRs] ADD  DEFAULT ((0)) FOR [reservedSuperFast]
GO
ALTER TABLE [dbo].[Symphony_CCRs] ADD  DEFAULT ((0)) FOR [reservedStrategic]
GO
ALTER TABLE [dbo].[Symphony_CCRs] ADD  DEFAULT ((0)) FOR [workingHoursSunday]
GO
ALTER TABLE [dbo].[Symphony_CCRs] ADD  DEFAULT ((0)) FOR [workingHoursMonday]
GO
ALTER TABLE [dbo].[Symphony_CCRs] ADD  DEFAULT ((0)) FOR [workingHoursTuesday]
GO
ALTER TABLE [dbo].[Symphony_CCRs] ADD  DEFAULT ((0)) FOR [workingHoursWednesday]
GO
ALTER TABLE [dbo].[Symphony_CCRs] ADD  DEFAULT ((0)) FOR [workingHoursThursday]
GO
ALTER TABLE [dbo].[Symphony_CCRs] ADD  DEFAULT ((0)) FOR [workingHoursFriday]
GO
ALTER TABLE [dbo].[Symphony_CCRs] ADD  DEFAULT ((0)) FOR [workingHoursSaturday]
GO
ALTER TABLE [dbo].[Symphony_CCRs] ADD  DEFAULT ((1)) FOR [superFastLongHorizon]
GO
ALTER TABLE [dbo].[Symphony_CCRs] ADD  DEFAULT ((1)) FOR [fastLongHorizon]
GO
ALTER TABLE [dbo].[Symphony_CCRs] ADD  DEFAULT ((1)) FOR [standardLongHorizon]
GO
ALTER TABLE [dbo].[Symphony_CCRs] ADD  DEFAULT ((1)) FOR [mtsLongHorizon]
GO
ALTER TABLE [dbo].[Symphony_CCRs] ADD  DEFAULT ((1)) FOR [strategicLongHorizon]
GO
ALTER TABLE [dbo].[Symphony_ClientOrder] ADD  DEFAULT ((0)) FOR [currentOrderPosition]
GO
ALTER TABLE [dbo].[Symphony_ClientOrder] ADD  DEFAULT ((0)) FOR [isCurrentTransactionOut]
GO
ALTER TABLE [dbo].[Symphony_ClientOrder] ADD  DEFAULT ((0)) FOR [bufferPenetration]
GO
ALTER TABLE [dbo].[Symphony_ClientOrder] ADD  DEFAULT ((0)) FOR [bpColor]
GO
ALTER TABLE [dbo].[Symphony_ClientOrder] ADD  DEFAULT ((0)) FOR [waitingForDelivery]
GO
ALTER TABLE [dbo].[Symphony_ClientOrder] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[Symphony_ClientOrder] ADD  DEFAULT ((0)) FOR [sentToReplenishment]
GO
ALTER TABLE [dbo].[Symphony_ClientOrder] ADD  DEFAULT ((0)) FOR [toReplenish]
GO
ALTER TABLE [dbo].[Symphony_ClientOrder] ADD  DEFAULT ((0)) FOR [avoidReplenishment]
GO
ALTER TABLE [dbo].[Symphony_DailyDBMRecommendationReaction] ADD  DEFAULT ((0)) FOR [react]
GO
ALTER TABLE [dbo].[Symphony_DailyDBMRecommendationReaction] ADD  DEFAULT ((0)) FOR [disappear]
GO
ALTER TABLE [dbo].[Symphony_DataChanged] ADD  DEFAULT ((0)) FOR [type]
GO
ALTER TABLE [dbo].[Symphony_DBMAttentions] ADD  DEFAULT ((0)) FOR [recommendationType]
GO
ALTER TABLE [dbo].[Symphony_DBMAttentions] ADD  DEFAULT ((0)) FOR [oldBufferSize]
GO
ALTER TABLE [dbo].[Symphony_DBMAttentions] ADD  DEFAULT ((0)) FOR [bufferSizeAfterChange]
GO
ALTER TABLE [dbo].[Symphony_DBMChangePolicies] ADD  CONSTRAINT [DF_Symphony_DBMChangePolicies_increaseFactor]  DEFAULT ((0.33)) FOR [increaseFactor]
GO
ALTER TABLE [dbo].[Symphony_DBMChangePolicies] ADD  CONSTRAINT [DF_Symphony_DBMChangePolicies_increaseTrigger]  DEFAULT ((1)) FOR [increaseTrigger]
GO
ALTER TABLE [dbo].[Symphony_DBMChangePolicies] ADD  CONSTRAINT [DF_Symphony_DBMChangePolicies_decreaseFactor]  DEFAULT ((0.33)) FOR [decreaseFactor]
GO
ALTER TABLE [dbo].[Symphony_DBMChangePolicies] ADD  CONSTRAINT [DF_Symphony_DBMChangePolicies_decreaseTrigger]  DEFAULT ((5.00)) FOR [decreaseTrigger]
GO
ALTER TABLE [dbo].[Symphony_DBMChangePolicies] ADD  CONSTRAINT [DF_Symphony_DBMChangePolicies_redBPLevel]  DEFAULT ((0.67)) FOR [redBPLevel]
GO
ALTER TABLE [dbo].[Symphony_DBMChangePolicies] ADD  CONSTRAINT [DF_Symphony_DBMChangePolicies_greenBPLevel]  DEFAULT ((0.33)) FOR [greenBPLevel]
GO
ALTER TABLE [dbo].[Symphony_DBMChangePolicies] ADD  DEFAULT ((20)) FOR [inactiveThreshold]
GO
ALTER TABLE [dbo].[Symphony_DBMChangePolicies] ADD  DEFAULT ((0)) FOR [TMGStopConditionProduction]
GO
ALTER TABLE [dbo].[Symphony_DBMChangePolicies] ADD  DEFAULT ((1)) FOR [consumptionFrequency]
GO
ALTER TABLE [dbo].[Symphony_DBMChangePolicies] ADD  DEFAULT ((0)) FOR [enableAttentions]
GO
ALTER TABLE [dbo].[Symphony_DBMChangePolicies] ADD  CONSTRAINT [DF_Symphony_DBMChangePolicies_mode]  DEFAULT ((1)) FOR [mode]
GO
ALTER TABLE [dbo].[Symphony_DBMExpiredHistory] ADD  DEFAULT ((0)) FOR [recommendationType]
GO
ALTER TABLE [dbo].[Symphony_DBMExpiredHistory] ADD  DEFAULT ((0)) FOR [oldBufferSize]
GO
ALTER TABLE [dbo].[Symphony_DBMPerformanceHistory] ADD  DEFAULT ((0)) FOR [numberOpen]
GO
ALTER TABLE [dbo].[Symphony_DBMPerformanceHistory] ADD  DEFAULT ((0)) FOR [numberReact]
GO
ALTER TABLE [dbo].[Symphony_DBMPerformanceHistory] ADD  DEFAULT ((0)) FOR [numberNotAppliedChanged]
GO
ALTER TABLE [dbo].[Symphony_DBMPerformanceHistory] ADD  DEFAULT ((0)) FOR [numberNotAppliedTimePass]
GO
ALTER TABLE [dbo].[Symphony_DGsProperty] ADD  DEFAULT ((0)) FOR [propType]
GO
ALTER TABLE [dbo].[Symphony_DGsProperty] ADD  DEFAULT ((0)) FOR [autoAddNewItem]
GO
ALTER TABLE [dbo].[Symphony_DPLM_SLFamilyPolicyAssociation] ADD  CONSTRAINT [DF_Symphony_DPLM_SLFamilyPolicyAssociation_familyID]  DEFAULT ((-1)) FOR [familyID]
GO
ALTER TABLE [dbo].[Symphony_EndOfLifePolicies] ADD  DEFAULT ((30)) FOR [analysisPeriod]
GO
ALTER TABLE [dbo].[Symphony_EndOfLifePolicies] ADD  DEFAULT ((0)) FOR [quantityTrigger]
GO
ALTER TABLE [dbo].[Symphony_EndOfLifePolicies] ADD  DEFAULT ((1)) FOR [disableBuffer]
GO
ALTER TABLE [dbo].[Symphony_EndOfLifePolicies] ADD  DEFAULT ((1)) FOR [stopReplenishment]
GO
ALTER TABLE [dbo].[Symphony_EndOfLifePolicies] ADD  DEFAULT ((1)) FOR [applyToAllFamily]
GO
ALTER TABLE [dbo].[Symphony_ExpeditingFilter] ADD  DEFAULT ((1)) FOR [isBrowsable]
GO
ALTER TABLE [dbo].[Symphony_ExpeditingFilter] ADD  DEFAULT (CONVERT([smalldatetime],CONVERT([varchar],getdate(),(112)))) FOR [creationDate]
GO
ALTER TABLE [dbo].[Symphony_FamilyValidationResults] ADD  DEFAULT ((0)) FOR [isDead]
GO
ALTER TABLE [dbo].[Symphony_FileLoadingStatus] ADD  DEFAULT ((0)) FOR [isLoadFinishedSuccessfully]
GO
ALTER TABLE [dbo].[Symphony_FileLoadingStatus] ADD  DEFAULT ((0)) FOR [isLoadContaintedErrors]
GO
ALTER TABLE [dbo].[Symphony_FileStructure] ADD  DEFAULT ((1)) FOR [participate]
GO
ALTER TABLE [dbo].[Symphony_FileStructure] ADD  DEFAULT ((0)) FOR [isDummy]
GO
ALTER TABLE [dbo].[Symphony_FileStructure] ADD  DEFAULT ((0)) FOR [avoidWhenUpdate]
GO
ALTER TABLE [dbo].[Symphony_FileStructure] ADD  DEFAULT ((0)) FOR [isKeyForInsert]
GO
ALTER TABLE [dbo].[Symphony_FileStructure] ADD  DEFAULT ((0)) FOR [idType]
GO
ALTER TABLE [dbo].[Symphony_FileStructure] ADD  DEFAULT ((0)) FOR [idLicense]
GO
ALTER TABLE [dbo].[Symphony_FileStructure] ADD  DEFAULT ((0)) FOR [symFieldType]
GO
ALTER TABLE [dbo].[Symphony_FileStructure] ADD  DEFAULT ((1)) FOR [stopInputOnError]
GO
ALTER TABLE [dbo].[Symphony_FileStructureGlobal] ADD  DEFAULT ('') FOR [separator]
GO
ALTER TABLE [dbo].[Symphony_FileStructureGlobal] ADD  DEFAULT ((0)) FOR [disregardedFirstLine]
GO
ALTER TABLE [dbo].[Symphony_GridViews] ADD  DEFAULT ((0)) FOR [viewType]
GO
ALTER TABLE [dbo].[Symphony_GridViews] ADD  DEFAULT ((0)) FOR [isActive]
GO
ALTER TABLE [dbo].[Symphony_GridViews] ADD  DEFAULT (CONVERT([smalldatetime],CONVERT([varchar],getdate(),(112)))) FOR [createdDate]
GO
ALTER TABLE [dbo].[Symphony_GridViews] ADD  DEFAULT ((1)) FOR [assignToMe]
GO
ALTER TABLE [dbo].[Symphony_GridViews] ADD  DEFAULT ((0)) FOR [isPublic]
GO
ALTER TABLE [dbo].[Symphony_GridViews] ADD  DEFAULT ((0)) FOR [setAsOriginalView]
GO
ALTER TABLE [dbo].[Symphony_GridViews] ADD  DEFAULT ((0)) FOR [isWebView]
GO
ALTER TABLE [dbo].[Symphony_GridViewsAssign] ADD  DEFAULT ((0)) FOR [isActive]
GO
ALTER TABLE [dbo].[Symphony_GridViewsAssign] ADD  DEFAULT ((0)) FOR [assignToMe]
GO
ALTER TABLE [dbo].[Symphony_Groups] ADD  DEFAULT ((0)) FOR [isFixed]
GO
ALTER TABLE [dbo].[Symphony_Groups] ADD  DEFAULT ((2)) FOR [moduleID]
GO
ALTER TABLE [dbo].[Symphony_InputAttributesAGTargetsSet] ADD  DEFAULT ((0)) FOR [attributePriority]
GO
ALTER TABLE [dbo].[Symphony_InputAttributesAGTargetsSet] ADD  DEFAULT ((0)) FOR [distributionType]
GO
ALTER TABLE [dbo].[Symphony_InputLocationAssortmentGroups] ADD  DEFAULT ((0)) FOR [ignoreNrBuffers]
GO
ALTER TABLE [dbo].[Symphony_InputLocationAssortmentGroups] ADD  DEFAULT ((0)) FOR [allocationPriority]
GO
ALTER TABLE [dbo].[Symphony_InputLocationAssortmentGroups] ADD  DEFAULT ((0)) FOR [oddmentsRatio]
GO
ALTER TABLE [dbo].[Symphony_InputLocationAssortmentGroups] ADD  DEFAULT ((0)) FOR [enableDTM]
GO
ALTER TABLE [dbo].[Symphony_InputLocationAssortmentGroups] ADD  DEFAULT ((0)) FOR [DTMBenchmark]
GO
ALTER TABLE [dbo].[Symphony_InputLocationAssortmentGroups] ADD  DEFAULT ((1.33)) FOR [DTMIncreaseThreshold]
GO
ALTER TABLE [dbo].[Symphony_InputLocationAssortmentGroups] ADD  DEFAULT ((0.66)) FOR [DTMDecreaseThreshold]
GO
ALTER TABLE [dbo].[Symphony_InputLocationAssortmentGroups] ADD  DEFAULT ((0.8)) FOR [DTMDecileForIncrease]
GO
ALTER TABLE [dbo].[Symphony_InputLocationAssortmentGroups] ADD  DEFAULT ((0.7)) FOR [DTMDecileForDecrease]
GO
ALTER TABLE [dbo].[Symphony_InputLocationAssortmentGroups] ADD  DEFAULT ((0.2)) FOR [DTMIncreaseFactor]
GO
ALTER TABLE [dbo].[Symphony_InputLocationAssortmentGroups] ADD  DEFAULT ((0.2)) FOR [DTMDecreaseFactor]
GO
ALTER TABLE [dbo].[Symphony_InputNewSku] ADD  DEFAULT ((0)) FOR [irrInvAtSite]
GO
ALTER TABLE [dbo].[Symphony_InputNewSku] ADD  DEFAULT ((0)) FOR [irrInvAtTransit]
GO
ALTER TABLE [dbo].[Symphony_InputNewSku] ADD  DEFAULT ((0)) FOR [irrInvAtProduction]
GO
ALTER TABLE [dbo].[Symphony_InputNewStockLocation] ADD  DEFAULT ((0)) FOR [spaceManagement]
GO
ALTER TABLE [dbo].[Symphony_LocationAssortmentGroups] ADD  DEFAULT ((0)) FOR [validFamiliesNum]
GO
ALTER TABLE [dbo].[Symphony_LocationAssortmentGroups] ADD  DEFAULT ((0)) FOR [notValidFamiliesNum]
GO
ALTER TABLE [dbo].[Symphony_LocationAssortmentGroups] ADD  DEFAULT ((0)) FOR [notValidFamiliesOverThresholdNum]
GO
ALTER TABLE [dbo].[Symphony_LocationAssortmentGroups] ADD  DEFAULT ((0)) FOR [varietyGap]
GO
ALTER TABLE [dbo].[Symphony_LocationAssortmentGroups] ADD  DEFAULT ((0)) FOR [spaceGap]
GO
ALTER TABLE [dbo].[Symphony_LocationAssortmentGroups] ADD  DEFAULT ((0)) FOR [sentToReplenishNum]
GO
ALTER TABLE [dbo].[Symphony_LocationAssortmentGroups] ADD  DEFAULT ((0)) FOR [gapMode]
GO
ALTER TABLE [dbo].[Symphony_LocationAssortmentGroups] ADD  DEFAULT ((0)) FOR [spaceManaged]
GO
ALTER TABLE [dbo].[Symphony_LocationAssortmentGroups] ADD  DEFAULT ((1)) FOR [quantityPerFamily]
GO
ALTER TABLE [dbo].[Symphony_LocationAssortmentGroups] ADD  DEFAULT ((0)) FOR [considerVarietyGap]
GO
ALTER TABLE [dbo].[Symphony_LocationAssortmentGroups] ADD  DEFAULT ((1)) FOR [alignmentToInventory]
GO
ALTER TABLE [dbo].[Symphony_LocationAssortmentGroups] ADD  DEFAULT ((1)) FOR [allocateExistingGroups]
GO
ALTER TABLE [dbo].[Symphony_LocationAssortmentGroups] ADD  DEFAULT ((0)) FOR [maximumFamiliesPerGroup]
GO
ALTER TABLE [dbo].[Symphony_LocationAssortmentGroups] ADD  DEFAULT ((0)) FOR [totalSpace]
GO
ALTER TABLE [dbo].[Symphony_LocationAssortmentGroups] ADD  DEFAULT ((0)) FOR [ignoreNrBuffers]
GO
ALTER TABLE [dbo].[Symphony_LocationAssortmentGroups] ADD  DEFAULT ((0)) FOR [allocationPriority]
GO
ALTER TABLE [dbo].[Symphony_LocationAssortmentGroups] ADD  DEFAULT ((0)) FOR [overrideAllocationMethod]
GO
ALTER TABLE [dbo].[Symphony_LocationAssortmentGroups] ADD  DEFAULT ((1)) FOR [isGapCalculatedByVariety]
GO
ALTER TABLE [dbo].[Symphony_LocationAssortmentGroups] ADD  DEFAULT ((0)) FOR [isAllocationCompleted]
GO
ALTER TABLE [dbo].[Symphony_LocationAssortmentGroups] ADD  DEFAULT ((0)) FOR [oddmentsRatio]
GO
ALTER TABLE [dbo].[Symphony_LocationAssortmentGroups] ADD  DEFAULT ((0)) FOR [enableDTM]
GO
ALTER TABLE [dbo].[Symphony_LocationAssortmentGroups] ADD  DEFAULT ((0)) FOR [DTMBenchmark]
GO
ALTER TABLE [dbo].[Symphony_LocationAssortmentGroups] ADD  DEFAULT ((1.33)) FOR [DTMIncreaseThreshold]
GO
ALTER TABLE [dbo].[Symphony_LocationAssortmentGroups] ADD  DEFAULT ((0.66)) FOR [DTMDecreaseThreshold]
GO
ALTER TABLE [dbo].[Symphony_LocationAssortmentGroups] ADD  DEFAULT ((0.8)) FOR [DTMDecileForIncrease]
GO
ALTER TABLE [dbo].[Symphony_LocationAssortmentGroups] ADD  DEFAULT ((0.7)) FOR [DTMDecileForDecrease]
GO
ALTER TABLE [dbo].[Symphony_LocationAssortmentGroups] ADD  DEFAULT ((0.2)) FOR [DTMIncreaseFactor]
GO
ALTER TABLE [dbo].[Symphony_LocationAssortmentGroups] ADD  DEFAULT ((0.2)) FOR [DTMDecreaseFactor]
GO
ALTER TABLE [dbo].[Symphony_LocationAssortmentGroupsSkuIDs] ADD  DEFAULT ((0)) FOR [ignoreNrBuffers]
GO
ALTER TABLE [dbo].[Symphony_LocationAssortmentGroupsTmpData] ADD  DEFAULT ((0)) FOR [validFamiliesNum]
GO
ALTER TABLE [dbo].[Symphony_LocationAssortmentGroupsTmpData] ADD  DEFAULT ((0)) FOR [notValidFamiliesNum]
GO
ALTER TABLE [dbo].[Symphony_LocationAssortmentGroupsTmpData] ADD  DEFAULT ((0)) FOR [notValidFamiliesOverThresholdNum]
GO
ALTER TABLE [dbo].[Symphony_LocationAssortmentGroupsTmpData] ADD  DEFAULT ((0)) FOR [gapMode]
GO
ALTER TABLE [dbo].[Symphony_LocationAssortmentGroupsTmpSpaceData] ADD  DEFAULT ((0)) FOR [gapMode]
GO
ALTER TABLE [dbo].[Symphony_LocationAssortmentGroupsTmpSpaceData] ADD  DEFAULT ((0)) FOR [sumInventory]
GO
ALTER TABLE [dbo].[Symphony_LocationAssortmentGroupsTmpSpaceData] ADD  DEFAULT ((0)) FOR [sumMaxInventoryBuffer]
GO
ALTER TABLE [dbo].[Symphony_LocationDisplayGroupRecommendations] ADD  DEFAULT ((0)) FOR [inSeasonality]
GO
ALTER TABLE [dbo].[Symphony_LocationFamilyAttributes] ADD  DEFAULT ((0)) FOR [avoidRefreshment]
GO
ALTER TABLE [dbo].[Symphony_LocationFamilyAttributes] ADD  DEFAULT ((0)) FOR [imposedValidation]
GO
ALTER TABLE [dbo].[Symphony_MasterSkus] ADD  DEFAULT ((0)) FOR [isPreferred]
GO
ALTER TABLE [dbo].[Symphony_MasterSkus] ADD  DEFAULT ((0)) FOR [npiQuantity]
GO
ALTER TABLE [dbo].[Symphony_MaterialsStockLocations] ADD  DEFAULT ((-1)) FOR [skuID]
GO
ALTER TABLE [dbo].[Symphony_Measures] ADD  DEFAULT ((1)) FOR [isBrowsable]
GO
ALTER TABLE [dbo].[Symphony_Measures] ADD  DEFAULT ((1)) FOR [calcDay]
GO
ALTER TABLE [dbo].[Symphony_Measures] ADD  DEFAULT (CONVERT([smalldatetime],CONVERT([varchar],getdate(),(112)))) FOR [creationDate]
GO
ALTER TABLE [dbo].[Symphony_MTOSkus] ADD  DEFAULT ((0)) FOR [consumption]
GO
ALTER TABLE [dbo].[Symphony_MTOSkus] ADD  DEFAULT ((0)) FOR [totalIn]
GO
ALTER TABLE [dbo].[Symphony_MTOSkus] ADD  DEFAULT ((1)) FOR [autoReplenishment]
GO
ALTER TABLE [dbo].[Symphony_MTOSkus] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[Symphony_MTOSkusHistory] ADD  DEFAULT ((0)) FOR [returned]
GO
ALTER TABLE [dbo].[Symphony_MTOSkusHistory] ADD  DEFAULT ((1)) FOR [inventoryAtSiteUpdatesNum]
GO
ALTER TABLE [dbo].[Symphony_MTOSkusHistory] ADD  DEFAULT ((0)) FOR [isDuplicatedRow]
GO
ALTER TABLE [dbo].[Symphony_MTOSkusHistory] ADD  DEFAULT ((1)) FOR [toIncreaseUpdateNum]
GO
ALTER TABLE [dbo].[Symphony_MTOSkusHistory] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[Symphony_NPISetMembers] ADD  DEFAULT ((0)) FOR [npiQuantity]
GO
ALTER TABLE [dbo].[Symphony_ParentSDCEvents] ADD  DEFAULT (CONVERT([smalldatetime],CONVERT([varchar],getdate(),(112)))) FOR [creationDate]
GO
ALTER TABLE [dbo].[Symphony_plannedLoadBreakDown] ADD  DEFAULT ((0)) FOR [isSuperFast]
GO
ALTER TABLE [dbo].[Symphony_plannedLoadBreakDown] ADD  DEFAULT ((1)) FOR [isPlanned]
GO
ALTER TABLE [dbo].[Symphony_plannedLoadBreakDown] ADD  DEFAULT ((-1)) FOR [periodIndex]
GO
ALTER TABLE [dbo].[Symphony_PlannedLoadHistory] ADD  DEFAULT ((0)) FOR [numberOfUpdates]
GO
ALTER TABLE [dbo].[Symphony_PlannedLoadHistory] ADD  DEFAULT ((0)) FOR [superFastCapacity]
GO
ALTER TABLE [dbo].[Symphony_PlannedLoadHistory] ADD  DEFAULT ((0)) FOR [superFastMtsLoad]
GO
ALTER TABLE [dbo].[Symphony_PlannedLoadHistory] ADD  DEFAULT ((0)) FOR [superFastStrategicLoad]
GO
ALTER TABLE [dbo].[Symphony_PlannedLoadHistory] ADD  DEFAULT ((0)) FOR [superFastStandardLoad]
GO
ALTER TABLE [dbo].[Symphony_PlannedLoadHistory] ADD  DEFAULT ((0)) FOR [superFastSuperFastLoad]
GO
ALTER TABLE [dbo].[Symphony_PlannedLoadHistory] ADD  DEFAULT ((0)) FOR [superFastFastLoad]
GO
ALTER TABLE [dbo].[Symphony_PlannedLoadHistory] ADD  DEFAULT ((0)) FOR [superFastReservedLoad]
GO
ALTER TABLE [dbo].[Symphony_PlannedLoadHistory] ADD  DEFAULT ((0)) FOR [superFastRedLoad]
GO
ALTER TABLE [dbo].[Symphony_PlannedLoadHistory] ADD  DEFAULT ((0)) FOR [superFastBlackLoad]
GO
ALTER TABLE [dbo].[Symphony_PlannedLoadHistory] ADD  DEFAULT ((0)) FOR [superFastPlanned]
GO
ALTER TABLE [dbo].[Symphony_PlannedLoadHistory] ADD  DEFAULT ((0)) FOR [superFastPresent]
GO
ALTER TABLE [dbo].[Symphony_PlannedLoadHistory] ADD  DEFAULT ((0)) FOR [ratioSuperFastMtsLoadOfPlanned]
GO
ALTER TABLE [dbo].[Symphony_PlannedLoadHistory] ADD  DEFAULT ((0)) FOR [ratioSuperFastStrateigcLoadOfPlanned]
GO
ALTER TABLE [dbo].[Symphony_PlannedLoadHistory] ADD  DEFAULT ((0)) FOR [ratioSuperFastStandardLoadOfPlanned]
GO
ALTER TABLE [dbo].[Symphony_PlannedLoadHistory] ADD  DEFAULT ((0)) FOR [ratioSuperFastSuperFastLoadOfPlanned]
GO
ALTER TABLE [dbo].[Symphony_PlannedLoadHistory] ADD  DEFAULT ((0)) FOR [ratioSuperFastReservedLoadOfPlanned]
GO
ALTER TABLE [dbo].[Symphony_PlannedLoadHistory] ADD  DEFAULT ((0)) FOR [ratioSuperFastRedLoadOfPlanned]
GO
ALTER TABLE [dbo].[Symphony_PlannedLoadHistory] ADD  DEFAULT ((0)) FOR [ratioSuperFastBlackLoadOfPlanned]
GO
ALTER TABLE [dbo].[Symphony_PlannedLoadHistory] ADD  DEFAULT ((0)) FOR [ratioSuperFastFastLoadOfPlanned]
GO
ALTER TABLE [dbo].[Symphony_PlannedLoadHistory] ADD  DEFAULT ((0)) FOR [bufferSlackRate]
GO
ALTER TABLE [dbo].[Symphony_ProductionCalendarNonWorkingDays] ADD  DEFAULT ((-1)) FOR [plantID]
GO
ALTER TABLE [dbo].[Symphony_ProductionCalendarNonWorkingDays] ADD  DEFAULT ((-1)) FOR [calenderID]
GO
ALTER TABLE [dbo].[Symphony_ProductionFamilies] ADD  DEFAULT ((0)) FOR [percentTouchTime]
GO
ALTER TABLE [dbo].[Symphony_ProductionFamilies] ADD  DEFAULT ((-1)) FOR [flowDictatorID]
GO
ALTER TABLE [dbo].[Symphony_ProductionFamilies] ADD  DEFAULT ((0)) FOR [allowForLongTravelTime]
GO
ALTER TABLE [dbo].[Symphony_ProductionFamilies] ADD  DEFAULT ((50)) FOR [productionLeadTimePrec]
GO
ALTER TABLE [dbo].[Symphony_ProductionFamilies] ADD  DEFAULT ((1)) FOR [bufferFactor]
GO
ALTER TABLE [dbo].[Symphony_ProductionFamilies] ADD  DEFAULT ((0)) FOR [safetyFactor]
GO
ALTER TABLE [dbo].[Symphony_ProductionFamilies] ADD  DEFAULT ((0.16666)) FOR [thersholdFactor]
GO
ALTER TABLE [dbo].[Symphony_ProductionQuotes] ADD  DEFAULT ((0)) FOR [quantity]
GO
ALTER TABLE [dbo].[Symphony_ProductionQuotes] ADD  DEFAULT ((0)) FOR [bufferSize]
GO
ALTER TABLE [dbo].[Symphony_ProductionQuotes] ADD  DEFAULT ((0)) FOR [leadTime]
GO
ALTER TABLE [dbo].[Symphony_ProductionQuotes] ADD  DEFAULT ((0)) FOR [status]
GO
ALTER TABLE [dbo].[Symphony_ProjectGroups ] ADD  DEFAULT ((1)) FOR [quota]
GO
ALTER TABLE [dbo].[Symphony_ProjectGroups ] ADD  DEFAULT ((100)) FOR [groupBufferPrec]
GO
ALTER TABLE [dbo].[Symphony_Projects] ADD  DEFAULT ((0)) FOR [isActive]
GO
ALTER TABLE [dbo].[Symphony_Projects] ADD  DEFAULT ((0)) FOR [isFinish]
GO
ALTER TABLE [dbo].[Symphony_Projects] ADD  DEFAULT ((0)) FOR [allWoRelease]
GO
ALTER TABLE [dbo].[Symphony_PurchaseBufferClass] ADD  DEFAULT ((0)) FOR [bufferSize]
GO
ALTER TABLE [dbo].[Symphony_PurchasingOrder] ADD  DEFAULT ((1)) FOR [bufferColor]
GO
ALTER TABLE [dbo].[Symphony_PurchasingOrder] ADD  DEFAULT ((0)) FOR [inputSuspicion]
GO
ALTER TABLE [dbo].[Symphony_PurchasingOrder] ADD  DEFAULT ((0)) FOR [considered]
GO
ALTER TABLE [dbo].[Symphony_PurchasingOrder] ADD  DEFAULT ((0)) FOR [newRedBlack]
GO
ALTER TABLE [dbo].[Symphony_PurchasingOrder] ADD  DEFAULT ((0)) FOR [oldBufferColor]
GO
ALTER TABLE [dbo].[Symphony_PurchasingOrder] ADD  DEFAULT ((1)) FOR [needsMatch]
GO
ALTER TABLE [dbo].[Symphony_PurchasingOrder] ADD  DEFAULT ((0)) FOR [isISTOrder]
GO
ALTER TABLE [dbo].[Symphony_PurchasingOrderPrev] ADD  DEFAULT ((1)) FOR [bufferColor]
GO
ALTER TABLE [dbo].[Symphony_PurchasingOrderPrev] ADD  DEFAULT ((0)) FOR [inputSuspicion]
GO
ALTER TABLE [dbo].[Symphony_PurchasingOrderPrev] ADD  DEFAULT ((0)) FOR [considered]
GO
ALTER TABLE [dbo].[Symphony_PurchasingOrderPrev] ADD  DEFAULT ((0)) FOR [newRedBlack]
GO
ALTER TABLE [dbo].[Symphony_PurchasingOrderPrev] ADD  DEFAULT ((0)) FOR [oldBufferColor]
GO
ALTER TABLE [dbo].[Symphony_PurchasingOrderPrev] ADD  DEFAULT ((1)) FOR [needsMatch]
GO
ALTER TABLE [dbo].[Symphony_PurchasingOrderPrev] ADD  DEFAULT ((0)) FOR [isISTOrder]
GO
ALTER TABLE [dbo].[Symphony_PurchasingProperty] ADD  DEFAULT ((0)) FOR [autoAddNewItem]
GO
ALTER TABLE [dbo].[Symphony_PurchasingRecommendation] ADD  DEFAULT ((0)) FOR [sentToReplenishment]
GO
ALTER TABLE [dbo].[Symphony_PurchasingRecommendation] ADD  DEFAULT ((0)) FOR [isAwaitsConfirmation]
GO
ALTER TABLE [dbo].[Symphony_PurchasingRecommendation] ADD  DEFAULT ((0)) FOR [showInReport]
GO
ALTER TABLE [dbo].[Symphony_PurchasingRecommendation] ADD  DEFAULT ((0)) FOR [isConfirmed]
GO
ALTER TABLE [dbo].[Symphony_PurchasingRecommendation] ADD  DEFAULT ((1)) FOR [bufferColor]
GO
ALTER TABLE [dbo].[Symphony_PurchasingRecommendation] ADD  DEFAULT ((0)) FOR [inventoryNeeded]
GO
ALTER TABLE [dbo].[Symphony_PurchasingRecommendation] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[Symphony_PurchasingRecommendationProperty] ADD  DEFAULT ((0)) FOR [autoAddNewItem]
GO
ALTER TABLE [dbo].[Symphony_ReplenishmentDistributionLog] ADD  DEFAULT ((0)) FOR [replenishmentQuantity]
GO
ALTER TABLE [dbo].[Symphony_ReplenishmentDistributionLog] ADD  DEFAULT ((0)) FOR [bpProduction]
GO
ALTER TABLE [dbo].[Symphony_ReplenishmentDistributionLog] ADD  DEFAULT ((0)) FOR [inventoryNeeded]
GO
ALTER TABLE [dbo].[Symphony_ReplenishmentDistributionLog] ADD  DEFAULT ((0)) FOR [bufferSize]
GO
ALTER TABLE [dbo].[Symphony_ReplenishmentDistributionLog] ADD  DEFAULT ((0)) FOR [productionColor]
GO
ALTER TABLE [dbo].[Symphony_ReplenishmentPerformanceHistory] ADD  DEFAULT ((0)) FOR [totalBuffers]
GO
ALTER TABLE [dbo].[Symphony_ReplenishmentPerformanceHistory] ADD  DEFAULT ((0)) FOR [numberNonfilled]
GO
ALTER TABLE [dbo].[Symphony_ReplenishmentPerformanceHistory] ADD  DEFAULT ((0)) FOR [numberOverfilled]
GO
ALTER TABLE [dbo].[Symphony_ReplenishmentPerformanceHistory] ADD  DEFAULT ((0)) FOR [grade]
GO
ALTER TABLE [dbo].[Symphony_ReplenishmentProductionLog] ADD  DEFAULT ((0)) FOR [replenishmentQuantity]
GO
ALTER TABLE [dbo].[Symphony_ReplenishmentProductionLog] ADD  DEFAULT ((0)) FOR [bpProduction]
GO
ALTER TABLE [dbo].[Symphony_ReplenishmentProductionLog] ADD  DEFAULT ((0)) FOR [inventoryNeeded]
GO
ALTER TABLE [dbo].[Symphony_ReplenishmentProductionLog] ADD  DEFAULT ((0)) FOR [bufferSize]
GO
ALTER TABLE [dbo].[Symphony_ReplenishmentProductionLog] ADD  DEFAULT ((0)) FOR [productionColor]
GO
ALTER TABLE [dbo].[Symphony_RetailAllocationRequest] ADD  DEFAULT ((0)) FOR [requestStatus]
GO
ALTER TABLE [dbo].[Symphony_RetailAllocationRequest] ADD  DEFAULT ((0)) FOR [sentToReplenishment]
GO
ALTER TABLE [dbo].[Symphony_RetailAllocationRequest] ADD  DEFAULT ((1)) FOR [bySystem]
GO
ALTER TABLE [dbo].[Symphony_RetailAllocationRequest] ADD  DEFAULT ((0)) FOR [optionalRequest]
GO
ALTER TABLE [dbo].[Symphony_RetailAllocationRequest] ADD  DEFAULT ((0)) FOR [userSelection]
GO
ALTER TABLE [dbo].[Symphony_RetailAttributesAGTargetsSet] ADD  DEFAULT ((0)) FOR [attributePriority]
GO
ALTER TABLE [dbo].[Symphony_RetailAttributesAGTargetsSet] ADD  DEFAULT ((0)) FOR [distributionType]
GO
ALTER TABLE [dbo].[Symphony_RetailFamiliesLocationData] ADD  DEFAULT ((0)) FOR [NumFamiliesAtSite]
GO
ALTER TABLE [dbo].[Symphony_RetailFamiliesLocationData] ADD  DEFAULT ((0)) FOR [NumFamiliesAtPipe]
GO
ALTER TABLE [dbo].[Symphony_RetailFamiliesLocationData] ADD  DEFAULT ((0)) FOR [NumAllocatedRequests]
GO
ALTER TABLE [dbo].[Symphony_RetailFamiliesLocationData] ADD  DEFAULT ((0)) FOR [NumFamiliesAtSiteBUL]
GO
ALTER TABLE [dbo].[Symphony_RetailFamiliesLocationData] ADD  DEFAULT ((0)) FOR [NumFamiliesInPipeBUL]
GO
ALTER TABLE [dbo].[Symphony_SalesRateFamily] ADD  DEFAULT ((0)) FOR [consumption]
GO
ALTER TABLE [dbo].[Symphony_SalesRateFamily] ADD  DEFAULT ((0)) FOR [validDays]
GO
ALTER TABLE [dbo].[Symphony_SalesRateFamily] ADD  DEFAULT ((0)) FOR [saleRate]
GO
ALTER TABLE [dbo].[Symphony_SalesRateFamily] ADD  DEFAULT ((0)) FOR [isLeaf]
GO
ALTER TABLE [dbo].[Symphony_SalesRateFamily] ADD  DEFAULT ((0)) FOR [whCandidate]
GO
ALTER TABLE [dbo].[Symphony_SalesRateFamily] ADD  DEFAULT ((0)) FOR [coverage]
GO
ALTER TABLE [dbo].[Symphony_SalesRateFamily] ADD  DEFAULT ((0)) FOR [week1consumption]
GO
ALTER TABLE [dbo].[Symphony_SalesRateFamily] ADD  DEFAULT ((0)) FOR [week1validDays]
GO
ALTER TABLE [dbo].[Symphony_SalesRateFamily] ADD  DEFAULT ((0)) FOR [week2consumption]
GO
ALTER TABLE [dbo].[Symphony_SalesRateFamily] ADD  DEFAULT ((0)) FOR [week2validDays]
GO
ALTER TABLE [dbo].[Symphony_SalesRateFamily] ADD  DEFAULT ((0)) FOR [week3consumption]
GO
ALTER TABLE [dbo].[Symphony_SalesRateFamily] ADD  DEFAULT ((0)) FOR [week3validDays]
GO
ALTER TABLE [dbo].[Symphony_SalesRateFamily] ADD  DEFAULT ((0)) FOR [week4consumption]
GO
ALTER TABLE [dbo].[Symphony_SalesRateFamily] ADD  DEFAULT ((0)) FOR [week4validDays]
GO
ALTER TABLE [dbo].[Symphony_SalesRateSku] ADD  DEFAULT ((0)) FOR [consumption]
GO
ALTER TABLE [dbo].[Symphony_SalesRateSku] ADD  DEFAULT ((0)) FOR [validDays]
GO
ALTER TABLE [dbo].[Symphony_SalesRateSku] ADD  DEFAULT ((0)) FOR [saleRate]
GO
ALTER TABLE [dbo].[Symphony_SalesRateSku] ADD  DEFAULT ((0)) FOR [isLeaf]
GO
ALTER TABLE [dbo].[Symphony_SalesRateSku] ADD  DEFAULT ((0)) FOR [whCandidate]
GO
ALTER TABLE [dbo].[Symphony_SalesRateSku] ADD  DEFAULT ((0)) FOR [coverage]
GO
ALTER TABLE [dbo].[Symphony_SalesRateSku] ADD  DEFAULT ((0)) FOR [week1consumption]
GO
ALTER TABLE [dbo].[Symphony_SalesRateSku] ADD  DEFAULT ((0)) FOR [week1validDays]
GO
ALTER TABLE [dbo].[Symphony_SalesRateSku] ADD  DEFAULT ((0)) FOR [week2consumption]
GO
ALTER TABLE [dbo].[Symphony_SalesRateSku] ADD  DEFAULT ((0)) FOR [week2validDays]
GO
ALTER TABLE [dbo].[Symphony_SalesRateSku] ADD  DEFAULT ((0)) FOR [week3consumption]
GO
ALTER TABLE [dbo].[Symphony_SalesRateSku] ADD  DEFAULT ((0)) FOR [week3validDays]
GO
ALTER TABLE [dbo].[Symphony_SalesRateSku] ADD  DEFAULT ((0)) FOR [week4consumption]
GO
ALTER TABLE [dbo].[Symphony_SalesRateSku] ADD  DEFAULT ((0)) FOR [week4validDays]
GO
ALTER TABLE [dbo].[Symphony_SalesRateTempFamily] ADD  DEFAULT ((0)) FOR [consumption]
GO
ALTER TABLE [dbo].[Symphony_SalesRateTempFamily] ADD  DEFAULT ((0)) FOR [validDays]
GO
ALTER TABLE [dbo].[Symphony_SalesRateTempFamily] ADD  DEFAULT ((1)) FOR [isLeaf]
GO
ALTER TABLE [dbo].[Symphony_SalesRateTempFamily] ADD  DEFAULT ((0)) FOR [whCandidate]
GO
ALTER TABLE [dbo].[Symphony_SalesRateTempFamily] ADD  DEFAULT ((0)) FOR [inventoryTotal]
GO
ALTER TABLE [dbo].[Symphony_SalesRateTempFamily] ADD  DEFAULT ((0)) FOR [saleRate]
GO
ALTER TABLE [dbo].[Symphony_SalesRateTempSku] ADD  DEFAULT ((0)) FOR [consumption]
GO
ALTER TABLE [dbo].[Symphony_SalesRateTempSku] ADD  DEFAULT ((0)) FOR [validDays]
GO
ALTER TABLE [dbo].[Symphony_SalesRateTempSku] ADD  DEFAULT ((1)) FOR [isLeaf]
GO
ALTER TABLE [dbo].[Symphony_SalesRateTempSku] ADD  DEFAULT ((0)) FOR [whCandidate]
GO
ALTER TABLE [dbo].[Symphony_SalesRateTempSku] ADD  DEFAULT ((0)) FOR [inventoryTotal]
GO
ALTER TABLE [dbo].[Symphony_SalesRateTempSku] ADD  DEFAULT ((0)) FOR [saleRate]
GO
ALTER TABLE [dbo].[Symphony_Seasonality] ADD  DEFAULT ((0)) FOR [eventType]
GO
ALTER TABLE [dbo].[Symphony_Seasonality] ADD  DEFAULT ((0)) FOR [eventState]
GO
ALTER TABLE [dbo].[Symphony_Seasonality] ADD  DEFAULT ((0)) FOR [isHandled]
GO
ALTER TABLE [dbo].[Symphony_Seasonality] ADD  DEFAULT ((0)) FOR [autoAccept]
GO
ALTER TABLE [dbo].[Symphony_ShipmentPolicies] ADD  DEFAULT ((0)) FOR [customReplenishFrequency]
GO
ALTER TABLE [dbo].[Symphony_ShipmentPolicies] ADD  DEFAULT ((1)) FOR [useSunday]
GO
ALTER TABLE [dbo].[Symphony_ShipmentPolicies] ADD  DEFAULT ((1)) FOR [useMonday]
GO
ALTER TABLE [dbo].[Symphony_ShipmentPolicies] ADD  DEFAULT ((1)) FOR [useTuesday]
GO
ALTER TABLE [dbo].[Symphony_ShipmentPolicies] ADD  DEFAULT ((1)) FOR [useWednesday]
GO
ALTER TABLE [dbo].[Symphony_ShipmentPolicies] ADD  DEFAULT ((1)) FOR [useThursday]
GO
ALTER TABLE [dbo].[Symphony_ShipmentPolicies] ADD  DEFAULT ((1)) FOR [useFriday]
GO
ALTER TABLE [dbo].[Symphony_ShipmentPolicies] ADD  DEFAULT ((1)) FOR [useSaturday]
GO
ALTER TABLE [dbo].[Symphony_SkuFamilies] ADD  DEFAULT (CONVERT([int],CONVERT([float],getdate()))) FOR [creationDate]
GO
ALTER TABLE [dbo].[Symphony_SkuFamiliesValidationReducedRules] ADD  DEFAULT ((0)) FOR [minimumInventory]
GO
ALTER TABLE [dbo].[Symphony_SkuFamiliesValidationReducedRules] ADD  DEFAULT ((1)) FOR [minimumPercentBufferSize]
GO
ALTER TABLE [dbo].[Symphony_SkuFamiliesValidationRules] ADD  DEFAULT ((0)) FOR [minimumInventory]
GO
ALTER TABLE [dbo].[Symphony_SkuFamiliesValidationRules] ADD  DEFAULT ((1)) FOR [minimumPercentBufferSize]
GO
ALTER TABLE [dbo].[Symphony_SkuFamiliesValidationRules] ADD  DEFAULT ((0)) FOR [minimumPreferredCount]
GO
ALTER TABLE [dbo].[Symphony_SkuFamiliesValidationRules] ADD  DEFAULT ((0)) FOR [minimumMembersCount]
GO
ALTER TABLE [dbo].[Symphony_SkuLifeCycleEvents] ADD  DEFAULT (CONVERT([smalldatetime],CONVERT([varchar],getdate(),(112)))) FOR [creationDate]
GO
ALTER TABLE [dbo].[Symphony_SkuProcurementData] ADD  DEFAULT ((0)) FOR [supplierLeadTime]
GO
ALTER TABLE [dbo].[Symphony_SkuProcurementData] ADD  DEFAULT ((0)) FOR [timeProtection]
GO
ALTER TABLE [dbo].[Symphony_SkuProcurementData] ADD  DEFAULT ((0)) FOR [quantityProtection]
GO
ALTER TABLE [dbo].[Symphony_SkuProcurementData] ADD  DEFAULT ((0)) FOR [minimumOrderQuantity]
GO
ALTER TABLE [dbo].[Symphony_SkuProcurementData] ADD  DEFAULT ((1)) FOR [orderMultiplications]
GO
ALTER TABLE [dbo].[Symphony_SkuProcurementData] ADD  DEFAULT ((0)) FOR [lastBatchReplenishment]
GO
ALTER TABLE [dbo].[Symphony_SkuProcurementData] ADD  DEFAULT ((0)) FOR [additionalTimeTillArrival]
GO
ALTER TABLE [dbo].[Symphony_SkuProcurementData] ADD  DEFAULT ((0)) FOR [isDefaultSupplier]
GO
ALTER TABLE [dbo].[Symphony_SKUsProperty] ADD  DEFAULT ((0)) FOR [propType]
GO
ALTER TABLE [dbo].[Symphony_SKUsProperty] ADD  DEFAULT ((0)) FOR [autoAddNewItem]
GO
ALTER TABLE [dbo].[Symphony_StockLocationProperty] ADD  DEFAULT ((0)) FOR [propType]
GO
ALTER TABLE [dbo].[Symphony_StockLocationProperty] ADD  DEFAULT ((0)) FOR [autoAddNewItem]
GO
ALTER TABLE [dbo].[Symphony_StockLocationProperty] ADD  DEFAULT ((0)) FOR [isResponsibleTooMuchRed]
GO
ALTER TABLE [dbo].[Symphony_StockLocationProperty] ADD  DEFAULT ((0)) FOR [isResponsibleTooMuchGreen]
GO
ALTER TABLE [dbo].[Symphony_StockLocationProperty] ADD  DEFAULT ((0)) FOR [isResponsibleReplanishment]
GO
ALTER TABLE [dbo].[Symphony_StockLocationPropertyItems] ADD  DEFAULT ((0)) FOR [autoTooMuchRed]
GO
ALTER TABLE [dbo].[Symphony_StockLocationPropertyItems] ADD  DEFAULT ((1.33)) FOR [tooMuchRedFactor]
GO
ALTER TABLE [dbo].[Symphony_StockLocationPropertyItems] ADD  DEFAULT ((0)) FOR [autoTooMuchGreen]
GO
ALTER TABLE [dbo].[Symphony_StockLocationPropertyItems] ADD  DEFAULT ((0.67)) FOR [tooMuchGreenFactor]
GO
ALTER TABLE [dbo].[Symphony_StockLocationPropertyItems] ADD  DEFAULT ((0)) FOR [autoReplanishment]
GO
ALTER TABLE [dbo].[Symphony_StockLocationPropertyItems] ADD  DEFAULT ((0.33)) FOR [replanishmentFactor]
GO
ALTER TABLE [dbo].[Symphony_StockLocations] ADD  DEFAULT ((5)) FOR [stockLocationType]
GO
ALTER TABLE [dbo].[Symphony_StockLocations] ADD  DEFAULT ((-1)) FOR [calenderID]
GO
ALTER TABLE [dbo].[Symphony_StockLocations] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[Symphony_StockLocations] ADD  DEFAULT ((0)) FOR [spaceManagement]
GO
ALTER TABLE [dbo].[Symphony_StockLocations] ADD  DEFAULT ((0)) FOR [allocationPriority]
GO
ALTER TABLE [dbo].[Symphony_StockLocations] ADD  DEFAULT ((0)) FOR [replenishmentPriority]
GO
ALTER TABLE [dbo].[Symphony_StockLocationsAdjacent] ADD  DEFAULT ((0)) FOR [inD1toD2NotNeeded]
GO
ALTER TABLE [dbo].[Symphony_StockLocationsAdjacent] ADD  DEFAULT ((0)) FOR [inD2toD1NotNeeded]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkuHistory] ADD  DEFAULT ((0)) FOR [irrConsumption]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkuHistory] ADD  DEFAULT ((0)) FOR [totalIn]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkuHistory] ADD  DEFAULT ((0)) FOR [irrTotalIn]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkuHistory] ADD  DEFAULT ((0)) FOR [returned]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkuHistory] ADD  DEFAULT ((1)) FOR [inventoryAtSiteUpdatesNum]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkuHistory] ADD  DEFAULT ((0)) FOR [bpSite]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkuHistory] ADD  DEFAULT ((0)) FOR [bpTransit]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkuHistory] ADD  DEFAULT ((0)) FOR [bpProduction]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkuHistory] ADD  DEFAULT ((0.33)) FOR [greenBpLevel]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkuHistory] ADD  DEFAULT ((0.67)) FOR [redBpLevel]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkuHistory] ADD  DEFAULT ((0)) FOR [safetyStock]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkuHistory] ADD  DEFAULT ((0)) FOR [isDuplicatedRow]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkuHistory] ADD  DEFAULT ((1)) FOR [toIncreaseUpdateNum]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkuHistory] ADD  DEFAULT ((0)) FOR [originType]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkuHistory] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((0)) FOR [bufferSize]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((0)) FOR [inventoryAtSite]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((0)) FOR [inventoryAtTransit]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((0)) FOR [inventoryAtTransitPurchasing]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((0)) FOR [inventoryAtProduction]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((0)) FOR [consumption]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((0)) FOR [noConsumption]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((0)) FOR [noConsumptionDays]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((-1)) FOR [noConsumptionDaysPrevious]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((0)) FOR [noConsumptionDaysToPreviousDecision]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((0)) FOR [totalIn]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((0)) FOR [inventoryNeeded]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((0)) FOR [bpSite]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((0)) FOR [bpTransit]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((0)) FOR [bpProduction]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((0)) FOR [siteColor]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((0)) FOR [transitColor]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((0)) FOR [productionColor]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((0)) FOR [isRedReasonNeeded]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((0)) FOR [isBlackReasonNeeded]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((0)) FOR [isYellowReasonNeeded]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((0)) FOR [toReplenish]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((0)) FOR [sentToReplenishment]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((0)) FOR [newBufferSize]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((0)) FOR [unitPrice]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((0)) FOR [avoidReplenishment]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((0)) FOR [minimumBufferSize]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((0)) FOR [suggestedReplenishmentAmount]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((0)) FOR [replenishmentQuantity]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((0)) FOR [saftyStock]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((100)) FOR [minimumRequiredBP]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((0)) FOR [minimumReplenishment]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((1)) FOR [multiplications]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((0)) FOR [avoidSeasonality]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((1)) FOR [autoReplenishment]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((0)) FOR [newRedBlack]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((0)) FOR [considered]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((0)) FOR [isDeleted]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((0)) FOR [allowedOverstocking]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((0)) FOR [invNeededToStartTmr]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT (CONVERT([smalldatetime],CONVERT([varchar],getdate(),(112)))) FOR [startDate]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((0)) FOR [recommendationType]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((1)) FOR [bufferManagementPolicy]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((0)) FOR [endOfLifeStatus]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((0)) FOR [greenPenetrationAccumulation]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((0)) FOR [redPenetrationAccumulation]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ('6/6/2079') FOR [lastAccumalteDate]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((0)) FOR [lastAccumulation]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((0)) FOR [inSeasonality]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((0)) FOR [greenOverStocking]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ('6/6/2079') FOR [dbmRecommendationDate]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((0)) FOR [lastAccumaltionColor]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT (CONVERT([smalldatetime],CONVERT([varchar],getdate(),(112)))) FOR [nextGreenOverstockCheckDate]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ('1/1/1999') FOR [enlargeCoolingPeriodDate]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((0)) FOR [enlargeCoolingPeriod]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT (dateadd(year,(-2),getdate())) FOR [greenPipeDate]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((0)) FOR [averageInLastRepTime]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((0)) FOR [TMGInvTransit]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((0)) FOR [irrInvAtSite]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((0)) FOR [irrInvAtTransit]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((0)) FOR [irrInvAtProduction]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((0)) FOR [irrConsumption]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((0)) FOR [irrTotalIn]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ADD  DEFAULT ((0)) FOR [irrInventoryAtTransitPurchasing]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkusProductionData] ADD  DEFAULT ((1)) FOR [expectedYield]
GO
ALTER TABLE [dbo].[Symphony_Transactions] ADD  DEFAULT ((1)) FOR [sendFromMts]
GO
ALTER TABLE [dbo].[Symphony_Transactions] ADD  DEFAULT ((1)) FOR [receiveToMts]
GO
ALTER TABLE [dbo].[Symphony_Transactions] ADD  DEFAULT ((1)) FOR [wasHandled]
GO
ALTER TABLE [dbo].[Symphony_UOM] ADD  DEFAULT ((0)) FOR [bufferAccuracy]
GO
ALTER TABLE [dbo].[Symphony_UOM] ADD  DEFAULT ((0)) FOR [inventoryAccuracy]
GO
ALTER TABLE [dbo].[Symphony_UOM] ADD  DEFAULT ((0)) FOR [shipmentsAccuracy]
GO
ALTER TABLE [dbo].[Symphony_UserPassword] ADD  DEFAULT ('') FOR [userEmail]
GO
ALTER TABLE [dbo].[Symphony_UserPassword] ADD  DEFAULT ((1)) FOR [isSymphony]
GO
ALTER TABLE [dbo].[Symphony_UserPassword] ADD  DEFAULT ((2)) FOR [moduleID]
GO
ALTER TABLE [dbo].[Symphony_WeeklyDays] ADD  DEFAULT ((0)) FOR [year_number]
GO
ALTER TABLE [dbo].[Symphony_WeeklyDays] ADD  DEFAULT (N'NA') FOR [dayName]
GO
ALTER TABLE [dbo].[Symphony_WeeklyDays] ADD  DEFAULT ((0)) FOR [isNonWorkingDay]
GO
ALTER TABLE [dbo].[Symphony_WeeklyDays] ADD  DEFAULT ((-1)) FOR [plantID]
GO
ALTER TABLE [dbo].[Symphony_WeeklyDays] ADD  DEFAULT ((-1)) FOR [calenderID]
GO
ALTER TABLE [dbo].[Symphony_WorkOrders] ADD  DEFAULT ((0)) FOR [newRedBlack]
GO
ALTER TABLE [dbo].[Symphony_WorkOrders] ADD  DEFAULT ((0)) FOR [considered]
GO
ALTER TABLE [dbo].[Symphony_WorkOrders] ADD  DEFAULT ((0)) FOR [oldColor]
GO
ALTER TABLE [dbo].[Symphony_WorkOrders] ADD  DEFAULT ((0)) FOR [prevColor]
GO
ALTER TABLE [dbo].[Symphony_WorkOrders] ADD  DEFAULT ((0)) FOR [inputSuspicion]
GO
ALTER TABLE [dbo].[Symphony_WorkOrders] ADD  DEFAULT ((0)) FOR [isPhantom]
GO
ALTER TABLE [dbo].[Symphony_WorkOrders] ADD  DEFAULT ((0)) FOR [toReleaseMtaCapacity]
GO
ALTER TABLE [dbo].[Symphony_workOrders4Projects] ADD  DEFAULT ((0)) FOR [sentToReplenishment]
GO
ALTER TABLE [dbo].[Symphony_workOrders4Projects] ADD  DEFAULT ((0)) FOR [releaseToFloor]
GO
ALTER TABLE [dbo].[Symphony_workOrders4Projects] ADD  DEFAULT ((0)) FOR [dueDateChanged]
GO
ALTER TABLE [dbo].[Symphony_WorkOrdersProperty] ADD  DEFAULT ((0)) FOR [propType]
GO
ALTER TABLE [dbo].[Symphony_WorkOrdersProperty] ADD  DEFAULT ((0)) FOR [autoAddNewItem]
GO
ALTER TABLE [dbo].[tb_rpt_dist_intrans_excp] ADD  DEFAULT ((0)) FOR [ind01]
GO
ALTER TABLE [dbo].[tb_SA_output] ADD  DEFAULT ((0)) FOR [ind01]
GO
ALTER TABLE [dbo].[tb_SA_stockreq] ADD  DEFAULT ((0)) FOR [ind01]
GO
ALTER TABLE [dbo].[Symphony_AccessItems]  WITH CHECK ADD  CONSTRAINT [FK_Symphony_AccessItems_GroupId] FOREIGN KEY([GroupID])
REFERENCES [dbo].[Symphony_Groups] ([GroupID])
GO
ALTER TABLE [dbo].[Symphony_AccessItems] CHECK CONSTRAINT [FK_Symphony_AccessItems_GroupId]
GO
ALTER TABLE [dbo].[Symphony_Log]  WITH CHECK ADD  CONSTRAINT [FK_sku_skuID] FOREIGN KEY([skuID])
REFERENCES [dbo].[Symphony_SKUs] ([skuID])
GO
ALTER TABLE [dbo].[Symphony_Log] CHECK CONSTRAINT [FK_sku_skuID]
GO
ALTER TABLE [dbo].[Symphony_Log]  WITH CHECK ADD  CONSTRAINT [FK_sku_stockLocationID] FOREIGN KEY([stockLocationID])
REFERENCES [dbo].[Symphony_StockLocations] ([stockLocationID])
GO
ALTER TABLE [dbo].[Symphony_Log] CHECK CONSTRAINT [FK_sku_stockLocationID]
GO
ALTER TABLE [dbo].[Symphony_MRsLoad]  WITH CHECK ADD  CONSTRAINT [FK_MRsLoad_skuID] FOREIGN KEY([skuID])
REFERENCES [dbo].[Symphony_SKUs] ([skuID])
GO
ALTER TABLE [dbo].[Symphony_MRsLoad] CHECK CONSTRAINT [FK_MRsLoad_skuID]
GO
ALTER TABLE [dbo].[Symphony_MTOSkus]  WITH CHECK ADD  CONSTRAINT [FK1_Symphony_MTOSkus] FOREIGN KEY([stockLocationID])
REFERENCES [dbo].[Symphony_StockLocations] ([stockLocationID])
GO
ALTER TABLE [dbo].[Symphony_MTOSkus] CHECK CONSTRAINT [FK1_Symphony_MTOSkus]
GO
ALTER TABLE [dbo].[Symphony_MTOSkus]  WITH CHECK ADD  CONSTRAINT [FK2_Symphony_MTOSkus] FOREIGN KEY([skuID])
REFERENCES [dbo].[Symphony_SKUs] ([skuID])
GO
ALTER TABLE [dbo].[Symphony_MTOSkus] CHECK CONSTRAINT [FK2_Symphony_MTOSkus]
GO
ALTER TABLE [dbo].[Symphony_MTOSkus]  WITH CHECK ADD  CONSTRAINT [FK3_Symphony_MTOSkus_uomID] FOREIGN KEY([uomID])
REFERENCES [dbo].[Symphony_UOM] ([uomID])
GO
ALTER TABLE [dbo].[Symphony_MTOSkus] CHECK CONSTRAINT [FK3_Symphony_MTOSkus_uomID]
GO
ALTER TABLE [dbo].[Symphony_MTOSkusHistory]  WITH CHECK ADD  CONSTRAINT [FK_Symphony_MTOSkusHistory_skuID] FOREIGN KEY([skuID])
REFERENCES [dbo].[Symphony_SKUs] ([skuID])
GO
ALTER TABLE [dbo].[Symphony_MTOSkusHistory] CHECK CONSTRAINT [FK_Symphony_MTOSkusHistory_skuID]
GO
ALTER TABLE [dbo].[Symphony_MTOSkusHistory]  WITH CHECK ADD  CONSTRAINT [FK_Symphony_MTOSkusHistory_stockLocationID] FOREIGN KEY([stockLocationID])
REFERENCES [dbo].[Symphony_StockLocations] ([stockLocationID])
GO
ALTER TABLE [dbo].[Symphony_MTOSkusHistory] CHECK CONSTRAINT [FK_Symphony_MTOSkusHistory_stockLocationID]
GO
ALTER TABLE [dbo].[Symphony_MTOSkusInflow]  WITH CHECK ADD  CONSTRAINT [FK1_Symphony_MTOSkusInflow] FOREIGN KEY([stockLocationID])
REFERENCES [dbo].[Symphony_StockLocations] ([stockLocationID])
GO
ALTER TABLE [dbo].[Symphony_MTOSkusInflow] CHECK CONSTRAINT [FK1_Symphony_MTOSkusInflow]
GO
ALTER TABLE [dbo].[Symphony_MTOSkusInflow]  WITH CHECK ADD  CONSTRAINT [FK2_Symphony_MTOSkusInflow] FOREIGN KEY([skuID])
REFERENCES [dbo].[Symphony_SKUs] ([skuID])
GO
ALTER TABLE [dbo].[Symphony_MTOSkusInflow] CHECK CONSTRAINT [FK2_Symphony_MTOSkusInflow]
GO
ALTER TABLE [dbo].[Symphony_MTOSkusOutflow]  WITH CHECK ADD  CONSTRAINT [FK1_Symphony_MTOSkusOutflow] FOREIGN KEY([stockLocationID])
REFERENCES [dbo].[Symphony_StockLocations] ([stockLocationID])
GO
ALTER TABLE [dbo].[Symphony_MTOSkusOutflow] CHECK CONSTRAINT [FK1_Symphony_MTOSkusOutflow]
GO
ALTER TABLE [dbo].[Symphony_MTOSkusOutflow]  WITH CHECK ADD  CONSTRAINT [FK2_Symphony_MTOSkusOutflow] FOREIGN KEY([skuID])
REFERENCES [dbo].[Symphony_SKUs] ([skuID])
GO
ALTER TABLE [dbo].[Symphony_MTOSkusOutflow] CHECK CONSTRAINT [FK2_Symphony_MTOSkusOutflow]
GO
ALTER TABLE [dbo].[Symphony_ProductionFamilies]  WITH CHECK ADD  CONSTRAINT [FK_plant] FOREIGN KEY([plant])
REFERENCES [dbo].[Symphony_StockLocations] ([stockLocationID])
GO
ALTER TABLE [dbo].[Symphony_ProductionFamilies] CHECK CONSTRAINT [FK_plant]
GO
ALTER TABLE [dbo].[Symphony_PurchasingPropertyItems]  WITH CHECK ADD  CONSTRAINT [FK_Symphony_PurchasingPropertyItems] FOREIGN KEY([purchasingPropertyID])
REFERENCES [dbo].[Symphony_PurchasingProperty] ([purchasingPropertyID])
GO
ALTER TABLE [dbo].[Symphony_PurchasingPropertyItems] CHECK CONSTRAINT [FK_Symphony_PurchasingPropertyItems]
GO
ALTER TABLE [dbo].[Symphony_PurchasingRecommendationPropertyItems]  WITH CHECK ADD  CONSTRAINT [FK_Symphony_PurchasingRecommendationPropertyItems] FOREIGN KEY([propertyID])
REFERENCES [dbo].[Symphony_PurchasingRecommendationProperty] ([propertyID])
GO
ALTER TABLE [dbo].[Symphony_PurchasingRecommendationPropertyItems] CHECK CONSTRAINT [FK_Symphony_PurchasingRecommendationPropertyItems]
GO
ALTER TABLE [dbo].[Symphony_SkuProcurementData]  WITH CHECK ADD  CONSTRAINT [FK_stockLocationID_SkuProcurementData] FOREIGN KEY([stockLocationID])
REFERENCES [dbo].[Symphony_StockLocations] ([stockLocationID])
GO
ALTER TABLE [dbo].[Symphony_SkuProcurementData] CHECK CONSTRAINT [FK_stockLocationID_SkuProcurementData]
GO
ALTER TABLE [dbo].[Symphony_SKUsPropertyItems]  WITH CHECK ADD  CONSTRAINT [FK_Symphony_SKUsPropertyItems] FOREIGN KEY([skuPropertyID])
REFERENCES [dbo].[Symphony_SKUsProperty] ([skuPropertyID])
GO
ALTER TABLE [dbo].[Symphony_SKUsPropertyItems] CHECK CONSTRAINT [FK_Symphony_SKUsPropertyItems]
GO
ALTER TABLE [dbo].[Symphony_StockLocationBPBlacks]  WITH CHECK ADD  CONSTRAINT [FK_StockLocationBPBlacks_skuID] FOREIGN KEY([skuID])
REFERENCES [dbo].[Symphony_SKUs] ([skuID])
GO
ALTER TABLE [dbo].[Symphony_StockLocationBPBlacks] CHECK CONSTRAINT [FK_StockLocationBPBlacks_skuID]
GO
ALTER TABLE [dbo].[Symphony_StockLocationBPBlacks]  WITH CHECK ADD  CONSTRAINT [FK_StockLocationBPBlacks_stockLocationID] FOREIGN KEY([stockLocationID])
REFERENCES [dbo].[Symphony_StockLocations] ([stockLocationID])
GO
ALTER TABLE [dbo].[Symphony_StockLocationBPBlacks] CHECK CONSTRAINT [FK_StockLocationBPBlacks_stockLocationID]
GO
ALTER TABLE [dbo].[Symphony_StockLocationBPReds]  WITH CHECK ADD  CONSTRAINT [FK_StockLocationBPReds_skuID] FOREIGN KEY([skuID])
REFERENCES [dbo].[Symphony_SKUs] ([skuID])
GO
ALTER TABLE [dbo].[Symphony_StockLocationBPReds] CHECK CONSTRAINT [FK_StockLocationBPReds_skuID]
GO
ALTER TABLE [dbo].[Symphony_StockLocationBPReds]  WITH CHECK ADD  CONSTRAINT [FK_StockLocationBPReds_stockLocationID] FOREIGN KEY([stockLocationID])
REFERENCES [dbo].[Symphony_StockLocations] ([stockLocationID])
GO
ALTER TABLE [dbo].[Symphony_StockLocationBPReds] CHECK CONSTRAINT [FK_StockLocationBPReds_stockLocationID]
GO
ALTER TABLE [dbo].[Symphony_StockLocationBPYellows]  WITH CHECK ADD  CONSTRAINT [FK_StockLocationBPYellows_skuID] FOREIGN KEY([skuID])
REFERENCES [dbo].[Symphony_SKUs] ([skuID])
GO
ALTER TABLE [dbo].[Symphony_StockLocationBPYellows] CHECK CONSTRAINT [FK_StockLocationBPYellows_skuID]
GO
ALTER TABLE [dbo].[Symphony_StockLocationBPYellows]  WITH CHECK ADD  CONSTRAINT [FK_StockLocationBPYellows_stockLocationID] FOREIGN KEY([stockLocationID])
REFERENCES [dbo].[Symphony_StockLocations] ([stockLocationID])
GO
ALTER TABLE [dbo].[Symphony_StockLocationBPYellows] CHECK CONSTRAINT [FK_StockLocationBPYellows_stockLocationID]
GO
ALTER TABLE [dbo].[Symphony_StockLocationPropertyItems]  WITH CHECK ADD  CONSTRAINT [FK_Symphony_StockLocationPropertyItems] FOREIGN KEY([slPropertyID])
REFERENCES [dbo].[Symphony_StockLocationProperty] ([slPropertyID])
GO
ALTER TABLE [dbo].[Symphony_StockLocationPropertyItems] CHECK CONSTRAINT [FK_Symphony_StockLocationPropertyItems]
GO
ALTER TABLE [dbo].[Symphony_StockLocationsAdjacent]  WITH CHECK ADD  CONSTRAINT [FK1_Symphony_StockLocationsAdjacent] FOREIGN KEY([stockLocationID1])
REFERENCES [dbo].[Symphony_StockLocations] ([stockLocationID])
GO
ALTER TABLE [dbo].[Symphony_StockLocationsAdjacent] CHECK CONSTRAINT [FK1_Symphony_StockLocationsAdjacent]
GO
ALTER TABLE [dbo].[Symphony_StockLocationsAdjacent]  WITH CHECK ADD  CONSTRAINT [FK2_Symphony_StockLocationsAdjacent] FOREIGN KEY([stockLocationID2])
REFERENCES [dbo].[Symphony_StockLocations] ([stockLocationID])
GO
ALTER TABLE [dbo].[Symphony_StockLocationsAdjacent] CHECK CONSTRAINT [FK2_Symphony_StockLocationsAdjacent]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkuHistory]  WITH NOCHECK ADD  CONSTRAINT [FK_StockLocationSkuHistory_skuID] FOREIGN KEY([skuID])
REFERENCES [dbo].[Symphony_SKUs] ([skuID])
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkuHistory] CHECK CONSTRAINT [FK_StockLocationSkuHistory_skuID]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkuHistory]  WITH NOCHECK ADD  CONSTRAINT [FK_StockLocationSkuHistory_stockLocationID] FOREIGN KEY([stockLocationID])
REFERENCES [dbo].[Symphony_StockLocations] ([stockLocationID])
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkuHistory] CHECK CONSTRAINT [FK_StockLocationSkuHistory_stockLocationID]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus]  WITH NOCHECK ADD  CONSTRAINT [FK_StockLocationSku_uomID] FOREIGN KEY([uomID])
REFERENCES [dbo].[Symphony_UOM] ([uomID])
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] CHECK CONSTRAINT [FK_StockLocationSku_uomID]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus]  WITH NOCHECK ADD  CONSTRAINT [FK_StockLocationSkus_skuID] FOREIGN KEY([skuID])
REFERENCES [dbo].[Symphony_SKUs] ([skuID])
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] CHECK CONSTRAINT [FK_StockLocationSkus_skuID]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus]  WITH NOCHECK ADD  CONSTRAINT [FK_StockLocationSkus_stockLocationID] FOREIGN KEY([stockLocationID])
REFERENCES [dbo].[Symphony_StockLocations] ([stockLocationID])
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] CHECK CONSTRAINT [FK_StockLocationSkus_stockLocationID]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkusProductionData]  WITH CHECK ADD  CONSTRAINT [FK_marketFamily_StockLocationSkusProductionData] FOREIGN KEY([marketFamily])
REFERENCES [dbo].[Symphony_MarketFamilies] ([ID])
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkusProductionData] CHECK CONSTRAINT [FK_marketFamily_StockLocationSkusProductionData]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkusProductionData]  WITH CHECK ADD  CONSTRAINT [FK_productionFamily_StockLocationSkusProductionData] FOREIGN KEY([productionFamily])
REFERENCES [dbo].[Symphony_ProductionFamilies] ([ID])
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkusProductionData] CHECK CONSTRAINT [FK_productionFamily_StockLocationSkusProductionData]
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkusProductionData]  WITH CHECK ADD  CONSTRAINT [FK1_StockLocationSkusProductionData] FOREIGN KEY([stockLocationID])
REFERENCES [dbo].[Symphony_StockLocations] ([stockLocationID])
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkusProductionData] CHECK CONSTRAINT [FK1_StockLocationSkusProductionData]
GO
ALTER TABLE [dbo].[Symphony_UOMConversions]  WITH CHECK ADD  CONSTRAINT [FK_UOMConversions_uomID1] FOREIGN KEY([uomID1])
REFERENCES [dbo].[Symphony_UOM] ([uomID])
GO
ALTER TABLE [dbo].[Symphony_UOMConversions] CHECK CONSTRAINT [FK_UOMConversions_uomID1]
GO
ALTER TABLE [dbo].[Symphony_UOMConversions]  WITH CHECK ADD  CONSTRAINT [FK_UOMConversions_uomID2] FOREIGN KEY([uomID2])
REFERENCES [dbo].[Symphony_UOM] ([uomID])
GO
ALTER TABLE [dbo].[Symphony_UOMConversions] CHECK CONSTRAINT [FK_UOMConversions_uomID2]
GO
ALTER TABLE [dbo].[Symphony_UserGroups]  WITH CHECK ADD  CONSTRAINT [FK_Symphony_UserGroups_GroupID] FOREIGN KEY([groupID])
REFERENCES [dbo].[Symphony_Groups] ([GroupID])
GO
ALTER TABLE [dbo].[Symphony_UserGroups] CHECK CONSTRAINT [FK_Symphony_UserGroups_GroupID]
GO
ALTER TABLE [dbo].[Symphony_UserGroups]  WITH CHECK ADD  CONSTRAINT [FK_Symphony_UserGroups_UserPassID] FOREIGN KEY([userPasswordID])
REFERENCES [dbo].[Symphony_UserPassword] ([userPasswordID])
GO
ALTER TABLE [dbo].[Symphony_UserGroups] CHECK CONSTRAINT [FK_Symphony_UserGroups_UserPassID]
GO
ALTER TABLE [dbo].[Symphony_UserReportGroups]  WITH CHECK ADD  CONSTRAINT [FK_Symphony_UserReportGroups_GroupID] FOREIGN KEY([reportGroupID])
REFERENCES [dbo].[Symphony_ReportGroups] ([reportGroupID])
GO
ALTER TABLE [dbo].[Symphony_UserReportGroups] CHECK CONSTRAINT [FK_Symphony_UserReportGroups_GroupID]
GO
ALTER TABLE [dbo].[Symphony_UserReportGroups]  WITH CHECK ADD  CONSTRAINT [FK_Symphony_UserReportGroups_UserPassID] FOREIGN KEY([userPasswordID])
REFERENCES [dbo].[Symphony_UserPassword] ([userPasswordID])
GO
ALTER TABLE [dbo].[Symphony_UserReportGroups] CHECK CONSTRAINT [FK_Symphony_UserReportGroups_UserPassID]
GO
ALTER TABLE [dbo].[Symphony_WorkOrdersPropertyItems]  WITH CHECK ADD  CONSTRAINT [FK_Symphony_WorkOrdersPropertyItems] FOREIGN KEY([woPropertyID])
REFERENCES [dbo].[Symphony_WorkOrdersProperty] ([woPropertyID])
GO
ALTER TABLE [dbo].[Symphony_WorkOrdersPropertyItems] CHECK CONSTRAINT [FK_Symphony_WorkOrdersPropertyItems]
GO
/****** Object:  StoredProcedure [dbo].[AfterCreate]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[AfterCreate] 
	@objectType sysname,
	@objectName sysname
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	IF OBJECT_ID(@objectName) IS NOT NULL
		PRINT '<<< CREATED ' + @objectType + ' ' + @objectName + ' >>>'
	ELSE
		PRINT '<<< FAILED CREATING ' + @objectType + ' ' + @objectName + ' >>>'

END
GO
/****** Object:  StoredProcedure [dbo].[AssortmentReplenishmentReport]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
/******************************************/
/***** End Create Utility Procedures ******/
/******************************************/

/******************************************/
/******** Diagnostic Procedures ***********/
/******************************************/


CREATE PROCEDURE [dbo].[AssortmentReplenishmentReport] 
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	CREATE TABLE #LocationCatalogSkusEx(
		[id] [int] NOT NULL,
		[skuID] [int] NOT NULL,
		[categoryID] [int] NOT NULL,
		[categoryName] [nvarchar](100) NOT NULL,
		[stockLocationID] [int] NOT NULL,
		[stockLocationName] [nvarchar] (100) NOT NULL,
		[originStockLocationID] [int] NOT NULL,
		[replenishmentTypeID] [tinyint] NOT NULL,
		[maxPipeline] [decimal](18, 5) NOT NULL,
		[normLevel] [decimal](18, 5) NOT NULL,
		[minimumReplenishment] [decimal] NULL,
		[lastBatchReplenishment] [decimal] (18, 5) NULL,
		[replenishmentMultiplications] [decimal] NULL,

	 CONSTRAINT [PK_LocationCatalogSkusEx] PRIMARY KEY CLUSTERED 
	(
		[stockLocationID] ASC,
		[categoryID] ASC,
		[skuID] ASC
	)ON [PRIMARY]
	);

	CREATE INDEX [IX_LocationCatalogSkusEx] ON #LocationCatalogSkusEx (id) ON [PRIMARY]

	INSERT INTO #LocationCatalogSkusEx
		SELECT 
			   [LCS].[id]
			  ,[LCS].[skuID]
			  ,[CS].[categoryID]
			  ,[C].[categoryName]
			  ,[LCS].[stockLocationID]
			  ,[SL].[stockLocationName]
			  ,[LCS].[originStockLocationID]
			  ,[LCS].[replenishmentTypeID]
			  ,[LCS].[maxPipeline]
			  ,[LC].[normLevel]
			  ,[LCS].[minimumReplenishment]
			  ,[LCS].[lastBatchReplenishment]
			  ,[LCS].[replenishmentMultiplications]
		FROM [dbo].[Symphony_LocationCatalogSkus] LCS
		INNER JOIN [dbo].[Symphony_CatalogSkus] CS
			ON CS.skuID = LCS.skuID
		INNER JOIN [dbo].[Symphony_LocationCategories] LC
			ON LC.categoryID = CS.categoryID
			AND LC.stockLocationID = LCS.stockLocationID
		INNER JOIN [dbo].[Symphony_Categories] C
			ON C.categoryID = CS.categoryID
		INNER JOIN [dbo].[Symphony_StockLocations] SL
			ON SL.stockLocationID = LCS.stockLocationID

	--SELECT * FROM #LocationCatalogSkusEx
	PRINT 'Table LocationCatalogSkusEx Created'

	CREATE TABLE #AssortmentReplenishmentRecommendationsEx(
		[id] [int] NOT NULL,
		[parentID] [int] NULL,
		[categoryID] [int] NULL,
		[originalSkuID] [int] NULL,
		[originalStockLocationID] [int] NULL,
		[originalLocationCatalogID] [int] NOT NULL,
		[originalInventoryNeeded] [decimal](18, 5) NOT NULL,
		[originalDaysAtStockLocation] [int] NOT NULL,
		[skuID] [int] NULL,
		[stockLocationID] [int] NULL,
		[locationCatalogID] [int] NOT NULL,
		[inventoryNeeded] [decimal](18, 5) NOT NULL,
		[inventoryInPipeline] [decimal](18, 5) NOT NULL,
		[replenishmentTypeID] [tinyint] NOT NULL,
		[replenishmentModeID] [tinyint] NOT NULL,
	 CONSTRAINT [PK_AssortmentReplenishmentRecommendationsEx] PRIMARY KEY CLUSTERED 
	(
		[id] ASC
	)
	);


	INSERT INTO #AssortmentReplenishmentRecommendationsEx
	SELECT 
		 [ARR].[id]
		,[ARR].[parentID]
		,CASE
			WHEN [OLCS].[categoryID] > 0 THEN [OLCS].[categoryID]
			ELSE [LCS].[categoryID]
		 END AS [categoryID]
		,[OLCS].[skuID] AS [originalSkuID] 
		,[OLCS].[stockLocationID] AS [originalStockLocationID]
		,[ARR].[originalLocationCatalogID]
		,[ARR].[originalInventoryNeeded]
		,[ARR].[originalDaysAtStockLocation]
		,[LCS].[skuID]
		,[LCS].[stockLocationID]
		,[ARR].[locationCatalogID]
		,[ARR].[inventoryNeeded]
		,[ARR].[inventoryInPipeline]
		,ISNULL([LCS].[replenishmentTypeID],255)
		,[ARR].[replenishmentModeID]
	FROM [dbo].[Symphony_AssortmentReplenishmentRecommendations] ARR
	LEFT JOIN #LocationCatalogSkusEx LCS
		ON LCS.[id] = ARR.[locationCatalogID]
	LEFT JOIN #LocationCatalogSkusEx OLCS
		ON OLCS.[id] = ARR.[originalLocationCatalogID]

	PRINT 'Table AssortmentReplenishmentRecommendationsEx Created'
	--SELECT * FROM #AssortmentReplenishmentRecommendationsEx
	
	DECLARE @InventoryNeededSummaries AS TABLE(
		 [id] [int] IDENTITY(1,1)
		,[skuID] [int]
		,[categoryID] [int]
		,[stockLocationID] [int]
		,[inventoryNeeded] [decimal](18,5)
		,[recommendedInventory] [decimal](18,5)
)	
	
	INSERT INTO @InventoryNeededSummaries
		SELECT 
			 TMP.skuID
			,TMP.categoryID
			,TMP.stockLocationID
			,SLS.inventoryNeeded
			,TMP.recommendedInventory
		FROM (
			SELECT 
				 skuID
				,categoryID
				,stockLocationID
				,SUM(inventoryNeeded) AS [recommendedInventory]
			FROM #AssortmentReplenishmentRecommendationsEx 
			WHERE locationCatalogID > 0 AND inventoryNeeded > 0
			GROUP BY stockLocationID,categoryID,skuID) TMP
		LEFT JOIN Symphony_StockLocationSkus SLS
			ON SLS.stockLocationID = TMP.stockLocationID
			AND SLS.skuID = TMP.skuID


	PRINT 'Table InventoryNeededSummaries Created'

	DECLARE @npiThreshold int
	SELECT @npiThreshold = CAST([flag_value] AS [int]) FROM [dbo].[Symphony_Globals] WHERE [flag_name] = N'elapsedTimeThreshold.NPI'

	DECLARE @mtrThreshold int
	SELECT @mtrThreshold = CAST([flag_value] AS [int]) FROM [dbo].[Symphony_Globals] WHERE [flag_name] = N'elapsedTimeThreshold.MTR'
	
	DECLARE @RecommendationCountsByType AS TABLE(
		 [id] [int] IDENTITY(1,1)
		,[skuID] [int]
		,[categoryID] [int]
		,[stockLocationID] [int]
		,[npiCount] [decimal](18,5)
		,[mtrCount] [decimal](18,5)
		,[mtarCount] [decimal](18,5)
		,[inactiveCount] [decimal](18,5)
		,[inventoryNeeded] [decimal](18,5)
	)

	INSERT INTO @RecommendationCountsByType
		SELECT 
			 ARR.[skuID]
			,ARR.[categoryID]
			,ARR.[stockLocationID]
			,CASE WHEN [replenishmentTypeID] = 0 AND [originalDaysAtStockLocation] < @npiThreshold THEN ISNULL(ARR.[inventoryNeeded],0) ELSE 0 END
			,CASE WHEN [replenishmentTypeID] = 1 AND (([originalDaysAtStockLocation] > 0 AND [originalDaysAtStockLocation] < @mtrThreshold) OR ([originalDaysAtStockLocation] = 0 AND INS.inventoryNeeded = INS.recommendedInventory)) THEN ISNULL(ARR.[inventoryNeeded],0)  ELSE 0 END
			,CASE WHEN [replenishmentTypeID] = 2  THEN ISNULL(ARR.[inventoryNeeded],0) ELSE 0 END
			,CASE WHEN [replenishmentTypeID] = 3  THEN ISNULL(ARR.[inventoryNeeded],0) ELSE 0 END	
			,ARR.[inventoryNeeded]
		FROM #AssortmentReplenishmentRecommendationsEx ARR
		INNER JOIN @InventoryNeededSummaries INS
			ON INS.skuID = ARR.skuID
			AND INS.stockLocationID = ARR.stockLocationID
		WHERE ARR.[inventoryNeeded] > 0

	DECLARE @Results AS TABLE(
		 [stockLocationName] [nvarchar](100)
		,[categoryName] [nvarchar](100)
		,[DELTA][decimal](18,5)
		,[normLevel][decimal](18,5)
		,[allowance][decimal](18,5)
		,[totalPipeLine][decimal](18,5)
		,[pipeLine][decimal](18,5)
		,[orderedInventory][decimal](18,5)
		,[recommendedInventory][decimal](18,5)
		,[npiCount] [decimal](18,5)
		,[mtrCount] [decimal](18,5)
		,[stockLocationID] [int]
		,[categoryID] [int]
	)


	INSERT INTO @Results
	 SELECT DISTINCT
		 LCS.stockLocationName
		,LCS.categoryName
		,TMP.pipeLine + ISNULL(TMP.recommendedInventory,0) + ISNULL(TMP.orderedInventory,0) - LCS.normLevel AS [DELTA]
		,LCS.normLevel
		,TMP.Allowance
		,TMP.pipeLine + ISNULL(TMP.recommendedInventory,0) + ISNULL(TMP.orderedInventory,0) AS [totalPipeLine]
		,TMP.pipeLine
		,TMP.orderedInventory
		,TMP.recommendedInventory
		,TMP.npiCount
		,TMP.mtrCount
		,LCS.stockLocationID
		,LCS.categoryID
	 FROM (

				SELECT 
					 SLS.stockLocationID
					,SLS.categoryID  
					,SLS.pipeLine
					,SLS.Allowance
					,ART.orderedInventory
					,ARR.recommendedInventory
					,ARR.npiCount
					,ARR.mtrCount
					,ARR.mtarCount
					,ARR.inactiveCount
				FROM (
					SELECT --Sum of pipeline per category
						 LCS.stockLocationID
						,LCS.categoryID  
						,LCS.normLevel
						,SUM(LCS.maxPipeline) AS [Allowance]
						,SUM(SLS.inventoryAtSite + SLS.inventoryAtTransit + SLS.inventoryAtProduction) AS [pipeLine]
					FROM #LocationCatalogSkusEx LCS
					LEFT JOIN Symphony_StockLocationSkus SLS
						ON SLS.skuID = LCS.skuID
						AND SLS.stockLocationID = LCS.stockLocationID
					GROUP BY
						 LCS.stockLocationID
						,LCS.categoryID  
						,LCS.normLevel
					) SLS
				LEFT JOIN (
					SELECT 
						 stockLocationID
						,categoryID
						,SUM(npiCount) AS [npiCount]
						,SUM(mtrCount) AS [mtrCount]
						,SUM(mtarCount) AS [mtarCount]
						,SUM(inactiveCount) AS [inactiveCount]
						,SUM(inventoryNeeded) AS [recommendedInventory]
					FROM @RecommendationCountsByType
					GROUP BY stockLocationID, categoryID) ARR
					
					--SELECT --Sum of Recommendations per sl category
					--	 LCS.stockLocationID
					--	,LCS.categoryID  
					--	,SUM(ARR.inventoryNeeded) AS [recommendedInventory]
					--FROM #AssortmentReplenishmentRecommendationsEx ARR
					--INNER JOIN #LocationCatalogSkusEx LCS
					--	ON LCS.id = ARR.locationCatalogID
					--WHERE ARR.inventoryNeeded > 0
					--GROUP BY LCS.stockLocationID,LCS.categoryID) ARR
					
				ON ARR.stockLocationID = SLS.stockLocationID
				AND ARR.categoryID = SLS.categoryID
				LEFT JOIN (
					SELECT --Sum of pending orders per sl category
						 LCS.stockLocationID
						,LCS.categoryID  
						,SUM(ART.quantity) AS [orderedInventory]
					FROM Symphony_AssortmentReplenishmentTracking ART
					INNER JOIN #LocationCatalogSkusEx LCS
						ON LCS.skuID = ART.skuID
						AND LCS.stockLocationID = ART.stockLocationID
					GROUP BY LCS.stockLocationID,LCS.categoryID) ART
				ON ART.stockLocationID = SLS.stockLocationID
				AND ART.categoryID = SLS.categoryID
		) TMP
		
	INNER JOIN #LocationCatalogSkusEx LCS
	ON LCS.categoryID = TMP.categoryID
	AND LCS.stockLocationID = TMP.stockLocationID
	
	PRINT 'Table Results Created'

	SELECT 
		 [stockLocationName]
		,[categoryName]
		,[DELTA]
		,[normLevel]
		,[allowance]
		,[totalPipeLine]
		,[pipeLine]
		,[orderedInventory]
		,[recommendedInventory]
		,[npiCount]
		,[mtrCount]
		,[stockLocationID]
		,[categoryID]
	FROM @Results
	WHERE [DELTA] < 0
	AND [normLevel] <= [allowance]
	ORDER BY [stockLocationName], [categoryName]

	SELECT 
		 [stockLocationName]
		,[categoryName]
		,[DELTA]
		,[normLevel]
		,[allowance]
		,[totalPipeLine]
		,[pipeLine]
		,[orderedInventory]
		,[recommendedInventory]
		,[npiCount]
		,[mtrCount]
		,[stockLocationID]
		,[categoryID]
	FROM @Results
	WHERE [DELTA] > 0
	AND ISNULL([recommendedInventory],0) <> ([npiCount] + [mtrCount])
	ORDER BY [stockLocationName], [categoryName]

	SELECT 
		 [stockLocationName]
		,[categoryName]
		,[DELTA]
		,[normLevel]
		,[allowance]
		,[totalPipeLine]
		,[pipeLine]
		,[orderedInventory]
		,[recommendedInventory]
		,[npiCount]
		,[mtrCount]
		,[stockLocationID]
		,[categoryID]
	FROM @Results
	
	END
GO
/****** Object:  StoredProcedure [dbo].[BeforeCreate]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[BeforeCreate] 
	-- Add the parameters for the stored procedure here
	@objectType sysname,
	@objectName sysname
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	IF OBJECT_ID(@objectName) IS NOT NULL
	BEGIN
		EXEC ('DROP ' + @objectType + ' ' + @objectName)
		IF OBJECT_ID(@objectName) IS NOT NULL
			PRINT '<<< FAILED DROPPING ' + @objectType + ' ' + @objectName + ' >>>'
		ELSE
			PRINT '<<< DROPPED ' + @objectType + ' ' + @objectName + ' >>>'
	END

END
GO
/****** Object:  StoredProcedure [dbo].[Client_Batch_Virtual_WH]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Client_Batch_Virtual_WH]
AS
BEGIN

DROP TABLE BATCH_WH

CREATE TABLE BATCH_WH
(SKU nvarchar(100),
SL nvarchar (100),
SLoc nvarchar (100),
Stock_at_site numeric (18,5), 
Batch nvarchar (100),)

BULK INSERT BATCH_WH
FROM 'E:\SymphonyData\BatchWH\BatchWH.csv' 
WITH
(
FIRSTROW = 2, 
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)



declare @cmd1 varchar(1000)

set @cmd1 = 'move "E:\SymphonyData\BatchWH\"Batch*.* "E:\SymphonyData\BatchWH\Archive\"'


EXEC Master..xp_cmdShell @cmd1

end
GO
/****** Object:  StoredProcedure [dbo].[Client_ProcessDataForVendorEmail]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--select top 1 * from Dealer_wise_Data 
--exec Client_ProcessDataForVendorEmail
CREATE proc [dbo].[Client_ProcessDataForVendorEmail]
as
begin


/*
create table Client_VendorEmailTable
(
DealerCode nvarchar(200)
,CustomerName nvarchar(200)
,Filename nvarchar(200)
,ReportDate datetime
,ind01 int default 0
)

select * from Client_VendorEmailTable
*/

truncate table Client_VendorEmailTable

insert into Client_VendorEmailTable
select distinct [Dealer code],	Customer_Name,'',getdate(), 0 as 'ind01' from Dealer_wise_Data

declare @var_DealerCount int,@var_DealerCode nvarchar(100),@var_filedate nvarchar(10)

set @var_DealerCount=(select isnull(count(*),0) from Client_VendorEmailTable)

set @var_filedate=(select top 1 replace(convert(nvarchar(10),reportdate,102),'.','_') from Client_VendorEmailTable)

while @var_DealerCount<>0
begin
set @var_DealerCode=(select top 1 dealercode from Client_VendorEmailTable where ind01=0)

truncate table HRJ_EmailData_Send

insert into HRJ_EmailData_Send  
values('Region'
,'Dealercode'
,'Customer_Name'
,'HRJSKUcode'
,'HRJParentSKUcode'
,'HRJSKUDescription'
,'Dealer_SKUDescription'
,'Division'
,'bufferSize'
,'inventoryAtSite'
,'InventoryAtTransit'
,'SuggestedReplenishmentQty'
,'SuggestedReplenishmentQty_in_M2'
,'Parent_code_SiteColor'
,'Parent_code_TransitColor'

)


insert into HRJ_EmailData_Send 
select *  from Dealer_wise_Data where [Dealer code]=@var_DealerCode


begin

declare @OutputFile nvarchar(100), @FilePath NVARCHAR(100) ,@bcpCommand NVARCHAR(1000) 

SET @bcpCommand = 'bcp "SELECT * FROM [Symphony_HRJ].[dbo].[HRJ_EmailData_Send]"  queryout ' 

SET @FilePath = '"E:\AutoEmail\'

SELECT @OutputFile='Dealer_Replenishment_'+@var_DealerCode+'_'+@var_filedate +'.CSV"' FROM [SYMPHONY_HRJ].[dbo].[HRJ_EmailData_Send]
                 
SET @bcpCommand = @bcpCommand + @FilePath + @OutputFile + ' -T -t"," -S "LOCALHOST" -c'                  
print @bcpcommand                
EXEC master..xp_cmdshell @bcpCommand , no_output

/*
update Client_VendorEmailTable set filename='Dealer_Replenishment_'+@var_DealerCode+'_'+@var_filedate +'.CSV' where DealerCode=@var_DealerCode */
update Client_VendorEmailTable set filename='Dealer_Replenishment_'+@var_DealerCode+'_'+@var_filedate  where DealerCode=@var_DealerCode
end

update Client_VendorEmailTable set ind01=1 where DealerCode=@var_DealerCode
set @var_DealerCount=@var_DealerCount-1
end

/*CSV Generation is completed*/

end





GO
/****** Object:  StoredProcedure [dbo].[Client_SendVendorEmail]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
--exec Client_SendVendorEmail

 

CREATE proc [dbo].[Client_SendVendorEmail]
as
begin
delete from Client_VendorEmailTable where len(filename) < 10

declare @var_count int,@var_dealercode nvarchar(100),@var_filename nvarchar(100),@var_customername nvarchar(100)
declare @ReportDate nvarchar(10),@var_email nvarchar(100)

set @var_count=580

while @var_count<>0
begin
set @var_email=''
set @var_dealercode=(select top 1 dealercode from Client_VendorEmailTable where ind01=1 and convert(date,reportdate)=convert(date,getdate()))
set @var_email=(select slpi.slItemName from Symphony_StockLocations SL left join Symphony_StockLocationPropertyItems slpi
on sl.slpropertyid7=slpi.slItemID  where sl.stockLocationName=@var_dealercode and sl.slPropertyID7 is not null and 
slpi.slPropertyID = 'slpropertyid7')
set @var_filename=(select top 1 filename from Client_VendorEmailTable where DealerCode=@var_dealercode and ind01=1)
set @var_customername=(select top 1 CustomerName from Client_VendorEmailTable where DealerCode=@var_dealercode and ind01=1)
set @ReportDate=(convert(nvarchar(4),datepart(yyyy,getdate()))+'_'+ case when len(convert(nvarchar(2),datepart(mm,getdate())))=1 then ('0'+convert(nvarchar(2),datepart(mm,getdate()))) else convert(nvarchar(2),datepart(mm,getdate())) end +'_'+
case when len(convert(nvarchar(2),datepart(dd,getdate())))=1 then ('0'+convert(nvarchar(2),datepart(dd,getdate()))) else convert(nvarchar(2),datepart(dd,getdate())) end )

if len(@var_email) > 2
begin
 exec obp_HRJVendorDailyEmail @var_email,@var_customername,@var_dealercode,@var_filename,@ReportDate
end
print @var_dealercode
update Client_VendorEmailTable set ind01=2 where DealerCode=@var_dealercode
set @var_count=@var_count-1

if not exists(select * from Client_VendorEmailTable where ind01=1)
begin
set @var_count=0
end

end

end
GO
/****** Object:  StoredProcedure [dbo].[Client_SP__Unmapped_SKU]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP__Unmapped_SKU]
AS
BEGIN

IF (OBJECT_ID('Client_STATUS_TEMP_Excep') IS NOT NULL)
drop table Client_STATUS_TEMP_Excep;

create table Client_STATUS_TEMP_Excep
(SKU nvarchar(100),
SL nvarchar(100),
Year nvarchar(10),
Month nvarchar(10),
Day nvarchar(10),
INV_Site nvarchar(100),
Inv_Transit nvarchar(100),
Dist_code nvarchar(400),

)

IF (OBJECT_ID('allfilenames') IS NOT NULL)
drop table allfilenames;

IF (OBJECT_ID('bulkact') IS NOT NULL)
drop table bulkact;

CREATE TABLE ALLFILENAMES(WHICHPATH VARCHAR(255),WHICHFILE varchar(255))
CREATE TABLE BULKACT(RAWDATA VARCHAR (8000))
declare @filename varchar(255),
        @path     varchar(255),
        @sql      varchar(8000),
        @cmd      varchar(1000)



SET @path = 'E:\SymphonyData\Status_Exception\'
SET @cmd = 'dir "' + @path + '" *.csv /b'
INSERT INTO  ALLFILENAMES(WHICHFILE)
EXEC Master..xp_cmdShell @cmd
UPDATE ALLFILENAMES SET WHICHPATH = @path where WHICHPATH is null

--cursor loop
    declare c1 cursor for SELECT WHICHPATH,WHICHFILE FROM ALLFILENAMES where WHICHFILE like 'STATUS_site_%.csv%'
    open c1
    fetch next from c1 into @path,@filename
    While @@fetch_status <> -1
      begin
      --bulk insert won't take a variable name, so make a sql and execute it instead:
       set @sql = 'BULK INSERT Client_STATUS_TEMP_Excep FROM ''' + @path + @filename + ''' '
           + '     WITH ( 
                   FIELDTERMINATOR = '','', 
                   ROWTERMINATOR = ''\n'', 
                   FIRSTROW = 2 
                ) '
    print @sql
    exec (@sql)

      fetch next from c1 into @path,@filename
      end
    close c1
    deallocate c1



end
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_AvailabilityReport_IPNR]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_AvailabilityReport_IPNR]
AS
BEGIN

select SL.stockLocationName, SLS.locationSkuName,sls.skuDescription, 
SKUPI1.skuItemName [Division]
,SLS.custom_txt3 [Business], SLS.custom_txt5 [Material Frieght Group],
SLS.bufferSize,
SLS.inventoryAtSite,  
SLS.InventoryAtTransit,
Case WHEN SLS.siteColor =0 THEN 'Cyan' 
     WHEN SLS.SiteColor =1 then 'Green' 
WHEN SLS.SiteColor =2 then 'Yellow' 
WHEN SLS.SiteColor =3 then 'Red' 
WHEN SLS.SiteColor =4 then 'Black'  
END [SiteColor],
Case WHEN SLS.TransitColor =0 THEN 'Cyan' 
     WHEN SLS.TransitColor =1 then 'Green' 
WHEN SLS.TransitColor =2 then 'Yellow' 
WHEN SLS.TransitColor =3 then 'Red' 
WHEN SLS.TransitColor =4 then 'Black'  
END [TransitColor],
RCONS.LastWeeksConsumption, RCONS.SiteStockoutDaysLastWeek, MCONS.Last30DaysConsumption, MCONS.SiteStockoutDaysLast30Days,
TMCONS.Last60DaysConsumption, TMCONS.SiteStockoutDaysLast60Days,
HMCONS.Last90DaysConsumption, HMCONS.SiteStockoutDaysLast90Days,
isnull(wavd.AvailableDaysLastWeek,0) as AvailableDaysLastWeek,
isnull(mavd.AvailableLast30Days,0) as AvailableLast30Days,
isnull(tmavd.AvailableLast60Days,0) as AvailableLast60Days,
isnull(Hmavd.AvailableLast90Days,0) as AvailableLast90Days,
OSL.StockLocationName [OriginWH],isnull(awh1.WHnewsiteStock,0) as [WH site Stock]
,isnull(ceiling(awh.LastWeekAverageWHsiteStock),0) as LastWeekAverageWHsiteStock,
FINW.firstInwarddate, datediff(day, FINW.firstInwarddate, getdate()+1) [DaysSinceFirstInward]
,sls.custom_txt10 as [National HBT]
,HMCONS.Last90DaysConsumption/nullif(Hmavd.AvailableLast90Days,0) as [ROS_90days]
from Symphony_StockLocationSkus SLS
join Symphony_StockLocations SL on SL.stockLocationID = SLS.stockLocationID
Left JOIN Symphony_SkusPropertyItems SKUPI1 ON SLS.skuPropertyID1 = SKUPI1.skuItemID
Left JOIN Symphony_SkusPropertyItems SKUPI2 ON SLS.skuPropertyID2 = SKUPI2.skuItemID
Left JOIN Symphony_SkusPropertyItems SKUPI3 ON SLS.skuPropertyID3 = SKUPI3.skuItemID
Left JOIN Symphony_SkusPropertyItems SKUPI4 ON SLS.skuPropertyID4 = SKUPI4.skuItemID
Left join Symphony_Stocklocations OSL on OSL.stockLocationID = SLS.originStockLocation 

join (select stocklocationID, skuID, min(updatedate) [firstInwarddate] from Symphony_StockLocationSkuhistory 
where totalIn>0 OR InventoryAtSite>0 OR Consumption>0
group by stocklocationID, skuID) FINW on FINW.stocklocationID = SLS.stocklocationID and  FINW.skuID = SLS.skuID


left join (select SLSH.stockLocationID, SLSH.skuID, 
Sum ( Case when (totalIn>0 OR InventoryAtSite>0 OR Consumption>0) then 1 else 0 End ) [AvailableDaysLastWeek]
from Symphony_stocklocationskuhistory SLSH
where updateDate >= convert(date,GETDATE()-6)
group by SLSH.stockLocationID, SLSH.skuID ) WAVD on WAVD.stockLocationID = SLS.stockLocationID and WAVD.skuID = SLS.skuID

left join (select SLSH.stockLocationID, SLSH.skuID, 
Sum ( Case when (totalIn>0 OR InventoryAtSite>0 OR Consumption>0) then 1 else 0 End ) [AvailableLast30Days]
from Symphony_stocklocationskuhistory SLSH
where updateDate >= convert(date,GETDATE()-29)
group by SLSH.stockLocationID, SLSH.skuID ) MAVD on MAVD.stockLocationID = SLS.stockLocationID and MAVD.skuID = SLS.skuID

left join (select SLSH.stockLocationID, SLSH.skuID, 
Sum ( Case when (totalIn>0 OR InventoryAtSite>0 OR Consumption>0) then 1 else 0 End ) [AvailableLast60Days]
from Symphony_stocklocationskuhistory SLSH
where updateDate >=  convert(date,GETDATE()-59)
group by SLSH.stockLocationID, SLSH.skuID ) TMAVD on TMAVD.stockLocationID = SLS.stockLocationID and TMAVD.skuID = SLS.skuID

left join (select SLSH.stockLocationID, SLSH.skuID, 
Sum ( Case when (totalIn>0 OR InventoryAtSite>0 OR Consumption>0) then 1 else 0 End ) [AvailableLast90Days]
from Symphony_stocklocationskuhistory SLSH
where updateDate >=  convert(date,GETDATE()-89)
group by SLSH.stockLocationID, SLSH.skuID ) HMAVD on HMAVD.stockLocationID = SLS.stockLocationID and HMAVD.skuID = SLS.skuID



left join (select SLSH.stockLocationID, SLSH.skuID, avg(SLSH.inventoryAtSite) [LastWeekAverageWHsiteStock]
from Symphony_stocklocationskuhistory SLSH
where updateDate >=  convert(date,GETDATE()-6) 
group by SLSH.stockLocationID, SLSH.skuID ) AWH on AWH.stockLocationID = OSL.stockLocationID and AWH.skuID = SLS.skuID

left join (select distinct SLSH.stockLocationID, SLSH.skuID,SLSH.inventoryAtSite [WHnewsiteStock]
from Symphony_StockLocationSkus SLSh
) AWH1 on AWH1.stockLocationID = OSL.stockLocationID and AWH1.skuID = sls.skuID

left join (select SLSH.stockLocationID, SLSH.skuID, SUM(SLSH.consumption) [LastWeeksConsumption],
Sum ( Case when SLSH.InventoryAtSite > 0 or totalIn>0 OR InventoryAtSite>0 OR Consumption>0 then 0 else 1 End ) [SiteStockoutDaysLastWeek]
from Symphony_stocklocationskuhistory SLSH
join (select stocklocationID, skuID, min(updatedate) [firstInwarddate] from Symphony_StockLocationSkuhistory 
where totalIn>0 OR InventoryAtSite>0 OR Consumption>0
group by stocklocationID, skuID) FINW on FINW.stocklocationID = SLSH.stocklocationID and  FINW.skuID = SLSH.skuID
where updateDate >= convert(date,GETDATE()-6) and updatedate > convert(date,finw.firstInwarddate)
group by SLSH.stockLocationID, SLSH.skuID ) RCONS on RCONS.stockLocationID = SLS.stockLocationID and RCONS.skuID = SLS.skuID

left join (select SLSH.stockLocationID, SLSH.skuID, SUM(SLSH.consumption) [Last30DaysConsumption],
Sum ( Case when SLSH.InventoryAtSite > 0 or totalIn>0 OR InventoryAtSite>0 OR Consumption>0 then 0 else 1 End ) [SiteStockoutDaysLast30Days]
from Symphony_stocklocationskuhistory SLSH
join (select stocklocationID, skuID, min(updatedate) [firstInwarddate] from Symphony_StockLocationSkuhistory 
where totalIn>0 OR InventoryAtSite>0 OR Consumption>0
group by stocklocationID, skuID) FINW on FINW.stocklocationID = SLSH.stocklocationID and  FINW.skuID = SLSH.skuID
where updateDate >= convert(date,GETDATE()-29) and updatedate > convert(date,finw.firstInwarddate)
group by SLSH.stockLocationID, SLSH.skuID ) MCONS on MCONS.stockLocationID = SLS.stockLocationID and MCONS.skuID = SLS.skuID

left join (select SLSH.stockLocationID, SLSH.skuID, SUM(SLSH.consumption) [Last60DaysConsumption],
Sum ( Case when SLSH.InventoryAtSite > 0 or totalIn>0 OR InventoryAtSite>0 OR Consumption>0 then 0 else 1 End ) [SiteStockoutDaysLast60Days]
from Symphony_stocklocationskuhistory SLSH
join (select stocklocationID, skuID, min(updatedate) [firstInwarddate] from Symphony_StockLocationSkuhistory 
where totalIn>0 OR InventoryAtSite>0 OR Consumption>0
group by stocklocationID, skuID) FINW on FINW.stocklocationID = SLSH.stocklocationID and  FINW.skuID = SLSH.skuID
where updateDate >= convert(date,GETDATE()-59) and updatedate > convert(date,finw.firstInwarddate)
group by SLSH.stockLocationID, SLSH.skuID ) TMCONS on TMCONS.stockLocationID = SLS.stockLocationID and TMCONS.skuID = SLS.skuID


left join (select SLSH.stockLocationID, SLSH.skuID, SUM(SLSH.consumption) [Last90DaysConsumption],
Sum ( Case when SLSH.InventoryAtSite > 0 or totalIn>0 OR InventoryAtSite>0 OR Consumption>0 then 0 else 1 End ) [SiteStockoutDaysLast90Days]
from Symphony_stocklocationskuhistory SLSH
join (select stocklocationID, skuID, min(updatedate) [firstInwarddate] from Symphony_StockLocationSkuhistory 
where totalIn>0 OR InventoryAtSite>0 OR Consumption>0
group by stocklocationID, skuID) FINW on FINW.stocklocationID = SLSH.stocklocationID and  FINW.skuID = SLSH.skuID
where updateDate >= convert(date,GETDATE()-89) and updatedate > convert(date,finw.firstInwarddate)
group by SLSH.stockLocationID, SLSH.skuID ) HMCONS on HMCONS.stockLocationID = SLS.stockLocationID and HMCONS.skuID = SLS.skuID


where SLS.isDeleted = 0 and sl.stockLocationType=5 and sls.custom_txt3='IPNR'
--order by SL.stockLocationName, SLS.locationSkuName;



end
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_AvailabilityReport_JBD]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_AvailabilityReport_JBD]
AS
BEGIN

select SL.stockLocationName, SLS.locationSkuName,sls.skuDescription, 
SKUPI1.skuItemName [Division]
,SLS.custom_txt3 [Business], SLS.custom_txt5 [Material Frieght Group],
SLS.bufferSize,
SLS.inventoryAtSite,  
SLS.InventoryAtTransit,
Case WHEN SLS.siteColor =0 THEN 'Cyan' 
     WHEN SLS.SiteColor =1 then 'Green' 
WHEN SLS.SiteColor =2 then 'Yellow' 
WHEN SLS.SiteColor =3 then 'Red' 
WHEN SLS.SiteColor =4 then 'Black'  
END [SiteColor],
Case WHEN SLS.TransitColor =0 THEN 'Cyan' 
     WHEN SLS.TransitColor =1 then 'Green' 
WHEN SLS.TransitColor =2 then 'Yellow' 
WHEN SLS.TransitColor =3 then 'Red' 
WHEN SLS.TransitColor =4 then 'Black'  
END [TransitColor],
RCONS.LastWeeksConsumption, RCONS.SiteStockoutDaysLastWeek, MCONS.Last30DaysConsumption, MCONS.SiteStockoutDaysLast30Days,
TMCONS.Last60DaysConsumption, TMCONS.SiteStockoutDaysLast60Days,
HMCONS.Last90DaysConsumption, HMCONS.SiteStockoutDaysLast90Days,
isnull(wavd.AvailableDaysLastWeek,0) as AvailableDaysLastWeek,
isnull(mavd.AvailableLast30Days,0) as AvailableLast30Days,
isnull(tmavd.AvailableLast60Days,0) as AvailableLast60Days,
isnull(Hmavd.AvailableLast90Days,0) as AvailableLast90Days,
OSL.StockLocationName [OriginWH],isnull(awh1.WHnewsiteStock,0) as [WH site Stock]
,isnull(ceiling(awh.LastWeekAverageWHsiteStock),0) as LastWeekAverageWHsiteStock,
FINW.firstInwarddate, datediff(day, FINW.firstInwarddate, getdate()+1) [DaysSinceFirstInward]
,sls.custom_txt10 as [National HBT]
,HMCONS.Last90DaysConsumption/nullif(Hmavd.AvailableLast90Days,0) as [ROS_90days]
from Symphony_StockLocationSkus SLS
join Symphony_StockLocations SL on SL.stockLocationID = SLS.stockLocationID
Left JOIN Symphony_SkusPropertyItems SKUPI1 ON SLS.skuPropertyID1 = SKUPI1.skuItemID
Left JOIN Symphony_SkusPropertyItems SKUPI2 ON SLS.skuPropertyID2 = SKUPI2.skuItemID
Left JOIN Symphony_SkusPropertyItems SKUPI3 ON SLS.skuPropertyID3 = SKUPI3.skuItemID
Left JOIN Symphony_SkusPropertyItems SKUPI4 ON SLS.skuPropertyID4 = SKUPI4.skuItemID
Left join Symphony_Stocklocations OSL on OSL.stockLocationID = SLS.originStockLocation 

join (select stocklocationID, skuID, min(updatedate) [firstInwarddate] from Symphony_StockLocationSkuhistory 
where totalIn>0 OR InventoryAtSite>0 OR Consumption>0
group by stocklocationID, skuID) FINW on FINW.stocklocationID = SLS.stocklocationID and  FINW.skuID = SLS.skuID


left join (select SLSH.stockLocationID, SLSH.skuID, 
Sum ( Case when (totalIn>0 OR InventoryAtSite>0 OR Consumption>0) then 1 else 0 End ) [AvailableDaysLastWeek]
from Symphony_stocklocationskuhistory SLSH
where updateDate >= convert(date,GETDATE()-6)
group by SLSH.stockLocationID, SLSH.skuID ) WAVD on WAVD.stockLocationID = SLS.stockLocationID and WAVD.skuID = SLS.skuID

left join (select SLSH.stockLocationID, SLSH.skuID, 
Sum ( Case when (totalIn>0 OR InventoryAtSite>0 OR Consumption>0) then 1 else 0 End ) [AvailableLast30Days]
from Symphony_stocklocationskuhistory SLSH
where updateDate >= convert(date,GETDATE()-29)
group by SLSH.stockLocationID, SLSH.skuID ) MAVD on MAVD.stockLocationID = SLS.stockLocationID and MAVD.skuID = SLS.skuID

left join (select SLSH.stockLocationID, SLSH.skuID, 
Sum ( Case when (totalIn>0 OR InventoryAtSite>0 OR Consumption>0) then 1 else 0 End ) [AvailableLast60Days]
from Symphony_stocklocationskuhistory SLSH
where updateDate >=  convert(date,GETDATE()-59)
group by SLSH.stockLocationID, SLSH.skuID ) TMAVD on TMAVD.stockLocationID = SLS.stockLocationID and TMAVD.skuID = SLS.skuID

left join (select SLSH.stockLocationID, SLSH.skuID, 
Sum ( Case when (totalIn>0 OR InventoryAtSite>0 OR Consumption>0) then 1 else 0 End ) [AvailableLast90Days]
from Symphony_stocklocationskuhistory SLSH
where updateDate >=  convert(date,GETDATE()-89)
group by SLSH.stockLocationID, SLSH.skuID ) HMAVD on HMAVD.stockLocationID = SLS.stockLocationID and HMAVD.skuID = SLS.skuID



left join (select SLSH.stockLocationID, SLSH.skuID, avg(SLSH.inventoryAtSite) [LastWeekAverageWHsiteStock]
from Symphony_stocklocationskuhistory SLSH
where updateDate >=  convert(date,GETDATE()-6) 
group by SLSH.stockLocationID, SLSH.skuID ) AWH on AWH.stockLocationID = OSL.stockLocationID and AWH.skuID = SLS.skuID

left join (select distinct SLSH.stockLocationID, SLSH.skuID,SLSH.inventoryAtSite [WHnewsiteStock]
from Symphony_StockLocationSkus SLSh
) AWH1 on AWH1.stockLocationID = OSL.stockLocationID and AWH1.skuID = sls.skuID

left join (select SLSH.stockLocationID, SLSH.skuID, SUM(SLSH.consumption) [LastWeeksConsumption],
Sum ( Case when SLSH.InventoryAtSite > 0 or totalIn>0 OR InventoryAtSite>0 OR Consumption>0 then 0 else 1 End ) [SiteStockoutDaysLastWeek]
from Symphony_stocklocationskuhistory SLSH
join (select stocklocationID, skuID, min(updatedate) [firstInwarddate] from Symphony_StockLocationSkuhistory 
where totalIn>0 OR InventoryAtSite>0 OR Consumption>0
group by stocklocationID, skuID) FINW on FINW.stocklocationID = SLSH.stocklocationID and  FINW.skuID = SLSH.skuID
where updateDate >= convert(date,GETDATE()-6) and updatedate > convert(date,finw.firstInwarddate)
group by SLSH.stockLocationID, SLSH.skuID ) RCONS on RCONS.stockLocationID = SLS.stockLocationID and RCONS.skuID = SLS.skuID

left join (select SLSH.stockLocationID, SLSH.skuID, SUM(SLSH.consumption) [Last30DaysConsumption],
Sum ( Case when SLSH.InventoryAtSite > 0 or totalIn>0 OR InventoryAtSite>0 OR Consumption>0 then 0 else 1 End ) [SiteStockoutDaysLast30Days]
from Symphony_stocklocationskuhistory SLSH
join (select stocklocationID, skuID, min(updatedate) [firstInwarddate] from Symphony_StockLocationSkuhistory 
where totalIn>0 OR InventoryAtSite>0 OR Consumption>0
group by stocklocationID, skuID) FINW on FINW.stocklocationID = SLSH.stocklocationID and  FINW.skuID = SLSH.skuID
where updateDate >= convert(date,GETDATE()-29) and updatedate > convert(date,finw.firstInwarddate)
group by SLSH.stockLocationID, SLSH.skuID ) MCONS on MCONS.stockLocationID = SLS.stockLocationID and MCONS.skuID = SLS.skuID

left join (select SLSH.stockLocationID, SLSH.skuID, SUM(SLSH.consumption) [Last60DaysConsumption],
Sum ( Case when SLSH.InventoryAtSite > 0 or totalIn>0 OR InventoryAtSite>0 OR Consumption>0 then 0 else 1 End ) [SiteStockoutDaysLast60Days]
from Symphony_stocklocationskuhistory SLSH
join (select stocklocationID, skuID, min(updatedate) [firstInwarddate] from Symphony_StockLocationSkuhistory 
where totalIn>0 OR InventoryAtSite>0 OR Consumption>0
group by stocklocationID, skuID) FINW on FINW.stocklocationID = SLSH.stocklocationID and  FINW.skuID = SLSH.skuID
where updateDate >= convert(date,GETDATE()-59) and updatedate > convert(date,finw.firstInwarddate)
group by SLSH.stockLocationID, SLSH.skuID ) TMCONS on TMCONS.stockLocationID = SLS.stockLocationID and TMCONS.skuID = SLS.skuID


left join (select SLSH.stockLocationID, SLSH.skuID, SUM(SLSH.consumption) [Last90DaysConsumption],
Sum ( Case when SLSH.InventoryAtSite > 0 or totalIn>0 OR InventoryAtSite>0 OR Consumption>0 then 0 else 1 End ) [SiteStockoutDaysLast90Days]
from Symphony_stocklocationskuhistory SLSH
join (select stocklocationID, skuID, min(updatedate) [firstInwarddate] from Symphony_StockLocationSkuhistory 
where totalIn>0 OR InventoryAtSite>0 OR Consumption>0
group by stocklocationID, skuID) FINW on FINW.stocklocationID = SLSH.stocklocationID and  FINW.skuID = SLSH.skuID
where updateDate >= convert(date,GETDATE()-89) and updatedate > convert(date,finw.firstInwarddate)
group by SLSH.stockLocationID, SLSH.skuID ) HMCONS on HMCONS.stockLocationID = SLS.stockLocationID and HMCONS.skuID = SLS.skuID


where SLS.isDeleted = 0 and sl.stockLocationType=5 and sls.custom_txt3='JBD'
--order by SL.stockLocationName, SLS.locationSkuName;

end
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_AvailabilityReport_TILES]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_AvailabilityReport_TILES]
AS
BEGIN

select SL.stockLocationName, SLS.locationSkuName,sls.skuDescription, 
SKUPI1.skuItemName [Division]
,SLS.custom_txt3 [Business], SLS.custom_txt5 [Material Frieght Group],
SLS.bufferSize,
SLS.inventoryAtSite,  
SLS.InventoryAtTransit,
Case WHEN SLS.siteColor =0 THEN 'Cyan' 
     WHEN SLS.SiteColor =1 then 'Green' 
WHEN SLS.SiteColor =2 then 'Yellow' 
WHEN SLS.SiteColor =3 then 'Red' 
WHEN SLS.SiteColor =4 then 'Black'  
END [SiteColor],
Case WHEN SLS.TransitColor =0 THEN 'Cyan' 
     WHEN SLS.TransitColor =1 then 'Green' 
WHEN SLS.TransitColor =2 then 'Yellow' 
WHEN SLS.TransitColor =3 then 'Red' 
WHEN SLS.TransitColor =4 then 'Black'  
END [TransitColor],
RCONS.LastWeeksConsumption, RCONS.SiteStockoutDaysLastWeek, MCONS.Last30DaysConsumption, MCONS.SiteStockoutDaysLast30Days,
TMCONS.Last60DaysConsumption, TMCONS.SiteStockoutDaysLast60Days,
HMCONS.Last90DaysConsumption, HMCONS.SiteStockoutDaysLast90Days,
isnull(wavd.AvailableDaysLastWeek,0) as AvailableDaysLastWeek,
isnull(mavd.AvailableLast30Days,0) as AvailableLast30Days,
isnull(tmavd.AvailableLast60Days,0) as AvailableLast60Days,
isnull(Hmavd.AvailableLast90Days,0) as AvailableLast90Days,
OSL.StockLocationName [OriginWH],isnull(awh1.WHnewsiteStock,0) as [WH site Stock]
,isnull(ceiling(awh.LastWeekAverageWHsiteStock),0) as LastWeekAverageWHsiteStock,
FINW.firstInwarddate, datediff(day, FINW.firstInwarddate, getdate()+1) [DaysSinceFirstInward]
,sls.custom_txt10 as [National HBT]
,HMCONS.Last90DaysConsumption/nullif(Hmavd.AvailableLast90Days,0) as [ROS_90days]
from Symphony_StockLocationSkus SLS
join Symphony_StockLocations SL on SL.stockLocationID = SLS.stockLocationID
Left JOIN Symphony_SkusPropertyItems SKUPI1 ON SLS.skuPropertyID1 = SKUPI1.skuItemID
Left JOIN Symphony_SkusPropertyItems SKUPI2 ON SLS.skuPropertyID2 = SKUPI2.skuItemID
Left JOIN Symphony_SkusPropertyItems SKUPI3 ON SLS.skuPropertyID3 = SKUPI3.skuItemID
Left JOIN Symphony_SkusPropertyItems SKUPI4 ON SLS.skuPropertyID4 = SKUPI4.skuItemID
Left join Symphony_Stocklocations OSL on OSL.stockLocationID = SLS.originStockLocation 

join (select stocklocationID, skuID, min(updatedate) [firstInwarddate] from Symphony_StockLocationSkuhistory 
where totalIn>0 OR InventoryAtSite>0 OR Consumption>0
group by stocklocationID, skuID) FINW on FINW.stocklocationID = SLS.stocklocationID and  FINW.skuID = SLS.skuID


left join (select SLSH.stockLocationID, SLSH.skuID, 
Sum ( Case when (totalIn>0 OR InventoryAtSite>0 OR Consumption>0) then 1 else 0 End ) [AvailableDaysLastWeek]
from Symphony_stocklocationskuhistory SLSH
where updateDate >= convert(date,GETDATE()-6)
group by SLSH.stockLocationID, SLSH.skuID ) WAVD on WAVD.stockLocationID = SLS.stockLocationID and WAVD.skuID = SLS.skuID

left join (select SLSH.stockLocationID, SLSH.skuID, 
Sum ( Case when (totalIn>0 OR InventoryAtSite>0 OR Consumption>0) then 1 else 0 End ) [AvailableLast30Days]
from Symphony_stocklocationskuhistory SLSH
where updateDate >= convert(date,GETDATE()-29)
group by SLSH.stockLocationID, SLSH.skuID ) MAVD on MAVD.stockLocationID = SLS.stockLocationID and MAVD.skuID = SLS.skuID

left join (select SLSH.stockLocationID, SLSH.skuID, 
Sum ( Case when (totalIn>0 OR InventoryAtSite>0 OR Consumption>0) then 1 else 0 End ) [AvailableLast60Days]
from Symphony_stocklocationskuhistory SLSH
where updateDate >=  convert(date,GETDATE()-59)
group by SLSH.stockLocationID, SLSH.skuID ) TMAVD on TMAVD.stockLocationID = SLS.stockLocationID and TMAVD.skuID = SLS.skuID

left join (select SLSH.stockLocationID, SLSH.skuID, 
Sum ( Case when (totalIn>0 OR InventoryAtSite>0 OR Consumption>0) then 1 else 0 End ) [AvailableLast90Days]
from Symphony_stocklocationskuhistory SLSH
where updateDate >=  convert(date,GETDATE()-89)
group by SLSH.stockLocationID, SLSH.skuID ) HMAVD on HMAVD.stockLocationID = SLS.stockLocationID and HMAVD.skuID = SLS.skuID



left join (select SLSH.stockLocationID, SLSH.skuID, avg(SLSH.inventoryAtSite) [LastWeekAverageWHsiteStock]
from Symphony_stocklocationskuhistory SLSH
where updateDate >=  convert(date,GETDATE()-6) 
group by SLSH.stockLocationID, SLSH.skuID ) AWH on AWH.stockLocationID = OSL.stockLocationID and AWH.skuID = SLS.skuID

left join (select distinct SLSH.stockLocationID, SLSH.skuID,SLSH.inventoryAtSite [WHnewsiteStock]
from Symphony_StockLocationSkus SLSh
) AWH1 on AWH1.stockLocationID = OSL.stockLocationID and AWH1.skuID = sls.skuID

left join (select SLSH.stockLocationID, SLSH.skuID, SUM(SLSH.consumption) [LastWeeksConsumption],
Sum ( Case when SLSH.InventoryAtSite > 0 or totalIn>0 OR InventoryAtSite>0 OR Consumption>0 then 0 else 1 End ) [SiteStockoutDaysLastWeek]
from Symphony_stocklocationskuhistory SLSH
join (select stocklocationID, skuID, min(updatedate) [firstInwarddate] from Symphony_StockLocationSkuhistory 
where totalIn>0 OR InventoryAtSite>0 OR Consumption>0
group by stocklocationID, skuID) FINW on FINW.stocklocationID = SLSH.stocklocationID and  FINW.skuID = SLSH.skuID
where updateDate >= convert(date,GETDATE()-6) and updatedate > convert(date,finw.firstInwarddate)
group by SLSH.stockLocationID, SLSH.skuID ) RCONS on RCONS.stockLocationID = SLS.stockLocationID and RCONS.skuID = SLS.skuID

left join (select SLSH.stockLocationID, SLSH.skuID, SUM(SLSH.consumption) [Last30DaysConsumption],
Sum ( Case when SLSH.InventoryAtSite > 0 or totalIn>0 OR InventoryAtSite>0 OR Consumption>0 then 0 else 1 End ) [SiteStockoutDaysLast30Days]
from Symphony_stocklocationskuhistory SLSH
join (select stocklocationID, skuID, min(updatedate) [firstInwarddate] from Symphony_StockLocationSkuhistory 
where totalIn>0 OR InventoryAtSite>0 OR Consumption>0
group by stocklocationID, skuID) FINW on FINW.stocklocationID = SLSH.stocklocationID and  FINW.skuID = SLSH.skuID
where updateDate >= convert(date,GETDATE()-29) and updatedate > convert(date,finw.firstInwarddate)
group by SLSH.stockLocationID, SLSH.skuID ) MCONS on MCONS.stockLocationID = SLS.stockLocationID and MCONS.skuID = SLS.skuID

left join (select SLSH.stockLocationID, SLSH.skuID, SUM(SLSH.consumption) [Last60DaysConsumption],
Sum ( Case when SLSH.InventoryAtSite > 0 or totalIn>0 OR InventoryAtSite>0 OR Consumption>0 then 0 else 1 End ) [SiteStockoutDaysLast60Days]
from Symphony_stocklocationskuhistory SLSH
join (select stocklocationID, skuID, min(updatedate) [firstInwarddate] from Symphony_StockLocationSkuhistory 
where totalIn>0 OR InventoryAtSite>0 OR Consumption>0
group by stocklocationID, skuID) FINW on FINW.stocklocationID = SLSH.stocklocationID and  FINW.skuID = SLSH.skuID
where updateDate >= convert(date,GETDATE()-59) and updatedate > convert(date,finw.firstInwarddate)
group by SLSH.stockLocationID, SLSH.skuID ) TMCONS on TMCONS.stockLocationID = SLS.stockLocationID and TMCONS.skuID = SLS.skuID


left join (select SLSH.stockLocationID, SLSH.skuID, SUM(SLSH.consumption) [Last90DaysConsumption],
Sum ( Case when SLSH.InventoryAtSite > 0 or totalIn>0 OR InventoryAtSite>0 OR Consumption>0 then 0 else 1 End ) [SiteStockoutDaysLast90Days]
from Symphony_stocklocationskuhistory SLSH
join (select stocklocationID, skuID, min(updatedate) [firstInwarddate] from Symphony_StockLocationSkuhistory 
where totalIn>0 OR InventoryAtSite>0 OR Consumption>0
group by stocklocationID, skuID) FINW on FINW.stocklocationID = SLSH.stocklocationID and  FINW.skuID = SLSH.skuID
where updateDate >= convert(date,GETDATE()-89) and updatedate > convert(date,finw.firstInwarddate)
group by SLSH.stockLocationID, SLSH.skuID ) HMCONS on HMCONS.stockLocationID = SLS.stockLocationID and HMCONS.skuID = SLS.skuID


where SLS.isDeleted = 0 and sl.stockLocationType=5 and sls.custom_txt3='TILES' 
--order by SL.stockLocationName, SLS.locationSkuName;


end
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_BATCH_INVENTORY]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_BATCH_INVENTORY]
AS
BEGIN

drop table Client_batchinv

create table Client_batchinv
(Year nvarchar(10),
Month nvarchar(10),
Day nvarchar(10),
SKU nvarchar(100),
SL nvarchar(100),
INV_Site nvarchar(100),
Batch nvarchar(100),
)


BULK INSERT Client_batchinv
FROM 'E:\SymphonyData\Batch\Status_Batch_inventory.csv'
WITH
(
FIRSTROW = 1,
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)
select
 #a.SKU
 ,#a.[Stock Location]
 ,case when #a.Inv_at_site_Qty<0 then 0 else #a.Inv_at_site_Qty end as [Inv_at_site_Qty]
 ,#a.[Batch Number]
 ,#a.Year
 ,#a.Month
 ,#a.Day as [Date]
from (select sku as SKU
       ,sl as [Stock Location]
       ,cast (CASE WHEN CHARINDEX('-',INV_Site) > 0 THEN SUBSTRING(INV_Site,CHARINDEX('-',INV_Site),LEN(INV_Site)) + SUBSTRING(INV_Site,0,CHARINDEX('-',INV_Site))
                                                 ELSE INV_Site
                                                 END as decimal(20,3)) as Inv_at_site_Qty
	,batch as [Batch Number]
	
        ,YEAR
        ,MONTH
        ,DAY
	FROM Client_batchinv)#a where #a.Inv_at_site_Qty>0

	end
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_BATCH_INVENTORY_DIST]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_BATCH_INVENTORY_DIST]
AS
BEGIN

drop table Client_batchinv_dist

create table Client_batchinv_dist
(Year nvarchar(10),
Month nvarchar(10),
Day nvarchar(10),
SKU nvarchar(100),
SL nvarchar(100),
INV_Site nvarchar(100),
Batch nvarchar(100),
Distributor_Item_Name nvarchar(300),
)




drop table allfilenames
drop table bulkact

CREATE TABLE ALLFILENAMES(WHICHPATH VARCHAR(255),WHICHFILE varchar(255))
CREATE TABLE BULKACT(RAWDATA VARCHAR (8000))
declare @filename varchar(255),
        @path     varchar(255),
        @sql      varchar(8000),
        @cmd      varchar(1000)

		
SET @path = 'E:\SymphonyData\Batch\Distributor\'
SET @cmd = 'dir ' + @path + '*.csv /b'
INSERT INTO  ALLFILENAMES(WHICHFILE)
EXEC Master..xp_cmdShell @cmd
UPDATE ALLFILENAMES SET WHICHPATH = @path where WHICHPATH is null

--cursor loop
    declare c1 cursor for SELECT WHICHPATH,WHICHFILE FROM ALLFILENAMES where WHICHFILE like 'STATUS_BATCH%.csv%'
    open c1
    fetch next from c1 into @path,@filename
    While @@fetch_status <> -1
      begin
      --bulk insert won't take a variable name, so make a sql and execute it instead:
       set @sql = 'BULK INSERT Client_batchinv_dist FROM ''' + @path + @filename + ''' '
           + '     WITH ( 
                   FIELDTERMINATOR = '','', 
                   ROWTERMINATOR = ''\n'', 
                   FIRSTROW = 2 
                ) '
    print @sql
    exec (@sql)

      fetch next from c1 into @path,@filename
      end
    close c1
    deallocate c1



select
 #a.SKU
 ,#a.[Stock Location]
 ,case when #a.Inv_at_site_Qty<0 then 0 else #a.Inv_at_site_Qty end as [Inv_at_site_Qty]
 ,#a.[Batch Number]
 ,#a.[Distributor Item Name]
 ,#a.Year
 ,#a.Month
 ,#a.Day as [Date]
from (select sku as SKU
       ,sl as [Stock Location]
       ,cast (CASE WHEN CHARINDEX('-',INV_Site) > 0 THEN SUBSTRING(INV_Site,CHARINDEX('-',INV_Site),LEN(INV_Site)) + SUBSTRING(INV_Site,0,CHARINDEX('-',INV_Site))
                                                 ELSE INV_Site
                                                 END as decimal(20,3)) as Inv_at_site_Qty
	,batch as [Batch Number]
	,Distributor_Item_Name as [Distributor Item Name]
	
        ,YEAR
        ,MONTH
        ,DAY
	FROM Client_batchinv_dist)#a where #a.Inv_at_site_Qty>0

	end
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_Dealer_Replenishment]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_Dealer_Replenishment]
AS
BEGIN
  

  select 
  slpi4.slItemName as Region
  ,SL.stockLocationName as [Stock Location]
  ,sl.stockLocationDescription as Deler_Name

  ,slpi1.slItemName as Dealer_City
  ,slpi2.slItemName as Dealer_State
  ,slpi5.slItemName as Sales_Person

  , SLS.locationSkuName as [Dealer's HRJ SKU code]
  ,sls.custom_txt8 as [HRJ Parent SKU code] 
 --,sls.skuDescription, 
 ,sls.custom_txt4 as [Dealer's SKU Description]
,SKUPI1.skuItemName [Division]
,SLS.custom_txt3 [Business], SLS.custom_txt5 [Material Frieght Group],
SLS.bufferSize,
SLS.inventoryAtSite,  
SLS.InventoryAtTransit,
sls.inventoryNeeded as [Suggested Replenishment Qty]
,isnull(cast(SKUPI2.skuItemName as decimal(10,3))*sls.inventoryNeeded,0) as [Suggested Replenishment Qty in M2]
,Case WHEN SLS.siteColor =0 THEN 'Cyan' 
     WHEN SLS.SiteColor =1 then 'Green' 
WHEN SLS.SiteColor =2 then 'Yellow' 
WHEN SLS.SiteColor =3 then 'Red' 
WHEN SLS.SiteColor =4 then 'Black'  
END [SiteColor],
Case WHEN SLS.TransitColor =0 THEN 'Cyan' 
     WHEN SLS.TransitColor =1 then 'Green' 
WHEN SLS.TransitColor =2 then 'Yellow' 
WHEN SLS.TransitColor =3 then 'Red' 
WHEN SLS.TransitColor =4 then 'Black'  
END [TransitColor]

from Symphony_StockLocationSkus SLS
join Symphony_StockLocations SL on SL.stockLocationID = SLS.stockLocationID
left join Symphony_StockLocationPropertyItems slpi4 on slpi4.slItemID=sl.slPropertyID4
left join Symphony_StockLocationPropertyItems slpi1 on slpi1.slItemID=sl.slPropertyID1
left join Symphony_StockLocationPropertyItems slpi2 on slpi2.slItemID=sl.slPropertyID2
left join Symphony_StockLocationPropertyItems slpi5 on slpi5.slItemID=sl.slPropertyID5
Left JOIN Symphony_SkusPropertyItems SKUPI1 ON SLS.skuPropertyID1 = SKUPI1.skuItemID
Left JOIN Symphony_SkusPropertyItems SKUPI2 ON SLS.skuPropertyID2 = SKUPI2.skuItemID
Left JOIN Symphony_SkusPropertyItems SKUPI3 ON SLS.skuPropertyID3 = SKUPI3.skuItemID
Left JOIN Symphony_SkusPropertyItems SKUPI4 ON SLS.skuPropertyID4 = SKUPI4.skuItemID
Left join Symphony_Stocklocations OSL on OSL.stockLocationID = SLS.originStockLocation 


where SLS.isDeleted = 0 and sl.stockLocationType=3 --and sl.stockLocationName='TN0P0009' 

end
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_Dealer_Replenishment_Dealerwise]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


 CREATE PROCEDURE [dbo].[Client_SP_Dealer_Replenishment_Dealerwise]  @DEALER NVARCHAR(100)           --@REGION NVARCHAR(100)

AS
BEGIN

  select 
  slpi4.slItemName as Region
  ,SL.stockLocationName as [Dealer code]
  ,sl.stockLocationDescription as Customer_Name


  , SLS.locationSkuName as [HRJ SKU code]
  ,sls.custom_txt8 as [HRJ Parent SKU code] 
 ,sls.skuDescription as [HRJ SKU Description]
 ,sls.custom_txt4 as [Dealer's SKU Description]
,SKUPI1.skuItemName [Division],
--,SLS.custom_txt3 [Business], SLS.custom_txt5 [Material Frieght Group],
SLS.bufferSize,
SLS.inventoryAtSite,  
SLS.InventoryAtTransit,
sls.inventoryNeeded as [Suggested Replenishment Qty]
,isnull(cast(SKUPI2.skuItemName as decimal(10,3))*sls.inventoryNeeded,0) as [Suggested Replenishment Qty in M2]
,Case WHEN SLS.siteColor =0 THEN 'Cyan' 
     WHEN SLS.SiteColor =1 then 'Green' 
WHEN SLS.SiteColor =2 then 'Yellow' 
WHEN SLS.SiteColor =3 then 'Red' 
WHEN SLS.SiteColor =4 then 'Black'  
END [Parent code SiteColor],
Case WHEN SLS.TransitColor =0 THEN 'Cyan' 
     WHEN SLS.TransitColor =1 then 'Green' 
WHEN SLS.TransitColor =2 then 'Yellow' 
WHEN SLS.TransitColor =3 then 'Red' 
WHEN SLS.TransitColor =4 then 'Black'  
END [Parent code TransitColor]

from Symphony_StockLocationSkus SLS
join Symphony_StockLocations SL on SL.stockLocationID = SLS.stockLocationID
left join Symphony_StockLocationPropertyItems slpi4 on slpi4.slItemID=sl.slPropertyID4
left join Symphony_StockLocationPropertyItems slpi1 on slpi1.slItemID=sl.slPropertyID1
left join Symphony_StockLocationPropertyItems slpi2 on slpi2.slItemID=sl.slPropertyID2
left join Symphony_StockLocationPropertyItems slpi5 on slpi5.slItemID=sl.slPropertyID5
Left JOIN Symphony_SkusPropertyItems SKUPI1 ON SLS.skuPropertyID1 = SKUPI1.skuItemID
Left JOIN Symphony_SkusPropertyItems SKUPI2 ON SLS.skuPropertyID2 = SKUPI2.skuItemID
Left JOIN Symphony_SkusPropertyItems SKUPI3 ON SLS.skuPropertyID3 = SKUPI3.skuItemID
Left JOIN Symphony_SkusPropertyItems SKUPI4 ON SLS.skuPropertyID4 = SKUPI4.skuItemID
Left join Symphony_Stocklocations OSL on OSL.stockLocationID = SLS.originStockLocation 
	

where SLS.isDeleted = 0 and sl.stockLocationType=3 and sl.stockLocationName=@DEALER     --'AP0A0008'--slpi4.slItemName= @REGION

END
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_Dealer_Replenishment_Region_and_division_wise]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_Dealer_Replenishment_Region_and_division_wise] @REGION NVARCHAR(100),@Division NVARCHAR(100)
AS
BEGIN



  select 
  slpi4.slItemName as Region
  ,SL.stockLocationName as [Dealer code]
  ,sl.stockLocationDescription as Customer_Name


  , SLS.locationSkuName as [HRJ SKU code]
  ,sls.custom_txt8 as [HRJ Parent SKU code] 
 ,sls.skuDescription as [HRJ SKU Description]
 ,sls.custom_txt4 as [Dealer's SKU Description]
,SKUPI1.skuItemName [Division],
--,SLS.custom_txt3 [Business], SLS.custom_txt5 [Material Frieght Group],
SLS.bufferSize,
SLS.inventoryAtSite,  
SLS.InventoryAtTransit,
sls.inventoryNeeded as [Suggested Replenishment Qty]
,isnull(cast(SKUPI2.skuItemName as decimal(10,3))*sls.inventoryNeeded,0) as [Suggested Replenishment Qty in M2]
,Case WHEN SLS.siteColor =0 THEN 'Cyan' 
     WHEN SLS.SiteColor =1 then 'Green' 
WHEN SLS.SiteColor =2 then 'Yellow' 
WHEN SLS.SiteColor =3 then 'Red' 
WHEN SLS.SiteColor =4 then 'Black'  
END [Parent code SiteColor],
Case WHEN SLS.TransitColor =0 THEN 'Cyan' 
     WHEN SLS.TransitColor =1 then 'Green' 
WHEN SLS.TransitColor =2 then 'Yellow' 
WHEN SLS.TransitColor =3 then 'Red' 
WHEN SLS.TransitColor =4 then 'Black'  
END [Parent code TransitColor]

from Symphony_StockLocationSkus SLS
join Symphony_StockLocations SL on SL.stockLocationID = SLS.stockLocationID
left join Symphony_StockLocationPropertyItems slpi4 on slpi4.slItemID=sl.slPropertyID4
left join Symphony_StockLocationPropertyItems slpi1 on slpi1.slItemID=sl.slPropertyID1
left join Symphony_StockLocationPropertyItems slpi2 on slpi2.slItemID=sl.slPropertyID2
left join Symphony_StockLocationPropertyItems slpi5 on slpi5.slItemID=sl.slPropertyID5
Left JOIN Symphony_SkusPropertyItems SKUPI1 ON SLS.skuPropertyID1 = SKUPI1.skuItemID
Left JOIN Symphony_SkusPropertyItems SKUPI2 ON SLS.skuPropertyID2 = SKUPI2.skuItemID
Left JOIN Symphony_SkusPropertyItems SKUPI3 ON SLS.skuPropertyID3 = SKUPI3.skuItemID
Left JOIN Symphony_SkusPropertyItems SKUPI4 ON SLS.skuPropertyID4 = SKUPI4.skuItemID
Left join Symphony_Stocklocations OSL on OSL.stockLocationID = SLS.originStockLocation 
	

where SLS.isDeleted = 0 and sl.stockLocationType=3 and slpi4.slItemName= @REGION and SKUPI1.skuItemName=@Division

END
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_Dealer_Replenishment_Regionwise]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_Dealer_Replenishment_Regionwise] @REGION NVARCHAR(100)
AS
BEGIN


  select 
  slpi4.slItemName as Region
  ,SL.stockLocationName as [Dealer code]
  ,sl.stockLocationDescription as Customer_Name


  , SLS.locationSkuName as [HRJ SKU code]
  ,sls.custom_txt8 as [HRJ Parent SKU code] 
 ,sls.skuDescription as [HRJ SKU Description]
 ,sls.custom_txt4 as [Dealer's SKU Description]
,SKUPI1.skuItemName [Division],
--,SLS.custom_txt3 [Business], SLS.custom_txt5 [Material Frieght Group],
SLS.bufferSize,
SLS.inventoryAtSite,  
SLS.InventoryAtTransit,
sls.inventoryNeeded as [Suggested Replenishment Qty]
,isnull(cast(SKUPI2.skuItemName as decimal(10,3))*sls.inventoryNeeded,0) as [Suggested Replenishment Qty in M2]
,Case WHEN SLS.siteColor =0 THEN 'Cyan' 
     WHEN SLS.SiteColor =1 then 'Green' 
WHEN SLS.SiteColor =2 then 'Yellow' 
WHEN SLS.SiteColor =3 then 'Red' 
WHEN SLS.SiteColor =4 then 'Black'  
END [Parent code SiteColor],
Case WHEN SLS.TransitColor =0 THEN 'Cyan' 
     WHEN SLS.TransitColor =1 then 'Green' 
WHEN SLS.TransitColor =2 then 'Yellow' 
WHEN SLS.TransitColor =3 then 'Red' 
WHEN SLS.TransitColor =4 then 'Black'  
END [Parent code TransitColor]

from Symphony_StockLocationSkus SLS
join Symphony_StockLocations SL on SL.stockLocationID = SLS.stockLocationID
left join Symphony_StockLocationPropertyItems slpi4 on slpi4.slItemID=sl.slPropertyID4
left join Symphony_StockLocationPropertyItems slpi1 on slpi1.slItemID=sl.slPropertyID1
left join Symphony_StockLocationPropertyItems slpi2 on slpi2.slItemID=sl.slPropertyID2
left join Symphony_StockLocationPropertyItems slpi5 on slpi5.slItemID=sl.slPropertyID5
Left JOIN Symphony_SkusPropertyItems SKUPI1 ON SLS.skuPropertyID1 = SKUPI1.skuItemID
Left JOIN Symphony_SkusPropertyItems SKUPI2 ON SLS.skuPropertyID2 = SKUPI2.skuItemID
Left JOIN Symphony_SkusPropertyItems SKUPI3 ON SLS.skuPropertyID3 = SKUPI3.skuItemID
Left JOIN Symphony_SkusPropertyItems SKUPI4 ON SLS.skuPropertyID4 = SKUPI4.skuItemID
Left join Symphony_Stocklocations OSL on OSL.stockLocationID = SLS.originStockLocation 
	

where SLS.isDeleted = 0 and sl.stockLocationType=3 and slpi4.slItemName= @REGION

END
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_Dist_Transac_Exception]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_Dist_Transac_Exception]
AS
BEGIN

select distinct #aca.stockLocationID,#aca.stockLocationName,#aca.stockLocationDescription
      ,case when out.Last_OUT_Transaction>(ISNULL (a.Last_IN_Transaction,0)) then out.Last_OUT_Transaction else 
     a.Last_IN_Transaction end as Last_Transaction
     ,out.Last_OUT_Transaction,a.Last_IN_Transaction
   

from (

   SELECT sl.stockLocationID,sl.stockLocationName,sl.stockLocationDescription
      ,max(t.reportedDate) as Last_OUT_Transaction
	  ,'' as Last_IN_Transaction
      
  FROM [SYMPHONY_HRJ].[dbo].[Symphony_Transactions] t
  join Symphony_StockLocations sl on sl.stockLocationID=t.sender
  where sl.slPropertyID6=122 and transactionType=0 and receiver=-1 --and sl.stockLocationName='BH0M0010'
  group by sl.stockLocationID,sl.stockLocationName,sl.stockLocationDescription
  --having max(t.reportedDate) is not null


union  

   SELECT sl.stockLocationID,sl.stockLocationName,sl.stockLocationDescription
       ,'' as Last_OUT_Transaction
      ,max(t.reportedDate) as Last_IN_Transaction
      
  FROM [SYMPHONY_HRJ].[dbo].[Symphony_Transactions] t
  join Symphony_StockLocations sl on sl.stockLocationID=t.receiver
  where sl.slPropertyID6=122 and transactionType=1 --and sl.stockLocationName='BH0M0010'
  group by sl.stockLocationID,sl.stockLocationName,sl.stockLocationDescription)#aca


  left join (SELECT sl.stockLocationID,sl.stockLocationName
      ,max(t.reportedDate) as Last_OUT_Transaction
	  ,'' as Last_IN_Transaction
      
  FROM [SYMPHONY_HRJ].[dbo].[Symphony_Transactions] t
  join Symphony_StockLocations sl on sl.stockLocationID=t.sender
  where sl.slPropertyID6=122 and transactionType=0 and receiver=-1 --and sl.stockLocationName='BH0M0010'
  group by sl.stockLocationID,sl.stockLocationName ) OUT on out.stockLocationID=#aca.stockLocationID

  left join (SELECT sl.stockLocationID,sl.stockLocationName
       ,'' as Last_OUT_Transaction
      ,max(t.reportedDate) as Last_IN_Transaction
      
  FROM [SYMPHONY_HRJ].[dbo].[Symphony_Transactions] t
  join Symphony_StockLocations sl on sl.stockLocationID=t.receiver
  where sl.slPropertyID6=122 and transactionType=1 --and sl.stockLocationName='BH0M0010'
  group by sl.stockLocationID,sl.stockLocationName) a on a.stockLocationID=#aca.stockLocationID

  end
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_DPLM]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_DPLM]
AS
BEGIN

update sls set sls.custom_txt2='T 0-90'
FROM Symphony_StockLocationSkus sls where sls.noConsumptionDays>90 and sls.custom_txt2 not like 'T 0-90'

update sls set sls.custom_txt2='T 0-90'
FROM Symphony_StockLocationSkus sls where sls.noConsumptionDays>90 and sls.custom_txt2 is null

update sls set sls.custom_txt2=null
FROM Symphony_StockLocationSkus sls where sls.noConsumptionDays<=90 --and sls.custom_txt2 like 'T 0-90' 

update [SYMPHONY_HRJ].[dbo].[Symphony_StockLocationSkus] set autoReplenishment=1 where autoReplenishment=0


update sls
set sls.custom_num4 = osls.inventoryAtSite 
FROM [SYMPHONY_HRJ].[dbo].[Symphony_StockLocationSkus] sls
JOIN [SYMPHONY_HRJ].[dbo].[Symphony_StockLocationSkus] osls on sls.originStockLocation=osls.stockLocationID AND SLS.locationSkuName=OSLS.locationSkuName
where sls.isdeleted = 0 and osls.isdeleted = 0

end
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_Exception_Site_Cyan_Transit_exist]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_Exception_Site_Cyan_Transit_exist]
AS
BEGIN



select SL.StockLocationName,sl.stockLocationDescription, SLS.LocationSkuName as SKU,SLS.skuDescription, 
 SLS.bufferSize,SLS.inventoryAtSite,Case WHEN SLS.siteColor =0 THEN 'Cyan' END SiteColor,
 SLS.InventoryAtTransit


from Symphony_Stocklocationskus SLS
join Symphony_Stocklocations SL on SLS.stocklocationID = SL.stocklocationID
left JOIN Symphony_SkusPropertyItems SKUPI1 ON SLS.skuPropertyID1 = SKUPI1.skuItemID
left JOIN Symphony_SkusPropertyItems SKUPI2 ON SLS.skuPropertyID2 = SKUPI2.skuItemID
left JOIN Symphony_SkusPropertyItems SKUPI3 ON SLS.skuPropertyID3 = SKUPI3.skuItemID
left JOIN Symphony_SkusPropertyItems SKUPI4 ON SLS.skuPropertyID4 = SKUPI4.skuItemID

left JOIN Symphony_StockLocationPropertyItems SLPI1 ON SL.SLPropertyID1 = SLPI1.SLItemID
where SLS.siteColor=0 and SLS.inventoryAtTransit>0 and SLS.bufferSize>0 
/* and SKUPI1.skuItemName not in ('EB Accessories','EB Foot Wear') */
order by SLPI1.SLItemName, SL.StockLocationName, SLS.LocationSkuName

end
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_IPNR_STPO_for_IPNR_Morbi_3100_from_2500_2900]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_IPNR_STPO_for_IPNR_Morbi_3100_from_2500_2900]
AS
BEGIN


  SELECT  sl.stockLocationName as [Stock Location]       
    ,sl.stockLocationDescription as [Stock Location Description]     
	  ,sls.locationSkuName as SKU        
	 ,sls.custom_txt8 as [Parent Code]  
	 ,sls.skuDescription as [SKU Description]        
	 ,SLS.custom_txt3 [Business]  
	 ,spi.skuItemName [Division]  
	 ,spi1.skuItemName [Design]         
	 ,sl1.stockLocationName as [Supply_Plant]  
	 ,sl1.stockLocationDescription as [Supply_Plant_Description]         
	 ,sls.bufferSize  ,sls.inventoryAtSite as Site_Qty  
	 ,sls.inventoryAtTransit as Transit_Qty  
	 ,1-bpProduction as [BP%]  
	 ,case when productionColor=0 then 'Cyan' when productionColor=1 then 'Green' when productionColor=2 then 'yellow' when productionColor=3 then 'Red' when productionColor=4 then 'Black' end [BP Color]  
	 ,sls.inventoryNeeded as InventoryNeeded  
	 ,sls.replenishmentQuantity as ReplenishmentQty   
	 --,isnull(a.inveneed,0) as Depot_InventoryNeeded   
	 --,isnull(((sls.bufferSize+isnull(a.inveneed,0)+sls.saftyStock)-(sls.inventoryAtSite+sls.inventoryAtTransit+sls.inventoryAtProduction)),0) as Total_Gap  
	 FROM [SYMPHONY_HRJ].[dbo].[Symphony_StockLocationSkus] sls   
	 join Symphony_StockLocations sl on sls.stockLocationID=sl.stockLocationID   
	 join Symphony_StockLocations sl1 on sls.originStockLocation=sl1.stockLocationID    
	 left join Symphony_SKUsPropertyItems spi on spi.skuItemID=sls.skuPropertyID1   
	 left join Symphony_SKUsPropertyItems spi1 on spi1.skuItemID=sls.skuPropertyID6      
	/* left join  (SELECT sl1.stockLocationName as [Stock Location]  ,slss.locationSkuName ,sum(case when slss.inventoryNeeded>=slss.minimumReplenishment 
	 then slss.inventoryNeeded else 0 end) as inveneed     
	 FROM [SYMPHONY_HRJ].[dbo].[Symphony_StockLocationSkus] slss   
	 join Symphony_StockLocations sl on slss.stockLocationID=sl.stockLocationID  
	 join Symphony_StockLocations sl1 on slss.originStockLocation=sl1.stockLocationID 
	 join Symphony_SKUs ss on slss.skuid=ss.skuID where /*sls.inventoryNeeded-sls.replenishmentQuantity>0 and */ sl.stockLocationName<>'4750' 
	 and  slss.avoidReplenishment=0 and slss.bufferSize>0 group by sl1.stockLocationName,slss.locationSkuName)a on a.[Stock Location]=sl.stockLocationName 
	 and a.locationSkuName=sls.locationSkuName  */
	  where sls.inventoryNeeded>0 
	  and sls.bufferSize>0 and sls.custom_txt3 like 'IPNR%'  and SLS.isDeleted = 0 --and sl.stockLocationType=5 
	  and sl.isDeleted=0  and sls.avoidReplenishment=0 and sl.stockLocationName='3100'
	  and spi.skuItemName='IPNR FG'
	 and sl1.stockLocationName in ('2500','2900')

	 END
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_JBD_PO_from_Baddi_plant_to_depots]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_JBD_PO_from_Baddi_plant_to_depots]
AS
BEGIN

SELECT  sl.stockLocationName as [Store]       
    ,sl.stockLocationDescription as [Store Description]     
	    ,sls.locationSkuName as SKU        
	 ,sls.custom_txt8 as [Parent Code]  
	 ,sls.skuDescription as [SKU Description]        
	 ,SLS.custom_txt3 [Business]  
	 ,spi.skuItemName [Division]  
	 ,spi1.skuItemName [Design]  
	 ,spi5.skuItemName as [HBT_Store]
	 ,sls.custom_txt10 as [HBT National]       
	 ,sl1.stockLocationName as [Supply Vendor/Plant]  
	 ,sl1.stockLocationDescription as [Supply Vendor/Plant Description]         
	 ,sls.bufferSize  ,sls.inventoryAtSite as Site_Qty  
	 ,sls.inventoryAtTransit as Transit_Qty  
	 ,1-bpProduction as [BP%]  
	 ,case when productionColor=0 then 'Cyan' when productionColor=1 then 'Green' when productionColor=2 then 'yellow' when productionColor=3 then 'Red' when productionColor=4 
	 then 'Black' end [BP Color]  
	 ,sls.inventoryNeeded as InventoryNeeded  
	 ,sls.replenishmentQuantity as ReplenishmentQty   
	 --,isnull(a.inveneed,0) as Depot_InventoryNeeded   
	 --,isnull(((sls.bufferSize+isnull(a.inveneed,0)+sls.saftyStock)-(sls.inventoryAtSite+sls.inventoryAtTransit+sls.inventoryAtProduction)),0) as Total_Gap  
	 FROM [SYMPHONY_HRJ].[dbo].[Symphony_StockLocationSkus] sls   
	 join Symphony_StockLocations sl on sls.stockLocationID=sl.stockLocationID   
	 join Symphony_StockLocations sl1 on sls.originStockLocation=sl1.stockLocationID    
	 left join Symphony_SKUsPropertyItems spi on spi.skuItemID=sls.skuPropertyID1   
	 left join Symphony_SKUsPropertyItems spi1 on spi1.skuItemID=sls.skuPropertyID6 
	 left join Symphony_SKUsPropertyItems spi5 on spi5.skuItemID=sls.skuPropertyID5    
	/* left join  (SELECT sl1.stockLocationName as [Stock Location]  ,slss.locationSkuName ,sum(case when slss.inventoryNeeded>=slss.minimumReplenishment 
	 then slss.inventoryNeeded else 0 end) as inveneed     
	 FROM [SYMPHONY_HRJ].[dbo].[Symphony_StockLocationSkus] slss   
	 join Symphony_StockLocations sl on slss.stockLocationID=sl.stockLocationID  
	 join Symphony_StockLocations sl1 on slss.originStockLocation=sl1.stockLocationID 
	 join Symphony_SKUs ss on slss.skuid=ss.skuID where /*sls.inventoryNeeded-sls.replenishmentQuantity>0 and */ sl.stockLocationName<>'4750' 
	 and  slss.avoidReplenishment=0 and slss.bufferSize>0 group by sl1.stockLocationName,slss.locationSkuName)a on a.[Stock Location]=sl.stockLocationName 
	 and a.locationSkuName=sls.locationSkuName  */
	  where sls.inventoryNeeded>0 
	  and sls.bufferSize>0 and sls.custom_txt3 like 'JBD%'  and SLS.isDeleted = 0 --and sl.stockLocationType=5 
	  and sl.isDeleted=0  and sls.avoidReplenishment=0 and sl1.stockLocationName in ('106205' )



end
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_JBD_STPO_from_Samba_plant_to_depots]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_JBD_STPO_from_Samba_plant_to_depots]
AS
BEGIN


  SELECT  sl.stockLocationName as [Store]       
    ,sl.stockLocationDescription as [Store Description]     
	  ,sls.locationSkuName as SKU        
	 ,sls.custom_txt8 as [Parent Code]  
	 ,sls.skuDescription as [SKU Description]        
	 ,SLS.custom_txt3 [Business]  
	 ,spi.skuItemName [Division]  
	 ,spi1.skuItemName [Design]  
     ,spi5.skuItemName as [HBT_Store]
	 ,sls.custom_txt10 as [HBT National]  	        
	 ,sl1.stockLocationName as [Origin WH]  
	 ,sl1.stockLocationDescription as [Origin WH Description]         
	 ,sls.bufferSize  ,sls.inventoryAtSite as Site_Qty  
	 ,sls.inventoryAtTransit as Transit_Qty  
	 ,1-bpProduction as [BP%]  
	 ,case when productionColor=0 then 'Cyan' when productionColor=1 then 'Green' when productionColor=2 then 'yellow' when productionColor=3 then 'Red' when productionColor=4 then 'Black' end [BP Color]  
	 ,sls.inventoryNeeded as InventoryNeeded  
	 ,sls.replenishmentQuantity as ReplenishmentQty   
	 --,isnull(a.inveneed,0) as Depot_InventoryNeeded   
	 --,isnull(((sls.bufferSize+isnull(a.inveneed,0)+sls.saftyStock)-(sls.inventoryAtSite+sls.inventoryAtTransit+sls.inventoryAtProduction)),0) as Total_Gap  
	 FROM [SYMPHONY_HRJ].[dbo].[Symphony_StockLocationSkus] sls   
	 join Symphony_StockLocations sl on sls.stockLocationID=sl.stockLocationID   
	 join Symphony_StockLocations sl1 on sls.originStockLocation=sl1.stockLocationID    
	 left join Symphony_SKUsPropertyItems spi on spi.skuItemID=sls.skuPropertyID1   
	 left join Symphony_SKUsPropertyItems spi1 on spi1.skuItemID=sls.skuPropertyID6 
	 left join Symphony_SKUsPropertyItems spi5 on spi5.skuItemID=sls.skuPropertyID5       
	/* left join  (SELECT sl1.stockLocationName as [Stock Location]  ,slss.locationSkuName ,sum(case when slss.inventoryNeeded>=slss.minimumReplenishment 
	 then slss.inventoryNeeded else 0 end) as inveneed     
	 FROM [SYMPHONY_HRJ].[dbo].[Symphony_StockLocationSkus] slss   
	 join Symphony_StockLocations sl on slss.stockLocationID=sl.stockLocationID  
	 join Symphony_StockLocations sl1 on slss.originStockLocation=sl1.stockLocationID 
	 join Symphony_SKUs ss on slss.skuid=ss.skuID where /*sls.inventoryNeeded-sls.replenishmentQuantity>0 and */ sl.stockLocationName<>'4750' 
	 and  slss.avoidReplenishment=0 and slss.bufferSize>0 group by sl1.stockLocationName,slss.locationSkuName)a on a.[Stock Location]=sl.stockLocationName 
	 and a.locationSkuName=sls.locationSkuName  */
	  where sls.inventoryNeeded>0 
	  and sls.bufferSize>0 and sls.custom_txt3 like 'JBD%'  and SLS.isDeleted = 0 --and sl.stockLocationType=5 
	  and sl.isDeleted=0  and sls.avoidReplenishment=0 and sl1.stockLocationName in ('109618')


end
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_Location_conversion_UpdateSKUs_Pendi]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_Location_conversion_UpdateSKUs_Pendi]
AS
BEGIN


IF (OBJECT_ID('Client_Parent_child_OSO') IS NOT NULL)
drop table Client_Parent_child_OSO

create table Client_Parent_child_OSO
(Parent nvarchar(100),
Child nvarchar(100),
Priority int,
)

BULK INSERT Client_Parent_child_OSO
FROM 'E:\SymphonyData\Parent_Child_Scripts\Inputfile\Parent_child.csv'
WITH
(
FIRSTROW = 2, --ignores first row (header row)
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)

IF (OBJECT_ID('Client_Temp_Location_Change') IS NOT NULL)
drop table Client_Temp_Location_Change

create table Client_Temp_Location_Change
(Actual_Location_in_Input_file nvarchar(100),
To_be_changed_Location nvarchar(100)
)

BULK INSERT Client_Temp_Location_Change
FROM 'E:\SymphonyData\Parent_Child_Scripts\Inputfile\Location_Change.csv'
WITH
(
FIRSTROW = 2, --ignores first row (header row)
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)


IF (OBJECT_ID('Client_Temp_UpdateSKUs_HRJ_Pendi_1') IS NOT NULL)
drop table Client_Temp_UpdateSKUs_HRJ_Pendi_1

create table Client_Temp_UpdateSKUs_HRJ_Pendi_1
(SL nvarchar(100),
SKU nvarchar(100),
Unreserved_Open_Orders_Trade nvarchar(100),
Unreserved_Open_Orders_Projects nvarchar(100),
Unreserved_Open_Orders_Dealer_Projects nvarchar(100),
)
/*
-----temporary addition jun'23----

bulk insert Client_Temp_UpdateSKUs_HRJ_Pendi_1
from 'E:\SymphonyData\InputFolder\UPDATESKUS_HRJ_Pendi_2023_06_23.csv' --file name to be changed
WITH ( 
                   FIELDTERMINATOR = ',', 
                   ROWTERMINATOR = '\n', 
                   FIRSTROW = 2 

)




-----temporary addition jun'23----


--remove start
*/
drop table allfilenames
drop table bulkact

CREATE TABLE ALLFILENAMES(WHICHPATH VARCHAR(255),WHICHFILE varchar(255))
CREATE TABLE BULKACT(RAWDATA VARCHAR (8000))
declare @filename varchar(255),
        @path     varchar(255),
        @sql      varchar(8000),
        @cmd      varchar(1000)


SET @path = 'E:\SymphonyData\InputFolder\'
SET @cmd = 'dir ' + @path + '*.csv /b'
INSERT INTO  ALLFILENAMES(WHICHFILE)
EXEC Master..xp_cmdShell @cmd
UPDATE ALLFILENAMES SET WHICHPATH = @path where WHICHPATH is null

--cursor loop
    declare c1 cursor for SELECT WHICHPATH,WHICHFILE FROM ALLFILENAMES where WHICHFILE like 'UPDATESKUS_HRJ_Pendi%.csv%'
    open c1
    fetch next from c1 into @path,@filename
    While @@fetch_status <> -1
      begin
      --bulk insert won't take a variable name, so make a sql and execute it instead:
       set @sql = 'BULK INSERT Client_Temp_UpdateSKUs_HRJ_Pendi_1 FROM ''' + @path + @filename + ''' '
           + '     WITH ( 
                   FIELDTERMINATOR = '','', 
                   ROWTERMINATOR = ''\n'', 
                   FIRSTROW = 2 
                ) '
    print @sql
    exec (@sql)

      fetch next from c1 into @path,@filename
      end
    close c1
    deallocate c1

	--*/ --rmoe ed
	IF (OBJECT_ID('Client_Temp_UpdateSKUs_HRJ_Pendi_2') IS NOT NULL)
drop table Client_Temp_UpdateSKUs_HRJ_Pendi_2;


select
 #a.[Stock_Location]
 ,#a.SKU
 ,#a.Unreserved_Open_Orders_Trade_Qty
 ,#a.Unreserved_Open_Orders_Projects_Qty
 ,#a.Unreserved_Open_Orders_Dealer_Projects_Qty
 --,case when #a.Unreserved_Open_Orders_Trade_Qty<0 then 0 else #a.Unreserved_Open_Orders_Trade_Qty end as [Unreserved_Open_Orders_Trade_Qty]
 --,case when #a.Unreserved_Open_Orders_Projects_Qty<0 then 0 else #a.Unreserved_Open_Orders_Projects_Qty end as [Unreserved_Open_Orders_Projects_Qty]
 --,case when #a.Unreserved_Open_Orders_Dealer_Projects_Qty<0 then 0 else #a.Unreserved_Open_Orders_Dealer_Projects_Qty end as [Unreserved_Open_Orders_Dealer_Projects_Qty]
 into Client_Temp_UpdateSKUs_HRJ_Pendi_2
from
(select  sl as [Stock_Location]
        ,sku as SKU
       ,sum(cast (CASE WHEN CHARINDEX('-',Unreserved_Open_Orders_Trade) > 0 THEN SUBSTRING(Unreserved_Open_Orders_Trade,CHARINDEX('-',Unreserved_Open_Orders_Trade),LEN(Unreserved_Open_Orders_Trade)) + SUBSTRING(Unreserved_Open_Orders_Trade,0,CHARINDEX('-',Unreserved_Open_Orders_Trade))
                                                 ELSE Unreserved_Open_Orders_Trade
                                                 END as decimal(20,3))) as Unreserved_Open_Orders_Trade_Qty
	  ,sum(cast (CASE WHEN CHARINDEX('-',Unreserved_Open_Orders_Projects) > 0 THEN SUBSTRING(Unreserved_Open_Orders_Projects,CHARINDEX('-',Unreserved_Open_Orders_Projects),LEN(Unreserved_Open_Orders_Projects)) + SUBSTRING(Unreserved_Open_Orders_Projects,0,CHARINDEX('-',Unreserved_Open_Orders_Projects))
                                                 ELSE Unreserved_Open_Orders_Projects
                                                 END as decimal(20,3))) as Unreserved_Open_Orders_Projects_Qty
     ,sum(cast (CASE WHEN CHARINDEX('-',Unreserved_Open_Orders_Dealer_Projects) > 0 THEN SUBSTRING(Unreserved_Open_Orders_Dealer_Projects,CHARINDEX('-',Unreserved_Open_Orders_Dealer_Projects),LEN(Unreserved_Open_Orders_Dealer_Projects)) + SUBSTRING(Unreserved_Open_Orders_Dealer_Projects,0,CHARINDEX('-',Unreserved_Open_Orders_Dealer_Projects))
                                                 ELSE Unreserved_Open_Orders_Dealer_Projects
                                                 END as decimal(20,3))) as Unreserved_Open_Orders_Dealer_Projects_Qty

	FROM Client_Temp_UpdateSKUs_HRJ_Pendi_1  group by SL,SKU)#a



	
update ctt set ctt.sku=ces.Parent
	from Client_Temp_UpdateSKUs_HRJ_Pendi_2 ctt
	join Client_Parent_child_OSO ces on ces.child = CTT.SKU

	update ctt set ctt.Stock_Location=ces.To_be_changed_Location
	from Client_Temp_UpdateSKUs_HRJ_Pendi_2 ctt 
	join Client_Temp_Location_Change ces on ces.Actual_Location_in_Input_file = CTT.Stock_Location
	
	
	IF (OBJECT_ID('Client_Temp_UpdateSKUs_HRJ_Pendi_3') IS NOT NULL)
drop table Client_Temp_UpdateSKUs_HRJ_Pendi_3

select * into Client_Temp_UpdateSKUs_HRJ_Pendi_3 from (

select Stock_Location as [Stock Location]
        ,SKU as [SKU]
        ,sum(Unreserved_Open_Orders_Trade_Qty) as [Unreserved Open Orders_Trade] 
       ,sum(Unreserved_Open_Orders_Projects_Qty) as [Unreserved Open Orders_Projects]
	   ,sum(Unreserved_Open_Orders_Dealer_Projects_Qty) as [Unreserved Open Orders_Dealer Projects]
	     from Client_Temp_UpdateSKUs_HRJ_Pendi_2 
		 group by Stock_Location,SKU )#efc

update sls set custom_num7=0 , custom_num8=0, custom_num9=0
 from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 
where 
sl.stockLocationName + '|' + sls.locationSkuName not in (select n.[Stock Location]  + '|' + n.SKU from Client_Temp_UpdateSKUs_HRJ_Pendi_3 n
left join Symphony_StockLocations sl on sl.stockLocationName=n.[Stock Location] where sl.stockLocationID between 0 and 1000 )
and    sl.stockLocationName  in (select distinct [Stock Location] from Client_Temp_UpdateSKUs_HRJ_Pendi_3) and sls.isDeleted=0 
and sls.stockLocationID between 0 and 1000

update sls set custom_num7=0 , custom_num8=0, custom_num9=0
 from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 
where 
sl.stockLocationName + '|' + sls.locationSkuName not in (select n.[Stock Location]  + '|' + n.SKU from Client_Temp_UpdateSKUs_HRJ_Pendi_3 n
left join Symphony_StockLocations sl on sl.stockLocationName=n.[Stock Location] where sl.stockLocationID between 1000 and 5000 )
and    sl.stockLocationName  in (select distinct [Stock Location] from Client_Temp_UpdateSKUs_HRJ_Pendi_3) and sls.isDeleted=0 
and sls.stockLocationID between 1000 and 5000

update sls set custom_num7=0 , custom_num8=0, custom_num9=0
 from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 
where 
sl.stockLocationName + '|' + sls.locationSkuName not in (select n.[Stock Location]  + '|' + n.SKU from Client_Temp_UpdateSKUs_HRJ_Pendi_3 n
left join Symphony_StockLocations sl on sl.stockLocationName=n.[Stock Location] where sl.stockLocationID > 5000 )
and    sl.stockLocationName  in (select distinct [Stock Location] from Client_Temp_UpdateSKUs_HRJ_Pendi_3) and sls.isDeleted=0 
and sls.stockLocationID > 5000
	
	Declare @cmd2 varchar(1000);
set @cmd2 = 'sqlcmd -S "HRJPOWERBI" -d "SYMPHONY_HRJ" -Q "set nocount on; select * from Client_Temp_UpdateSKUs_HRJ_Pendi_3;" -o "E:\SymphonyData\InputFolder\UPDATESKUS_ZRevised_HRJ_PendingSO_%date:~-4,4%%date:~-10,2%%date:~-7,2%.csv" -s"," -W'
exec master.dbo.xp_cmdshell @cmd2

end
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_MTA_MTO_combine_Report_IPNR]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_MTA_MTO_combine_Report_IPNR]
AS
BEGIN

drop table client_temp_WO_detail
SELECT 
      wo.[stockLocationName] as Client_SL
	  ,substring (sl.stockLocationName,1, len(sl.stockLocationName)-1) as Plant
      	  ,s.skuName
	  ,isnull(slls.Parent_code,s.skuName) as Parent_code
       ,[quantity]
      ,[bufferColor]
	  ,wo.woid
     into client_temp_WO_detail
  FROM [SYMPHONY_HRJ].[dbo].[Symphony_WorkOrders] wo
  left join Symphony_StockLocations sl on sl.stockLocationID=wo.plantID
  left join Symphony_SKUs s on s.skuID=wo.skuID
  left join  (select ssl.stockLocationName as SL,ssls.locationSkuName as sku,ssls.custom_txt8 as Parent_code from  Symphony_StockLocationSkus ssls 
  left join symphony_stocklocations ssl on ssl.stockLocationID=ssls.stockLocationID) slls on slls.SL=substring (sl.stockLocationName,1, len(sl.stockLocationName)-1) and slls.sku=s.skuName



SELECT  sl.stockLocationName as [Stock Location]       
    ,sl.stockLocationDescription as [SL Description]     
	    ,sls.locationSkuName as SKU        
	 ,sls.custom_txt8 as [Parent Code]  
	 ,sls.skuDescription as [SKU Description] 
    ,SLS.custom_txt3 [Business]  
	 ,spi.skuItemName [Division]  
	 ,sls.bufferSize 
	  ,sls.inventoryAtSite as [Inventory at Site] 
	   ,case when sls.siteColor=0 then 'Cyan' when sls.siteColor=1 then 'Green' when sls.siteColor=2 then 'yellow' when sls.siteColor=3 then 'Red' when sls.siteColor=4 
	 then 'Black' end [BP Site Color]  
	   ,sls.inventoryAtTransit as [Inventory at Transit]
	  ,sls.inventoryAtProduction as [Inventory at Production]
	  ,sls.inventoryNeeded as InventoryNeeded 
	  ,sls.custom_num7 as [Unreserved Open Orders_Trade]
	  ,sls.custom_num8 as [Unreserved Open Orders_Projects]
	  ,sls.custom_num9 as [Unreserved Open Orders_Dealer Projects]
	  ,sls.custom_num7+sls.custom_num8+sls.custom_num9+sls.inventoryNeeded as [Total Production Requirement]
	  ,BR.Total_WO_Count as [Total Number of MTO orders]
	  ,BR.Total_WO_Qty as [MTO requirement qty for Total Orders]
	  ,BR.BR_WO_Count as [Number of MTO orders in Black & Red]
	  ,BR.BR_WO_Qty as [MTO requirement qty for orders in Black & Red]
	  
	 FROM [SYMPHONY_HRJ].[dbo].[Symphony_StockLocationSkus] sls   
	 join Symphony_StockLocations sl on sls.stockLocationID=sl.stockLocationID   
	 join Symphony_StockLocations sl1 on sls.originStockLocation=sl1.stockLocationID    
	 left join Symphony_SKUsPropertyItems spi on spi.skuItemID=sls.skuPropertyID1   
	 left join Symphony_SKUsPropertyItems spi1 on spi1.skuItemID=sls.skuPropertyID6 
	 left join Symphony_SKUsPropertyItems spi5 on spi5.skuItemID=sls.skuPropertyID5  
	 
	 left join (
	 
  select t1.Plant,t1.skuName,sum(t1.quantity) as Total_WO_Qty,count(t1.woid ) as Total_WO_Count,isnull(max( t2.Total_WO_BR),0 )as BR_WO_Count,isnull(max(t2.WO_Qty_BR ),0) as BR_WO_Qty from client_temp_WO_detail t1
   left join (select Plant,skuName,count(woid ) as Total_WO_BR,sum(quantity) as WO_Qty_BR from  client_temp_WO_detail where bufferColor in (3,4) group by Plant,skuName) t2  on t2.Plant=t1.Plant and t2.skuName=t1.skuName
   group by t1.Plant,t1.skuName) BR on BR.Plant=sl.stockLocationName  and BR.skuName=sls.locationSkuName

	  where 
	  sls.custom_txt3 like 'IPNR'  and SLS.isDeleted = 0 and sl.stockLocationType=5 
	  and sl.isDeleted=0  and sls.avoidReplenishment=0 
	  --and sl1.stockLocationName in ('106205' ) and sl.stockLocationName='6100' and sls.inventoryNeeded>0 and sls.bufferSize>0 and 
	  end
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_MTA_MTO_combine_Report_JBD]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_MTA_MTO_combine_Report_JBD]
AS
BEGIN

drop table client_temp_WO_detail
SELECT 
      wo.[stockLocationName] as Client_SL
	  ,substring (sl.stockLocationName,1, len(sl.stockLocationName)-1) as Plant
      	  ,s.skuName
	  ,isnull(slls.Parent_code,s.skuName) as Parent_code
       ,[quantity]
      ,[bufferColor]
	  ,wo.woid
     into client_temp_WO_detail
  FROM [SYMPHONY_HRJ].[dbo].[Symphony_WorkOrders] wo
  left join Symphony_StockLocations sl on sl.stockLocationID=wo.plantID
  left join Symphony_SKUs s on s.skuID=wo.skuID
  left join  (select ssl.stockLocationName as SL,ssls.locationSkuName as sku,ssls.custom_txt8 as Parent_code from  Symphony_StockLocationSkus ssls 
  left join symphony_stocklocations ssl on ssl.stockLocationID=ssls.stockLocationID) slls on slls.SL=substring (sl.stockLocationName,1, len(sl.stockLocationName)-1) and slls.sku=s.skuName



SELECT  sl.stockLocationName as [Stock Location]       
    ,sl.stockLocationDescription as [SL Description]     
	    ,sls.locationSkuName as SKU        
	 ,sls.custom_txt8 as [Parent Code]  
	 ,sls.skuDescription as [SKU Description] 
    ,SLS.custom_txt3 [Business]  
	 ,spi.skuItemName [Division]  
	 ,sls.bufferSize 
	  ,sls.inventoryAtSite as [Inventory at Site] 
	   ,case when sls.siteColor=0 then 'Cyan' when sls.siteColor=1 then 'Green' when sls.siteColor=2 then 'yellow' when sls.siteColor=3 then 'Red' when sls.siteColor=4 
	 then 'Black' end [BP Site Color]  
	   ,sls.inventoryAtTransit as [Inventory at Transit]
	  ,sls.inventoryAtProduction as [Inventory at Production]
	  ,sls.inventoryNeeded as InventoryNeeded 
	  ,sls.custom_num7 as [Unreserved Open Orders_Trade]
	  ,sls.custom_num8 as [Unreserved Open Orders_Projects]
	  ,sls.custom_num9 as [Unreserved Open Orders_Dealer Projects]
	  ,sls.custom_num7+sls.custom_num8+sls.custom_num9+sls.inventoryNeeded as [Total Production Requirement]
	  ,BR.Total_WO_Count as [Total Number of MTO orders]
	  ,BR.Total_WO_Qty as [MTO requirement qty for Total Orders]
	  ,BR.BR_WO_Count as [Number of MTO orders in Black & Red]
	  ,BR.BR_WO_Qty as [MTO requirement qty for orders in Black & Red]
	  
	 FROM [SYMPHONY_HRJ].[dbo].[Symphony_StockLocationSkus] sls   
	 join Symphony_StockLocations sl on sls.stockLocationID=sl.stockLocationID   
	 join Symphony_StockLocations sl1 on sls.originStockLocation=sl1.stockLocationID    
	 left join Symphony_SKUsPropertyItems spi on spi.skuItemID=sls.skuPropertyID1   
	 left join Symphony_SKUsPropertyItems spi1 on spi1.skuItemID=sls.skuPropertyID6 
	 left join Symphony_SKUsPropertyItems spi5 on spi5.skuItemID=sls.skuPropertyID5  
	 
	 left join (
	 
  select t1.Plant,t1.skuName,sum(t1.quantity) as Total_WO_Qty,count(t1.woid ) as Total_WO_Count,isnull(max( t2.Total_WO_BR),0 )as BR_WO_Count,isnull(max(t2.WO_Qty_BR ),0) as BR_WO_Qty from client_temp_WO_detail t1
   left join (select Plant,skuName,count(woid ) as Total_WO_BR,sum(quantity) as WO_Qty_BR from  client_temp_WO_detail where bufferColor in (3,4) group by Plant,skuName) t2  on t2.Plant=t1.Plant and t2.skuName=t1.skuName
   group by t1.Plant,t1.skuName) BR on BR.Plant=sl.stockLocationName  and BR.skuName=sls.locationSkuName

	  where 
	  sls.custom_txt3 like 'JBD'  and SLS.isDeleted = 0 and sl.stockLocationType=5 
	  and sl.isDeleted=0  and sls.avoidReplenishment=0 
	  --and sl1.stockLocationName in ('106205' ) and sl.stockLocationName='6100' and sls.inventoryNeeded>0 and sls.bufferSize>0 and 
	  end
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_MTA_MTO_combine_Report_TILES]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_MTA_MTO_combine_Report_TILES]
AS
BEGIN

drop table client_temp_WO_detail
SELECT 
      wo.[stockLocationName] as Client_SL
	  ,substring (sl.stockLocationName,1, len(sl.stockLocationName)-1) as Plant
      	  ,s.skuName
	  ,isnull(slls.Parent_code,s.skuName) as Parent_code
       ,[quantity]
      ,[bufferColor]
	  ,wo.woid
     into client_temp_WO_detail
  FROM [SYMPHONY_HRJ].[dbo].[Symphony_WorkOrders] wo
  left join Symphony_StockLocations sl on sl.stockLocationID=wo.plantID
  left join Symphony_SKUs s on s.skuID=wo.skuID
  left join  (select ssl.stockLocationName as SL,ssls.locationSkuName as sku,ssls.custom_txt8 as Parent_code from  Symphony_StockLocationSkus ssls 
  left join symphony_stocklocations ssl on ssl.stockLocationID=ssls.stockLocationID) slls on slls.SL=substring (sl.stockLocationName,1, len(sl.stockLocationName)-1) and slls.sku=s.skuName



SELECT  sl.stockLocationName as [Stock Location]       
    ,sl.stockLocationDescription as [SL Description]     
	    ,sls.locationSkuName as SKU        
	 ,sls.custom_txt8 as [Parent Code]  
	 ,sls.skuDescription as [SKU Description] 
    ,SLS.custom_txt3 [Business]  
	 ,spi.skuItemName [Division]  
	 ,sls.bufferSize 
	  ,sls.inventoryAtSite as [Inventory at Site] 
	   ,case when sls.siteColor=0 then 'Cyan' when sls.siteColor=1 then 'Green' when sls.siteColor=2 then 'yellow' when sls.siteColor=3 then 'Red' when sls.siteColor=4 
	 then 'Black' end [BP Site Color]  
	   ,sls.inventoryAtTransit as [Inventory at Transit]
	  ,sls.inventoryAtProduction as [Inventory at Production]
	  ,sls.inventoryNeeded as InventoryNeeded 
	  ,sls.custom_num7 as [Unreserved Open Orders_Trade]
	  ,sls.custom_num8 as [Unreserved Open Orders_Projects]
	  ,sls.custom_num9 as [Unreserved Open Orders_Dealer Projects]
	  ,sls.custom_num7+sls.custom_num8+sls.custom_num9+sls.inventoryNeeded as [Total Production Requirement]
	  ,BR.Total_WO_Count as [Total Number of MTO orders]
	  ,BR.Total_WO_Qty as [MTO requirement qty for Total Orders]
	  ,BR.BR_WO_Count as [Number of MTO orders in Black & Red]
	  ,BR.BR_WO_Qty as [MTO requirement qty for orders in Black & Red]
	  
	 FROM [SYMPHONY_HRJ].[dbo].[Symphony_StockLocationSkus] sls   
	 join Symphony_StockLocations sl on sls.stockLocationID=sl.stockLocationID   
	 join Symphony_StockLocations sl1 on sls.originStockLocation=sl1.stockLocationID    
	 left join Symphony_SKUsPropertyItems spi on spi.skuItemID=sls.skuPropertyID1   
	 left join Symphony_SKUsPropertyItems spi1 on spi1.skuItemID=sls.skuPropertyID6 
	 left join Symphony_SKUsPropertyItems spi5 on spi5.skuItemID=sls.skuPropertyID5  
	 
	 left join (
	 
  select t1.Plant,t1.skuName,sum(t1.quantity) as Total_WO_Qty,count(t1.woid ) as Total_WO_Count,isnull(max( t2.Total_WO_BR),0 )as BR_WO_Count,isnull(max(t2.WO_Qty_BR ),0) as BR_WO_Qty from client_temp_WO_detail t1
   left join (select Plant,skuName,count(woid ) as Total_WO_BR,sum(quantity) as WO_Qty_BR from  client_temp_WO_detail where bufferColor in (3,4) group by Plant,skuName) t2  on t2.Plant=t1.Plant and t2.skuName=t1.skuName
   group by t1.Plant,t1.skuName) BR on BR.Plant=sl.stockLocationName  and BR.skuName=sls.locationSkuName

	  where 
	  sls.custom_txt3 like 'TILES'  and SLS.isDeleted = 0 and sl.stockLocationType=5 
	  and sl.isDeleted=0  and sls.avoidReplenishment=0 
	  --and sl1.stockLocationName in ('106205' ) and sl.stockLocationName='6100' and sls.inventoryNeeded>0 and sls.bufferSize>0 and 
	  end
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_MTS_field_Exception]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_MTS_field_Exception]
AS
BEGIN


select sl.stockLocationName as [Stock Location],sls.locationSkuName as SKU
   ,sls.skuDescription as [SKU Description],sls.skuPropertyID1 as Division,sls.custom_txt3 as Business,sls.originStockLocation as [Origin Stock Location],sls.custom_txt8 as [Parent code],
   sls.custom_txt10 as [HBT National],u.uomName as UOM
 from Symphony_StockLocationSkus sls
left join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID
left join Symphony_UOM u on u.uomID=sls.uomID
where (sls.skuPropertyID1 is null or sls.skuDescription is null or sls.skuDescription='' or 
sls.custom_txt3 is null or sls.custom_txt3='' or sls.originStockLocation='' or sls.originStockLocation is null
 or sls.custom_txt8 is null or sls.custom_txt8='' or sls.custom_txt10 is null or sls.custom_txt10='' or sls.uomID=1)
  and sls.inventoryAtSite+sls.inventoryAtTransit>0 

 end
 
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_MTS_History]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_MTS_History]      
AS      
BEGIN      
      
      
SELECT sl.stockLocationName      
      ,s.skuName      
   ,spi.skuItemName as Division  
   ,sls.custom_txt3 as Business  
   ,u.uomName as UOM  
   ,slsh.bufferSize      
   ,slsh.inventoryAtSite      
   ,slsh.inventoryAtTransit      
   ,slsh.inventoryAtProduction      
   ,case when slsh.bufferSize=0 and (slsh.inventoryAtSite + slsh.inventoryAtTransit+slsh.inventoryAtProduction)=0 then 'Green' else      
   case when slsh.bufferSize=0 and (slsh.inventoryAtSite + slsh.inventoryAtTransit+slsh.inventoryAtProduction)>0 then 'Cyan' else      
   case when slsh.bufferSize>0 and (slsh.inventoryAtSite + slsh.inventoryAtTransit+slsh.inventoryAtProduction)=0 then 'Black' else      
   case when slsh.bufferSize=(slsh.inventoryAtSite + slsh.inventoryAtTransit+slsh.inventoryAtProduction) then 'Green' else      
   case when slsh.bufferSize<(slsh.inventoryAtSite + slsh.inventoryAtTransit+slsh.inventoryAtProduction) then 'Cyan' else      
   case when slsh.bufferSize>0 and (slsh.inventoryAtSite + slsh.inventoryAtTransit+slsh.inventoryAtProduction)/slsh.bufferSize>1 then 'Cyan' else      
   case when slsh.bufferSize>0 and (slsh.inventoryAtSite + slsh.inventoryAtTransit+slsh.inventoryAtProduction)/slsh.bufferSize between 0.6601 and 1 then 'Green' else      
   case when slsh.bufferSize>0 and (slsh.inventoryAtSite + slsh.inventoryAtTransit+slsh.inventoryAtProduction)/slsh.bufferSize between 0.3301 and 0.66 then 'Yellow' else      
   case when slsh.bufferSize>0 and (slsh.inventoryAtSite + slsh.inventoryAtTransit+slsh.inventoryAtProduction)/slsh.bufferSize between 0.001 and 0.33 then 'Red'       
    end end end end end end end end end as [BP Colour]      
    ,slsh.updateDate      
      --,slsh.[consumption]        
  FROM [Symphony_StockLocationSkuHistory] slsh      
  join Symphony_StockLocations sl on sl.stockLocationID=slsh.stockLocationID      
  join Symphony_SKUs s on s.skuID=slsh.skuID      
  left join Symphony_StockLocationSkus sls on sls.stockLocationID=slsh.stockLocationID and sls.skuID=slsh.skuID      
  left join Symphony_SKUsPropertyItems spi on spi.skuItemID=sls.skuPropertyID1  
  left join Symphony_UOM u on u.uomID=sls.uomID  
  where slsh.updatedate>=convert(date, getdate()-60)     
  /*Condition added on 2019-08-08 by bharat*/    
  and slsh.bufferSize > 0  and s.skuID in (select distinct skuID  from Symphony_StockLocationSkus where custom_txt3='JBD' )  
   -- commented SL by bharat on 2019-08-05  
  --and sl.stockLocationName in ('2400','7410') --and s.skuName='U0004FUCOAL0405'      
  /*END - Condition added on 2019-08-05 by bharat*/   
  order by slsh.updateDate      
        
  end
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_MTS_History_IPNR]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

    
CREATE PROCEDURE [dbo].[Client_SP_MTS_History_IPNR]      
AS      
BEGIN      
      
      
SELECT sl.stockLocationName      
      ,s.skuName
	  ,spi.skuItemName as Division
	  ,sls.custom_txt3 as Business
	  ,u.uomName as UOM      
   ,slsh.bufferSize      
   ,slsh.inventoryAtSite      
   ,slsh.inventoryAtTransit      
   ,slsh.inventoryAtProduction      
   ,case when slsh.bufferSize=0 and (slsh.inventoryAtSite + slsh.inventoryAtTransit+slsh.inventoryAtProduction)=0 then 'Green' else      
   case when slsh.bufferSize=0 and (slsh.inventoryAtSite + slsh.inventoryAtTransit+slsh.inventoryAtProduction)>0 then 'Cyan' else      
   case when slsh.bufferSize>0 and (slsh.inventoryAtSite + slsh.inventoryAtTransit+slsh.inventoryAtProduction)=0 then 'Black' else      
   case when slsh.bufferSize=(slsh.inventoryAtSite + slsh.inventoryAtTransit+slsh.inventoryAtProduction) then 'Green' else      
   case when slsh.bufferSize<(slsh.inventoryAtSite + slsh.inventoryAtTransit+slsh.inventoryAtProduction) then 'Cyan' else      
   case when slsh.bufferSize>0 and (slsh.inventoryAtSite + slsh.inventoryAtTransit+slsh.inventoryAtProduction)/slsh.bufferSize>1 then 'Cyan' else      
   case when slsh.bufferSize>0 and (slsh.inventoryAtSite + slsh.inventoryAtTransit+slsh.inventoryAtProduction)/slsh.bufferSize between 0.6601 and 1 then 'Green' else      
   case when slsh.bufferSize>0 and (slsh.inventoryAtSite + slsh.inventoryAtTransit+slsh.inventoryAtProduction)/slsh.bufferSize between 0.3301 and 0.66 then 'Yellow' else      
   case when slsh.bufferSize>0 and (slsh.inventoryAtSite + slsh.inventoryAtTransit+slsh.inventoryAtProduction)/slsh.bufferSize between 0.001 and 0.33 then 'Red'       
    end end end end end end end end end as [BP Colour]      
    ,slsh.updateDate      
      --,slsh.[consumption]        
  FROM [Symphony_StockLocationSkuHistory] slsh      
  join Symphony_StockLocations sl on sl.stockLocationID=slsh.stockLocationID      
  join Symphony_SKUs s on s.skuID=slsh.skuID      
  left join Symphony_StockLocationSkus sls on sls.stockLocationID=slsh.stockLocationID and sls.skuID=slsh.skuID
  left join Symphony_SKUsPropertyItems spi on spi.skuItemID=sls.skuPropertyID1
  left join Symphony_UOM u on u.uomID=sls.uomID      
  where slsh.updatedate>=convert(date, getdate()-60)     
  /*Condition added on 2019-08-08 by bharat*/    
  and slsh.bufferSize > 0  and s.skuID in (select distinct skuID  from Symphony_StockLocationSkus where custom_txt3='IPNR' )  
   -- commented SL by bharat on 2019-08-05  
  --and sl.stockLocationName in ('2400','7410') --and s.skuName='U0004FUCOAL0405'      
  /*END - Condition added on 2019-08-05 by bharat*/   
  order by slsh.updateDate      
        
  end
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_MTS_History_TILES]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[Client_SP_MTS_History_TILES]    
AS    
BEGIN    
    
    
SELECT sl.stockLocationName    
      ,s.skuName 
	  ,spi.skuItemName as Division
	  ,sls.custom_txt3 as Business
	  ,u.uomName as UOM
     ,slsh.bufferSize    
   ,slsh.inventoryAtSite    
   ,slsh.inventoryAtTransit    
   ,slsh.inventoryAtProduction    
   ,case when slsh.bufferSize=0 and (slsh.inventoryAtSite + slsh.inventoryAtTransit+slsh.inventoryAtProduction)=0 then 'Green' else    
   case when slsh.bufferSize=0 and (slsh.inventoryAtSite + slsh.inventoryAtTransit+slsh.inventoryAtProduction)>0 then 'Cyan' else    
   case when slsh.bufferSize>0 and (slsh.inventoryAtSite + slsh.inventoryAtTransit+slsh.inventoryAtProduction)=0 then 'Black' else    
   case when slsh.bufferSize=(slsh.inventoryAtSite + slsh.inventoryAtTransit+slsh.inventoryAtProduction) then 'Green' else    
   case when slsh.bufferSize<(slsh.inventoryAtSite + slsh.inventoryAtTransit+slsh.inventoryAtProduction) then 'Cyan' else    
   case when slsh.bufferSize>0 and (slsh.inventoryAtSite + slsh.inventoryAtTransit+slsh.inventoryAtProduction)/slsh.bufferSize>1 then 'Cyan' else    
   case when slsh.bufferSize>0 and (slsh.inventoryAtSite + slsh.inventoryAtTransit+slsh.inventoryAtProduction)/slsh.bufferSize between 0.6601 and 1 then 'Green' else    
   case when slsh.bufferSize>0 and (slsh.inventoryAtSite + slsh.inventoryAtTransit+slsh.inventoryAtProduction)/slsh.bufferSize between 0.3301 and 0.66 then 'Yellow' else    
   case when slsh.bufferSize>0 and (slsh.inventoryAtSite + slsh.inventoryAtTransit+slsh.inventoryAtProduction)/slsh.bufferSize between 0.001 and 0.33 then 'Red'     
    end end end end end end end end end as [BP Colour]    
    ,slsh.updateDate    
      --,slsh.[consumption]      
  FROM [Symphony_StockLocationSkuHistory] slsh    
  join Symphony_StockLocations sl on sl.stockLocationID=slsh.stockLocationID    
  join Symphony_SKUs s on s.skuID=slsh.skuID    
  left join Symphony_StockLocationSkus sls on sls.stockLocationID=slsh.stockLocationID and sls.skuID=slsh.skuID    
  left join Symphony_SKUsPropertyItems spi on spi.skuItemID=sls.skuPropertyID1
  left join Symphony_UOM u on u.uomID=sls.uomID
  where slsh.updatedate>=convert(date, getdate()-90)   
  /*Condition added on 2019-08-08 by bharat*/  
  and slsh.bufferSize > 0  and s.skuID in (select distinct skuID  from Symphony_StockLocationSkus where custom_txt3='TILES' )
   -- commented SL by bharat on 2019-08-05
  --and sl.stockLocationName in ('2400','7410') --and s.skuName='U0004FUCOAL0405'    
  /*END - Condition added on 2019-08-05 by bharat*/ 
  order by slsh.updateDate    
      
  end 
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_MTSSKUsUpdate]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_MTSSKUsUpdate]
AS
BEGIN

update sls 
set sls.avoidReplenishment = 1
from [SYMPHONY_HRJ].[dbo].[Symphony_StockLocationSkus] sls
where locationSkuName in ('1000000000000','1.00E+12')

update sls
set sls.custom_num6 = batch.Inv_at_site_Qty
from [SYMPHONY_HRJ].[dbo].[Symphony_StockLocationSkus] sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID
join Symphony_SKUs s on s.skuID=sls.skuID
join (select a.SL,a.SKU,batch,Inv_at_site_Qty  from client_temp_batch_inv a 
	inner join (select sku,sl,max(Inv_at_site_Qty) as qty from client_temp_batch_inv group by SKU,SL) b on b.SKU=a.SKU and b.SL=a.SL and b.qty=a.Inv_at_site_Qty
) batch on batch.SL=sl.stockLocationName and batch.SKU=s.skuName
where sl.stockLocationName in ('2400','2100','2200','2600','0200','0300','0400','6610','7210','7410','7800')


update sls set inventoryAtTransit=#sym.rev_transit
from Symphony_StockLocationSkus sls
join (select slsh.stockLocationID,slsh.skuID,sum(slsh.totalIn) as TotIN,sls.inventoryAtTransit as trasit,sls.inventoryAtTransit-sum(slsh.totalIn) as rev_transit from Symphony_StockLocationSkuHistory slsh
join Symphony_StockLocationSkus sls on sls.stockLocationID=slsh.stockLocationID and sls.skuID=slsh.skuID
join Symphony_StockLocations sl on sl.stockLocationID=slsh.stockLocationID
where sl.slPropertyID6=122 and sls.inventoryAtTransit>0 -- slsh.stockLocationID=141 and slsh.skuID=12526 
group by slsh.stockLocationID,slsh.skuID,sls.inventoryAtTransit
having sls.inventoryAtTransit-sum(slsh.totalIn)>0 and sum(slsh.totalIn)>0
)#sym on #sym.stockLocationID=sls.stockLocationID and #sym.skuID=sls.skuID


/*
update sls set inventoryAtTransit=0
from Symphony_StockLocationSkus sls
join (select sls.stockLocationID, sl.stockLocationName, locationSkuName,datediff(d,slsh.Update_date,getdate()) as No_of_days_from_His_Lastupdate,
sls.skuID,replenishmentTime,inventoryAtTransit ,slsh.count_transit_days,slsh.inv_trans from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 
left join (select stockLocationID,skuID,max(updateDate) as Update_date,sum(case when inventoryAtTransit>0 then 1 else 0 end) as 
count_transit_days,sum(inventoryAtTransit) as inv_trans from Symphony_StockLocationSkuHistory where updateDate>=convert(date,getdate()-7) group by stockLocationID,skuID ) slsh on 
slsh.stockLocationID=sls.stockLocationID and slsh.skuID=sls.skuID
where sl.slPropertyID6=122 and replenishmentTime<=7 and sls.inventoryAtTransit>0 
and (slsh.count_transit_days is null or slsh.count_transit_days=7))#xdm on #xdm.stockLocationID=sls.stockLocationID and #xdm.skuID=sls.skuID
*/

update sls set inventoryAtTransit=0
from Symphony_StockLocationSkus sls
join (
select sls.stockLocationID, sl.stockLocationName, locationSkuName,datediff(d,slsh.Update_date,getdate()) as No_of_days_from_His_Lastupdate,
sls.skuID,replenishmentTime,inventoryAtTransit ,slsh.count_transit_days,slsh.inv_trans from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 
left join (select stockLocationID,skuID,max(updateDate) as Update_date,sum(case when inventoryAtTransit>0 then 1 else 0 end) as 
count_transit_days,sum(inventoryAtTransit) as inv_trans from Symphony_StockLocationSkuHistory where updateDate>=convert(date,getdate()-2) group by stockLocationID,skuID ) slsh on 
slsh.stockLocationID=sls.stockLocationID and slsh.skuID=sls.skuID
where sl.slPropertyID6=122  and sls.inventoryAtTransit>0 and slsh.count_transit_days+datediff(d,slsh.Update_date,getdate())>sls.replenishmentTime and sls.replenishmentTime=1
)#xdm on #xdm.stockLocationID=sls.stockLocationID and #xdm.skuID=sls.skuID





update sls set inventoryAtTransit=0
from Symphony_StockLocationSkus sls
where sls.inventoryAtTransit<0


update slsh set inventoryAtTransit=0
from Symphony_StockLocationSkuHistory slsh
where slsh.inventoryAtTransit<0


---- added day wise (Repl. lead time) reset of In-transit qty from 1 day to 20 days

update sls set inventoryAtTransit=0
from Symphony_StockLocationSkus sls
join (
select sls.stockLocationID, sl.stockLocationName, locationSkuName,datediff(d,slsh.Update_date,getdate()) as No_of_days_from_His_Lastupdate,
sls.skuID,replenishmentTime,inventoryAtTransit ,slsh.count_transit_days,slsh.inv_trans from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 
left join (select stockLocationID,skuID,max(updateDate) as Update_date,sum(case when inventoryAtTransit>0 then 1 else 0 end) as 
count_transit_days,sum(inventoryAtTransit) as inv_trans from Symphony_StockLocationSkuHistory where
 updateDate>=convert(date,getdate()-3) group by stockLocationID,skuID ) slsh on 
slsh.stockLocationID=sls.stockLocationID and slsh.skuID=sls.skuID
where sl.slPropertyID6=122  and sls.inventoryAtTransit>0 and slsh.count_transit_days+datediff(d,slsh.Update_date,getdate())>sls.replenishmentTime 
and sls.replenishmentTime=2
)#xdm on #xdm.stockLocationID=sls.stockLocationID and #xdm.skuID=sls.skuID


update sls set inventoryAtTransit=0
from Symphony_StockLocationSkus sls
join (
select sls.stockLocationID, sl.stockLocationName, locationSkuName,datediff(d,slsh.Update_date,getdate()) as No_of_days_from_His_Lastupdate,
sls.skuID,replenishmentTime,inventoryAtTransit ,slsh.count_transit_days,slsh.inv_trans from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 
left join (select stockLocationID,skuID,max(updateDate) as Update_date,sum(case when inventoryAtTransit>0 then 1 else 0 end) as 
count_transit_days,sum(inventoryAtTransit) as inv_trans from Symphony_StockLocationSkuHistory where
 updateDate>=convert(date,getdate()-4) group by stockLocationID,skuID ) slsh on 
slsh.stockLocationID=sls.stockLocationID and slsh.skuID=sls.skuID
where sl.slPropertyID6=122  and sls.inventoryAtTransit>0 and slsh.count_transit_days+datediff(d,slsh.Update_date,getdate())>sls.replenishmentTime 
and sls.replenishmentTime=3
)#xdm on #xdm.stockLocationID=sls.stockLocationID and #xdm.skuID=sls.skuID

update sls set inventoryAtTransit=0
from Symphony_StockLocationSkus sls
join (
select sls.stockLocationID, sl.stockLocationName, locationSkuName,datediff(d,slsh.Update_date,getdate()) as No_of_days_from_His_Lastupdate,
sls.skuID,replenishmentTime,inventoryAtTransit ,slsh.count_transit_days,slsh.inv_trans from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 
left join (select stockLocationID,skuID,max(updateDate) as Update_date,sum(case when inventoryAtTransit>0 then 1 else 0 end) as 
count_transit_days,sum(inventoryAtTransit) as inv_trans from Symphony_StockLocationSkuHistory where
 updateDate>=convert(date,getdate()-5) group by stockLocationID,skuID ) slsh on 
slsh.stockLocationID=sls.stockLocationID and slsh.skuID=sls.skuID
where sl.slPropertyID6=122  and sls.inventoryAtTransit>0 and slsh.count_transit_days+datediff(d,slsh.Update_date,getdate())>sls.replenishmentTime 
and sls.replenishmentTime=4
)#xdm on #xdm.stockLocationID=sls.stockLocationID and #xdm.skuID=sls.skuID


update sls set inventoryAtTransit=0
from Symphony_StockLocationSkus sls
join (
select sls.stockLocationID, sl.stockLocationName, locationSkuName,datediff(d,slsh.Update_date,getdate()) as No_of_days_from_His_Lastupdate,
sls.skuID,replenishmentTime,inventoryAtTransit ,slsh.count_transit_days,slsh.inv_trans from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 
left join (select stockLocationID,skuID,max(updateDate) as Update_date,sum(case when inventoryAtTransit>0 then 1 else 0 end) as 
count_transit_days,sum(inventoryAtTransit) as inv_trans from Symphony_StockLocationSkuHistory where
 updateDate>=convert(date,getdate()-6) group by stockLocationID,skuID ) slsh on 
slsh.stockLocationID=sls.stockLocationID and slsh.skuID=sls.skuID
where sl.slPropertyID6=122  and sls.inventoryAtTransit>0 and slsh.count_transit_days+datediff(d,slsh.Update_date,getdate())>sls.replenishmentTime 
and sls.replenishmentTime=5
)#xdm on #xdm.stockLocationID=sls.stockLocationID and #xdm.skuID=sls.skuID


update sls set inventoryAtTransit=0
from Symphony_StockLocationSkus sls
join (
select sls.stockLocationID, sl.stockLocationName, locationSkuName,datediff(d,slsh.Update_date,getdate()) as No_of_days_from_His_Lastupdate,
sls.skuID,replenishmentTime,inventoryAtTransit ,slsh.count_transit_days,slsh.inv_trans from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 
left join (select stockLocationID,skuID,max(updateDate) as Update_date,sum(case when inventoryAtTransit>0 then 1 else 0 end) as 
count_transit_days,sum(inventoryAtTransit) as inv_trans from Symphony_StockLocationSkuHistory where
 updateDate>=convert(date,getdate()-7) group by stockLocationID,skuID ) slsh on 
slsh.stockLocationID=sls.stockLocationID and slsh.skuID=sls.skuID
where sl.slPropertyID6=122  and sls.inventoryAtTransit>0 and slsh.count_transit_days+datediff(d,slsh.Update_date,getdate())>sls.replenishmentTime 
and sls.replenishmentTime=6
)#xdm on #xdm.stockLocationID=sls.stockLocationID and #xdm.skuID=sls.skuID


update sls set inventoryAtTransit=0
from Symphony_StockLocationSkus sls
join (
select sls.stockLocationID, sl.stockLocationName, locationSkuName,datediff(d,slsh.Update_date,getdate()) as No_of_days_from_His_Lastupdate,
sls.skuID,replenishmentTime,inventoryAtTransit ,slsh.count_transit_days,slsh.inv_trans from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 
left join (select stockLocationID,skuID,max(updateDate) as Update_date,sum(case when inventoryAtTransit>0 then 1 else 0 end) as 
count_transit_days,sum(inventoryAtTransit) as inv_trans from Symphony_StockLocationSkuHistory where
 updateDate>=convert(date,getdate()-8) group by stockLocationID,skuID ) slsh on 
slsh.stockLocationID=sls.stockLocationID and slsh.skuID=sls.skuID
where sl.slPropertyID6=122  and sls.inventoryAtTransit>0 and slsh.count_transit_days+datediff(d,slsh.Update_date,getdate())>sls.replenishmentTime 
and sls.replenishmentTime=7
)#xdm on #xdm.stockLocationID=sls.stockLocationID and #xdm.skuID=sls.skuID


update sls set inventoryAtTransit=0
from Symphony_StockLocationSkus sls
join (
select sls.stockLocationID, sl.stockLocationName, locationSkuName,datediff(d,slsh.Update_date,getdate()) as No_of_days_from_His_Lastupdate,
sls.skuID,replenishmentTime,inventoryAtTransit ,slsh.count_transit_days,slsh.inv_trans from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 
left join (select stockLocationID,skuID,max(updateDate) as Update_date,sum(case when inventoryAtTransit>0 then 1 else 0 end) as 
count_transit_days,sum(inventoryAtTransit) as inv_trans from Symphony_StockLocationSkuHistory where
 updateDate>=convert(date,getdate()-9) group by stockLocationID,skuID ) slsh on 
slsh.stockLocationID=sls.stockLocationID and slsh.skuID=sls.skuID
where sl.slPropertyID6=122  and sls.inventoryAtTransit>0 and slsh.count_transit_days+datediff(d,slsh.Update_date,getdate())>sls.replenishmentTime 
and sls.replenishmentTime=8
)#xdm on #xdm.stockLocationID=sls.stockLocationID and #xdm.skuID=sls.skuID


update sls set inventoryAtTransit=0
from Symphony_StockLocationSkus sls
join (
select sls.stockLocationID, sl.stockLocationName, locationSkuName,datediff(d,slsh.Update_date,getdate()) as No_of_days_from_His_Lastupdate,
sls.skuID,replenishmentTime,inventoryAtTransit ,slsh.count_transit_days,slsh.inv_trans from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 
left join (select stockLocationID,skuID,max(updateDate) as Update_date,sum(case when inventoryAtTransit>0 then 1 else 0 end) as 
count_transit_days,sum(inventoryAtTransit) as inv_trans from Symphony_StockLocationSkuHistory where
 updateDate>=convert(date,getdate()-10) group by stockLocationID,skuID ) slsh on 
slsh.stockLocationID=sls.stockLocationID and slsh.skuID=sls.skuID
where sl.slPropertyID6=122  and sls.inventoryAtTransit>0 and slsh.count_transit_days+datediff(d,slsh.Update_date,getdate())>sls.replenishmentTime 
and sls.replenishmentTime=9
)#xdm on #xdm.stockLocationID=sls.stockLocationID and #xdm.skuID=sls.skuID


update sls set inventoryAtTransit=0
from Symphony_StockLocationSkus sls
join (
select sls.stockLocationID, sl.stockLocationName, locationSkuName,datediff(d,slsh.Update_date,getdate()) as No_of_days_from_His_Lastupdate,
sls.skuID,replenishmentTime,inventoryAtTransit ,slsh.count_transit_days,slsh.inv_trans from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 
left join (select stockLocationID,skuID,max(updateDate) as Update_date,sum(case when inventoryAtTransit>0 then 1 else 0 end) as 
count_transit_days,sum(inventoryAtTransit) as inv_trans from Symphony_StockLocationSkuHistory where
 updateDate>=convert(date,getdate()-11) group by stockLocationID,skuID ) slsh on 
slsh.stockLocationID=sls.stockLocationID and slsh.skuID=sls.skuID
where sl.slPropertyID6=122  and sls.inventoryAtTransit>0 and slsh.count_transit_days+datediff(d,slsh.Update_date,getdate())>sls.replenishmentTime 
and sls.replenishmentTime=10
)#xdm on #xdm.stockLocationID=sls.stockLocationID and #xdm.skuID=sls.skuID


update sls set inventoryAtTransit=0
from Symphony_StockLocationSkus sls
join (
select sls.stockLocationID, sl.stockLocationName, locationSkuName,datediff(d,slsh.Update_date,getdate()) as No_of_days_from_His_Lastupdate,
sls.skuID,replenishmentTime,inventoryAtTransit ,slsh.count_transit_days,slsh.inv_trans from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 
left join (select stockLocationID,skuID,max(updateDate) as Update_date,sum(case when inventoryAtTransit>0 then 1 else 0 end) as 
count_transit_days,sum(inventoryAtTransit) as inv_trans from Symphony_StockLocationSkuHistory where
 updateDate>=convert(date,getdate()-12) group by stockLocationID,skuID ) slsh on 
slsh.stockLocationID=sls.stockLocationID and slsh.skuID=sls.skuID
where sl.slPropertyID6=122  and sls.inventoryAtTransit>0 and slsh.count_transit_days+datediff(d,slsh.Update_date,getdate())>sls.replenishmentTime 
and sls.replenishmentTime=11
)#xdm on #xdm.stockLocationID=sls.stockLocationID and #xdm.skuID=sls.skuID

update sls set inventoryAtTransit=0
from Symphony_StockLocationSkus sls
join (
select sls.stockLocationID, sl.stockLocationName, locationSkuName,datediff(d,slsh.Update_date,getdate()) as No_of_days_from_His_Lastupdate,
sls.skuID,replenishmentTime,inventoryAtTransit ,slsh.count_transit_days,slsh.inv_trans from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 
left join (select stockLocationID,skuID,max(updateDate) as Update_date,sum(case when inventoryAtTransit>0 then 1 else 0 end) as 
count_transit_days,sum(inventoryAtTransit) as inv_trans from Symphony_StockLocationSkuHistory where
 updateDate>=convert(date,getdate()-13) group by stockLocationID,skuID ) slsh on 
slsh.stockLocationID=sls.stockLocationID and slsh.skuID=sls.skuID
where sl.slPropertyID6=122  and sls.inventoryAtTransit>0 and slsh.count_transit_days+datediff(d,slsh.Update_date,getdate())>sls.replenishmentTime 
and sls.replenishmentTime=12
)#xdm on #xdm.stockLocationID=sls.stockLocationID and #xdm.skuID=sls.skuID


update sls set inventoryAtTransit=0
from Symphony_StockLocationSkus sls
join (
select sls.stockLocationID, sl.stockLocationName, locationSkuName,datediff(d,slsh.Update_date,getdate()) as No_of_days_from_His_Lastupdate,
sls.skuID,replenishmentTime,inventoryAtTransit ,slsh.count_transit_days,slsh.inv_trans from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 
left join (select stockLocationID,skuID,max(updateDate) as Update_date,sum(case when inventoryAtTransit>0 then 1 else 0 end) as 
count_transit_days,sum(inventoryAtTransit) as inv_trans from Symphony_StockLocationSkuHistory where
 updateDate>=convert(date,getdate()-14) group by stockLocationID,skuID ) slsh on 
slsh.stockLocationID=sls.stockLocationID and slsh.skuID=sls.skuID
where sl.slPropertyID6=122  and sls.inventoryAtTransit>0 and slsh.count_transit_days+datediff(d,slsh.Update_date,getdate())>sls.replenishmentTime 
and sls.replenishmentTime=13
)#xdm on #xdm.stockLocationID=sls.stockLocationID and #xdm.skuID=sls.skuID


update sls set inventoryAtTransit=0
from Symphony_StockLocationSkus sls
join (
select sls.stockLocationID, sl.stockLocationName, locationSkuName,datediff(d,slsh.Update_date,getdate()) as No_of_days_from_His_Lastupdate,
sls.skuID,replenishmentTime,inventoryAtTransit ,slsh.count_transit_days,slsh.inv_trans from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 
left join (select stockLocationID,skuID,max(updateDate) as Update_date,sum(case when inventoryAtTransit>0 then 1 else 0 end) as 
count_transit_days,sum(inventoryAtTransit) as inv_trans from Symphony_StockLocationSkuHistory where
 updateDate>=convert(date,getdate()-15) group by stockLocationID,skuID ) slsh on 
slsh.stockLocationID=sls.stockLocationID and slsh.skuID=sls.skuID
where sl.slPropertyID6=122  and sls.inventoryAtTransit>0 and slsh.count_transit_days+datediff(d,slsh.Update_date,getdate())>sls.replenishmentTime 
and sls.replenishmentTime=14
)#xdm on #xdm.stockLocationID=sls.stockLocationID and #xdm.skuID=sls.skuID


update sls set inventoryAtTransit=0
from Symphony_StockLocationSkus sls
join (
select sls.stockLocationID, sl.stockLocationName, locationSkuName,datediff(d,slsh.Update_date,getdate()) as No_of_days_from_His_Lastupdate,
sls.skuID,replenishmentTime,inventoryAtTransit ,slsh.count_transit_days,slsh.inv_trans from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 
left join (select stockLocationID,skuID,max(updateDate) as Update_date,sum(case when inventoryAtTransit>0 then 1 else 0 end) as 
count_transit_days,sum(inventoryAtTransit) as inv_trans from Symphony_StockLocationSkuHistory where
 updateDate>=convert(date,getdate()-16) group by stockLocationID,skuID ) slsh on 
slsh.stockLocationID=sls.stockLocationID and slsh.skuID=sls.skuID
where sl.slPropertyID6=122  and sls.inventoryAtTransit>0 and slsh.count_transit_days+datediff(d,slsh.Update_date,getdate())>sls.replenishmentTime 
and sls.replenishmentTime=15
)#xdm on #xdm.stockLocationID=sls.stockLocationID and #xdm.skuID=sls.skuID



update sls set inventoryAtTransit=0
from Symphony_StockLocationSkus sls
join (
select sls.stockLocationID, sl.stockLocationName, locationSkuName,datediff(d,slsh.Update_date,getdate()) as No_of_days_from_His_Lastupdate,
sls.skuID,replenishmentTime,inventoryAtTransit ,slsh.count_transit_days,slsh.inv_trans from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 
left join (select stockLocationID,skuID,max(updateDate) as Update_date,sum(case when inventoryAtTransit>0 then 1 else 0 end) as 
count_transit_days,sum(inventoryAtTransit) as inv_trans from Symphony_StockLocationSkuHistory where
 updateDate>=convert(date,getdate()-17) group by stockLocationID,skuID ) slsh on 
slsh.stockLocationID=sls.stockLocationID and slsh.skuID=sls.skuID
where sl.slPropertyID6=122  and sls.inventoryAtTransit>0 and slsh.count_transit_days+datediff(d,slsh.Update_date,getdate())>sls.replenishmentTime 
and sls.replenishmentTime=16
)#xdm on #xdm.stockLocationID=sls.stockLocationID and #xdm.skuID=sls.skuID


update sls set inventoryAtTransit=0
from Symphony_StockLocationSkus sls
join (
select sls.stockLocationID, sl.stockLocationName, locationSkuName,datediff(d,slsh.Update_date,getdate()) as No_of_days_from_His_Lastupdate,
sls.skuID,replenishmentTime,inventoryAtTransit ,slsh.count_transit_days,slsh.inv_trans from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 
left join (select stockLocationID,skuID,max(updateDate) as Update_date,sum(case when inventoryAtTransit>0 then 1 else 0 end) as 
count_transit_days,sum(inventoryAtTransit) as inv_trans from Symphony_StockLocationSkuHistory where
 updateDate>=convert(date,getdate()-18) group by stockLocationID,skuID ) slsh on 
slsh.stockLocationID=sls.stockLocationID and slsh.skuID=sls.skuID
where sl.slPropertyID6=122  and sls.inventoryAtTransit>0 and slsh.count_transit_days+datediff(d,slsh.Update_date,getdate())>sls.replenishmentTime 
and sls.replenishmentTime=17
)#xdm on #xdm.stockLocationID=sls.stockLocationID and #xdm.skuID=sls.skuID


update sls set inventoryAtTransit=0
from Symphony_StockLocationSkus sls
join (
select sls.stockLocationID, sl.stockLocationName, locationSkuName,datediff(d,slsh.Update_date,getdate()) as No_of_days_from_His_Lastupdate,
sls.skuID,replenishmentTime,inventoryAtTransit ,slsh.count_transit_days,slsh.inv_trans from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 
left join (select stockLocationID,skuID,max(updateDate) as Update_date,sum(case when inventoryAtTransit>0 then 1 else 0 end) as 
count_transit_days,sum(inventoryAtTransit) as inv_trans from Symphony_StockLocationSkuHistory where
 updateDate>=convert(date,getdate()-19) group by stockLocationID,skuID ) slsh on 
slsh.stockLocationID=sls.stockLocationID and slsh.skuID=sls.skuID
where sl.slPropertyID6=122  and sls.inventoryAtTransit>0 and slsh.count_transit_days+datediff(d,slsh.Update_date,getdate())>sls.replenishmentTime 
and sls.replenishmentTime=18
)#xdm on #xdm.stockLocationID=sls.stockLocationID and #xdm.skuID=sls.skuID


update sls set inventoryAtTransit=0
from Symphony_StockLocationSkus sls
join (
select sls.stockLocationID, sl.stockLocationName, locationSkuName,datediff(d,slsh.Update_date,getdate()) as No_of_days_from_His_Lastupdate,
sls.skuID,replenishmentTime,inventoryAtTransit ,slsh.count_transit_days,slsh.inv_trans from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 
left join (select stockLocationID,skuID,max(updateDate) as Update_date,sum(case when inventoryAtTransit>0 then 1 else 0 end) as 
count_transit_days,sum(inventoryAtTransit) as inv_trans from Symphony_StockLocationSkuHistory where
 updateDate>=convert(date,getdate()-20) group by stockLocationID,skuID ) slsh on 
slsh.stockLocationID=sls.stockLocationID and slsh.skuID=sls.skuID
where sl.slPropertyID6=122  and sls.inventoryAtTransit>0 and slsh.count_transit_days+datediff(d,slsh.Update_date,getdate())>sls.replenishmentTime 
and sls.replenishmentTime=19
)#xdm on #xdm.stockLocationID=sls.stockLocationID and #xdm.skuID=sls.skuID


update sls set inventoryAtTransit=0
from Symphony_StockLocationSkus sls
join (
select sls.stockLocationID, sl.stockLocationName, locationSkuName,datediff(d,slsh.Update_date,getdate()) as No_of_days_from_His_Lastupdate,
sls.skuID,replenishmentTime,inventoryAtTransit ,slsh.count_transit_days,slsh.inv_trans from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 
left join (select stockLocationID,skuID,max(updateDate) as Update_date,sum(case when inventoryAtTransit>0 then 1 else 0 end) as 
count_transit_days,sum(inventoryAtTransit) as inv_trans from Symphony_StockLocationSkuHistory where
 updateDate>=convert(date,getdate()-21) group by stockLocationID,skuID ) slsh on 
slsh.stockLocationID=sls.stockLocationID and slsh.skuID=sls.skuID
where sl.slPropertyID6=122  and sls.inventoryAtTransit>0 and slsh.count_transit_days+datediff(d,slsh.Update_date,getdate())>sls.replenishmentTime 
and sls.replenishmentTime=20
)#xdm on #xdm.stockLocationID=sls.stockLocationID and #xdm.skuID=sls.skuID


---- Update Dist_sku column from FTP files folder, Pls chk all the files in FTP folder is hving all columns filled, some files may have last record not proper

drop table Client_STATUS_TEMP_Dist_ftp_mts_update;

create table Client_STATUS_TEMP_Dist_ftp_mts_update
(SKU nvarchar(100),
SL nvarchar(100),
Year nvarchar(10),
Month nvarchar(10),
Day nvarchar(10),
INV_Site nvarchar(100),
Inv_Transit nvarchar(100),
Dist_SKU nvarchar(500),
)

IF (OBJECT_ID('allfilenames') IS NOT NULL)
drop table allfilenames;

IF (OBJECT_ID('bulkact') IS NOT NULL)
drop table bulkact;

CREATE TABLE ALLFILENAMES(WHICHPATH VARCHAR(255),WHICHFILE varchar(255))
CREATE TABLE BULKACT(RAWDATA VARCHAR (8000))
declare @filename varchar(255),
        @path     varchar(255),
        @sql      varchar(8000),
        @cmd      varchar(1000)



SET @path = 'E:\SymphonyData\SFTP_files\Archive\'
SET @cmd = 'dir "' + @path + '" *.csv /b'
INSERT INTO  ALLFILENAMES(WHICHFILE)
EXEC Master..xp_cmdShell @cmd
UPDATE ALLFILENAMES SET WHICHPATH = @path where WHICHPATH is null

--cursor loop
--''\n''
    declare c1 cursor for SELECT WHICHPATH,WHICHFILE FROM ALLFILENAMES where WHICHFILE like 'STATUS_site%.csv%'
    open c1
    fetch next from c1 into @path,@filename
    While @@fetch_status <> -1
      begin
      --bulk insert won't take a variable name, so make a sql and execute it instead:
       set @sql = 'BULK INSERT Client_STATUS_TEMP_Dist_ftp_mts_update FROM ''' + @path + @filename + ''' '
           + '     WITH ( 
                   FIELDTERMINATOR = '','', 
                   ROWTERMINATOR = ''\n'', 
                   FIRSTROW = 2 
                ) '
    print @sql
    exec (@sql)

      fetch next from c1 into @path,@filename
      end
    close c1
    deallocate c1


	--select * from Client_STATUS_TEMP_Dist_ftp_mts_update

	update Client_STATUS_TEMP_Dist_ftp_mts_update
	set Dist_SKU=REPLACE(DIST_SKU,',','')

update sls
set sls.custom_txt4 = d.dis_sku
from [SYMPHONY_HRJ].[dbo].[Symphony_StockLocationSkus] sls
join Symphony_StockLocations SL on SL.stockLocationID = SLS.stockLocationID
left join (select distinct sl,sku,max(dist_sku) as dis_sku from Client_STATUS_TEMP_Dist_ftp_mts_update  group by sl,sku ) d on d.sl=sl.stockLocationName and d.SKU=sls.locationSkuName
where sls.isDeleted=0 and sl.isDeleted=0 --and sl.stockLocationType=3 


update sls set sls.skuDescription =s1.desc1
from Symphony_StockLocationSkus sls
join (select s.locationSkuName, MAX(s.skuDescription) as desc1  from Symphony_StockLocationSkus s
 where s.isDeleted=0 group by s.locationSkuName) s1 on s1.locationSkuName=sls.locationSkuName
where (sls.skuDescription is null or sls.skuDescription=''  )
 and sls.isDeleted=0

  update sls set sls.skuPropertyID1 =s1.desc1
from Symphony_StockLocationSkus sls
join (select s.locationSkuName, MAX(s.skuPropertyID1) as desc1  from Symphony_StockLocationSkus s
 where s.isDeleted=0 group by s.locationSkuName) s1 on s1.locationSkuName=sls.locationSkuName
where (sls.skuPropertyID1 is null or sls.skuPropertyID1=''  )
 and sls.isDeleted=0

  update sls set sls.custom_txt3 =s1.desc1
from Symphony_StockLocationSkus sls
join (select s.locationSkuName, MAX(s.custom_txt3) as desc1  from Symphony_StockLocationSkus s
 where s.isDeleted=0 group by s.locationSkuName) s1 on s1.locationSkuName=sls.locationSkuName
where (sls.custom_txt3 is null  )
 and sls.isDeleted=0


 update sls set sls.custom_txt5 =s1.desc1
from Symphony_StockLocationSkus sls
join (select s.locationSkuName, MAX(s.custom_txt5) as desc1  from Symphony_StockLocationSkus s
 where s.isDeleted=0 group by s.locationSkuName) s1 on s1.locationSkuName=sls.locationSkuName
where (sls.custom_txt5 is null  )
 and sls.isDeleted=0


 update sls set sls.custom_txt8 =s1.desc1
from Symphony_StockLocationSkus sls
join (select s.locationSkuName, MAX(s.custom_txt8) as desc1  from Symphony_StockLocationSkus s
 where s.isDeleted=0 group by s.locationSkuName) s1 on s1.locationSkuName=sls.locationSkuName
where (sls.custom_txt8 is null  )
 and sls.isDeleted=0

 ---- Update Shipping buffer (Symphony_WorkOrders table) fieds (i.e: business & division) ---

 update sls set sls.woCustom_txt7 =s1.desc1
from Symphony_WorkOrders sls
join (select s.skuID, MAX(spi.skuItemName) as desc1  from Symphony_StockLocationSkus s
left join Symphony_SKUsPropertyItems spi on spi.skuItemID=s.skuPropertyID1
 where s.isDeleted=0 group by s.skuID) s1 on s1.skuID=sls.skuID
where (sls.woCustom_txt7 is null or sls.woCustom_txt7=''  )
 --and sls.isDeleted=0

  update sls set sls.woCustom_txt6 =s1.desc1
from Symphony_WorkOrders sls
join (select s.skuID, MAX(s.custom_txt3) as desc1  from Symphony_StockLocationSkus s
 where s.isDeleted=0 group by s.skuID) s1 on s1.skuID=sls.skuID
where (sls.woCustom_txt6 is null or sls.woCustom_txt6='' )


------- Added for Finance data - Feb'21 by Pratiksha --------------------

Update sls

set custom_num2=isnull(b.bdgt+isnull(tin.ttlIn,0)-isnull(cns.ttlOut,0),0)

,inventoryatsite=isnull(b.bdgt+isnull(tin.ttlIn,0)-isnull(cns.ttlOut,0),0)

,buffersize=b.bdgt      --isnull(cast(sls.custom_num1*5/12 as decimal(18,0)),0)

--select sls.stockLocationID,sls.buffersize,sls.locationskuname,sls.skuDescription,isnull(sls.custom_num1,0) AnualBud,sls.custom_num2 ShortExcess

--,sls.inventoryAtSite,cns.ttlout,tin.TtlIn

--,isnull(b.Bdgt+ isnull(tin.ttlIn,0)-isnull(cns.ttlOut,0),0) NewInvSite

--,b.Bdgt CurrentBudget

from Symphony_stocklocationskus sls

join (Select stockLocationID,buffersize,locationskuname,skuDescription,custom_num1,inventoryAtSite

      ,cast((isnull(custom_num1,0)/12)*(

                                          Case when month(getdate())= 1 then 10

                                                          when month(getdate())= 2 then 11

                                                          when month(getdate())= 3 then 12

                                                          when month(getdate())= 4 then 1

                                                          when month(getdate())= 5 then 2

                                                          when month(getdate())= 6 then 3

                                                          when month(getdate())= 7 then 4

                                                          when month(getdate())= 8 then 5

                                                          when month(getdate())= 9 then 6

                                                          when month(getdate())= 10 then 7

                                                          when month(getdate())= 11 then 8

                                                          when month(getdate())= 12 then 9

                                           end) as decimal(18,0)) Bdgt

                                 ,custom_num2 ExcessShort

                from Symphony_StockLocationSkus

                where stocklocationid=4783) b on b.stocklocationid=sls.stockLocationID and b.locationSkuName=sls.locationSkuName
				and custom_txt4 = 'All'

left join (Select sl.stockLocationName SL,sk.skuname Sku,sum(quantity) TtlOut,sender,t.Skuid

                                           from Symphony_transactions t

                                           join Symphony_skus sk on sk.skuid=t.skuID

                                           join Symphony_StockLocations sl on sl.stockLocationID=t.sender

                                           where sender=4783 and transactiontype=0 and  reportedDate > '2021-03-31 00:00:00' and reportedDate < '2022-04-01 00:00:00'

                                           group by sl.stockLocationName,sk.skuName,sender,t.skuID) cns on cns.sender=sls.stocklocationid and cns.skuid=sls.skuid

left join (Select sl.stockLocationName SL,sk.skuname Sku,sum(quantity) TtlIn,receiver,t.Skuid

                                           from Symphony_transactions t

                                           join Symphony_skus sk on sk.skuid=t.skuID

                                           join Symphony_StockLocations sl on sl.stockLocationID=t.receiver

                                           where receiver=4783 and transactiontype=1 and  reportedDate > '2021-03-31 00:00:00' and reportedDate < '2022-04-01 00:00:00'

                                           group by sl.stockLocationName,sk.skuName,t.receiver,t.skuID) tin on tin.Receiver=sls.stocklocationid and tin.skuid=sls.skuid

where sls.stocklocationid=4783

-------------------- Fin data update END ---------------------------------------


 end
 
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_NewStatus]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_NewStatus]
AS
BEGIN


IF (OBJECT_ID('Client_STATUS_TEMP_12') IS NOT NULL)
drop table Client_STATUS_TEMP_12;

create table Client_STATUS_TEMP_12
(SKU nvarchar(100),
SL nvarchar(100),
SLoc nvarchar(100),
Year nvarchar(10),
Month nvarchar(10),
Day nvarchar(10),
INV_Site nvarchar(100),
Inv_Transit nvarchar(100),

)
/*
-----temporary addition jun'23----
bulk insert Client_STATUS_TEMP_12
from 'E:\SymphonyData\InputFolder\Status_Site_2023_06_23.csv' --file name to be changed
WITH ( 
                   FIELDTERMINATOR = ',', 
                   ROWTERMINATOR = '\n', 
                   FIRSTROW = 2 

)
-----temporary addition jun'23----
*/
IF (OBJECT_ID('allfilenames') IS NOT NULL)
drop table allfilenames;

IF (OBJECT_ID('bulkact') IS NOT NULL)
drop table bulkact;

CREATE TABLE ALLFILENAMES(WHICHPATH VARCHAR(255),WHICHFILE varchar(255))
CREATE TABLE BULKACT(RAWDATA VARCHAR (8000))
declare @filename varchar(255),
        @path     varchar(255),
        @sql      varchar(8000),
        @cmd      varchar(1000)



SET @path = 'E:\SymphonyData\InputFolder\'
SET @cmd = 'dir "' + @path + '" *.csv /b'
INSERT INTO  ALLFILENAMES(WHICHFILE)
EXEC Master..xp_cmdShell @cmd
UPDATE ALLFILENAMES SET WHICHPATH = @path where WHICHPATH is null

--cursor loop
    declare c1 cursor for SELECT WHICHPATH,WHICHFILE FROM ALLFILENAMES where WHICHFILE like 'STATUS_site_2%.csv%'
    open c1
    fetch next from c1 into @path,@filename
    While @@fetch_status <> -1
      begin
      --bulk insert won't take a variable name, so make a sql and execute it instead:
       set @sql = 'BULK INSERT Client_STATUS_TEMP_12 FROM ''' + @path + @filename + ''' '
           + '     WITH ( 
                   FIELDTERMINATOR = '','', 
                   ROWTERMINATOR = ''\n'', 
                   FIRSTROW = 2 
                ) '
    print @sql
    exec (@sql)

      fetch next from c1 into @path,@filename
      end
    close c1
    deallocate c1
	
	IF (OBJECT_ID('Client_STATUS_TEMP_5') IS NOT NULL)
drop table Client_STATUS_TEMP_5;


select
 #a.SKU
 ,#a.[Stock_Location]
 ,#a.Year
 ,#a.Month
 ,#a.Day as [Date]
 ,case when #a.Inv_at_site_Qty<0 then 0 else #a.Inv_at_site_Qty end as [Inv_at_site_Qty]
 ,0 as [Inv_at_transit_Qty]
 into Client_STATUS_TEMP_5
from
(select sku as SKU
       ,sl as [Stock_Location]
       ,sum(cast (CASE WHEN CHARINDEX('-',INV_Site) > 0 THEN SUBSTRING(INV_Site,CHARINDEX('-',INV_Site),LEN(INV_Site)) + SUBSTRING(INV_Site,0,CHARINDEX('-',INV_Site))
                                                 ELSE INV_Site
                                                 END as decimal(20,3))) as Inv_at_site_Qty
	
        ,YEAR
        ,MONTH
        ,DAY
	FROM Client_STATUS_TEMP_12  group by SKU,SL,YEAR,MONTH,DAY)#a




	Declare @cmd2 varchar(1000);
set @cmd2 = 'sqlcmd -S "HRJPOWERBI" -d "SYMPHONY_HRJ" -Q "set nocount on; select * from Client_Status_Temp_5;" -o "E:\SymphonyData\InputFolder\Status_New_Site_%date:~-4,4%%date:~-10,2%%date:~-7,2%.csv" -s"," -W'
exec master.dbo.xp_cmdshell @cmd2
	


	end
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_NewTransit]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_NewTransit]
AS
BEGIN

IF (OBJECT_ID('Client_STATUS_TEMP') IS NOT NULL)
drop table Client_STATUS_TEMP;

create table Client_STATUS_TEMP
(SKU nvarchar(100),
SL nvarchar(100),
Year nvarchar(10),
Month nvarchar(10),
Day nvarchar(10),
INV_Site numeric(10),
Inv_Transit nvarchar(100),

)

/*
-----temporary addition jun'23----
bulk insert Client_STATUS_TEMP
from 'E:\SymphonyData\InputFolder\STATUS_TRANSIT_Z_2023_06_23.csv' --file name to be changed
WITH ( 
                   FIELDTERMINATOR = ',', 
                   ROWTERMINATOR = '\n', 
                   FIRSTROW = 2 

)
-----temporary addition jun'23----
*/


IF (OBJECT_ID('allfilenames') IS NOT NULL)
drop table allfilenames;

IF (OBJECT_ID('bulkact') IS NOT NULL)
drop table bulkact;

CREATE TABLE ALLFILENAMES(WHICHPATH VARCHAR(255),WHICHFILE varchar(255))
CREATE TABLE BULKACT(RAWDATA VARCHAR (8000))
declare @filename varchar(255),
        @path     varchar(255),
        @sql      varchar(8000),
        @cmd      varchar(1000)



SET @path = 'E:\SymphonyData\InputFolder\'
SET @cmd = 'dir "' + @path + '" *.csv /b'
INSERT INTO  ALLFILENAMES(WHICHFILE)
EXEC Master..xp_cmdShell @cmd
UPDATE ALLFILENAMES SET WHICHPATH = @path where WHICHPATH is null

--cursor loop
    declare c1 cursor for SELECT WHICHPATH,WHICHFILE FROM ALLFILENAMES where WHICHFILE like 'STATUS_TRANSIT_Z%.csv%'
    open c1
    fetch next from c1 into @path,@filename
    While @@fetch_status <> -1
      begin
      --bulk insert won't take a variable name, so make a sql and execute it instead:
       set @sql = 'BULK INSERT Client_STATUS_TEMP FROM ''' + @path + @filename + ''' '
           + '     WITH ( 
                   FIELDTERMINATOR = '','', 
                   ROWTERMINATOR = ''\n'', 
                   FIRSTROW = 1 
                ) '
    print @sql
    exec (@sql)

      fetch next from c1 into @path,@filename
      end
    close c1
    deallocate c1
 

	IF (OBJECT_ID('Client_STATUS_TEMP_2') IS NOT NULL)

drop table Client_STATUS_TEMP_2;

select
 #a.SKU
 ,#a.[Stock_Location]
 ,#a.Year
 ,#a.Month
 ,#a.Day as [Date]
 ,'' as [Inv_at_site_Qty]
 --,case when #a.Inv_at_site_Qty<0 then 0 else #a.Inv_at_site_Qty end as [Inv_at_site_Qty]
 ,#a.Inv_at_transit_Qty as [Inv_at_transit_Qty]
 into Client_STATUS_TEMP_2
from
(select sku as SKU
       ,sl as [Stock_Location]
       ,sum(cast (inv_transit as decimal(20,3))) as Inv_at_transit_Qty
	
        ,YEAR
        ,MONTH
        ,DAY
	FROM Client_STATUS_TEMP  group by SKU,SL,YEAR,MONTH,DAY)#a



	Declare @cmd2 varchar(1000);
set @cmd2 = 'sqlcmd -S "HRJPOWERBI" -d "SYMPHONY_HRJ" -Q "set nocount on; select * from Client_Status_Temp_2;" -o "E:\SymphonyData\InputFolder\Status_Transit_new_%date:~-4,4%%date:~-10,2%%date:~-7,2%.csv" -s"," -W'
exec master.dbo.xp_cmdshell @cmd2
	
	/*
update sls set inventoryAtTransit=0
 from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 

where sl.stockLocationName + '|' + locationSkuName not in (select Stock_Location  + '|' + SKU from Client_STATUS_TEMP_2)
and (slPropertyID6 <> 122 or slPropertyID6 is null) */

end
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_PARENT_CHILD_AFTER_LNR]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_PARENT_CHILD_AFTER_LNR]
AS
BEGIN


drop table Client_Replenishment

SELECT * into Client_Replenishment from (SELECT sl.stockLocationName as [SL]
         ,ss.skuName as SKU
		 ,CAST(sls.replenishmentQuantity AS decimal(20,0)) as [Repl_Qty]
		 ,sl1.stockLocationName as [Origin_SL]
		 ,cast(sls.bpProduction as decimal (20,2)) as VPP
		 ,case when productionColor=0 then 'Cyan' 
       when productionColor=1 then 'Green' 
	when productionColor=2 then 'yellow' 	
   	when productionColor=3 then 'Red' 	
	when productionColor=4 then 'Black' end	[BP Color]
	,cast(sls.bufferSize as decimal(20,0)) as [Buffer Size]
		 FROM [dbo].[Symphony_StockLocationSkus] sls
  join Symphony_StockLocations sl
on sls.stockLocationID=sl.stockLocationID
 join Symphony_StockLocations sl1
on sls.originStockLocation=sl1.stockLocationID
join Symphony_SKUs ss
on sls.skuid=ss.skuID
where sls.replenishmentQuantity>0 and sl.stockLocationType=3 and sls.avoidReplenishment=0 and sls.bufferSize>0)#b


DROP TABLE To_be_allocated

Create Table To_be_allocated
(
	SL nvarchar(40),
	SKU nvarchar(40),
	Req_Qty int,
	Origin nvarchar(40),
	Checked int,
	Allocated int
)

Insert into To_be_allocated
Select SL,SKU,Repl_Qty,Origin_SL,0,0 from Client_Replenishment r 
right join client_parent_child c on r.sku=c.Child where sl is not null



DROP TABLE Parent_Child_Checked

Create Table Parent_Child_Checked
(
	Parent nvarchar(40),
	Child nvarchar(40),
	Priority int,
	Checked int
)


Insert into Parent_Child_Checked
Select Parent,Child,Priority,0 from Client_Parent_Child


DROP TABLE WHSE_Stock_Checked

Create Table WHSE_Stock_Checked
(
	Whse nvarchar(40),
	SKU nvarchar(40),
	Qty int,
	Allocated int,
	Checked int
)


Insert into WHSE_Stock_Checked
Select SL,SKU,Inv_site,0,0 from Client_STATUS_TEMP where sl like 'COR%' and inv_site>0


Drop table Final_List
Create Table Final_List
(
	SL nvarchar(40),
	Parent nvarchar(40),
	Child nvarchar(40),
	Qty int,
	Whse nvarchar(40)
)

Declare @Sku nvarchar(40)
Declare @SL nvarchar(40)
Declare @Child nvarchar(40)
Declare @Whse nvarchar(40)
Declare @Qty int
Declare @avail int

While (Select COUNT(*) from to_be_allocated where Checked=0)>0
Begin

Set @Sku=(Select Top 1 SKU from to_be_allocated where Checked=0)
Set @SL=(Select Top 1 SL from to_be_allocated where Checked=0)
Set @WHSE=(Select Top 1 Origin from to_be_allocated where Checked=0)
Set @Qty=(Select Top 1 Req_Qty-Allocated from to_be_allocated where Checked=0)

Update WHSE_Stock_Checked set Checked=0

truncate table Parent_Child_Checked
Insert into Parent_Child_Checked
Select Parent,Child,Priority,0 from Client_Parent_Child where Parent=@Sku

Update to_be_allocated Set Checked=1 where SKU=@Sku and SL=@SL and Origin=@Whse

		While (Select COUNT(*) from Parent_Child_Checked where Checked=0)>0
		Begin
			
		Set @Child=(Select Top 1 Child from Parent_Child_Checked where Checked=0 order by Priority Asc)
				
				Update Parent_Child_Checked Set Checked=1 Where Child=@Child
				
				While (Select ISNULL((Select COUNT(*) from WHSE_Stock_Checked where SKU=@Child and Whse=@Whse and Checked=0),0))>0
				Begin
										
					Set @avail=(Select Qty-Allocated From WHSE_Stock_Checked where SKU=@Child and Whse=@Whse )
						If(@avail>=@Qty)
							Begin
                                                                        update to_be_allocated set Allocated=(@Qty+Allocated) where SKU=@Sku and SL=@SL and Origin=@Whse
									update WHSE_Stock_Checked set Allocated=(@Qty+Allocated),Checked=1 where SKU=@Child  and Whse=@Whse
									Insert into Final_List
									Select @SL,@Sku,@Child,@Qty,@Whse
									Set @Qty=0
							End
						
						Else
							Begin
									If(@avail>0)
									Begin
										update to_be_allocated set Allocated=(@avail+Allocated) where SKU=@Sku and SL=@SL and Origin=@Whse
										update WHSE_Stock_Checked set Allocated=(@avail+Allocated),Checked=1 where SKU=@Child  and Whse=@Whse
										Insert into Final_List
										Select @SL,@Sku,@Child,@avail,@Whse
										Set @Qty=@Qty-@avail
									End
							End	
						update WHSE_Stock_Checked set Checked=1 where SKU=@Child  and Whse=@Whse
				End
		
			
		End

End


Drop table Client_Replenishemnt_rev

select * into  Client_Replenishemnt_rev from 

(Select sl as [Stock Location], child as [SKU], Qty as [Replenishment Quantity], whse as [Origin Stock Location],
   0 as VPP,'' as [BP Color],0 as [Buffer Size]
      from Final_List

union
Select sl as [Stock Location],
       SKU as [SKU],
       Repl_Qty as [Replenishment Quantity],
       Origin_SL as [Origin Stock Location],
       VPP AS VPP,
       [BP COLOR] AS [BP Color],
       [Buffer Size] as [Buffer Size]
        from Client_Replenishment r
       LEFT join client_parent_child c on r.sku=c.Child 
       where SKU not in (select child from client_parent_child)
       
 union
 
 SELECT SL.stockLocationName as [Stock Location],SKF.name as SKU,CAST(totalNPI AS decimal(20,0)) as [Replenishment Quantity],SL1.stockLocationName as [Origin Stock Location],
0 as vpp,'' as [BP Color],0 as [Buffer Size]
FROM Symphony_RetailAllocationRequest RAR 
LEFT JOIN Symphony_StockLocations SL on SL.stockLocationID=RAR.destinationID 
LEFT JOIN Symphony_SkuFamilies SKF on SKF.id=RAR.familyID 
LEFT JOIN Symphony_StockLocations SL1 on SL1.stockLocationID=RAR.originID 

WHERE userSelection=1 and allocationRecommendationType=2)#az


Declare @cmd2 varchar(1000);
set @cmd2 = 'sqlcmd -S "HRJPOWERBI" -d "SYMPHONY_HRJ" -Q "set nocount on; select * from Client_Replenishemnt_rev;" -o "E:\SymphonyData\OutputFolder\Stores Replenishment\Symphony_Daily_Recommendation_Stores_%date:~-4,4%%date:~-10,2%%date:~-7,2%.csv" -s"," -W'
exec master.dbo.xp_cmdshell @cmd2


end
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_PARENT_CHILD_BEFORE_LNR]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_PARENT_CHILD_BEFORE_LNR]
AS
BEGIN


drop table Client_Parent_child

create table Client_Parent_child
(Parent nvarchar(100),
Child nvarchar(100),
Priority int,
)

BULK INSERT Client_Parent_child
FROM 'E:\SymphonyData\Parent_Child_Scripts\Inputfile\Parent_child.csv'
WITH
(
FIRSTROW = 2, --ignores first row (header row)
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)



drop table Client_STATUS_TEMP

create table Client_STATUS_TEMP
(SKU nvarchar(100),
SL nvarchar(100),
Year nvarchar(10),
Month nvarchar(10),
Day nvarchar(10),
INV_Site decimal(20,4),
Inv_Transit decimal(20,4),
)


/*
-----temporary addition jun'23----

bulk insert Client_STATUS_TEMP
from 'E:\SymphonyData\InputFolder\STATUS_new_SITE_2023_06_23.csv' --file name to be changed
WITH ( 
                   FIELDTERMINATOR = ',', 
                   ROWTERMINATOR = '\n', 
                   FIRSTROW = 2 

)


bulk insert Client_STATUS_TEMP
from 'E:\SymphonyData\InputFolder\STATUS_SITE_RM_2023_06_23.csv' --file name to be changed
WITH ( 
                   FIELDTERMINATOR = ',', 
                   ROWTERMINATOR = '\n', 
                   FIRSTROW = 2 

)


-----temporary addition jun'23----

--remove start
*/
drop table allfilenames
drop table bulkact

CREATE TABLE ALLFILENAMES(WHICHPATH VARCHAR(255),WHICHFILE varchar(255))
CREATE TABLE BULKACT(RAWDATA VARCHAR (8000))
declare @filename varchar(255),
        @path     varchar(255),
        @sql      varchar(8000),
        @cmd      varchar(1000)



SET @path = 'E:\SymphonyData\InputFolder\'
SET @cmd = 'dir ' + @path + '*.csv /b'
INSERT INTO  ALLFILENAMES(WHICHFILE)
EXEC Master..xp_cmdShell @cmd
UPDATE ALLFILENAMES SET WHICHPATH = @path where WHICHPATH is null

--cursor loop
    declare c1 cursor for SELECT WHICHPATH,WHICHFILE FROM ALLFILENAMES where WHICHFILE like 'Status%Site%.csv%'
    open c1
    fetch next from c1 into @path,@filename
    While @@fetch_status <> -1
      begin
      --bulk insert won't take a variable name, so make a sql and execute it instead:
       set @sql = 'BULK INSERT Client_STATUS_TEMP FROM ''' + @path + @filename + ''' '
           + '     WITH ( 
                   FIELDTERMINATOR = '','', 
                   ROWTERMINATOR = ''\n'', 
                   FIRSTROW = 3 
                ) '
    print @sql
    exec (@sql)

      fetch next from c1 into @path,@filename
      end
    close c1
    deallocate c1
  	
/*   
drop table Client_STATUS_TEMP_1



select 
#a.parent as SKU,
#a.sl as SL,
DATEPART(year,getdate()) as [year],
DATEPART(MONTH,getdate()) as [Month], 
DATEPART(DAY,getdate()) as [Day],
sum(#a.Inv_site) Inv_site,
0 as Inv_Transit

into Client_STATUS_TEMP_1

from 
(select st.SL as SL,
       sb.Parent as Parent,
	   SUM(st.Inv_site) as Inv_site,
	   SUM(st.Inv_Transit) as Inv_Transit
from Client_Status_temp st 
right join Client_Parent_child sb on st.sku=SB.child
group by sl,Parent

union

select st.SL as SL,
       st.SKU as SKU,
	   0 as Inv_site,
	   0 as Inv_transit
from Client_Status_temp st 
right join Client_Parent_child sb on st.sku=SB.child
group by sl,st.SKU) #a where #a.SL is not null
group by #a.sl,#a.parent order by #a.SL
*/


	Declare @cmd3 varchar(1000);
set @cmd3 = 'sqlcmd -i E:\SymphonyData\Parent_Child_Scripts\New_Status_1.sql'
exec master.dbo.xp_cmdshell @cmd3


	Declare @cmd2 varchar(1000);
set @cmd2 = 'sqlcmd -S "HRJPOWERBI" -d "SYMPHONY_HRJ" -Q "set nocount on; select * from Client_Status_Temp_1;" -o "E:\SymphonyData\InputFolder\Status_ZNew_Site_RM_FG%date:~-4,4%%date:~-10,2%%date:~-7,2%.csv" -s"," -W'
exec master.dbo.xp_cmdshell @cmd2


end
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_PARENT_CHILD_BEFORE_LNR_1]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_PARENT_CHILD_BEFORE_LNR_1]
AS
BEGIN


drop table Client_Parent_child

create table Client_Parent_child
(Parent nvarchar(100),
Child nvarchar(100),
Priority int,
)

BULK INSERT Client_Parent_child
FROM 'E:\SymphonyData\Parent_Child_Scripts\Inputfile\Parent_child.csv'
WITH
(
FIRSTROW = 2, --ignores first row (header row)
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)



drop table Client_STATUS_TEMP

create table Client_STATUS_TEMP
(SKU nvarchar(100),
SL nvarchar(100),
Year nvarchar(10),
Month nvarchar(10),
Day nvarchar(10),
INV_Site decimal(20,4),
Inv_Transit decimal(20,4),
)

/*
-----temporary addition jun'23----

bulk insert Client_STATUS_TEMP
from 'E:\SymphonyData\InputFolder\STATUS_TRANSIT_new_2023_06_23.csv' --file name to be changed
WITH ( 
                   FIELDTERMINATOR = ',', 
                   ROWTERMINATOR = '\n', 
                   FIRSTROW = 2 

)


bulk insert Client_STATUS_TEMP
from 'E:\SymphonyData\InputFolder\STATUS_TRAN_RM_2023_06_23.csv' --file name to be changed
WITH ( 
                   FIELDTERMINATOR = ',', 
                   ROWTERMINATOR = '\n', 
                   FIRSTROW = 2 

)


-----temporary addition jun'23----

--- select *  from Client_STATUS_TEMP



-- remove start
*/
drop table allfilenames
drop table bulkact

CREATE TABLE ALLFILENAMES(WHICHPATH VARCHAR(255),WHICHFILE varchar(255))
CREATE TABLE BULKACT(RAWDATA VARCHAR (8000))
declare @filename varchar(255),
        @path     varchar(255),
        @sql      varchar(8000),
        @cmd      varchar(1000)



SET @path = 'E:\SymphonyData\InputFolder\'
SET @cmd = 'dir ' + @path + '*.csv /b'
INSERT INTO  ALLFILENAMES(WHICHFILE)
EXEC Master..xp_cmdShell @cmd
UPDATE ALLFILENAMES SET WHICHPATH = @path where WHICHPATH is null

--cursor loop
    declare c1 cursor for SELECT WHICHPATH,WHICHFILE FROM ALLFILENAMES where WHICHFILE like 'Status_Tran%.csv%'
    open c1
    fetch next from c1 into @path,@filename
    While @@fetch_status <> -1
      begin
      --bulk insert won't take a variable name, so make a sql and execute it instead:
       set @sql = 'BULK INSERT Client_STATUS_TEMP FROM ''' + @path + @filename + ''' '
           + '     WITH ( 
                   FIELDTERMINATOR = '','', 
                   ROWTERMINATOR = ''\n'', 
                   FIRSTROW = 3 
                ) '
    print @sql
    exec (@sql)

      fetch next from c1 into @path,@filename
      end
    close c1
    deallocate c1
    
   
/*
drop table Client_STATUS_TEMP_1

select 
#a.parent as SKU,
#a.sl as SL,
DATEPART(year,getdate()) as [year],
DATEPART(MONTH,getdate()) as [Month], 
DATEPART(DAY,getdate()) as [Day],
'' as Inv_site,
sum(#a.Inv_Transit) Inv_Transit

into Client_STATUS_TEMP_1

from 
(select st.SL,
       sb.Parent,
	    SUM(st.Inv_Transit) as Inv_Transit
from Client_Status_temp st 
right join Client_Parent_child sb on st.sku=SB.child
group by sl,Parent

union

select st.SL,
       st.SKU,
	     0 as Inv_transit
from Client_Status_temp st 
right join Client_Parent_child sb on st.sku=SB.child
group by sl,st.SKU) #a where #a.SL is not null
group by #a.sl,#a.parent order by #a.SL
*/

Declare @cmd3 varchar(1000);
set @cmd3 = 'sqlcmd -i E:\SymphonyData\Parent_Child_Scripts\New_Status_tran_1.sql'
exec master.dbo.xp_cmdshell @cmd3


	Declare @cmd2 varchar(1000);
set @cmd2 = 'sqlcmd -S "HRJPOWERBI" -d "SYMPHONY_HRJ" -Q "set nocount on; select * from Client_Status_Temp_1;" -o "E:\SymphonyData\InputFolder\Status_ZTransit_new_RM_FG%date:~-4,4%%date:~-10,2%%date:~-7,2%.csv" -s"," -W'
exec master.dbo.xp_cmdshell @cmd2


end
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_PARENT_CHILD_BEFORE_LNR_RMC]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_PARENT_CHILD_BEFORE_LNR_RMC]
AS
BEGIN


drop table Client_Parent_child_rmc

create table Client_Parent_child_rmc
(Parent nvarchar(100),
Child nvarchar(100),
Priority int,
)

BULK INSERT Client_Parent_child_rmc
FROM 'E:\SymphonyData\Parent_Child_Scripts\Inputfile\Parent_child_rmc.csv'
WITH
(
FIRSTROW = 2, --ignores first row (header row)
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)


drop table Client_STATUS_TEMP_RMC

create table Client_STATUS_TEMP_RMC
(SKU nvarchar(100),
SL nvarchar(100),
Year nvarchar(10),
Month nvarchar(10),
Day nvarchar(10),
INV_Site decimal(20,4),
Inv_Transit decimal(20,4),
)



drop table allfilenames
drop table bulkact

CREATE TABLE ALLFILENAMES(WHICHPATH VARCHAR(255),WHICHFILE varchar(255))
CREATE TABLE BULKACT(RAWDATA VARCHAR (8000))
declare @filename varchar(255),
        @path     varchar(255),
        @sql      varchar(8000),
        @cmd      varchar(1000)



SET @path = 'E:\SymphonyData\InputFolder\'
SET @cmd = 'dir ' + @path + '*.csv /b'
INSERT INTO  ALLFILENAMES(WHICHFILE)
EXEC Master..xp_cmdShell @cmd
UPDATE ALLFILENAMES SET WHICHPATH = @path where WHICHPATH is null

--cursor loop
    declare c1 cursor for SELECT WHICHPATH,WHICHFILE FROM ALLFILENAMES where WHICHFILE like 'Status_RMC%.csv%'
    open c1
    fetch next from c1 into @path,@filename
    While @@fetch_status <> -1
      begin
      --bulk insert won't take a variable name, so make a sql and execute it instead:
       set @sql = 'BULK INSERT Client_STATUS_TEMP_RMC FROM ''' + @path + @filename + ''' '
           + '     WITH ( 
                   FIELDTERMINATOR = '','', 
                   ROWTERMINATOR = ''\n'', 
                   FIRSTROW = 3 
                ) '
    print @sql
    exec (@sql)

      fetch next from c1 into @path,@filename
      end
    close c1
    deallocate c1
    
	
drop table Client_STATUS_TEMP_1_RMC

select 
#a.parent as SKU,
#a.sl as SL,
DATEPART(year,getdate()) as [year],
DATEPART(MONTH,getdate()) as [Month], 
DATEPART(DAY,getdate()) as [Day],
sum(#a.Inv_site)as Inv_site,
sum(#a.Inv_Transit) as Inv_Transit

into Client_STATUS_TEMP_1_RMC

from 
(select st.SL as SL,
       sb.Parent as Parent,
	   SUM(st.Inv_site) as Inv_site,
	   SUM(st.Inv_Transit) as Inv_Transit
from Client_Status_temp_rmc st 
right join Client_Parent_child_rmc sb on st.sku=SB.child
group by sl,Parent

union

select st.SL as SL,
       st.SKU as SKU,
	   0 as Inv_site,
	   0 as Inv_transit
from Client_Status_temp_rmc st 
right join Client_Parent_child_rmc sb on st.sku=SB.child
group by sl,st.SKU) #a where #a.SL is not null
group by #a.sl,#a.parent order by #a.SL


Declare @cmd2 varchar(1000);
set @cmd2 = 'sqlcmd -S "HRJPOWERBI" -d "SYMPHONY_HRJ" -Q "set nocount on; select * from Client_Status_Temp_1_RMC;" -o "E:\SymphonyData\InputFolder\StatusZ_RMC_%date:~-4,4%%date:~-10,2%%date:~-7,2%.csv" -s"," -W'
exec master.dbo.xp_cmdshell @cmd2


end
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_PRODUCTION_FILE_CONSOLIDATION]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_PRODUCTION_FILE_CONSOLIDATION]
AS
BEGIN


drop table Client_PRODUCTION_TEMP_1

create table Client_PRODUCTION_TEMP_1
(WorkID nvarchar(150),
Plant nvarchar(150),
Customer_Code nvarchar(150),
Customer_Name nvarchar(150),
SKU nvarchar(150),
SKU_Desc nvarchar(200),
Qty decimal(25,4),
Order_type nvarchar(150),
SO_Year nvarchar(10),
SO_Month nvarchar(10),
SO_Date nvarchar(10),
Due_Year nvarchar(10),
Due_Month nvarchar(10),
Due_Date nvarchar(10),
Net_Price nvarchar(100),
Year nvarchar(10),
Month nvarchar(10),
Day nvarchar(10),
DC nvarchar(20),
Vendor_Code nvarchar(150) null,
Vendor_Name nvarchar(150) null
)

/*
-----temporary addition jun'23----

bulk insert Client_PRODUCTION_TEMP_1
from 'E:\SymphonyData\InputFolder\PRODUCTION_10_2023_06_23.csv' --file name to be changed
WITH ( 
                   FIELDTERMINATOR = ',', 
                   ROWTERMINATOR = '\n', 
                   FIRSTROW = 2 

)


bulk insert Client_PRODUCTION_TEMP_1
from 'E:\SymphonyData\InputFolder\PRODUCTION_20_2023_06_23.csv' --file name to be changed
WITH ( 
                   FIELDTERMINATOR = ',', 
                   ROWTERMINATOR = '\n', 
                   FIRSTROW = 2 

)



bulk insert Client_PRODUCTION_TEMP_1
from 'E:\SymphonyData\InputFolder\PRODUCTION_25_2023_06_23.csv' --file name to be changed
WITH ( 
                   FIELDTERMINATOR = ',', 
                   ROWTERMINATOR = '\n', 
                   FIRSTROW = 2 

)


bulk insert Client_PRODUCTION_TEMP_1
from 'E:\SymphonyData\InputFolder\PRODUCTION_30_2023_06_23.csv' --file name to be changed
WITH ( 
                   FIELDTERMINATOR = ',', 
                   ROWTERMINATOR = '\n', 
                   FIRSTROW = 2 

)



bulk insert Client_PRODUCTION_TEMP_1
from 'E:\SymphonyData\InputFolder\PRODUCTION_40_2023_06_23.csv' --file name to be changed
WITH ( 
                   FIELDTERMINATOR = ',', 
                   ROWTERMINATOR = '\n', 
                   FIRSTROW = 2 

)



bulk insert Client_PRODUCTION_TEMP_1
from 'E:\SymphonyData\InputFolder\PRODUCTION_50_2023_06_23.csv' --file name to be changed
WITH ( 
                   FIELDTERMINATOR = ',', 
                   ROWTERMINATOR = '\n', 
                   FIRSTROW = 2 

)


bulk insert Client_PRODUCTION_TEMP_1
from 'E:\SymphonyData\InputFolder\PRODUCTION_80_2023_06_23.csv' --file name to be changed
WITH ( 
                   FIELDTERMINATOR = ',', 
                   ROWTERMINATOR = '\n', 
                   FIRSTROW = 2 

)






-----temporary addition jun'23----

 --remove start
*/

drop table allfilenames
drop table bulkact

CREATE TABLE allfilenames(WHICHPATH VARCHAR(500),WHICHFILE varchar(500))
CREATE TABLE bulkact(RAWDATA VARCHAR (max))
declare @filename varchar(500),
        @path     varchar(500),
        @sql      varchar(max),
        @cmd      varchar(5000)



--SET @path = '\\HRJPOWERBI\InputFolder\'
SET @path = 'E:\SymphonyData\InputFolder\'
--SET @cmd = 'dir E:\SymphonyData\InputFolder\*.csv /b'
SET @cmd = 'dir "'+@path+'" *.csv /b'
--print @cmd
INSERT INTO  ALLFILENAMES(WHICHFILE)
----EXEC xp_cmdShell @cmd
EXEC Master..xp_cmdShell @cmd
--UPDATE ALLFILENAMES SET WHICHPATH = @path where WHICHPATH is null

--set @cmd = 'powershell.exe (Get-Item -Path '+@path+'* -filter *.csv).name'
 
--INSERT INTO ALLFILENAMES(WHICHFILE) EXEC xp_cmdShell @cmd;
UPDATE ALLFILENAMES SET WHICHPATH = @path where WHICHPATH is null


--cursor loop
    declare c1 cursor for SELECT WHICHPATH,WHICHFILE FROM ALLFILENAMES where WHICHFILE like 'PRODUCTION%.csv%'
    open c1
    fetch next from c1 into @path,@filename
    While @@fetch_status <> -1
      begin
      --bulk insert won't take a variable name, so make a sql and execute it instead:
       set @sql = 'BULK INSERT Client_PRODUCTION_TEMP_1 FROM ''' + @path + @filename + ''' '
           + '     WITH ( 
                   FIELDTERMINATOR = '','', 
                   ROWTERMINATOR = ''\n'', 
                   FIRSTROW = 2
                ) '
    print @sql
    exec (@sql)

      fetch next from c1 into @path,@filename
      end
    close c1
    deallocate c1



	--select * from Client_PRODUCTION_TEMP_1

	update sls set Due_Date=day(cast(SO_Year+'-'+SO_Month+'-'+SO_Date as datetime)+15)  
	from Client_PRODUCTION_TEMP_1 sls
	where ( due_year is null or (cast(SO_Year+'-'+SO_Month+'-'+SO_Date as datetime)=cast(Due_Year+'-'+Due_Month+'-'+Due_Date as datetime)))

	update sls set Due_Month=month(cast(SO_Year+'-'+SO_Month+'-'+SO_Date as datetime)+15)  
		from Client_PRODUCTION_TEMP_1 sls
	where ( due_year is null or (cast(SO_Year+'-'+SO_Month+'-'+SO_Date as datetime)=cast(Due_Year+'-'+Due_Month+'-'+Due_Date as datetime)))

	update sls set Due_Year=year(cast(SO_Year+'-'+SO_Month+'-'+SO_Date as datetime)+15)  
		from Client_PRODUCTION_TEMP_1 sls
	where ( due_year is null or (cast(SO_Year+'-'+SO_Month+'-'+SO_Date as datetime)=cast(Due_Year+'-'+Due_Month+'-'+Due_Date as datetime)))


	Declare @cmd2 varchar(1000);
set @cmd2 = 'sqlcmd -S "HRJPOWERBI" -d "SYMPHONY_HRJ" -Q "set nocount on; select * from Client_PRODUCTION_TEMP_1;" -o "E:\SymphonyData\InputFolder\ProductionZNew_%date:~-4,4%%date:~-10,2%%date:~-7,2%.csv" -s"," -W'
exec master.dbo.xp_cmdshell @cmd2

	end
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_SFTP_Filecopy_status]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_SFTP_Filecopy_status]
AS
BEGIN


IF (OBJECT_ID('Client_STATUS_TEMP_Dist_ftp') IS NOT NULL)
drop table Client_STATUS_TEMP_Dist_ftp;

create table Client_STATUS_TEMP_Dist_ftp
(SKU nvarchar(100),
SL nvarchar(100),
Year nvarchar(10),
Month nvarchar(10),
Day nvarchar(10),
INV_Site nvarchar(100),
Inv_Transit nvarchar(100),
Dist_SKU nvarchar(200),
)

IF (OBJECT_ID('allfilenames') IS NOT NULL)
drop table allfilenames;

IF (OBJECT_ID('bulkact') IS NOT NULL)
drop table bulkact;

CREATE TABLE ALLFILENAMES(WHICHPATH VARCHAR(255),WHICHFILE varchar(255))
CREATE TABLE BULKACT(RAWDATA VARCHAR (8000))
declare @filename varchar(255),
        @path     varchar(255),
        @sql      varchar(8000),
        @cmd      varchar(1000)



SET @path = 'E:\SymphonyData\SFTP_files\'
SET @cmd = 'dir "' + @path + '" *.csv /b'
INSERT INTO  ALLFILENAMES(WHICHFILE)
EXEC Master..xp_cmdShell @cmd
UPDATE ALLFILENAMES SET WHICHPATH = @path where WHICHPATH is null

--cursor loop
    declare c1 cursor for SELECT WHICHPATH,WHICHFILE FROM ALLFILENAMES where WHICHFILE like 'STATUS_site%.csv%'
    open c1
    fetch next from c1 into @path,@filename
    While @@fetch_status <> -1
      begin
      --bulk insert won't take a variable name, so make a sql and execute it instead:
       set @sql = 'BULK INSERT Client_STATUS_TEMP_Dist_ftp FROM ''' + @path + @filename + ''' '
           + '     WITH ( 
                   FIELDTERMINATOR = '','', 
                   ROWTERMINATOR = ''\n'', 
                   FIRSTROW = 2 
                ) '
    print @sql
    exec (@sql)

      fetch next from c1 into @path,@filename
      end
    close c1
    deallocate c1


	IF (OBJECT_ID('Client_STATUS_Dist_ftp_t1') IS NOT NULL)
drop table Client_STATUS_Dist_ftp_t1;

	

	select SKU,sl,DATEPART(year,getdate()) as [year],
DATEPART(MONTH,getdate()) as [Month], 
DATEPART(DAY,getdate()) as [Day],INV_Site,'' as Inv_at_Transit  into Client_STATUS_Dist_ftp_t1 from Client_STATUS_TEMP_Dist_ftp


--select * from Client_STATUS_Dist_ftp_t1

	Declare @cmd23 varchar(1000);
set @cmd23 = 'sqlcmd -S "HRJPOWERBI" -d "SYMPHONY_HRJ" -Q "set nocount on; select * from Client_STATUS_Dist_ftp_t1;" -o "E:\SymphonyData\InputFolder\Status_Distributor_Site_%date:~-4,4%%date:~-10,2%%date:~-7,2%.csv" -s"," -W'
exec master.dbo.xp_cmdshell @cmd23



end
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_SFTP_Filecopy_Transaction]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_SFTP_Filecopy_Transaction] 
AS
BEGIN


IF (OBJECT_ID('Client_Trans_TEMP_Dist_ftp') IS NOT NULL)
drop table Client_Trans_TEMP_Dist_ftp;


create table Client_Trans_TEMP_Dist_ftp
(
TransID nvarchar(100),
SAP_validation nvarchar(100),
TransType nvarchar(10),
Origin nvarchar(100),
Destination nvarchar(100),
--AdjustInventory int,
SKUName nvarchar(100),
Quantity decimal(10,4),
Year nvarchar(10),
Month nvarchar(10),
Day nvarchar(10),
Doc_date nvarchar(100),
Doc_ref nvarchar(100),
movement nvarchar(100),
adjust nvarchar(100),

Dist_SKU nvarchar(200),
) 



IF (OBJECT_ID('allfilenames') IS NOT NULL)
drop table allfilenames;

IF (OBJECT_ID('bulkact') IS NOT NULL)
drop table bulkact;

CREATE TABLE ALLFILENAMES(WHICHPATH VARCHAR(255),WHICHFILE varchar(255))
CREATE TABLE BULKACT(RAWDATA VARCHAR (8000))
declare @filename varchar(255),
        @path     varchar(255),
        @sql      varchar(8000),
        @cmd      varchar(1000)



SET @path = 'E:\SymphonyData\SFTP_files\'
SET @cmd = 'dir "' + @path + '" *.csv /b'
INSERT INTO  ALLFILENAMES(WHICHFILE)
EXEC Master..xp_cmdShell @cmd
UPDATE ALLFILENAMES SET WHICHPATH = @path where WHICHPATH is null

--cursor loop
    declare c1 cursor for SELECT WHICHPATH,WHICHFILE FROM ALLFILENAMES where WHICHFILE like 'TRANSACTIONS%.csv%'
    open c1
    fetch next from c1 into @path,@filename
    While @@fetch_status <> -1
      begin
      --bulk insert won't take a variable name, so make a sql and execute it instead:
       set @sql = 'BULK INSERT Client_Trans_TEMP_Dist_ftp FROM ''' + @path + @filename + ''' '
           + '     WITH ( 
                   FIELDTERMINATOR = '','', 
                   ROWTERMINATOR = ''\n'', 
                   FIRSTROW = 2 
                ) '
    print @sql
    exec (@sql)

      fetch next from c1 into @path,@filename
      end
    close c1
    deallocate c1

	--select * from Client_Trans_TEMP_Dist_ftp

	IF (OBJECT_ID('Client_Trans_TEMP_Dist_ftpdata') IS NOT NULL)
drop table Client_Trans_TEMP_Dist_ftpdata;



select TransID,isnull(SAP_validation,'') as SAP_validation,TransType,Origin,Destination,SKUName,Quantity,DATEPART(year,getdate()) as [year],
DATEPART(MONTH,getdate()) as [Month],DATEPART(DAY,getdate()) as [Day],isnull(Doc_date,'') as Doc_date,Doc_ref,isnull(movement,'') as movement,isnull(adjust,'') as adjust 
into Client_Trans_TEMP_Dist_ftpdata 
from Client_Trans_TEMP_Dist_ftp

--select * from client_DIST_SALE_DATA
 --select * from Client_Trans_TEMP_Dist_ftp
insert into client_DIST_SALE_DATA select * from (
select origin,s.stockLocationDescription,Destination,SKUName,Dist_SKU,Quantity,Year,Month,day,'' as Division,'' as region, '' as Business  from Client_Trans_TEMP_Dist_ftp d
left join Symphony_StockLocations s on s.stockLocationName=d.Origin
where TransType='OUT' and Origin not like '1%')#edfg

update client_DIST_SALE_DATA
	set distributor_item_name=REPLACE(distributor_item_name,',','')

update d set Region=slpi4.slItemName
 from client_DIST_SALE_DATA d
 left join Symphony_StockLocations s on s.stockLocationName=d.Distributor_code
 left join Symphony_StockLocationPropertyItems slpi4 on slpi4.slItemID=s.slPropertyID4
 --where region is null

 update d set Division=sls1.desc1
 from client_DIST_SALE_DATA d
 left join (select s.locationSkuName, MAX(SKUPI1.skuItemName) as desc1  from Symphony_StockLocationSkus s
 Left JOIN Symphony_SkusPropertyItems SKUPI1 ON S.skuPropertyID1 = SKUPI1.skuItemID
 where s.isDeleted=0 group by s.locationSkuName) sls1 on sls1.locationSkuName=d.HRJ_SKU

 update d set Business=sls.desc1
 from client_DIST_SALE_DATA d
 left join (select s.locationSkuName, MAX(s.custom_txt3) as desc1  from Symphony_StockLocationSkus s
 where s.isDeleted=0 group by s.locationSkuName) sls on sls.locationSkuName=d.HRJ_SKU


Declare @cmd231 varchar(1000);
set @cmd231 = 'sqlcmd -S "HRJPOWERBI" -d "SYMPHONY_HRJ" -Q "set nocount on; select * from Client_Trans_TEMP_Dist_ftpdata;" -o "E:\SymphonyData\InputFolder\Transactions_Distributor_%date:~-4,4%%date:~-10,2%%date:~-7,2%.csv" -s"," -W'
exec master.dbo.xp_cmdshell @cmd231



end
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_Site_Qty_Reset]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_Site_Qty_Reset]
AS
BEGIN
  

  	
IF (OBJECT_ID('Client_STATUS_TEMP_RM') IS NOT NULL)
drop table Client_STATUS_TEMP_RM;

create table Client_STATUS_TEMP_RM
(SKU nvarchar(100),
Stock_Location nvarchar(100),

Year nvarchar(10),
Month nvarchar(10),
Date nvarchar(10),
INV_at_Site_Qty nvarchar(100),
Inv_at_Transit_qty nvarchar(100),

)

IF (OBJECT_ID('allfilenames') IS NOT NULL)
drop table allfilenames;

IF (OBJECT_ID('bulkact') IS NOT NULL)
drop table bulkact;

CREATE TABLE ALLFILENAMES(WHICHPATH VARCHAR(255),WHICHFILE varchar(255))
CREATE TABLE BULKACT(RAWDATA VARCHAR (8000))
declare @filename1 varchar(255),
        @path1     varchar(255),
        @sql1      varchar(8000),
        @cmd1      varchar(1000)



SET @path1 = 'E:\SymphonyData\InputFolder\'
SET @cmd1 = 'dir "' + @path1 + '" *.csv /b'
INSERT INTO  ALLFILENAMES(WHICHFILE)
EXEC Master..xp_cmdShell @cmd1
UPDATE ALLFILENAMES SET WHICHPATH = @path1 where WHICHPATH is null

--cursor loop
    declare c1 cursor for SELECT WHICHPATH,WHICHFILE FROM ALLFILENAMES where WHICHFILE like 'STATUS_site_RM%.csv%'
    open c1
    fetch next from c1 into @path1,@filename1
    While @@fetch_status <> -1
      begin
      --bulk insert won't take a variable name, so make a sql and execute it instead:
       set @sql1 = 'BULK INSERT Client_STATUS_TEMP_RM FROM ''' + @path1 + @filename1 + ''' '
           + '     WITH ( 
                   FIELDTERMINATOR = '','', 
                   ROWTERMINATOR = ''\n'', 
                   FIRSTROW = 1 
                ) '
    print @sql1
    exec (@sql1)

      fetch next from c1 into @path1,@filename1
      end
    close c1
    deallocate c1

	--select * from Client_Status_Temp_combined_n1
	
	Truncate table Client_Status_Temp_combined_n1
	insert into Client_Status_Temp_combined_n1
	--select * into Client_Status_Temp_combined_n1
	--from (
	select  SKU,Stock_Location,Year,Month,Date,cast(Inv_at_site_Qty as nvarchar) as Inv_at_Site_Qty,cast ('' as nvarchar) as Inv_at_Transit_qty from Client_Status_Temp_5
	union
	select  SKU,Stock_Location,Year,Month,Date,cast(INV_at_Site_Qty as nvarchar) as Inv_at_Site_Qty, cast ('' as nvarchar) as Inv_at_Transit_qty from Client_STATUS_TEMP_RM

	
	

	update sls set inventoryAtSite=0
 from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 
where sl.stockLocationName + '|' + sls.locationSkuName not in (select Stock_Location  + '|' + SKU from Client_Status_Temp_combined_n1)
and    sl.stockLocationName  in (select distinct stock_location from Client_Status_Temp_combined_n1) 

end
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_Site_Qty_Reset_newD20]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_Site_Qty_Reset_newD20]
AS
BEGIN



IF (OBJECT_ID('Client_STATUS_TEMP_RM') IS NOT NULL)
drop table Client_STATUS_TEMP_RM;

create table Client_STATUS_TEMP_RM
(SKU nvarchar(100),
Stock_Location nvarchar(100),

Year nvarchar(10),
Month nvarchar(10),
Date nvarchar(10),
INV_at_Site_Qty nvarchar(100),
Inv_at_Transit_qty nvarchar(100),

)

/*
-----temporary addition jun'23----
bulk insert Client_STATUS_TEMP_RM
from 'E:\SymphonyData\InputFolder\Status_Site_RM_2023_06_23.csv'  -- rename file
WITH ( 
                   FIELDTERMINATOR = ',', 
                   ROWTERMINATOR = '\n', 
                   FIRSTROW = 2 

)
-----temporary addition jun'23----
*/

IF (OBJECT_ID('allfilenames') IS NOT NULL)
drop table allfilenames;

IF (OBJECT_ID('bulkact') IS NOT NULL)
drop table bulkact;

CREATE TABLE ALLFILENAMES(WHICHPATH VARCHAR(255),WHICHFILE varchar(255))
CREATE TABLE BULKACT(RAWDATA VARCHAR (8000))
declare @filename1 varchar(255),
        @path1     varchar(255),
        @sql1      varchar(8000),
        @cmd1      varchar(1000)



SET @path1 = 'E:\SymphonyData\InputFolder\'
SET @cmd1 = 'dir "' + @path1 + '" *.csv /b'
INSERT INTO  ALLFILENAMES(WHICHFILE)
EXEC Master..xp_cmdShell @cmd1
UPDATE ALLFILENAMES SET WHICHPATH = @path1 where WHICHPATH is null

--cursor loop
    declare c1 cursor for SELECT WHICHPATH,WHICHFILE FROM ALLFILENAMES where WHICHFILE like 'STATUS_site_RM%.csv%'
    open c1
    fetch next from c1 into @path1,@filename1
    While @@fetch_status <> -1
      begin
      --bulk insert won't take a variable name, so make a sql and execute it instead:
       set @sql1 = 'BULK INSERT Client_STATUS_TEMP_RM FROM ''' + @path1 + @filename1 + ''' '
           + '     WITH ( 
                   FIELDTERMINATOR = '','', 
                   ROWTERMINATOR = ''\n'', 
                   FIRSTROW = 1 
                ) '
    print @sql1
    exec (@sql1)

      fetch next from c1 into @path1,@filename1
      end
    close c1
    deallocate c1

	--select * from Client_Status_Temp_combined_n1
	
	Truncate table Client_Status_Temp_combined_n1
	insert into Client_Status_Temp_combined_n1
	--select * into Client_Status_Temp_combined_n1
	--from (
	select  SKU,Stock_Location,Year,Month,Date,cast(Inv_at_site_Qty as nvarchar) as Inv_at_Site_Qty,cast ('' as nvarchar) as Inv_at_Transit_qty from Client_Status_Temp_5
	union
	select  SKU,Stock_Location,Year,Month,Date,cast(INV_at_Site_Qty as nvarchar) as Inv_at_Site_Qty, cast ('' as nvarchar) as Inv_at_Transit_qty from Client_STATUS_TEMP_RM

	

	update sls set inventoryAtSite=0
 from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 
where 
sl.stockLocationName + '|' + sls.locationSkuName not in (select n.Stock_Location  + '|' + n.SKU from Client_Status_Temp_combined_n1 n
left join Symphony_StockLocations sl on sl.stockLocationName=n.Stock_Location where sl.stockLocationID between 0 and 1000 )
and    sl.stockLocationName  in (select distinct stock_location from Client_Status_Temp_combined_n1) and sls.isDeleted=0 
and sls.stockLocationID between 0 and 1000

update sls set inventoryAtSite=0
 from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 
where 
sl.stockLocationName + '|' + sls.locationSkuName not in (select n.Stock_Location  + '|' + n.SKU from Client_Status_Temp_combined_n1 n
left join Symphony_StockLocations sl on sl.stockLocationName=n.Stock_Location where sl.stockLocationID between 1000 and 5000 )
and    sl.stockLocationName  in (select distinct stock_location from Client_Status_Temp_combined_n1) and sls.isDeleted=0 
and sls.stockLocationID between 1000 and 5000

update sls set inventoryAtSite=0
 from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 
where 
sl.stockLocationName + '|' + sls.locationSkuName not in (select n.Stock_Location  + '|' + n.SKU from Client_Status_Temp_combined_n1 n
left join Symphony_StockLocations sl on sl.stockLocationName=n.Stock_Location where sl.stockLocationID >5000 )
and    sl.stockLocationName  in (select distinct stock_location from Client_Status_Temp_combined_n1) and sls.isDeleted=0 
and sls.stockLocationID >5000

end

GO
/****** Object:  StoredProcedure [dbo].[Client_SP_Site_Stock_Summary]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_Site_Stock_Summary]
AS
BEGIN
  

SELECT sl.stockLocationName 
       ,sl.stockLocationDescription 
	  ,spi.skuItemName as Division  
       ,sls.custom_txt3 as Business  
        ,u.uomName as UOM  
		,slsh.updateDate      
		,count(*) as No_of_SKUs
        ,sum(case when slsh.buffersize>0 then 1 else 0 end) as No_of_buffer_SKUs
		,sum(sls.buffersize) as buffer_Size
		,sum(slsh.inventoryAtSite) as Inventory_at_Site
		,sum(slsh.inventoryAtTransit) as Inventory_at_Transit
		        --,slsh.[consumption]        
  FROM [Symphony_StockLocationSkuHistory] slsh      
  join Symphony_StockLocations sl on sl.stockLocationID=slsh.stockLocationID      
  --join Symphony_SKUs s on s.skuID=slsh.skuID      
  left join Symphony_StockLocationSkus sls on sls.stockLocationID=slsh.stockLocationID and sls.skuID=slsh.skuID      
  left join Symphony_SKUsPropertyItems spi on spi.skuItemID=sls.skuPropertyID1  
  left join Symphony_UOM u on u.uomID=sls.uomID  
  where slsh.updatedate>=convert(date, getdate()-30) and sl.stockLocationType in (5,3)   --and sl.stockLocationName='5135'
  group by sl.stockLocationName,slsh.updateDate,sl.stockLocationDescription ,sls.custom_txt3,u.uomName ,spi.skuItemName
  order by sl.stockLocationName,slsh.updateDate,sls.custom_txt3 desc

  
  

  end
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_STO_JBD]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_STO_JBD]
AS
BEGIN
SELECT  sl1.stockLocationName as [Supplying Plant]
         ,sls.locationSkuName as Material
         	,sls.replenishmentQuantity
			,spi.skuItemName as Division
        ,CONVERT(VARCHAR(10), GETDATE(), 103) as [Delivery Date]
         ,sl.stockLocationName as [Plant]
	
 FROM [SYMPHONY_HRJ].[dbo].[Symphony_StockLocationSkus] sls
  join Symphony_StockLocations sl on sls.stockLocationID=sl.stockLocationID
  join Symphony_StockLocations sl1 on sls.originStockLocation=sl1.stockLocationID 
  left join Symphony_SKUsPropertyItems spi on spi.skuItemID=sls.skuPropertyID1
  left join Symphony_SKUsPropertyItems spi1 on spi1.skuItemID=sls.skuPropertyID6
where sls.inventoryNeeded>0 and sls.bufferSize>0 
 and SLS.isDeleted = 0 and sl.stockLocationType=5 and sl.isDeleted=0 and sls.custom_txt3='JBD' and sls.replenishmentQuantity>0    and
 sls.avoidReplenishment=0 and sl.stockLocationName not in ('7550','4750') and sl1.stockLocationName in 
 ('4200','5000','5135','5160','6100','6700','7550','8110','7000','7590','8900','7680') order by sl1.stockLocationName

 end
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_Transit_Qty_Reset]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_Transit_Qty_Reset]
AS
BEGIN

  	
IF (OBJECT_ID('Client_STATUS_TEMP_RM_1') IS NOT NULL)
drop table Client_STATUS_TEMP_RM_1;

create table Client_STATUS_TEMP_RM_1
(SKU nvarchar(100),
Stock_Location nvarchar(100),

Year nvarchar(10),
Month nvarchar(10),
Date nvarchar(10),
INV_at_Site_Qty nvarchar(100),
Inv_at_Transit_qty nvarchar(100),

)

IF (OBJECT_ID('allfilenames') IS NOT NULL)
drop table allfilenames;

IF (OBJECT_ID('bulkact') IS NOT NULL)
drop table bulkact;

CREATE TABLE ALLFILENAMES(WHICHPATH VARCHAR(255),WHICHFILE varchar(255))
CREATE TABLE BULKACT(RAWDATA VARCHAR (8000))
declare @filename1 varchar(255),
        @path1     varchar(255),
        @sql1      varchar(8000),
        @cmd1      varchar(1000)



SET @path1 = 'E:\SymphonyData\InputFolder\'
SET @cmd1 = 'dir "' + @path1 + '" *.csv /b'
INSERT INTO  ALLFILENAMES(WHICHFILE)
EXEC Master..xp_cmdShell @cmd1
UPDATE ALLFILENAMES SET WHICHPATH = @path1 where WHICHPATH is null

--cursor loop
    declare c1 cursor for SELECT WHICHPATH,WHICHFILE FROM ALLFILENAMES where WHICHFILE like 'STATUS_TRAN_RM%.csv%'
    open c1
    fetch next from c1 into @path1,@filename1
    While @@fetch_status <> -1
      begin
      --bulk insert won't take a variable name, so make a sql and execute it instead:
       set @sql1 = 'BULK INSERT Client_STATUS_TEMP_RM_1 FROM ''' + @path1 + @filename1 + ''' '
           + '     WITH ( 
                   FIELDTERMINATOR = '','', 
                   ROWTERMINATOR = ''\n'', 
                   FIRSTROW = 1 
                ) '
    print @sql1
    exec (@sql1)

      fetch next from c1 into @path1,@filename1
      end
    close c1
    deallocate c1

	--select * from Client_Status_Temp_combined_n1_1

	truncate table Client_Status_Temp_combined_n1_1
	insert into Client_Status_Temp_combined_n1_1
		
	select SKU,Stock_Location,Year,Month,Date,cast('' as nvarchar) as Inv_at_Site_Qty,cast (Inv_at_Transit_qty as nvarchar) as Inv_at_Transit_qty from Client_STATUS_TEMP_2
	union
	select SKU,Stock_Location,Year,Month,Date,cast('' as nvarchar) as Inv_at_Site_Qty, cast (Inv_at_Transit_qty as nvarchar) as Inv_at_Transit_qty  from Client_STATUS_TEMP_RM_1

	
	update sls set inventoryAtTransit=0
 from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 
where sl.stockLocationName + '|' + sls.locationSkuName not in (select Stock_Location  + '|' + SKU from Client_Status_Temp_combined_n1_1)
and    sl.stockLocationName  in (select distinct stock_location from Client_Status_Temp_combined_n1_1) 

end
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_Transit_Qty_Reset_newD20]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_Transit_Qty_Reset_newD20]
AS
BEGIN

 	
IF (OBJECT_ID('Client_STATUS_TEMP_RM_1') IS NOT NULL)
drop table Client_STATUS_TEMP_RM_1;

create table Client_STATUS_TEMP_RM_1
(SKU nvarchar(100),
Stock_Location nvarchar(100),

Year nvarchar(10),
Month nvarchar(10),
Date nvarchar(10),
INV_at_Site_Qty nvarchar(100),
Inv_at_Transit_qty nvarchar(100),

)
/*
-----temporary addition jun'23----
bulk insert Client_STATUS_TEMP_RM_1
from 'E:\SymphonyData\InputFolder\STATUS_TRAN_RM_2023_06_23.csv' --file name to be changed
WITH ( 
                   FIELDTERMINATOR = ',', 
                   ROWTERMINATOR = '\n', 
                   FIRSTROW = 2 

)
-----temporary addition jun'23----
*/



IF (OBJECT_ID('allfilenames') IS NOT NULL)
drop table allfilenames;

IF (OBJECT_ID('bulkact') IS NOT NULL)
drop table bulkact;

CREATE TABLE ALLFILENAMES(WHICHPATH VARCHAR(255),WHICHFILE varchar(255))
CREATE TABLE BULKACT(RAWDATA VARCHAR (8000))
declare @filename1 varchar(255),
        @path1     varchar(255),
        @sql1      varchar(8000),
        @cmd1      varchar(1000)



SET @path1 = 'E:\SymphonyData\InputFolder\'
SET @cmd1 = 'dir "' + @path1 + '" *.csv /b'
INSERT INTO  ALLFILENAMES(WHICHFILE)
EXEC Master..xp_cmdShell @cmd1
UPDATE ALLFILENAMES SET WHICHPATH = @path1 where WHICHPATH is null

--cursor loop
    declare c1 cursor for SELECT WHICHPATH,WHICHFILE FROM ALLFILENAMES where WHICHFILE like 'STATUS_TRAN_RM%.csv%'
    open c1
    fetch next from c1 into @path1,@filename1
    While @@fetch_status <> -1
      begin
      --bulk insert won't take a variable name, so make a sql and execute it instead:
       set @sql1 = 'BULK INSERT Client_STATUS_TEMP_RM_1 FROM ''' + @path1 + @filename1 + ''' '
           + '     WITH ( 
                   FIELDTERMINATOR = '','', 
                   ROWTERMINATOR = ''\n'', 
                   FIRSTROW = 1 
                ) '
    print @sql1
    exec (@sql1)

      fetch next from c1 into @path1,@filename1
      end
    close c1
    deallocate c1

	--select * from Client_Status_Temp_combined_n1_1

	truncate table Client_Status_Temp_combined_n1_1
	insert into Client_Status_Temp_combined_n1_1
		
	select SKU,Stock_Location,Year,Month,Date,cast('' as nvarchar) as Inv_at_Site_Qty,cast (Inv_at_Transit_qty as nvarchar) as Inv_at_Transit_qty from Client_STATUS_TEMP_2
	union
	select SKU,Stock_Location,Year,Month,Date,cast('' as nvarchar) as Inv_at_Site_Qty, cast (Inv_at_Transit_qty as nvarchar) as Inv_at_Transit_qty  from Client_STATUS_TEMP_RM_1

	
	update sls set inventoryAtTransit=0
 from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 
where sl.stockLocationName + '|' + sls.locationSkuName not in (select Stock_Location  + '|' + SKU from Client_Status_Temp_combined_n1_1 n
left join Symphony_StockLocations sl on sl.stockLocationName=n.Stock_Location where sl.stockLocationID between 0 and 10 )
and    sl.stockLocationName  in (select distinct stock_location from Client_Status_Temp_combined_n1_1) and sls.isDeleted=0 
and sls.stockLocationID between 0 and 10

	
	update sls set inventoryAtTransit=0
 from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 
where sl.stockLocationName + '|' + sls.locationSkuName not in (select Stock_Location  + '|' + SKU from Client_Status_Temp_combined_n1_1 n
left join Symphony_StockLocations sl on sl.stockLocationName=n.Stock_Location where sl.stockLocationID between 10 and 5000 )
and    sl.stockLocationName  in (select distinct stock_location from Client_Status_Temp_combined_n1_1) and sls.isDeleted=0 
and sls.stockLocationID between 10 and 5000


update sls set inventoryAtTransit=0
 from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID 
where sl.stockLocationName + '|' + sls.locationSkuName not in (select Stock_Location  + '|' + SKU from Client_Status_Temp_combined_n1_1 n
left join Symphony_StockLocations sl on sl.stockLocationName=n.Stock_Location where sl.stockLocationID >5000 )
and    sl.stockLocationName  in (select distinct stock_location from Client_Status_Temp_combined_n1_1) and sls.isDeleted=0 
and sls.stockLocationID >5000


end
GO
/****** Object:  StoredProcedure [dbo].[Client_SP_UOM_Conversion_Report]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Client_SP_UOM_Conversion_Report]
AS
BEGIN



select sl.stockLocationName as SL,osl.stockLocationName as Origin_Stock_Location   ,sl.stockLocationDescription as SL_Description,  sls.locationSkuName as SKU,
      sls.skuDescription,uom.uomName as UOM
       ,sls.custom_txt3 as Business,spi.skuItemName as Divison
       ,cast(bufferSize as decimal(10,0)) as Buffer_Size,cast(inventoryAtSite as decimal(10,0)) as Inv_Site,
	   cast(inventoryAtTransit as decimal(10,0)) as Inv_Transit ,cast(custom_num5 as decimal(10,0)) as Pack_Size,
      cast(inventoryAtTransit*custom_num5 as decimal(10,0))  as Rev_Inv_at_transit,
 cast(  case when bufferSize-(inventoryAtSite+(inventoryAtTransit*custom_num5)+inventoryAtProduction)>0 then
    bufferSize-(inventoryAtSite+(inventoryAtTransit*custom_num5)+inventoryAtProduction) else 0 end as decimal(10,0)) as Gap_qty 
	,convert(varchar,getdate(),103) as Date
	 from Symphony_StockLocationSkus sls
join Symphony_StockLocations sl on sl.stockLocationID=sls.stockLocationID
left join Symphony_StockLocations osl on osl.stockLocationID=sls.stockLocationID
  left join Symphony_SKUsPropertyItems spi on spi.skuItemID=sls.skuPropertyID1 

  left join Symphony_UOM uom on uom.uomID=sls.uomID
  
 where custom_num5 is not null and bufferSize-(inventoryAtSite+(inventoryAtTransit*custom_num5)+inventoryAtProduction)>0

 end
GO
/****** Object:  StoredProcedure [dbo].[CreateAfterChangeTriggers]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[CreateAfterChangeTriggers]
	@tableName sysname = NULL
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	--Get trigger/table name pairs
	DECLARE @PARAMETERS AS TABLE([ID] [int] IDENTITY (0,1),[tableName] [nvarchar](100), [triggerName] [nvarchar](150))
	
	INSERT INTO @PARAMETERS
		SELECT [tableName], [triggerName] 
		FROM [dbo].[Symphony_DataChanged]
		WHERE [type] = 0
		AND [tableName] LIKE ISNULL(@tableName, '%')
		
	DECLARE
		 @COUNT int
		,@INDEX int
		,@TABLE_NAME NVARCHAR(100)
		,@TRIGGER_NAME NVARCHAR(150)
		
	SELECT @COUNT = COUNT(1), @INDEX = 0 FROM @PARAMETERS;
	
	WHILE @INDEX < @COUNT
	BEGIN
	
		SELECT @TABLE_NAME = [tableName], @TRIGGER_NAME = [triggerName] 
		FROM @PARAMETERS
		WHERE [ID] = @INDEX
		
		EXECUTE('IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N''[dbo].[' + @TRIGGER_NAME + ']''))
						DROP TRIGGER [dbo].[' + @TRIGGER_NAME + ']'
				) 

					
		EXECUTE('CREATE TRIGGER [dbo].[' + @TRIGGER_NAME + '] ON [dbo].[' + @TABLE_NAME +']
					   AFTER INSERT,DELETE,UPDATE
					AS
					BEGIN
						UPDATE [dbo].[Symphony_DataChanged]
						SET [lastDataChange] = GETDATE()
						WHERE [tableName] = ''' + @TABLE_NAME + ''';
					END'
				)
												
		SET @INDEX = @INDEX + 1;
		
	END
	
END
GO
/****** Object:  StoredProcedure [dbo].[CreateAfterInsertDeleteTriggers]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[CreateAfterInsertDeleteTriggers]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	--Get trigger/table name pairs
	DECLARE @PARAMETERS AS TABLE([ID] [int] IDENTITY (0,1),[tableName] [nvarchar](100), [triggerName] [nvarchar](150))
	
	INSERT INTO @PARAMETERS
		SELECT [tableName], [triggerName] 
		FROM [dbo].[Symphony_DataChanged]
		WHERE [type] = 1;
		
	DECLARE
		 @COUNT int
		,@INDEX int
		,@TABLE_NAME NVARCHAR(100)
		,@TRIGGER_NAME NVARCHAR(150)
		
	SELECT @COUNT = COUNT(1), @INDEX = 0 FROM @PARAMETERS;
	
	WHILE @INDEX < @COUNT
	BEGIN
	
		SELECT @TABLE_NAME = [tableName], @TRIGGER_NAME = [triggerName] 
		FROM @PARAMETERS
		WHERE [ID] = @INDEX
		
		EXECUTE('IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N''[dbo].[' + @TRIGGER_NAME + ']''))
					DROP TRIGGER [dbo].[' + @TRIGGER_NAME + ']'
				)
					
		EXECUTE('CREATE TRIGGER [dbo].[' + @TRIGGER_NAME + '] ON [dbo].[' + @TABLE_NAME +']
					   AFTER INSERT,DELETE
					AS
					BEGIN
						UPDATE [dbo].[Symphony_DataChanged]
						SET [lastDataChange] = GETDATE()
						WHERE [tableName] = ''' + @TABLE_NAME + ''';
					END' 
				)
										
		SET @INDEX = @INDEX + 1;
		
	END
END
GO
/****** Object:  StoredProcedure [dbo].[CreateCustomChangeTriggers]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[CreateCustomChangeTriggers]
	-- Add the parameters for the stored procedure here
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	EXECUTE (
		'IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N''[dbo].[AfterUpdate_StockLocationSkus]''))
			DROP TRIGGER [dbo].[AfterUpdate_StockLocationSkus]'
	)
					
	EXECUTE (
		'CREATE TRIGGER [dbo].[AfterUpdate_StockLocationSkus] 
		   ON  [dbo].[Symphony_StockLocationSkus] 
		   AFTER UPDATE
		AS 
		BEGIN
			IF UPDATE([isDeleted])	BEGIN
			
				DECLARE @isChanged bit = 0
				
				SELECT TOP 1
					@isChanged = CONVERT(bit, 1)
				FROM deleted 
				INNER JOIN inserted 
					ON inserted.skuID =deleted.skuID
					AND inserted.stockLocationID = deleted.stockLocationID
					AND inserted.[isDeleted] <> deleted.[isDeleted]
				
				IF @isChanged = 1
					UPDATE [dbo].[Symphony_DataChanged]
					SET [lastDataChange] = GETDATE()
					WHERE [tableName] = ''Symphony_StockLocationSkus''
					OR [tableName] = ''Symphony_SKUs'';
				
			END
			ELSE IF UPDATE([originStockLocation])
			BEGIN
				UPDATE [dbo].[Symphony_DataChanged]
				SET [lastDataChange] = GETDATE()
				WHERE [tableName] = ''Symphony_StockLocationSkus'' AND [type] = 2;
			END
		END'
	)

	EXECUTE (
		'IF  EXISTS (SELECT * FROM sys.triggers WHERE object_id = OBJECT_ID(N''[dbo].[AfterUpdate_MTOSkus]''))
			DROP TRIGGER [dbo].[AfterUpdate_MTOSkus]'
	)
					
	EXECUTE (
		'CREATE TRIGGER [dbo].[AfterUpdate_MTOSkus] 
		   ON  [dbo].[Symphony_MTOSkus] 
		   AFTER UPDATE
		AS 
		BEGIN
			IF UPDATE([isDeleted])
			BEGIN
				UPDATE [dbo].[Symphony_DataChanged]
				SET [lastDataChange] = GETDATE()
				WHERE [tableName] = ''Symphony_MTOSkus''
				OR [tableName] = ''Symphony_MTOSkus'';
			END
		END'
	)

END
GO
/****** Object:  StoredProcedure [dbo].[CreateInputQuarantineTable]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[CreateInputQuarantineTable]
	-- Add the parameters for the stored procedure here
	@inputTableName sysname
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
    DECLARE @identityColumnName sysname;
    DECLARE @quarantineTableName sysname;
	SELECT @quarantineTableName = N'[dbo].[' +  OBJECT_NAME(OBJECT_ID(@inputTableName)) + N'Quarantine]';
	--SELECT @quarantineTableName = OBJECT_NAME(OBJECT_ID(@inputTableName)) + N'Quarantine';
	EXEC [dbo].[BeforeCreate] 'TABLE', @quarantineTableName
	
	EXEC ('SELECT TOP(0) * INTO ' + @quarantineTableName + ' FROM ' + @inputTableName)

	SELECT
		@identityColumnName = ISNULL( COL.[name],N'')
	FROM sys.columns COL
	INNER JOIN sys.tables TBL
		ON TBL.[object_id] = COL.[object_id]
	WHERE COL.[is_identity] = 1
		AND TBL.[object_id] = OBJECT_ID(@quarantineTableName,'TABLE')

	IF LEN(@identityColumnName) > 0
		EXEC ('ALTER TABLE ' + @quarantineTableName + ' DROP COLUMN ' + @identityColumnName)

	EXEC ('ALTER TABLE ' + @quarantineTableName + ' ADD id bigint IDENTITY')
	EXEC ('ALTER TABLE ' + @quarantineTableName + ' ADD [type] nvarchar(50)')
	EXEC ('ALTER TABLE ' + @quarantineTableName + ' ADD loadingDate datetime')
	EXEC ('ALTER TABLE ' + @quarantineTableName + ' ADD quarantineReason nvarchar(500)')
	EXEC ('ALTER TABLE ' + @quarantineTableName + ' ADD actualLineContent nvarchar(1000)')
	
	EXEC [dbo].[AfterCreate] 'TABLE', @quarantineTableName

END
GO
/****** Object:  StoredProcedure [dbo].[DropDefaultConstraint]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[DropDefaultConstraint] 
	-- Add the parameters for the stored procedure here
	@tableName sysname, 
	@columnName sysname
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

    -- Insert statements for procedure here
	DECLARE @constraintName sysname;
	
	SELECT
		@constraintName = DC.name
	FROM sys.default_constraints DC
	INNER JOIN sys.tables T
		ON DC.parent_object_id = T.object_id
	INNER JOIN sys.columns C
		ON C.object_id = T.object_id
		AND DC.parent_column_id = C.column_id
	WHERE T.name = REPLACE(REPLACE(@tableName,'[',''),']','') 
		AND C.name = REPLACE(REPLACE(@columnName,'[',''),']','')
		

	IF  EXISTS (SELECT * FROM dbo.sysobjects WHERE id = OBJECT_ID(@constraintName) AND type = 'D')
	BEGIN
		EXEC ('ALTER TABLE ' + @tableName + ' DROP CONSTRAINT ' + @constraintName)
	END
END
GO
/****** Object:  StoredProcedure [dbo].[DropDefaultConstraints]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[DropDefaultConstraints] 
	@tableName sysname
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;

	DECLARE @cmd nvarchar(max);
	
	SELECT
		@cmd = CASE
			WHEN @cmd IS NULL THEN 'ALTER TABLE ' + @tableName + ' DROP CONSTRAINT ' + DC.name
			ELSE @cmd + CHAR(13) + 'ALTER TABLE ' + @tableName + ' DROP CONSTRAINT ' + DC.name
		END
	FROM sys.default_constraints DC
	INNER JOIN sys.tables T
		ON DC.parent_object_id = T.object_id
	WHERE T.name = REPLACE(REPLACE(@tableName,'[',''),']','');
		
	EXEC (@cmd);
END
GO
/****** Object:  StoredProcedure [dbo].[DropForeignKeyConstraints]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[DropForeignKeyConstraints]
	@tableName sysname
AS
BEGIN

	SET NOCOUNT ON;
	
	DECLARE
		 @charIndex int
		,@cmd nvarchar(max);

	SELECT 
		 @charIndex = CHARINDEX('.', REVERSE(@tableName), 1)
		,@tableName = CASE 
			WHEN @charIndex > 0 THEN  LTRIM(RTRIM(REPLACE(REPLACE(RIGHT(@tableName, @charIndex - 1),'[',''),']','')))
			ELSE LTRIM(RTRIM(REPLACE(REPLACE(@tableName,'[',''),']','')))
			END

	SELECT 
		@cmd = CASE	
			WHEN @cmd IS NULL THEN 'ALTER TABLE ' + @tableName + ' DROP CONSTRAINT ' + FK.name 
			ELSE @cmd + CHAR(13) +  'ALTER TABLE ' + @tableName + ' DROP CONSTRAINT ' + FK.name 
			END
	FROM sys.foreign_keys FK
	INNER JOIN sys.tables TBL
		ON TBL.object_id = FK.parent_object_id
	WHERE TBL.name = @tableName
	
	EXEC (@cmd)
	
END
GO
/****** Object:  StoredProcedure [dbo].[obp_HRJVendorDailyEmail]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[obp_HRJVendorDailyEmail]                
(@var_emailto nvarchar(100),@var_uname nvarchar(100),@var_usercode nvarchar(100),@var_rptname nvarchar(200),@var_rptdate nvarchar(10))                
AS                  
begin                  
DECLARE @xml NVARCHAR(MAX)                
DECLARE @body NVARCHAR(MAX)   
Declare @var_filepath nvarchar(200),@var_sub nvarchar(200)      
           
 
set @var_filepath='E:\AutoEmail\'+ @var_rptname +'.CSV'    
set @var_sub=    'Automatic Custom Report - '+@var_rptname   
  
               
SET @body ='<html><body>Dear User,<BR>Symphony has generated a new report [attached] for your request:</BR><P><BR>Report Name: '+@var_rptname+'</BR>Report Date: '+@var_rptdate+'<P><BR>Have a pleasant day!</BR><BR>Symphony</BR>Inherent Simplicity<P><BR><i>
Please, do not reply - this email was generated automatically by Symphony.</i></BR><i>If you do not want to receive these updates, please, inform your administrator.</i><P><BR>*report will be attached as a CSV file</BR><P>'                
  
SET @body = @body  +'</body></html>'                
               
                
SET @body = @body  +'</body></html>'                
EXEC msdb.dbo.sp_send_dbmail                
@profile_name = 'profile2',                
@body = @body,                
@body_format ='HTML',                
@recipients = @var_emailto,  
@file_attachments=@var_filepath,      
@subject = @var_sub;                
                  
end      
GO
/****** Object:  StoredProcedure [dbo].[obp_LicAndWindowsEmail]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create PROCEDURE [dbo].[obp_LicAndWindowsEmail]                
(@var_emailto nvarchar(100),@var_uname nvarchar(100))                
AS                  
begin                  
DECLARE @xml NVARCHAR(MAX)                
DECLARE @body NVARCHAR(MAX)                

Set @var_uname='Team'
SET @xml = CAST(( SELECT [ItemName] AS 'td','',[ItemValue] AS 'td','',[ItemCalValue] AS 'td','', [UpdateDate] AS 'td'               
FROM tb_DiskAndLicDetail where ISNULL(cast(ItemCalValue as float),999)<=20
ORDER BY ItemName                
FOR XML PATH('tr'), ELEMENTS ) AS NVARCHAR(MAX))                
/*                
SET @xml = CAST(( SELECT [ClientName] AS 'td','',[LicenseDate] AS 'td','', [DaysLeft] AS 'td','' ,[FeesPendingAmount] as 'td','', [ExpensePendingAmount] as 'td'                
FROM obp_EmailList where username= @var_uname                
ORDER BY ClientName                
FOR XML PATH('tr'), ELEMENTS ) AS NVARCHAR(MAX))                
*/                
                
SET @body ='<html><body>Dear '+@var_uname+'<BR></BR><BR>Onebeat License/ Server Disk Details are mentioned below.</BR><P>                
<table border = 1>                 
<tr bgcolor=Orange>                
<th> ItemName </th> <th> ItemValue </th> <th> ItemValueLeft(%) </th><th> ReportDate </th></tr>'
/*<th> ClientName </th> <th> LicenseValidityDate </th> <th> DaysLeft </th><th> FeesPendingAmount </th><th> ExpensePendingAmount </th>*/                    
/*                 
SET @body = @body + @xml +'</table><BR>Thanks</BR><BR>OneBeat Team</BR><BR>Goldratt Group</BR><BR>-----This is an auto generated email from http://164.52.203.134/ . Please Do not Reply-----</BR></body></html>'                
*/                
SET @body = @body + @xml +'</table><BR>Thanks</BR><BR>OneBeat Team</BR><BR>-----This is an auto generated email. Please Do not Reply-----</BR></body></html>'                
EXEC msdb.dbo.sp_send_dbmail                
@profile_name = 'Profile_01',                
@body = @body,                
@body_format ='HTML',                
@recipients = @var_emailto,                
@subject = 'Goldratt : Prism Johnson OneBeat License and Disk Consumption Detail' ;                
    
                  
end      
    
GO
/****** Object:  StoredProcedure [dbo].[obp_SP_GetWindowsDiskAnd1BLicDetails]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
CREATE proc [dbo].[obp_SP_GetWindowsDiskAnd1BLicDetails]  
as  
Begin  
  
If OBJECT_ID('tempdb..#output') is not null drop table #output  
  
declare @svrName varchar(255)  
declare @sql varchar(400)  
  
--by default it will take the current server name, we can the set the server name as well  
set @svrName = @@SERVERNAME  
set @sql = 'powershell.exe -c "Get-WmiObject -ComputerName ' + QUOTENAME(@svrName,'''') + ' -Class Win32_Volume -Filter ''DriveType = 3'' | select name,capacity,freespace | foreach{$_.name+''|''+$_.capacity/1048576+''%''+$_.freespace/1048576+''*''}"'  
  
--creating a temporary table  
CREATE TABLE #output  
(line varchar(255))  
  
--inserting disk name, total space and free space value in to temporary table  
insert #output  
EXEC xp_cmdshell @sql  
  
/*Generats and Insert Daily Windows disk space Details*/  
  
;With cte_dd as  
(select rtrim(ltrim(SUBSTRING(line,1,CHARINDEX('|',line) -1))) as drivename  
   ,round(((round(cast(rtrim(ltrim(SUBSTRING(line,CHARINDEX('%',line)+1,  
   (CHARINDEX('*',line) -1)-CHARINDEX('%',line)) )) as Float) /1024 ,0))/(round(cast(rtrim(ltrim(SUBSTRING(line,CHARINDEX('|',line)+1,  
   (CHARINDEX('%',line) -1)-CHARINDEX('|',line)) )) as Float)/1024,0))*100),2) 'RemainingPer'  
,'DiskSpaceLeft%' 'Desc'  
,cast(getdate() as date) 'UpdateDate'  
from #output  
where line like '[A-Z][:]%'  
  
)  
Update ID set ID.ItemCalValue=DD.RemainingPer,ID.UpdateDate=DD.UpdateDate from tb_DiskAndLicDetail ID,cte_dd DD  where ID.ItemName=DD.drivename  
  
/*Calculate 1Beat Parameters*/  
Declare @var_ConsumedVal float  
  
Set @var_ConsumedVal=0  
Set @var_ConsumedVal=(Select count(*) from Symphony_StockLocations where stockLocationType=2 and isDeleted=0)  
  
update tb_DiskAndLicDetail set ItemCalValue=((ItemValue-@var_ConsumedVal)/ItemValue)*100 where ItemName='Suppliers'  
  
Set @var_ConsumedVal=0  
Set @var_ConsumedVal=(Select count(*) from Symphony_StockLocations where stockLocationType=5 and isDeleted=0)  
  
update tb_DiskAndLicDetail set ItemCalValue=((ItemValue-@var_ConsumedVal)/ItemValue)*100 where ItemName='Warehouse'  
  
Set @var_ConsumedVal=0  
Set @var_ConsumedVal=(Select count(*) from Symphony_StockLocationSkus)  
  
update tb_DiskAndLicDetail set ItemCalValue=((ItemValue-@var_ConsumedVal)/ItemValue)*100 where ItemName='MTSBuffers'  
  
Set @var_ConsumedVal=0  
Set @var_ConsumedVal=(Select count(*) from Symphony_UserPassword)   
--where userName is not null)  
  
update tb_DiskAndLicDetail set ItemCalValue=((ItemValue-@var_ConsumedVal)/ItemValue)*100 where ItemName='Users'  
  
/*End - Calculate 1Beat Parameters*/  
  
  
-- Select * from tb_DiskAndLicDetail  
End  
  
  
  
  
  
  
  
  
GO
/****** Object:  StoredProcedure [dbo].[Replinishment_Report_For_JBD_Depot_Spares]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Replinishment_Report_For_JBD_Depot_Spares]
AS
BEGIN

SELECT  sl.stockLocationName as [Store],sl.stockLocationDescription as [Store Description],
  sls.locationSkuName as SKU,sls.custom_txt8 as [Parent Code]  ,sls.skuDescription as [SKU Description],
  SLS.custom_txt3 [Business],spi.skuItemName [Division], SLS.custom_txt5 [Material Freight Group],spi1.skuItemName [Design],spi5.skuItemName as [HBT_Store],
  sls.custom_txt10 as [HBT National],sl1.stockLocationName as [Origin WH]  ,sl1.stockLocationDescription as [Origin WH Description]
  ,sls.bufferSize  ,sls.inventoryAtSite as Site_Qty  ,sls.inventoryAtTransit as Transit_Qty  ,1-bpProduction as [BP%],
  case when productionColor=0 then 'Cyan' when productionColor=1 then 'Green' when productionColor=2 then 'yellow'when 
  productionColor=3 then 'Red'when productionColor=4 then 'Black' end [BP Color],sls.inventoryNeeded,sls.replenishmentQuantity  
  FROM [SYMPHONY_HRJ].[dbo].[Symphony_StockLocationSkus] sls join Symphony_StockLocations sl on sls.stockLocationID=sl.stockLocationID 
  join Symphony_StockLocations sl1 on sls.originStockLocation=sl1.stockLocationID left join Symphony_SKUsPropertyItems spi on 
  spi.skuItemID=sls.skuPropertyID1     left join Symphony_SKUsPropertyItems spi5 on spi5.skuItemID=sls.skuPropertyID5     
  left join Symphony_SKUsPropertyItems spi1 on spi1.skuItemID=sls.skuPropertyID6
  where sls.inventoryNeeded>0 and sls.bufferSize>0 and sls.custom_txt3 like 'JBD%' and   spi.skuItemName like 'JBD Spares'
  --sls.custom_txt5 like 'JBD SPARE%'   
  and SLS.isDeleted = 0 and 
  sl.stockLocationType=5 and sl.isDeleted=0 and   sls.avoidReplenishment=0 and sl.stockLocationName not like '7550'     

  
  end
GO
/****** Object:  StoredProcedure [dbo].[RMC_Replenishment_Report]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[RMC_Replenishment_Report]
AS
BEGIN

  select 

	SL.stockLocationName as [SL code]
  ,sl.stockLocationDescription as SL_Name
  , SLS.locationSkuName as [RMC SKU code]
  ,sls.custom_txt8 as [RMC Parent SKU code] 
 ,sls.skuDescription as [RMC SKU Description],
SLS.bufferSize,
SLS.inventoryAtSite,  
SLS.InventoryAtTransit,
sls.inventoryNeeded as [Suggested Replenishment Qty]
,isnull(cast(SKUPI2.skuItemName as decimal(10,3))*sls.inventoryNeeded,0) as [Suggested Replenishment Qty in M2]
,Case WHEN SLS.siteColor =0 THEN 'Cyan' 
     WHEN SLS.SiteColor =1 then 'Green' 
WHEN SLS.SiteColor =2 then 'Yellow' 
WHEN SLS.SiteColor =3 then 'Red' 
WHEN SLS.SiteColor =4 then 'Black'  
END [Parent code SiteColor],
Case WHEN SLS.TransitColor =0 THEN 'Cyan' 
     WHEN SLS.TransitColor =1 then 'Green' 
WHEN SLS.TransitColor =2 then 'Yellow' 
WHEN SLS.TransitColor =3 then 'Red' 
WHEN SLS.TransitColor =4 then 'Black'  
END [Parent code TransitColor]

from Symphony_StockLocationSkus SLS
join Symphony_StockLocations SL on SL.stockLocationID = SLS.stockLocationID
left join Symphony_StockLocationPropertyItems slpi4 on slpi4.slItemID=sl.slPropertyID4
left join Symphony_StockLocationPropertyItems slpi1 on slpi1.slItemID=sl.slPropertyID1
left join Symphony_StockLocationPropertyItems slpi2 on slpi2.slItemID=sl.slPropertyID2
left join Symphony_StockLocationPropertyItems slpi5 on slpi5.slItemID=sl.slPropertyID5
Left JOIN Symphony_SkusPropertyItems SKUPI1 ON SLS.skuPropertyID1 = SKUPI1.skuItemID
Left JOIN Symphony_SkusPropertyItems SKUPI2 ON SLS.skuPropertyID2 = SKUPI2.skuItemID
Left JOIN Symphony_SkusPropertyItems SKUPI3 ON SLS.skuPropertyID3 = SKUPI3.skuItemID
Left JOIN Symphony_SkusPropertyItems SKUPI4 ON SLS.skuPropertyID4 = SKUPI4.skuItemID
Left join Symphony_Stocklocations OSL on OSL.stockLocationID = SLS.originStockLocation 
	
where SLS.isDeleted = 0   and sl.stockLocationName = '2625'

END
GO
/****** Object:  StoredProcedure [dbo].[SA_main]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
create proc [dbo].[SA_main]  
as  
begin  
--drop table #skuid  
--drop table #slid  
--drop table #singleskuid  
  
truncate table tb_SA_output  
  
declare @var_per_1 float,@var_per_2 float,@var_per_3 float,@var_per_4 float  
set @var_per_1=0.35  
set @var_per_2=0.50  
set @var_per_3=0.75  
set @var_per_4=1.00  
  
declare @var_skuid_cnt int,@var_sl_cnt int,@var_salrat_ind int  
declare @var_skuid nvarchar(50),@var_sl_pr int,@var_stkqty_dir_alloc float,@var_balqty_dir_alloc float  
   
  
create table #skuid  
(  
skuid nvarchar(50)  
,ind01 int default 0  
)  
  
create table #slid  
(  
sno int identity(1,1)  
,slid nvarchar(50)  
,sl_priority int  
,salrat_priority int  
,req_qty float  
,ind01 int default 0  
)  
  
insert into #skuid(skuid) select distinct skuid from tb_SA_stockreq  
  
set @var_skuid_cnt=(select count(*) from #skuid)  
  
/*Skuid Loop*/  
while @var_skuid_cnt<>0  
begin  
set @var_skuid=(select top 1 skuid from #skuid where ind01=0)  
  
--insert into #slid select slid,sl_priority,salrate_priority,inv_needed,0 from tb_SA_stockreq where skuid= @var_skuid order by sl_priority desc,salrate_priority  
insert into tb_SA_output(skuid,slid,sl_priority,salrate_priority,tot_req_qty,buffersize,batch_size) select @var_skuid,slid,sl_priority,salrate_priority,inv_needed,buffersize,batch_size from tb_SA_stockreq where skuid= @var_skuid order by sl_priority desc,
salrate_priority   
set @var_sl_cnt=0  
  
  
update #skuid set ind01=1 where skuid=@var_skuid  
--set @var_skuid_cnt=1  
set @var_skuid_cnt=@var_skuid_cnt-1  
end  
/*End -SKUID Loop*/  
  
update tb_SA_output set exp_35=(buffersize*@var_per_1),exp_50=(buffersize*@var_per_2),exp_75=(buffersize*@var_per_3),exp_100=(buffersize*@var_per_4) where buffersize > 2  
  
update tb_SA_output set exp_35=1,exp_50=1,exp_75=0,exp_100=0 where buffersize=2  
  
update tb_SA_output set exp_35=1,exp_50=0,exp_75=0,exp_100=0 where buffersize=1  
  
/*Update table tb_SA_output with all the skuid which has 1 record only*/  
  
create table #singleskuid  
(  
skuid nvarchar(50)  
,Nos int  
,ind01 int default 0  
)  
  
insert into #singleskuid  
select distinct  skuid,count(*) as 'COUNT',0 from tb_SA_output group by skuid  
  
delete from #singleskuid where Nos > 1  
  
declare @var_1rec_skuid nvarchar(50),@var_1rec_skuid_cnt int,@var_1rec_stock float,@var_1rec_stock_sno int  
  
set @var_1rec_skuid_cnt =(select count(*) from #singleskuid where Nos =1)  
  
while @var_1rec_skuid_cnt <> 0  
begin  
set @var_1rec_skuid =(select top 1 skuid from #singleskuid where ind01=0)  
--select * from tb_SA_stkat_altorigin  
set @var_1rec_stock_sno=(select top 1 sno from tb_SA_stkat_altorigin where skuid=@var_1rec_skuid and balc_stk >= 1 order by sno)  
set @var_1rec_stock=(select top 1 balc_stk from tb_SA_stkat_altorigin where sno=@var_1rec_stock_sno)  
print 'SKUID'  
print @var_1rec_skuid  
  
if  @var_1rec_stock > (select tot_req_qty from tb_SA_output where skuid=@var_1rec_skuid)  
begin  
  
update tb_SA_output set tot_alloc_qty=tot_req_qty,ind01=1 where skuid=@var_1rec_skuid  
update tb_SA_stkat_altorigin set balc_stk=(balc_stk- (select tot_req_qty from tb_SA_output where skuid=@var_1rec_skuid)) where sno=@var_1rec_stock_sno  
  
end  
  
if  @var_1rec_stock = (select tot_req_qty from tb_SA_output where skuid=@var_1rec_skuid)  
begin  
  
update tb_SA_output set tot_alloc_qty=tot_req_qty,ind01=1 where skuid=@var_1rec_skuid  
update tb_SA_stkat_altorigin set balc_stk=0 where sno=@var_1rec_stock_sno  
  
end  
  
if  @var_1rec_stock < (select tot_req_qty from tb_SA_output where skuid=@var_1rec_skuid)  
begin  
  
update tb_SA_output set tot_alloc_qty=@var_1rec_stock,ind01=1 where skuid=@var_1rec_skuid  
update tb_SA_stkat_altorigin set balc_stk=0 where sno=@var_1rec_stock_sno  
  
end  
  
  
update #singleskuid set ind01=1 where skuid=@var_1rec_skuid  
set @var_1rec_skuid_cnt=@var_1rec_skuid_cnt-1  
end  
  
/*Multiple Stock Allocation Process*/  
truncate table #singleskuid  
  
insert into #singleskuid  
select distinct  skuid,count(*) as 'COUNT',0 from tb_SA_output group by skuid  
  
delete from #singleskuid where Nos = 1  
  
declare @var_mrec_skuid nvarchar(50),@var_mrec_skuid_cnt int,@var_mrec_stock float,@var_mrec_stock_sno int,@var_mrec_ind_skuid_cnt int,@balc_stk float  
declare @var_mrec_from_sno int,@var_mrec_from_sno_cnt int,@var_mrec_pri_sno int,@var_mrec_balc_out_ind int,@var_mrec_proc_ind int,@balc_stk_o float  
set @var_mrec_skuid_cnt=(select count(*) from #singleskuid where nos > 1)  
  
print 'MULTI ALLOC CNT'  
print @var_mrec_skuid_cnt  
  
while @var_mrec_skuid_cnt<>0  
begin  
set @var_mrec_skuid=(select top 1 skuid from #singleskuid where ind01=0)  
set @var_mrec_ind_skuid_cnt=(select count(*) from tb_SA_output where skuid=@var_mrec_skuid)  
set @balc_stk=(select top 1 balc_stk from tb_SA_stkat_altorigin where skuid=@var_mrec_skuid and balc_stk > 1)  
set @var_mrec_balc_out_ind=0   
print 'SKUId'   
print @var_mrec_skuid  
 /*Allocation process for indv SKUID*/  
  
 while @var_mrec_ind_skuid_cnt<>0  
 begin  
 Print 'Alloc cnt'  
 print @var_mrec_ind_skuid_cnt  
  
 set @var_mrec_pri_sno=(select top 1 sl_priority from tb_SA_output where skuid=@var_mrec_skuid and ind01=0 order by sno)  
 set @var_mrec_from_sno=(select top 1 sno from tb_SA_output where skuid=@var_mrec_skuid and sl_priority=@var_mrec_pri_sno and ind01=0 order by sno)  
   
 set @var_mrec_from_sno_cnt=(select count(*) from tb_SA_output where skuid=@var_mrec_skuid and sl_priority=@var_mrec_pri_sno and ind01=0)  
 set @var_mrec_proc_ind=0  
  
 /*SKUID without salerate_priority*/  
 if @var_mrec_from_sno_cnt=1  
 begin  
 print 'S Alloc'  
 print convert(varchar(10),@var_mrec_from_sno)  
  
 if (@balc_stk > ( select tot_req_qty from tb_SA_output where sno=@var_mrec_from_sno) and (@var_mrec_proc_ind=0))  
 begin  
 update tb_SA_output set tot_alloc_qty=tot_req_qty,ind01=1 where sno=@var_mrec_from_sno  
 set @balc_stk=@balc_stk-(select tot_req_qty from tb_SA_output where sno=@var_mrec_from_sno)  
 set @var_mrec_proc_ind=1  
 end  
  
 if (@balc_stk = ( select tot_req_qty from tb_SA_output where sno=@var_mrec_from_sno) and (@var_mrec_proc_ind=0))  
 begin  
 update tb_SA_output set tot_alloc_qty=tot_req_qty,ind01=1 where sno=@var_mrec_from_sno  
 set @balc_stk=0  
 set @var_mrec_balc_out_ind=1  
 set @var_mrec_proc_ind=1  
 end  
  
 if  (@balc_stk < ( select tot_req_qty from tb_SA_output where sno=@var_mrec_from_sno) and (@var_mrec_proc_ind=0))  
 begin  
 update tb_SA_output set tot_alloc_qty=tot_req_qty-@balc_stk,ind01=1 where sno=@var_mrec_from_sno  
 set @balc_stk=0  
 set @var_mrec_balc_out_ind=1  
 set @var_mrec_proc_ind=1  
 end  
  
 end  
  
 /*SKUID with salerate_priority*/  
 if @var_mrec_from_sno_cnt > 1  
 begin  
 print 'S_M Alloc'  
 set  @balc_stk_o= @balc_stk  
 exec sp_SA_stg01 @var_mrec_skuid,@balc_stk,@var_mrec_from_sno_cnt,@balc_stk_o output  
 set @balc_stk=@balc_stk_o  
  
 if @balc_stk < 1   
 begin  
 set  @var_mrec_balc_out_ind=1  
 end  
 end  
  
 if @var_mrec_balc_out_ind=1  
 begin   
 set @var_mrec_from_sno_cnt=@var_mrec_ind_skuid_cnt  
 end  
  
 set @var_mrec_ind_skuid_cnt=@var_mrec_ind_skuid_cnt-@var_mrec_from_sno_cnt  
  
 if @var_mrec_ind_skuid_cnt=0  
 begin  
 Print 'MAIN END'  
 print @var_mrec_skuid  
 print @balc_stk  
 update tb_SA_stkat_altorigin  set balc_stk=@balc_stk where skuid=@var_mrec_skuid  
 end  
  
 end  
 /*END - Allocation process for indv SKUID*/  
update #singleskuid set ind01=1 where skuid=@var_mrec_skuid  
  
set @var_mrec_skuid_cnt=@var_mrec_skuid_cnt-1  
end  
  
-- select * from tb_SA_output where skuid='1001'  
-- select * from tb_SA_output where skuid='1002'  
-- select * from tb_SA_output where skuid='1003'  
-- update tb_SA_output set alloc_35=NULL,alloc_50=NULL,alloc_75=NULL ,alloc_100=NULL, ind01=0  
--  select * from tb_SA_stkat_altorigin  
end  
GO
/****** Object:  StoredProcedure [dbo].[SP_Budget_Update]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_Budget_Update] as

Update sls
set buffersize= cast(b.custom_num1/12 as decimal(18,0)) --isnull(b.Bdgt,0)
,inventoryAtSite=cast(b.custom_num1/12 as decimal(18,0))  --isnull(sls.inventoryAtSite+b.Bdgt,0)------------
,custom_num2=sls.inventoryatsite+isnull(tin.ttlIn,0)-isnull(cns.ttlOut,0)
--select sls.stockLocationID,sls.buffersize,sls.locationskuname,sls.skuDescription,sls.custom_num1,sls.custom_num2,sls.inventoryAtSite,b.Bdgt,cns.ttlout,tin.TtlIn
from Symphony_stocklocationskus sls
join (Select stockLocationID,buffersize,locationskuname,skuDescription,custom_num1,inventoryAtSite
      ,cast((custom_num1/12)*(
		 	Case when month(getdate())= 1 then 10
				 when month(getdate())= 2 then 11
				 when month(getdate())= 3 then 12
				 when month(getdate())= 4 then 1
				 when month(getdate())= 5 then 2
				 when month(getdate())= 6 then 3
				 when month(getdate())= 7 then 4
				 when month(getdate())= 8 then 5
				 when month(getdate())= 9 then 6
				 when month(getdate())= 10 then 7
				 when month(getdate())= 11 then 8
				 when month(getdate())= 12 then 9
			end) as decimal(18,0)) Bdgt
		    ,custom_num2 BgtGap
	  from Symphony_StockLocationSkus
	  where stocklocationid=4783) b on b.stocklocationid=sls.stockLocationID and b.locationSkuName=sls.locationSkuName
left join (Select sl.stockLocationName SL,sk.skuname Sku,sum(quantity) TtlOut,sender,t.Skuid
			from Symphony_transactions t
			join Symphony_skus sk on sk.skuid=t.skuID
			join Symphony_StockLocations sl on sl.stockLocationID=t.sender
			where sender=4783 and transactiontype=0
			group by sl.stockLocationName,sk.skuName,sender,t.skuID) cns on cns.sender=sls.stocklocationid and cns.skuid=sls.skuid 
left join (Select sl.stockLocationName SL,sk.skuname Sku,sum(quantity) TtlIn,receiver,t.Skuid
			from Symphony_transactions t
			join Symphony_skus sk on sk.skuid=t.skuID
			join Symphony_StockLocations sl on sl.stockLocationID=t.receiver
			where receiver=4783 and transactiontype=1
			group by sl.stockLocationName,sk.skuName,t.receiver,t.skuID) tin on tin.Receiver=sls.stocklocationid and tin.skuid=sls.skuid
where sls.stocklocationid=4783

--Select locationskuname,inventoryAtSite,bufferSize from Symphony_stocklocationskus where stocklocationid=4783
/*
Select sl.stockLocationName SL,sk.skuname Sku,sum(quantity) QtyConsumed,max(inventoryAtSite) InvSite
from Symphony_transactions t
join Symphony_skus sk on sk.skuid=t.skuID
join Symphony_StockLocations sl on sl.stockLocationID=t.sender
join Symphony_stocklocationskus sls on sls.stocklocationid=t.sender and t.skuid=sls.skuid
where sender=4783 and transactiontype=0
group by sl.stockLocationName,sk.skuName


Select sl.stockLocationName SL,sk.skuname Sku,sum(quantity) QtyReversed,max(inventoryAtSite) InvSite
from Symphony_transactions t
join Symphony_skus sk on sk.skuid=t.skuID
join Symphony_StockLocations sl on sl.stockLocationID=t.receiver
join Symphony_stocklocationskus sls on sls.stocklocationid=t.receiver and t.skuid=sls.skuid
where receiver=4783 and transactiontype=1
group by sl.stockLocationName,sk.skuName

Select transactionidentity,sl.stockLocationName SL,sk.skuname Sku,(quantity) QtyConsumed,(inventoryAtSite) InvSite,convert(date,reporteddate) Dt
from Symphony_transactions t
join Symphony_skus sk on sk.skuid=t.skuID
join Symphony_StockLocations sl on sl.stockLocationID=t.sender
join Symphony_stocklocationskus sls on sls.stocklocationid=t.sender and t.skuid=sls.skuid
where sender=4783 and transactiontype=0
order by Sku,Dt

--old 4482

select * from Symphony_stocklocations order by stocklocationid desc  -- 4783


*/

GO
/****** Object:  StoredProcedure [dbo].[SP_Budget_Update_Dly]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE Procedure [dbo].[SP_Budget_Update_Dly] as

Update sls
 set custom_num2=isnull(b.bdgt+isnull(tin.ttlIn,0)-isnull(cns.ttlOut,0),0)
,inventoryatsite=isnull(b.bdgt+isnull(tin.ttlIn,0)-isnull(cns.ttlOut,0),0)
,buffersize=b.bdgt      --isnull(cast(sls.custom_num1*5/12 as decimal(18,0)),0)
--select sls.stockLocationID,sls.buffersize,sls.locationskuname,sls.skuDescription,isnull(sls.custom_num1,0) AnualBud,sls.custom_num2 ShortExcess
--,sls.inventoryAtSite,cns.ttlout,tin.TtlIn
--,isnull(b.Bdgt+ isnull(tin.ttlIn,0)-isnull(cns.ttlOut,0),0) NewInvSite
--,b.Bdgt CurrentBudget
from Symphony_stocklocationskus sls
join (Select stockLocationID,buffersize,locationskuname,skuDescription,custom_num1,inventoryAtSite
      ,cast((isnull(custom_num1,0)/12)*(
		 	Case when month(getdate())= 1 then 10
				 when month(getdate())= 2 then 11
				 when month(getdate())= 3 then 12
				 when month(getdate())= 4 then 1
				 when month(getdate())= 5 then 2
				 when month(getdate())= 6 then 3
				 when month(getdate())= 7 then 4
				 when month(getdate())= 8 then 5
				 when month(getdate())= 9 then 6
				 when month(getdate())= 10 then 7
				 when month(getdate())= 11 then 8
				 when month(getdate())= 12 then 9
			end) as decimal(18,0)) Bdgt
		    ,custom_num2 ExcessShort
	  from Symphony_StockLocationSkus
	  where stocklocationid=4783) b on b.stocklocationid=sls.stockLocationID and b.locationSkuName=sls.locationSkuName
left join (Select sl.stockLocationName SL,sk.skuname Sku,sum(quantity) TtlOut,sender,t.Skuid
			from Symphony_transactions t
			join Symphony_skus sk on sk.skuid=t.skuID
			join Symphony_StockLocations sl on sl.stockLocationID=t.sender
			where sender=4783 and transactiontype=0
			group by sl.stockLocationName,sk.skuName,sender,t.skuID) cns on cns.sender=sls.stocklocationid and cns.skuid=sls.skuid 
left join (Select sl.stockLocationName SL,sk.skuname Sku,sum(quantity) TtlIn,receiver,t.Skuid
			from Symphony_transactions t
			join Symphony_skus sk on sk.skuid=t.skuID
			join Symphony_StockLocations sl on sl.stockLocationID=t.receiver
			where receiver=4783 and transactiontype=1
			group by sl.stockLocationName,sk.skuName,t.receiver,t.skuID) tin on tin.Receiver=sls.stocklocationid and tin.skuid=sls.skuid
where sls.stocklocationid=4783
GO
/****** Object:  StoredProcedure [dbo].[SP_Budget_Update_Monthwise]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
create Procedure [dbo].[SP_Budget_Update_Monthwise] as
begin
CREATE TABLE #TempSubProduct(row_count bigint, ID1 int , splitMonth varchar(50),Distributor_sku varchar(50),count int ,skuId varchar(50),Annual_Bdgt  BIGINT,Current_Bdgt  BIGINT)
DECLARE @RowCnt BIGINT
DECLARE @PID INT
DECLARE @Name VARCHAR(100)
DECLARE @Separator VARCHAR(1)= '-'
DECLARE @SKUId VARCHAR(100)
DECLARE @Annual_Bdgt BIGINT
DECLARE @Current_Bdgt BIGINT
DECLARE @count VARCHAR(100)
DECLARE Split_Product CURSOR LOCAL FAST_FORWARD FOR 
        SELECT id,id,custom_txt4,custom_txt4,id,skuID,custom_num1,custom_num2
        FROM Symphony_StockLocationSkus 
		WHERE stockLocationID=4783 and custom_txt4 != 'All' and skuID = 180754
 OPEN Split_Product
 
FETCH NEXT FROM Split_Product 
INTO @RowCnt, @PID, @Name,@Name,@count,@SKUId,@Annual_Bdgt,@Current_Bdgt
 set @RowCnt =0
WHILE @@FETCH_STATUS = 0
BEGIN
set @count = (SELECT (LEN(@Name)- LEN(REPLACE(@Name ,@Separator,''))))+1
set  @RowCnt = @RowCnt+1
INSERT INTO #TempSubProduct
        SELECT  @RowCnt,@PID,SPL.value,@Name,@count ,@SKUId,@Annual_Bdgt,@Current_Bdgt
        FROM string_split(@Name,@Separator) AS SPL
	
        FETCH NEXT FROM Split_Product 
        INTO @RowCnt,@PID, @Name,@Name,@count,@SKUId,@Annual_Bdgt,@Current_Bdgt
		END 
		
--SELECT * FROM #TempSubProduct 		
--SELECT * FROM newTempTable1 where  skuID = 180754
--SELECT * FROM newTempTable2 where skuID = 180754

select* into newTempTable2 from (select ID1,splitMonth,
Case when  splitMonth= 1 then 10
				 when splitMonth= 2 then 11
				 when splitMonth= 3 then 12
				 when splitMonth= 4 then 1
				 when splitMonth= 5 then 2
				 when splitMonth= 6 then 3
				 when splitMonth= 7 then 4
				 when splitMonth= 8 then 5
				 when splitMonth= 9 then 6
				 when splitMonth= 10 then 7
				 when splitMonth= 11 then 8
				 when splitMonth= 12 then 9
			end  as Fin_month ,[count], skuId,Annual_Bdgt, Current_Bdgt from #TempSubProduct)tt

select* into newTempTable1 from (select ROW_NUMBER() over(partition by id1 order by id1,Fin_month) 'RowNo', ID1, splitMonth,[count], skuId,Annual_Bdgt, Current_Bdgt from newTempTable2) t

update  newTempTable1  set  Current_Bdgt = Annual_Bdgt/count*rowno

Update sls
 set custom_num2=isnull(b.bdgt+isnull(tin.ttlIn,0)-isnull(cns.ttlOut,0),0)
,inventoryatsite=isnull(b.bdgt+isnull(tin.ttlIn,0)-isnull(cns.ttlOut,0),0)
,buffersize=b.bdgt     
--select sls.stockLocationID,sls.buffersize,sls.locationskuname,sls.skuDescription,isnull(sls.custom_num1,0) AnualBud,sls.custom_num2 ShortExcess
--,sls.inventoryAtSite,cns.ttlout,tin.TtlIn
--,isnull(b.Bdgt+ isnull(tin.ttlIn,0)-isnull(cns.ttlOut,0),0) NewInvSite
--,b.Bdgt CurrentBudget
from Symphony_stocklocationskus sls
join (Select s1.stockLocationID,s1.buffersize,s1.locationskuname,s1.skuDescription,s1.custom_num1,s1.inventoryAtSite, t.current_bdgt  Bdgt ,s1.custom_num2 ExcessShort
	  from Symphony_StockLocationSkus s1 inner join newTempTable1 t 	on s1.skuID = t.skuId  where s1.stocklocationid=4783 and t.splitMonth =01) b on b.stocklocationid=sls.stockLocationID and b.locationSkuName=sls.locationSkuName

left join (Select sl.stockLocationName SL,sk.skuname Sku,sum(quantity) TtlOut,sender,t.Skuid
			from Symphony_transactions t
			join Symphony_skus sk on sk.skuid=t.skuID
			join Symphony_StockLocations sl on sl.stockLocationID=t.sender
			where sender=4783 and transactiontype=0 and sk.skuID = 180754
			group by sl.stockLocationName,sk.skuName,sender,t.skuID) cns on cns.sender=sls.stocklocationid and cns.skuid=sls.skuid 
left join (Select sl.stockLocationName SL,sk.skuname Sku,sum(quantity) TtlIn,receiver,t.Skuid
			from Symphony_transactions t
			join Symphony_skus sk on sk.skuid=t.skuID
			join Symphony_StockLocations sl on sl.stockLocationID=t.receiver
			where receiver=4783 and transactiontype=1 and sk.skuID = 180754
			group by sl.stockLocationName,sk.skuName,t.receiver,t.skuID) tin on tin.Receiver=sls.stocklocationid and tin.skuid=sls.skuid 
where sls.stocklocationid=4783 and sls.skuID = 180754

DROP TABLE #TempSubProduct
DROP TABLE newTempTable1
DROP TABLE newTempTable2
END
GO
/****** Object:  StoredProcedure [dbo].[SP_CountBlack_Auto_mths]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

Create Procedure [dbo].[SP_CountBlack_Auto_mths] as

-- create TABLE  Amonths (
--   [month] char(4)
--  ,[monthname] char(5)
--)
Truncate table Amonths

declare @startdate [DATETIME] = cast(DATEADD(yy, DATEDIFF(yy,'',getdate()), '') as Date)  
declare @Enddate [DATETIME] = cast(DATEADD(d, -1, DATEADD(m, DATEDIFF(m, 0, GETDATE()) + 1, 0)) as date)
--BEGIN

  DECLARE @MonthDiff         INT;
  DECLARE @counter           INT;
  DECLARE @tbl               TABLE ([month] DATETIME);

  SET @counter      = 0

  SELECT @MonthDiff = DATEDIFF(mm, @StartDate, @EndDate);

  WHILE @counter <= @MonthDiff
	BEGIN
		INSERT Amonths---@months 
		SELECT REPLACE((cast(datepart(MONTH,DATEADD(mm, @counter, @StartDate)) as CHAR(2))) +  cast(RIGHT(datepart(YY,DATEADD(mm, @counter, @StartDate)),2) as char(2)),' ',''),cast(left(DATENAME(Month,DATEADD(mm, @counter, @StartDate)),3) + RIGHT(datepart(YY,DATEADD(mm, @counter, @StartDate)),2) as CHAR(5))
		SET @counter = @counter + 1;
	END


--END

--Select * from Amonths

declare @date1 [DATETIME] = cast(DATEADD(yy, DATEDIFF(yy,'',getdate()), '') as Date)  
declare @date2 [DATETIME] = cast(DATEADD(d, -1, DATEADD(m, DATEDIFF(m, 0, GETDATE()) + 1, 0)) as date) 

---Declare @itemnumber [int] = 1 -- Here you should choose the item number (according to the Property Guide Table)
--Declare @PropertyIdnumber [int] = 1  --Here you need to change the number of the property id (1 to 7)

DECLARE @DATES TABLE (
	[id] [int] IDENTITY(1,1)
	,[MONTH] [INT]
	,[monthname] char(5)
)


INSERT INTO @DATES
SELECT * from Amonths


Create  TABLE BaseTable (
	[skuID] [int]
	,[stockLocationID] [int]
	,[month] [char](10)
	,[count] [int]
	)
	
INSERT INTO BaseTable
SELECT 
	 [skuID]
	,[stockLocationID]
	,REPLACE(cast(DATEPART(MONTH,[updateDate]) as CHAR(2)) + CAST(right(datepart(YY,[updateDate]),2) as CHAR(5)),' ','') [Month]
---	,sum(case when bpsite>=1 then 1 else 0 end)
	,sum(case when bufferSize>0 and InventoryAtSite=0 then 1 else 0 end)
	FROM [dbo].[Symphony_StockLocationSkuHistory]
	WHERE CAST(REPLACE(cast(DATEPART(MONTH,[updateDate]) as CHAR(2)) + CAST(right(datepart(YY,[updateDate]),2) as CHAR(5)),' ','') as int) IN (SELECT MONTH FROM @DATES)
	group by skuID,stockLocationID,(REPLACE(cast(DATEPART(MONTH,[updateDate]) as CHAR(2)) + CAST(right(datepart(YY,[updateDate]),2) as CHAR(5)),' ',''))
	having sum(case when bufferSize>0 and InventoryAtSite=0 then 1 else 0 end)>0

--Select * from Basetable

create TABLE idTable (
	[id] [int] IDENTITY(1,1)
	,[skuID] [int] 
	,[stockLocationID] [int]
	,skuName [nvarchar](100)
	,stockLocationName [nvarchar](100)
	,skuDescription [nvarchar](MAX)
	)
	
INSERT INTO idTable
SELECT DISTINCT
	 BT.[skuID]
	,BT.[stockLocationID]
	,SKU.[skuName]
	,SL.[stockLocationName]
	,SLS.[skuDescription] 

FROM(
	SELECT DISTINCT 
		 [skuID]
		,[stockLocationID] 
	FROM BaseTable) BT
INNER JOIN [Symphony_StockLocationSkus] SLS
	ON SLS.skuID = BT.skuID
	AND SLS.stockLocationID = BT.stockLocationID
INNER JOIN [Symphony_SKUs] SKU
	ON SKU.skuID = BT.skuID
INNER JOIN [Symphony_StockLocations] SL
	ON SL.stockLocationID = BT.stockLocationID

create  TABLE tableForPivot (
	[id] [int]
	,[month] [int]
	,[count] [int]
	)
	
INSERT INTO tableForPivot
SELECT 
	IDT.[id]
	,BT.[month]
	,BT.[count]
FROM idTable IDT
INNER JOIN BaseTable BT
ON BT.[skuID]=IDT.[skuID]
AND BT.[stockLocationID] = IDT.[stockLocationID]

declare @cmd varchar(max)
set @cmd ='SELECT 
	IDT.stockLocationName [Stock Location Name]
	,IDT.skuName [SKU Name]
	,IDT.skuDescription [SKU Description]'
	
declare @i as int
declare @n as int
declare @monthname as char(5)
declare @monthnumber as varchar(4)
set @i = 1
set @n = (select COUNT(1) from @DATES)  


while (@i<=@n) 
	BEGIN	
		set @monthname=(select monthname from @DATES as D where @i=d.id)
		set @cmd = @cmd + ',(case when pvt.'+@monthname+'=0 then null else pvt.'+@monthname+' end) as '+@monthname+''	
		set @i=@i+1

	END


set @cmd = @cmd + ' FROM idTable IDT INNER JOIN (SELECT [id]'

set @i = 1
while (@i<=@n) 
	BEGIN	
		set @monthname=(select monthname from @DATES as D where @i=d.id)
		set @monthnumber=cast(replace((select MONTH from @DATES as D where @i=d.id),' ','') as varchar)
		set @cmd = @cmd + ',['+@monthnumber+']['+@monthname+']'	
		set @i=@i+1
	END

set @cmd = @cmd + 'FROM (SELECT [id],[count], [month] FROM tableForPivot) [SRC] PIVOT( SUM([count]) FOR [month] IN ('

set @i = 1
while (@i<@n) 
	BEGIN	
		set @monthnumber=cast(replace((select MONTH from @DATES as D where @i=d.id),' ','') as varchar)
		set @cmd = @cmd + '['+@monthnumber+'],'	
		set @i=@i+1
	END
	
set @monthnumber=cast(replace((select MONTH from @DATES as D where @i=d.id),' ','') as varchar)
set @cmd = @cmd + '['+@monthnumber+'])) [RESULTS]) [PVT] ON PVT.id = IDT.id '
 
execute(@CMD) 


drop table idTable,BaseTable,tableForPivot
GO
/****** Object:  StoredProcedure [dbo].[SP_CountCyan_Auto_mths]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[SP_CountCyan_Auto_mths] as

-- create TABLE  CAmonths (
--   [month] char(4)
--  ,[monthname] char(5)
--)
Truncate table CAmonths

declare @startdate [DATETIME] = cast(DATEADD(yy, DATEDIFF(yy,'',getdate()), '') as Date)  
declare @Enddate [DATETIME] = cast(DATEADD(d, -1, DATEADD(m, DATEDIFF(m, 0, GETDATE()) + 1, 0)) as date)
--BEGIN

  DECLARE @MonthDiff         INT;
  DECLARE @counter           INT;
  DECLARE @tbl               TABLE ([month] DATETIME);

  SET @counter      = 0

  SELECT @MonthDiff = DATEDIFF(mm, @StartDate, @EndDate);

  WHILE @counter <= @MonthDiff
	BEGIN
		INSERT CAmonths---@months 
		SELECT REPLACE((cast(datepart(MONTH,DATEADD(mm, @counter, @StartDate)) as CHAR(2))) +  cast(RIGHT(datepart(YY,DATEADD(mm, @counter, @StartDate)),2) as char(2)),' ',''),cast(left(DATENAME(Month,DATEADD(mm, @counter, @StartDate)),3) + RIGHT(datepart(YY,DATEADD(mm, @counter, @StartDate)),2) as CHAR(5))
		SET @counter = @counter + 1;
	END


--END

--Select * from CAmonths

declare @date1 [DATETIME] = cast(DATEADD(yy, DATEDIFF(yy,'',getdate()), '') as Date)  
declare @date2 [DATETIME] = cast(DATEADD(d, -1, DATEADD(m, DATEDIFF(m, 0, GETDATE()) + 1, 0)) as date) 

---Declare @itemnumber [int] = 1 -- Here you should choose the item number (according to the Property Guide Table)
--Declare @PropertyIdnumber [int] = 1  --Here you need to change the number of the property id (1 to 7)

DECLARE @DATES TABLE (
	[id] [int] IDENTITY(1,1)
	,[MONTH] [INT]
	,[monthname] char(5)
)


INSERT INTO @DATES
SELECT * from CAmonths


Create  TABLE BaseTable (
	[skuID] [int]
	,[stockLocationID] [int]
	,[month] [char](10)
	,[count] [int]
	)
	
INSERT INTO BaseTable
SELECT 
	 [skuID]
	,[stockLocationID]
	,REPLACE(cast(DATEPART(MONTH,[updateDate]) as CHAR(2)) + CAST(right(datepart(YY,[updateDate]),2) as CHAR(5)),' ','') [Month]
---	,sum(case when bpsite<0 then 1 else 0 end)
	,sum(case when bufferSize>0 and InventoryAtSite>bufferSize then 1 else 0 end)
	FROM [dbo].[Symphony_StockLocationSkuHistory]
	WHERE CAST(REPLACE(cast(DATEPART(MONTH,[updateDate]) as CHAR(2)) + CAST(right(datepart(YY,[updateDate]),2) as CHAR(5)),' ','') as int) IN (SELECT MONTH FROM @DATES) 
	group by skuID,stockLocationID,(REPLACE(cast(DATEPART(MONTH,[updateDate]) as CHAR(2)) + CAST(right(datepart(YY,[updateDate]),2) as CHAR(5)),' ',''))
	having sum(case when bpsite<0 then 1 else 0 end)>0

--Select * from Basetable

create TABLE idTable (
	[id] [int] IDENTITY(1,1)
	,[skuID] [int] 
	,[stockLocationID] [int]
	,skuName [nvarchar](100)
	,stockLocationName [nvarchar](100)
	,skuDescription [nvarchar](MAX)
	)
	
INSERT INTO idTable
SELECT DISTINCT
	 BT.[skuID]
	,BT.[stockLocationID]
	,SKU.[skuName]
	,SL.[stockLocationName]
	,SLS.[skuDescription] 

FROM(
	SELECT DISTINCT 
		 [skuID]
		,[stockLocationID] 
	FROM BaseTable) BT
INNER JOIN [Symphony_StockLocationSkus] SLS
	ON SLS.skuID = BT.skuID
	AND SLS.stockLocationID = BT.stockLocationID
INNER JOIN [Symphony_SKUs] SKU
	ON SKU.skuID = BT.skuID
INNER JOIN [Symphony_StockLocations] SL
	ON SL.stockLocationID = BT.stockLocationID

create  TABLE tableForPivot (
	[id] [int]
	,[month] [int]
	,[count] [int]
	)
	
INSERT INTO tableForPivot
SELECT 
	IDT.[id]
	,BT.[month]
	,BT.[count]
FROM idTable IDT
INNER JOIN BaseTable BT
ON BT.[skuID]=IDT.[skuID]
AND BT.[stockLocationID] = IDT.[stockLocationID]

declare @cmd varchar(max)
set @cmd ='SELECT 
	IDT.stockLocationName [Stock Location Name]
	,IDT.skuName [SKU Name]
	,IDT.skuDescription [SKU Description]'
	
declare @i as int
declare @n as int
declare @monthname as char(5)
declare @monthnumber as varchar(4)
set @i = 1
set @n = (select COUNT(1) from @DATES)  


while (@i<=@n) 
	BEGIN	
		set @monthname=(select monthname from @DATES as D where @i=d.id)
		set @cmd = @cmd + ',(case when pvt.'+@monthname+'=0 then null else pvt.'+@monthname+' end) as '+@monthname+''	
		set @i=@i+1

	END


set @cmd = @cmd + ' FROM idTable IDT INNER JOIN (SELECT [id]'

set @i = 1
while (@i<=@n) 
	BEGIN	
		set @monthname=(select monthname from @DATES as D where @i=d.id)
		set @monthnumber=cast(replace((select MONTH from @DATES as D where @i=d.id),' ','') as varchar)
		set @cmd = @cmd + ',['+@monthnumber+']['+@monthname+']'	
		set @i=@i+1
	END

set @cmd = @cmd + 'FROM (SELECT [id],[count], [month] FROM tableForPivot) [SRC] PIVOT( SUM([count]) FOR [month] IN ('

set @i = 1
while (@i<@n) 
	BEGIN	
		set @monthnumber=cast(replace((select MONTH from @DATES as D where @i=d.id),' ','') as varchar)
		set @cmd = @cmd + '['+@monthnumber+'],'	
		set @i=@i+1
	END
	
set @monthnumber=cast(replace((select MONTH from @DATES as D where @i=d.id),' ','') as varchar)
set @cmd = @cmd + '['+@monthnumber+'])) [RESULTS]) [PVT] ON PVT.id = IDT.id '
 
execute(@CMD) 


drop table idTable,BaseTable,tableForPivot
GO
/****** Object:  StoredProcedure [dbo].[SP_CRS_Repl_recommend_for_JBD_SW_CWH_]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE PROCEDURE [dbo].[SP_CRS_Repl_recommend_for_JBD_SW_CWH_]
	-- Add the parameters for the stored procedure here
	
AS
BEGIN
		SET NOCOUNT ON;

    -- Insert statements for procedure here
SELECT  
	sl.stockLocationName as 'Store'
	,sl.stockLocationDescription as 'Store Description' 
	,sls.locationSkuName as 'SKU' 
	,sls.custom_txt8 as 'Parent Code'  
	,sls.skuDescription as 'SKU Description' 
	,sls.custom_txt3 'Business'  
	,spi.skuItemName 'Division'  
	,spi1.skuItemName 'Design' 
	,spi5.skuItemName as 'HBT Store'   
	,sls.custom_txt10 as 'HBT ational'  
	,sl1.stockLocationName as 'Origin WH'  
	,sl1.stockLocationDescription as 'Origin WH Description'
	,sls.bufferSize 'Buffer Size' 
	,sls.inventoryAtSite as 'Site Qty'  
	,sls.inventoryAtTransit as 'Transit Qty'  
	,1-bpProduction as 'BP%'  
	,case when productionColor=0 then 'Cyan'when productionColor=1 then 'Green' when productionColor=2 then 'yellow'   when productionColor=3 then 'Red'      when productionColor=4 then 'Black' end 'BP Color'  
	,sls.inventoryNeeded as 'WH Inventory Needed'  
	,sls.replenishmentQuantity as 'WH Replenishment Qty'   
	,isnull(a.inveneed,0) as 'Depot Inventory Needed'
	, isnull(b.veninveneed,0) as 'Customer Inventory Needed'
	,isnull(((sls.bufferSize+isnull(a.inveneed,0)+sls.saftyStock+isnull(b.veninveneed,0))-(sls.inventoryAtSite+sls.inventoryAtTransit+sls.inventoryAtProduction)),0) as 'Total Gap'
	FROM [SYMPHONY_HRJ].[dbo].[Symphony_StockLocationSkus] sls   
	join Symphony_StockLocations sl on sls.stockLocationID=sl.stockLocationID      
	join Symphony_StockLocations sl1 on sls.originStockLocation=sl1.stockLocationID      
	left join Symphony_SKUsPropertyItems spi on spi.skuItemID=sls.skuPropertyID1      
	left join Symphony_SKUsPropertyItems spi1 on spi1.skuItemID=sls.skuPropertyID6     
	left join Symphony_SKUsPropertyItems spi5 on spi5.skuItemID=sls.skuPropertyID5
	left join  (SELECT sl1.stockLocationName as [Stock Location]  ,slss.locationSkuName     ,
	sum(case when slss.inventoryNeeded>=slss.minimumReplenishment and sl.stockLocationType<>3 then slss.inventoryNeeded else 0 end) as inveneed        
	FROM [SYMPHONY_HRJ].[dbo].[Symphony_StockLocationSkus] slss      
	join Symphony_StockLocations sl on slss.stockLocationID=sl.stockLocationID     
	join Symphony_StockLocations sl1 on slss.originStockLocation=sl1.stockLocationID    
	join Symphony_SKUs ss on slss.skuid=ss.skuID    
	where sl.stockLocationName not in('7550','7590','7680') and  slss.avoidReplenishment=0 and slss.bufferSize>0
	group by sl1.stockLocationName,slss.locationSkuName
	)a on a.[Stock Location]=sl.stockLocationName and a.locationSkuName=sls.locationSkuName
	left join  (SELECT sl1.stockLocationName as [Stock Location]  ,slss.locationSkuName     ,
	sum(case when slss.inventoryNeeded>=slss.minimumReplenishment and sl.stockLocationType=3 then slss.inventoryNeeded else 0 end) as veninveneed        
	FROM [SYMPHONY_HRJ].[dbo].[Symphony_StockLocationSkus] slss      
	join Symphony_StockLocations sl on slss.stockLocationID=sl.stockLocationID     
	join Symphony_StockLocations sl1 on slss.originStockLocation=sl1.stockLocationID    
	join Symphony_SKUs ss on slss.skuid=ss.skuID    
	where sl.stockLocationName not in('7550','7590','7680') and  slss.avoidReplenishment=0 and slss.bufferSize>0
	group by sl1.stockLocationName,slss.locationSkuName
	)b on b.[Stock Location]=sl.stockLocationName and b.locationSkuName=sls.locationSkuName  
	
	where 
	(isnull(sls.inventoryNeeded,0)>0 or ((isnull(sls.bufferSize,0)+isnull(a.inveneed,0)+isnull(sls.saftyStock,0)+isnull(b.veninveneed,0))-(isnull(sls.inventoryAtSite,0)+isnull(sls.inventoryAtTransit,0)+isnull(sls.inventoryAtProduction,0))>0)) and 
	isnull(sls.bufferSize,0)>0 and sls.custom_txt3 like 'JBD%'  and SLS.isDeleted = 0 
	and sl.stockLocationType=5 
	and sl.isDeleted=0  
	and sls.avoidReplenishment=0 
	and sl.stockLocationName in('7550' ,'7590','7680') 
END
GO
/****** Object:  StoredProcedure [dbo].[sp_EquivSKUCombineTransactions]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_EquivSKUCombineTransactions] 
AS
BEGIN


IF (OBJECT_ID('Client_DAILY_TRANSACTIONS_TEMP_HRJ') IS NOT NULL)
drop table Client_DAILY_TRANSACTIONS_TEMP_HRJ;

create table Client_DAILY_TRANSACTIONS_TEMP_HRJ

(TransID nvarchar(200),
SAP_validation nvarchar(100),
TransType nvarchar(100),
Origin nvarchar(100),
Destination nvarchar(200),
SKUname nvarchar(200),
Quantity nvarchar(100),
Year nvarchar(10),
Month nvarchar(10),
Day nvarchar(10),
Doc_date nvarchar(100),
Doc_ref nvarchar(100),
movement nvarchar(100),
adjust nvarchar(100),

)
/*
-----temporary addition jun'23----

bulk insert Client_DAILY_TRANSACTIONS_TEMP_HRJ
from 'E:\SymphonyData\InputFolder\TRANSACTIONS_2023_06_23.csv' --file name to be changed
WITH ( 
                   FIELDTERMINATOR = ',', 
                   ROWTERMINATOR = '\n', 
                   FIRSTROW = 2 

)


bulk insert Client_DAILY_TRANSACTIONS_TEMP_HRJ
from 'E:\SymphonyData\InputFolder\TRANSACTIONS_RM_2023_06_23.csv' --file name to be changed
WITH ( 
                   FIELDTERMINATOR = ',', 
                   ROWTERMINATOR = '\n', 
                   FIRSTROW = 2 

)


-----temporary addition jun'23----
--remove start
*/


IF (OBJECT_ID('allfilenames') IS NOT NULL)
drop table allfilenames;

IF (OBJECT_ID('bulkact') IS NOT NULL)
drop table bulkact;

CREATE TABLE ALLFILENAMES(WHICHPATH VARCHAR(255),WHICHFILE varchar(255))
CREATE TABLE BULKACT(RAWDATA VARCHAR (8000))
declare @filename varchar(255),
        @path     varchar(255),
        @sql      varchar(8000),
        @cmd      varchar(1000)



SET @path = 'E:\SymphonyData\InputFolder\'
SET @cmd = 'dir "' + @path + '" *.csv /b'
INSERT INTO  ALLFILENAMES(WHICHFILE)
EXEC Master..xp_cmdShell @cmd
UPDATE ALLFILENAMES SET WHICHPATH = @path where WHICHPATH is null

--cursor loop
    declare c1 cursor for SELECT WHICHPATH,WHICHFILE FROM ALLFILENAMES where WHICHFILE like 'TRANSACTIONS_%.csv%'
    open c1
    fetch next from c1 into @path,@filename
    While @@fetch_status <> -1
      begin
      --bulk insert won't take a variable name, so make a sql and execute it instead:
       set @sql = 'BULK INSERT Client_DAILY_TRANSACTIONS_TEMP_HRJ FROM ''' + @path + @filename + ''' '
           + '     WITH ( 
                   FIELDTERMINATOR = '','', 
                   ROWTERMINATOR = ''\n'', 
                   FIRSTROW = 2 
                ) '
    print @sql
    exec (@sql)

      fetch next from c1 into @path,@filename
      end
    close c1
    deallocate c1
    


	-- select * from Client_daily_TRANSACTIONS_TEMP_hrj
	-- select * from Client_Parent_child_daily_tran

	drop table Client_Parent_child_daily_tran

create table Client_Parent_child_daily_tran
(Parent nvarchar(100),
Child nvarchar(100),
Priority int,
)

BULK INSERT Client_Parent_child_daily_tran
FROM 'E:\SymphonyData\Parent_Child_Scripts\Inputfile\Parent_child.csv'
WITH
(
FIRSTROW = 2, --ignores first row (header row)
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)



update ctt set ctt.skuname=ces.Parent
	from Client_daily_TRANSACTIONS_TEMP_hrj ctt
	join Client_Parent_child_daily_tran ces on ces.child = CTT.SKUName



drop table Client_daily_TRANSACTIONS_TEMP_hrj_1
select * into Client_daily_TRANSACTIONS_TEMP_hrj_1 from (
select TransID,SAP_validation,TransType,Origin,Destination,SKUname,Quantity,Year,Month,Day,Doc_date,
isnull(doc_ref,'') as Doc_Ref,movement,isnull(adjust,'') as Adjust  from Client_daily_TRANSACTIONS_TEMP_hrj)#efc



	
Declare @cmd2 varchar(1000)
set @cmd2 = 'sqlcmd -S "HRJPOWERBI" -d "SYMPHONY_HRJ"  -Q "set nocount on; select * from Client_daily_TRANSACTIONS_TEMP_hrj_1;" -o "E:\SymphonyData\InputFolder\Transactions_Znew%date:~-4,4%%date:~-10,2%%date:~-7,2%.csv" -s"," -W '
exec master.dbo.xp_cmdshell @cmd2



END
GO
/****** Object:  StoredProcedure [dbo].[sp_EquivSKUCombineTransactions_RMC]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[sp_EquivSKUCombineTransactions_RMC] 
AS
BEGIN


IF (OBJECT_ID('Client_DAILY_TRANSACTIONS_TEMP_HRJ_RMC') IS NOT NULL)
drop table Client_DAILY_TRANSACTIONS_TEMP_HRJ_RMC;

create table Client_DAILY_TRANSACTIONS_TEMP_HRJ_RMC

(TransID nvarchar(200),
SAP_validation nvarchar(100),
TransType nvarchar(100),
Origin nvarchar(100),
Destination nvarchar(200),
SKUname nvarchar(200),
Quantity nvarchar(100),
Year nvarchar(10),
Month nvarchar(10),
Day nvarchar(10),
Doc_date nvarchar(100),
Doc_ref nvarchar(100),
movement nvarchar(100),
adjust nvarchar(100),

)

IF (OBJECT_ID('allfilenames') IS NOT NULL)
drop table allfilenames;

IF (OBJECT_ID('bulkact') IS NOT NULL)
drop table bulkact;

CREATE TABLE ALLFILENAMES(WHICHPATH VARCHAR(255),WHICHFILE varchar(255))
CREATE TABLE BULKACT(RAWDATA VARCHAR (8000))
declare @filename varchar(255),
        @path     varchar(255),
        @sql      varchar(8000),
        @cmd      varchar(1000)



SET @path = 'E:\SymphonyData\InputFolder\'
SET @cmd = 'dir "' + @path + '" *.csv /b'
INSERT INTO  ALLFILENAMES(WHICHFILE)
EXEC Master..xp_cmdShell @cmd
UPDATE ALLFILENAMES SET WHICHPATH = @path where WHICHPATH is null

--cursor loop
    declare c1 cursor for SELECT WHICHPATH,WHICHFILE FROM ALLFILENAMES where WHICHFILE like 'TRANSACTIONS_RMC%.csv%'
    open c1
    fetch next from c1 into @path,@filename
    While @@fetch_status <> -1
      begin
      --bulk insert won't take a variable name, so make a sql and execute it instead:
       set @sql = 'BULK INSERT Client_DAILY_TRANSACTIONS_TEMP_HRJ_RMC FROM ''' + @path + @filename + ''' '
           + '     WITH ( 
                   FIELDTERMINATOR = '','', 
                   ROWTERMINATOR = ''\n'', 
                   FIRSTROW = 2 
                ) '
    print @sql
    exec (@sql)

      fetch next from c1 into @path,@filename
      end
    close c1
    deallocate c1
    
	-- select * from Client_daily_TRANSACTIONS_TEMP_hrj
	-- select * from Client_Parent_child_daily_tran

	drop table Client_Parent_child_daily_tran_RMC

create table Client_Parent_child_daily_tran_RMC
(Parent nvarchar(100),
Child nvarchar(100),
Priority int,
)

BULK INSERT Client_Parent_child_daily_tran_RMC
FROM 'E:\SymphonyData\Parent_Child_Scripts\Inputfile\Parent_child_RMC.csv'
WITH
(
FIRSTROW = 2, --ignores first row (header row)
FIELDTERMINATOR = ',',
ROWTERMINATOR = '\n'
)



update ctt set ctt.skuname=ces.Parent
	from Client_daily_TRANSACTIONS_TEMP_hrj_RMC ctt
	join Client_Parent_child_daily_tran_RMC ces on ces.child = CTT.SKUName



drop table Client_daily_TRANSACTIONS_TEMP_hrj_1_RMC
select * into Client_daily_TRANSACTIONS_TEMP_hrj_1_RMC from (
select TransID,SAP_validation,TransType,Origin,Destination,SKUname,Quantity,Year,Month,Day,Doc_date,
isnull(doc_ref,'') as Doc_Ref,movement,isnull(adjust,'') as Adjust  from Client_daily_TRANSACTIONS_TEMP_hrj_RMC)#efc



	
Declare @cmd2 varchar(1000)
set @cmd2 = 'sqlcmd -S "HRJPOWERBI" -d "SYMPHONY_HRJ"  -Q "set nocount on; select * from Client_daily_TRANSACTIONS_TEMP_hrj_1_RMC;" -o "E:\SymphonyData\InputFolder\TransactionsZ_RMC%date:~-4,4%%date:~-10,2%%date:~-7,2%.csv" -s"," -W '
exec master.dbo.xp_cmdshell @cmd2

--move "E:\SymphonyData\InputFolder\"Transactions_RMC*.* "E:\SymphonyData\InputFolder\Archive\"

END
GO
/****** Object:  StoredProcedure [dbo].[sp_hrj_dist_rep_02]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

--exec sp_hrj_dist_rep_02

CREATE proc [dbo].[sp_hrj_dist_rep_02]
as
begin
/*
create table tb_rpt_dist_buff_stk_eff
(
r2_id int identity(1,1)
,r2_dist_code nvarchar(50)
,r2_distname nvarchar(100)
,r2_distregn nvarchar(100)
,r2_city nvarchar(100)

,r2_sku_buff float
,r2_sku_buff_stk1 float
--,r2_sku_stk float
,r2_bfrsku_sold_dist float
,r2_buff_eff_perc_sku_sold_vs_buff_sku float
,r2_buff_eff_perc_sku_sold_vs_buff_sku_1 float
,r2_nosku_mapped_sold float
,r2_nosku_mapped_hav_stk1 float
,r2_Stk_eff_perc_sku_sold_vs_stk_sku float
,r2_sales_person nvarchar(100)
,ind01 int
)
*/

CREATE TABLE #Client_DIST_SALE_DATA_1    
(    
 [Distributor_code] [nvarchar] (100) NULL,    
 [Distributor_name]  [nvarchar] (200) NULL,    
 [Sold_party]  [nvarchar] (300) NULL,    
 [HRJ_SKU]  [nvarchar] (200) NULL,   
 [Distributor_Item_name]  [nvarchar] (300) NULL,    
 [Quantity] [float] NULL,    
 [Year]  [nvarchar] (100) NULL,    
 [Month]  [nvarchar] (100) NULL,    
 [Day]  [nvarchar] (100) NULL,    
 [gen_mm] [varchar](2) NULL,    
 [gen_dd] [varchar](2) NULL,    
 [gen_date] [datetime] NULL,
 [Clust_code]   [varchar](2)
) 




------------------------------
insert into #Client_DIST_SALE_DATA_1(Distributor_code,Distributor_name,Sold_party,HRJ_SKU,Distributor_Item_name,Quantity,Year,Month,Day)    
select * from Client_DIST_SALE_DATA  

update #Client_DIST_SALE_DATA_1 set gen_mm='0'+month where len(month)=1    
update #Client_DIST_SALE_DATA_1 set gen_mm=month where len(month)=2    
    
update #Client_DIST_SALE_DATA_1 set gen_dd='0'+day where len(day)=1    
update #Client_DIST_SALE_DATA_1 set gen_dd=day where len(day)=2    
    
update #Client_DIST_SALE_DATA_1 set gen_date=convert(datetime,(year+'-'+gen_mm+'-'+gen_dd))    
 
delete from #Client_DIST_SALE_DATA_1 where gen_date < getdate()-30 

 truncate table tb_rpt_dist_buff_stk_eff

insert into tb_rpt_dist_buff_stk_eff(r2_dist_code) select distinct Distributor_code from #Client_DIST_SALE_DATA_1 order by Distributor_code

update a set a.r2_distname=b.stockLocationDescription  from tb_rpt_dist_buff_stk_eff a , Symphony_StockLocations b
where a.r2_dist_code =b.stockLocationName

/*
select distinct a.stockLocationName,a.slPropertyID1,b.slItemName from Stocklocations  a
left join Symphony_StockLocationPropertyItems b 
on convert(varchar(10),a.slPropertyID1)=convert(varchar(10),b.slItemID) and b.slPropertyID='slPropertyID1'
*/

--select * from Symphony_StockLocations

update a set a.r2_city=b.slItemName from tb_rpt_dist_buff_stk_eff a , (select distinct a.stockLocationName,a.slPropertyID1,b.slItemName from Symphony_StockLocations  a
left join Symphony_StockLocationPropertyItems b 
on convert(varchar(10),a.slPropertyID1)=convert(varchar(10),b.slItemID) and b.slPropertyID='slPropertyID1') as b
where a.r2_dist_code=b.stockLocationName 

update a set a.r2_distregn=b.slItemName from tb_rpt_dist_buff_stk_eff a , (select distinct a.stockLocationName,a.slPropertyID2,b.slItemName from Symphony_StockLocations  a
left join Symphony_StockLocationPropertyItems b 
on convert(varchar(10),a.slPropertyID2)=convert(varchar(10),b.slItemID) and b.slPropertyID='slPropertyID2') as b
where a.r2_dist_code=b.stockLocationName 

  
--select * from Stocklocationlocationskus
--select * from Symphony_StockLocationSkus

update a set a.r2_sku_buff=b.skucount from  tb_rpt_dist_buff_stk_eff a,
(select a.stockLocationName,count(distinct b.skuID) as 'skucount'from Symphony_StockLocations a
join Symphony_StockLocationSkus b 
on a.stockLocationID=b.stockLocationID
where b.buffersize > 0
group by stockLocationName) as b
where a.r2_dist_code=b.stockLocationName

--update tb_rpt_dist_buff_stk_eff set r2_sku_buff_stk1=(
--select stockLocationID,count(distinct skuid) from Symphony_StockLocationSkus where bufferSize > 0 and skuid in 
--(
--select distinct skuid from Symphony_StockLocationSkuHistory
--where inventoryatsite > 0  and updatedate between convert(date,getdate()-200) and convert(date,getdate())
----where inventoryatsite > 0  and updatedate between convert(date,getdate()-30) and convert(date,getdate())
--) group by stockLocationID)


update a set a.r2_sku_buff_stk1=c.totalsku  from tb_rpt_dist_buff_stk_eff a,(select a.stockLocationName,b.totalsku from Symphony_StockLocations a
join 
(select stockLocationID,count(distinct skuid) as 'totalsku' from Symphony_StockLocationSkus where bufferSize > 0 and skuid in 
(
select distinct skuid from Symphony_StockLocationSkuHistory
--where inventoryatsite > 0  and updatedate between convert(date,getdate()-200) and convert(date,getdate())
where inventoryatsite > 0  and updatedate between convert(date,getdate()-30) and convert(date,getdate())
) group by stockLocationID) b
on a.stockLocationID=b.stockLocationID ) as c
where a.r2_dist_code=c.stockLocationName


/*
select * from Symphony_StockLocationSkus
select Distributor_code,count(distinct hrj_sku) as 'SKUCNT' from #Client_DIST_SALE_DATA_1 
where HRJ_SKU in  (select locationSkuName  from Symphony_StockLocationSkus where buffersize > 0)
group by Distributor_code
*/
update a set a.r2_bfrsku_sold_dist=b.SKUCNT
from tb_rpt_dist_buff_stk_eff a , (select Distributor_code,count(distinct hrj_sku) as 'SKUCNT' from #Client_DIST_SALE_DATA_1 
where HRJ_SKU in  (select locationSkuName  from Symphony_StockLocationSkus where buffersize > 0)
group by Distributor_code) as b
where a.r2_dist_code=b.Distributor_code

update tb_rpt_dist_buff_stk_eff set r2_buff_eff_perc_sku_sold_vs_buff_sku=round((isnull(r2_bfrsku_sold_dist,0)/r2_sku_buff),2) where r2_sku_buff is not null
update tb_rpt_dist_buff_stk_eff set r2_buff_eff_perc_sku_sold_vs_buff_sku_1=round((isnull(r2_bfrsku_sold_dist,0)/r2_sku_buff_stk1),2) where r2_sku_buff is not null

update a set a.r2_nosku_mapped_sold=b1.SKUCNT from  tb_rpt_dist_buff_stk_eff a, (select [Distributor_code], count(distinct [HRJ_SKU]) as 'SKUCNT' from #Client_DIST_SALE_DATA_1 group by [Distributor_code]) as b1
where a.r2_dist_code=b1.Distributor_code



update a set a.r2_nosku_mapped_sold=b2.SKUCNT from  tb_rpt_dist_buff_stk_eff a, (select [Distributor_code], count(distinct [HRJ_SKU]) as 'SKUCNT' from #Client_DIST_SALE_DATA_1 where  [hrj_sku] in ((
select distinct a1.skuname from Symphony_SKUs a1
left join   Symphony_StockLocationSkuHistory b3
on a1.skuID=b3.skuID
--where b3.inventoryatsite > 0 and b3.updatedate between convert(date,getdate()-200) and convert(date,getdate())
where b3.inventoryatsite > 0 and b3.updatedate between convert(date,getdate()-30) and convert(date,getdate())
))  group by [Distributor_code]) as b2
where a.r2_dist_code=b2.Distributor_code

update tb_rpt_dist_buff_stk_eff set r2_Stk_eff_perc_sku_sold_vs_stk_sku=(r2_nosku_mapped_sold/r2_nosku_mapped_hav_stk1) 
where (r2_nosku_mapped_hav_stk1 is not null or r2_nosku_mapped_hav_stk1 <> 0)


--select * from tb_rpt_dist_buff_stk_eff
select r2_dist_code as 'Distributor Code as per SAP',	r2_distname	as 'Distributor Name',r2_distregn as 'Distributor Region',	r2_city	as  'Distributor City',r2_sku_buff as 'Number of SKUs having buffer',
		r2_sku_buff_stk1 as 'Number of Buffer SKUs having stock (Available for at least 1 day in report period)',	r2_bfrsku_sold_dist as 'Number of SKUs sold by the distributor (buffer SKUs only)'
		,	concat(isnull(r2_buff_eff_perc_sku_sold_vs_buff_sku,0),'%') as 'Buffer Effectiveness % of SKUs sold v/s buffer SKUs only',	r2_buff_eff_perc_sku_sold_vs_buff_sku_1 as 'Buffer Effectiveness % of SKUs sold v/s buffer SKUs with min 1 day available'
		,	r2_nosku_mapped_sold as 'Number of SKUs sold by the distributor for all Mapped SKUs',	r2_nosku_mapped_hav_stk1 as 'Number of mapped SKUs having stock (Available for at least 1 day in report period)'
		,	r2_Stk_eff_perc_sku_sold_vs_stk_sku		as 'Stock effectiveness % of SKUs sold v/s  SKUs in stock (At least 1 days available in report period)' from tb_rpt_dist_buff_stk_eff


end


	
GO
/****** Object:  StoredProcedure [dbo].[sp_hrj_dist_rep_02_intransit_excp]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
1. Get all distinct dealers from client_sale_data and dealercode in (select distinct stocklocationid from symphony_stocklocationskuhistory where inventoryAtTransit>0) and fill 4 columns


*/

-- exec sp_hrj_dist_rep_02_intransit_excp

CREATE proc [dbo].[sp_hrj_dist_rep_02_intransit_excp]
as
begin

truncate table tb_rpt_dist_intrans_excp
/*
--drop table tb_rpt_dist_intrans_excp
create table tb_rpt_dist_intrans_excp
(
r2_id int identity(1,1)
,r2_dist_code nvarchar(50)
,r2_distname nvarchar(100)
,r2_distregn nvarchar(100)
,r2_city nvarchar(100)
,r2_sl_id int
,r2_trans_date datetime
,r2_inv_date datetime
,r2_intrans_days int
,r2_deal_sku nvarchar(50)
,r2_hrj_sku nvarchar(50)
,r2_qty float
,r2_sales_person nvarchar(100)
,ind01 int default 0
)
*/

CREATE TABLE #Client_DIST_SALE_DATA_4    
(    
 [Distributor_code] [nvarchar] (100) NULL,    
 [Distributor_name]  [nvarchar] (200) NULL,    
 [Sold_party]  [nvarchar] (300) NULL,    
 [HRJ_SKU]  [nvarchar] (200) NULL,   
 [Distributor_Item_name]  [nvarchar] (300) NULL,    
 [Quantity] [float] NULL,    
 [Year]  [nvarchar] (100) NULL,    
 [Month]  [nvarchar] (100) NULL,    
 [Day]  [nvarchar] (100) NULL,    
 [gen_mm] [varchar](2) NULL,    
 [gen_dd] [varchar](2) NULL,    
 [gen_date] [datetime] NULL,
 [Clust_code]   [varchar](2)
) 

create table #distb
(
Distributor_code nvarchar(100)
,dist_id int
,ind01 int default 0
)


------------------------------
insert into #Client_DIST_SALE_DATA_4(Distributor_code,Distributor_name,Sold_party,HRJ_SKU,Distributor_Item_name,Quantity,Year,Month,Day)    
select * from Client_DIST_SALE_DATA  

update #Client_DIST_SALE_DATA_4 set gen_mm='0'+month where len(month)=1    
update #Client_DIST_SALE_DATA_4 set gen_mm=month where len(month)=2    
    
update #Client_DIST_SALE_DATA_4 set gen_dd='0'+day where len(day)=1    
update #Client_DIST_SALE_DATA_4 set gen_dd=day where len(day)=2    
    
update #Client_DIST_SALE_DATA_4 set gen_date=convert(datetime,(year+'-'+gen_mm+'-'+gen_dd))    
 

-- delete from #Client_DIST_SALE_DATA_4 where gen_date < getdate()-30 

--insert into #distb(Distributor_code) select distinct [Distributor_code] from #Client_DIST_SALE_DATA_4 order by [Distributor_code]

--update a  set a.dist_id=b.stockLocationID  from #distb a, Symphony_StockLocations b where a.Distributor_code=b.stockLocationName

insert into #distb(dist_id) 
select distinct stocklocationid from symphony_stocklocationskuhistory where convert(date,updateDate)=convert(date,(getdate()-1)) and inventoryAtTransit>0 and stocklocationid in (select distinct a.stockLocationID  from symphony_stocklocations a join  #Client_DIST_SALE_DATA_4 b on a.stockLocationName=b.[Distributor_code] )
 
update a  set a.Distributor_code=b.stockLocationName   from #distb a, Symphony_StockLocations b where a.dist_id=b.stockLocationID
 
-- select * from Symphony_StockLocations where stockLocationID='APDS0002'
declare @var_dist_cnt int,@var_distcode nvarchar(100),@var_slid  int
declare @var_skuid int,@var_qty float,@var_sku_cnt int,@var_sku_rcid int

set @var_dist_cnt=(select count(*) from #distb)

while @var_dist_cnt<>0
begin
 set @var_distcode=(select top 1 Distributor_code from #distb where ind01=0)
 set @var_slid=(select top 1 dist_id from #distb where Distributor_code=@var_distcode)

 insert into tb_rpt_dist_intrans_excp(r2_dist_code,r2_sl_id,r2_hrj_sku,r2_trans_date,r2_qty) 
 select @var_distcode,@var_slid,skuid,(getdate()-1),inventoryAtTransit  from symphony_stocklocationskuhistory where stockLocationID=@var_slid and updateDate=convert(date,getdate()-2) and inventoryAtTransit > 0
 --and skuid not in  (select distinct skuid from Symphony_StockLocationSkus where stockLocationID=@var_slid  and convert(date,convert(datetime,updateDate)-1)=convert(date,getdate()-1) )

 update a set a.r2_deal_sku=b.custom_txt8  from tb_rpt_dist_unmapped_excp a , Symphony_StockLocationskus b
 where a.r2_sl_id =b.stockLocationID and a.r2_hrj_sku=b.locationSkuName

 

/*Workin for inv date*/


	set @var_sku_cnt=(select count(*) from tb_rpt_dist_intrans_excp where r2_sl_id=@var_slid )

	while @var_sku_cnt<>0
	begin
	set @var_sku_rcid =(select top 1 r2_id from tb_rpt_dist_intrans_excp where ind01=0)
	set @var_skuid=(select top 1 r2_hrj_sku from tb_rpt_dist_intrans_excp where r2_id=@var_sku_rcid)
	set @var_qty=(select top 1 r2_qty from tb_rpt_dist_intrans_excp where r2_id=@var_sku_rcid)

	update tb_rpt_dist_intrans_excp set r2_inv_date = (select top 1  reportedDate from Symphony_Transactions where receiver <> -1 and receiver=@var_slid  and skuid=@var_skuid and quantity=@var_qty order by reportedDate desc) where  r2_id=@var_sku_rcid
	
	update tb_rpt_dist_intrans_excp set ind01=1 where r2_id=@var_sku_rcid
	set @var_sku_cnt=@var_sku_cnt-1
	end
	/*Workin for inv date--END*/
	
 update #distb set ind01=1 where Distributor_code=@var_distcode
 set @var_dist_cnt=@var_dist_cnt-1
end
/*
truncate table tb_rpt_dist_unmapped_excp
-- select * from tb_rpt_dist_buff_stk_eff
select * from Symphony_StockLocations where stockLocationName='BH0S0020'
select distinct stockLocationType from Symphony_StockLocations
select * from Stocklocations where stockLocationName='BH0S0020'
select * from Stocklocationlocationskus where stockLocationID=151

select * from symphony_stocklocationskuhistory where stocklocationid=52  and updatedate='2018-10-24' and skuid=25688
select * from symphony_stocklocationskuhistory where stocklocationid=52  and updatedate='2018-10-25' and skuid=25688
select * from symphony_stocklocationskuhistory where stocklocationid=52  and updatedate='2018-10-26' and skuid=25688


select * from symphony_stocklocationskus where stocklocationid=52  and updatedate='2018-10-24'


select distinct updatedate from symphony_stocklocationskus

BH0S0020
SHIVAM ENTERPRISES

select skuid from Symphony_Transactions where receiver=52 and reportedDate='2018-10-24 00:00:00'

select * from Symphony_Transactions
select * from Symphony_Transactions where receiver <> -1 
select distinct transactiontype from Symphony_Transactions

--select * from Symphony_StockLocations
select * from Stocklocationlocationskus

/*
select distinct a.stockLocationName,a.slPropertyID1,b.slItemName from Stocklocations  a
left join Symphony_StockLocationPropertyItems b 
on convert(varchar(10),a.slPropertyID1)=convert(varchar(10),b.slItemID) and b.slPropertyID='slPropertyID1'
*/
--select * from Symphony_StockLocationSkuHistory
*/


update tb_rpt_dist_intrans_excp set r2_intrans_days=datediff(dd,r2_inv_date,r2_trans_date) where r2_inv_date is not null or r2_trans_date is not null

update a set a.r2_distname=b.stockLocationDescription  from tb_rpt_dist_intrans_excp a , Symphony_StockLocations b
where a.r2_dist_code =b.stockLocationName

update a set a.r2_city=b.slItemName from tb_rpt_dist_intrans_excp a , (select distinct a.stockLocationName,a.slPropertyID1,b.slItemName from Symphony_StockLocations  a
left join Symphony_StockLocationPropertyItems b 
on convert(varchar(10),a.slPropertyID1)=convert(varchar(10),b.slItemID) and b.slPropertyID='slPropertyID1') as b
where a.r2_dist_code=b.stockLocationName 

update a set a.r2_distregn=b.slItemName from tb_rpt_dist_intrans_excp a , (select distinct a.stockLocationName,a.slPropertyID2,b.slItemName from Symphony_StockLocations  a
left join Symphony_StockLocationPropertyItems b 
on convert(varchar(10),a.slPropertyID2)=convert(varchar(10),b.slItemID) and b.slPropertyID='slPropertyID2') as b
where a.r2_dist_code=b.stockLocationName 

update a set a.r2_sl_id = b.stockLocationID from tb_rpt_dist_intrans_excp a, Symphony_StockLocations b where a.r2_dist_code=b.stockLocationName

--update a set a.r2_lastrec_date=b.updateDate from tb_rpt_dist_intrans_excp a, (select distinct top 10  stocklocationid, updateDate from Symphony_StockLocationSkuHistory  where stocklocationid in (select distinct r2_sl_id from tb_rpt_dist_intrans_excp as c) order by updateDate desc) b
--where a.r2_sl_id=b.stockLocationID

update tb_rpt_dist_intrans_excp set r2_intrans_days=DATEDIFF(dd,getdate(),r2_inv_date)


--select * from tb_rpt_dist_intrans_excp

select r2_id as 'Serial Number'
,r2_dist_code as 'Dealer Code as per SAP'
,r2_distname as 'Dealer Name'
,r2_distregn as 'Dealer Region'
,r2_city as 'Dealer City'
,r2_hrj_sku as 'HRJ SKU'
,r2_deal_sku as 'Dealer SKU'
,convert(date,r2_inv_date) as 'Invoice Date'
,r2_intrans_days as 'In transit since'
 from tb_rpt_dist_intrans_excp
order by r2_id

end


----------------


GO
/****** Object:  StoredProcedure [dbo].[sp_hrj_dist_rep_02_nil_trans]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
-- exec sp_hrj_dist_rep_02_nil_trans

CREATE proc [dbo].[sp_hrj_dist_rep_02_nil_trans]
as
begin
truncate table tb_rpt_dist_nil_trans_exp
/*
create table tb_rpt_dist_nil_trans_exp
(
r2_id int identity(1,1)
,r2_dist_code nvarchar(50)
,r2_distname nvarchar(100)
,r2_distregn nvarchar(100)
,r2_city nvarchar(100)
,r2_sl_id int
,r2_lastrec_date datetime
,r2_no_of_days_lasttrans int
,r2_sales_person nvarchar(100)
,ind01 int
)
*/

CREATE TABLE #Client_DIST_SALE_DATA_2    
(    
 [Distributor_code] [nvarchar] (100) NULL,    
 [Distributor_name]  [nvarchar] (200) NULL,    
 [Sold_party]  [nvarchar] (300) NULL,    
 [HRJ_SKU]  [nvarchar] (200) NULL,   
 [Distributor_Item_name]  [nvarchar] (300) NULL,    
 [Quantity] [float] NULL,    
 [Year]  [nvarchar] (100) NULL,    
 [Month]  [nvarchar] (100) NULL,    
 [Day]  [nvarchar] (100) NULL,    
 [gen_mm] [varchar](2) NULL,    
 [gen_dd] [varchar](2) NULL,    
 [gen_date] [datetime] NULL,
 [Clust_code]   [varchar](2)
) 




------------------------------
insert into #Client_DIST_SALE_DATA_2(Distributor_code,Distributor_name,Sold_party,HRJ_SKU,Distributor_Item_name,Quantity,Year,Month,Day)    
select * from Client_DIST_SALE_DATA  

update #Client_DIST_SALE_DATA_2 set gen_mm='0'+month where len(month)=1    
update #Client_DIST_SALE_DATA_2 set gen_mm=month where len(month)=2    
    
update #Client_DIST_SALE_DATA_2 set gen_dd='0'+day where len(day)=1    
update #Client_DIST_SALE_DATA_2 set gen_dd=day where len(day)=2    
    
update #Client_DIST_SALE_DATA_2 set gen_date=convert(datetime,(year+'-'+gen_mm+'-'+gen_dd))    
 
delete from #Client_DIST_SALE_DATA_2 where gen_date < getdate()-30 

truncate table tb_rpt_dist_nil_trans_exp
-- select * from tb_rpt_dist_buff_stk_eff
--select * from Symphony_StockLocations

insert into tb_rpt_dist_nil_trans_exp(r2_dist_code) select distinct Distributor_code from #Client_DIST_SALE_DATA_2 order by Distributor_code

update a set a.r2_distname=b.stockLocationDescription  from tb_rpt_dist_nil_trans_exp a , Symphony_StockLocations b
where a.r2_dist_code =b.stockLocationName

/*
select distinct a.stockLocationName,a.slPropertyID1,b.slItemName from Stocklocations  a
left join Symphony_StockLocationPropertyItems b 
on convert(varchar(10),a.slPropertyID1)=convert(varchar(10),b.slItemID) and b.slPropertyID='slPropertyID1'
*/

--select * from Symphony_StockLocations

update a set a.r2_city=b.slItemName from tb_rpt_dist_nil_trans_exp a , (select distinct a.stockLocationName,a.slPropertyID1,b.slItemName from Symphony_StockLocations  a
left join Symphony_StockLocationPropertyItems b 
on convert(varchar(10),a.slPropertyID1)=convert(varchar(10),b.slItemID) and b.slPropertyID='slPropertyID1') as b
where a.r2_dist_code=b.stockLocationName 

update a set a.r2_distregn=b.slItemName from tb_rpt_dist_nil_trans_exp a , (select distinct a.stockLocationName,a.slPropertyID2,b.slItemName from Symphony_StockLocations  a
left join Symphony_StockLocationPropertyItems b 
on convert(varchar(10),a.slPropertyID2)=convert(varchar(10),b.slItemID) and b.slPropertyID='slPropertyID2') as b
where a.r2_dist_code=b.stockLocationName 

update a set a.r2_sl_id = b.stockLocationID from tb_rpt_dist_nil_trans_exp a, Symphony_StockLocations b where a.r2_dist_code=b.stockLocationName

--select * from Symphony_StockLocationSkuHistory

--select distinct top 10  stocklocationid, updateDate from Symphony_StockLocationSkuHistory order by updateDate desc

update a set a.r2_lastrec_date=b.updateDate from tb_rpt_dist_nil_trans_exp a, (select distinct top 10  stocklocationid, updateDate from Symphony_StockLocationSkuHistory  where stocklocationid in (select distinct r2_sl_id from tb_rpt_dist_nil_trans_exp as c) order by updateDate desc) b
where a.r2_sl_id=b.stockLocationID

update tb_rpt_dist_nil_trans_exp set r2_no_of_days_lasttrans=DATEDIFF(dd,r2_lastrec_date,getdate())



--select * from tb_rpt_dist_nil_trans_exp

select r2_id as 'Serial Number'
,r2_dist_code as 'Dealer Code as per SAP'
,r2_distname as 'Dealer Name'
,r2_distregn as 'Dealer Region'
,r2_city as 'Dealer City'
,convert(date,r2_lastrec_date) as 'Last transaction received on'
,r2_no_of_days_lasttrans as 'Number of days from the last transaction'
 from tb_rpt_dist_nil_trans_exp
order by r2_id

end


----------------


GO
/****** Object:  StoredProcedure [dbo].[sp_hrj_dist_rep_02_nonmta_excp]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
1. Get all distinct dealers from client_sale_data and fill 4 columns
2. get all skus from stocklocationskus against each dealer on getdate-2 
	where sku doesnot exists in transaction table 

*/

-- exec sp_hrj_dist_rep_02_nonmta_excp

create proc [dbo].[sp_hrj_dist_rep_02_nonmta_excp]
as
begin
truncate table tb_rpt_dist_nonmta_excp
/*
create table tb_rpt_dist_nonmta_excp
(
r2_id int identity(1,1)
,r2_dist_code nvarchar(50)
,r2_distname nvarchar(100)
,r2_distregn nvarchar(100)
,r2_city nvarchar(100)
,r2_sl_id int
,r2_trans_date datetime
,r2_deal_sku nvarchar(50)
,r2_hrj_sku nvarchar(50)
,r2_sales_person nvarchar(100)
,ind01 int
)
*/

CREATE TABLE #Client_DIST_SALE_DATA_3    
(    
 [Distributor_code] [nvarchar] (100) NULL,    
 [Distributor_name]  [nvarchar] (200) NULL,    
 [Sold_party]  [nvarchar] (300) NULL,    
 [HRJ_SKU]  [nvarchar] (200) NULL,   
 [Distributor_Item_name]  [nvarchar] (300) NULL,    
 [Quantity] [float] NULL,    
 [Year]  [nvarchar] (100) NULL,    
 [Month]  [nvarchar] (100) NULL,    
 [Day]  [nvarchar] (100) NULL,    
 [gen_mm] [varchar](2) NULL,    
 [gen_dd] [varchar](2) NULL,    
 [gen_date] [datetime] NULL,
 [Clust_code]   [varchar](2)
) 

create table #distb
(
Distributor_code nvarchar(100)
,ind01 int default 0
)


------------------------------
insert into #Client_DIST_SALE_DATA_3(Distributor_code,Distributor_name,Sold_party,HRJ_SKU,Distributor_Item_name,Quantity,Year,Month,Day)    
select * from Client_DIST_SALE_DATA  

update #Client_DIST_SALE_DATA_3 set gen_mm='0'+month where len(month)=1    
update #Client_DIST_SALE_DATA_3 set gen_mm=month where len(month)=2    
    
update #Client_DIST_SALE_DATA_3 set gen_dd='0'+day where len(day)=1    
update #Client_DIST_SALE_DATA_3 set gen_dd=day where len(day)=2    
    
update #Client_DIST_SALE_DATA_3 set gen_date=convert(datetime,(year+'-'+gen_mm+'-'+gen_dd))    
 
delete from #Client_DIST_SALE_DATA_3 where gen_date < getdate()-30 

insert into #distb(Distributor_code) select distinct [Distributor_code] from #Client_DIST_SALE_DATA_3 order by [Distributor_code]

declare @var_dist_cnt int,@var_distcode nvarchar(100),@var_slid  int

set @var_dist_cnt=(select count(*) from #distb)

while @var_dist_cnt<>0
begin
 set @var_distcode=(select top 1 Distributor_code from #distb where ind01=0)
 set @var_slid=(select top 1 stocklocationid from Symphony_StockLocations where stockLocationName=@var_distcode)

 insert into tb_rpt_dist_nonmta_excp(r2_dist_code,r2_sl_id,r2_hrj_sku,r2_trans_date) 
 select @var_distcode,@var_slid,skuid,(getdate()-1)  from Symphony_Transactions where receiver=@var_slid and reportedDate=convert(date,getdate()-1) and skuid not in
 (select distinct skuid from Symphony_StockLocationSkus where stockLocationID=@var_slid  and convert(date,convert(datetime,updateDate)-1)=convert(date,getdate()-1) )

 update a set a.r2_deal_sku=b.custom_txt8  from tb_rpt_dist_nonmta_excp a , Symphony_StockLocationskus b
 where a.r2_sl_id =b.stockLocationID and a.r2_hrj_sku=b.locationSkuName


 update #distb set ind01=1 where Distributor_code=@var_distcode
 set @var_dist_cnt=@var_dist_cnt-1
end
/*
truncate table tb_rpt_dist_unmapped_excp
-- select * from tb_rpt_dist_buff_stk_eff
select * from Symphony_StockLocations where stockLocationName='BH0S0020'
select distinct stockLocationType from Symphony_StockLocations
select * from Stocklocations where stockLocationName='BH0S0020'
select * from Stocklocationlocationskus where stockLocationID=151

BH0S0020
SHIVAM ENTERPRISES

select skuid from Symphony_Transactions where receiver=52 and reportedDate='2018-10-24 00:00:00'

select * from Symphony_Transactions
select * from Symphony_Transactions where receiver <> -1 
select distinct transactiontype from Symphony_Transactions

--select * from Symphony_StockLocations
select * from Stocklocationlocationskus

/*
select distinct a.stockLocationName,a.slPropertyID1,b.slItemName from Stocklocations  a
left join Symphony_StockLocationPropertyItems b 
on convert(varchar(10),a.slPropertyID1)=convert(varchar(10),b.slItemID) and b.slPropertyID='slPropertyID1'
*/
--select * from Symphony_StockLocationSkuHistory
*/



update a set a.r2_distname=b.stockLocationDescription  from tb_rpt_dist_nonmta_excp a , Symphony_StockLocations b
where a.r2_dist_code =b.stockLocationName

update a set a.r2_city=b.slItemName from tb_rpt_dist_nonmta_excp a , (select distinct a.stockLocationName,a.slPropertyID1,b.slItemName from Symphony_StockLocations  a
left join Symphony_StockLocationPropertyItems b 
on convert(varchar(10),a.slPropertyID1)=convert(varchar(10),b.slItemID) and b.slPropertyID='slPropertyID1') as b
where a.r2_dist_code=b.stockLocationName 

update a set a.r2_distregn=b.slItemName from tb_rpt_dist_nonmta_excp a , (select distinct a.stockLocationName,a.slPropertyID2,b.slItemName from Symphony_StockLocations  a
left join Symphony_StockLocationPropertyItems b 
on convert(varchar(10),a.slPropertyID2)=convert(varchar(10),b.slItemID) and b.slPropertyID='slPropertyID2') as b
where a.r2_dist_code=b.stockLocationName 

update a set a.r2_sl_id = b.stockLocationID from tb_rpt_dist_nonmta_excp a, Symphony_StockLocations b where a.r2_dist_code=b.stockLocationName

--update a set a.r2_lastrec_date=b.updateDate from tb_rpt_dist_nonmta_excp a, (select distinct top 10  stocklocationid, updateDate from Symphony_StockLocationSkuHistory  where stocklocationid in (select distinct r2_sl_id from tb_rpt_dist_nil_trans_exp as c) order by updateDate desc) b
--where a.r2_sl_id=b.stockLocationID

--update tb_rpt_dist_nonmta_excp set r2_lastrec_date=DATEDIFF(dd,getdate(),r2_lastrec_date)

--select * from tb_rpt_dist_unmapped_excp

select r2_id as 'Serial Number'
,r2_dist_code as 'Dealer Code as per SAP'
,r2_distname as 'Dealer Name'
,r2_distregn as 'Dealer Region'
,r2_city as 'Dealer City'
,convert(date,r2_trans_date) as 'Transaction Date'
,r2_deal_sku as 'Dealer SKU'
,r2_hrj_sku as 'HRJ SKU'
 from tb_rpt_dist_nonmta_excp
order by r2_id

end


----------------


GO
/****** Object:  StoredProcedure [dbo].[sp_hrj_dist_rep_02_unmapped_excp]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
/*
1. Get all distinct dealers from client_sale_data and fill 4 columns
2. get all skus from stocklocationskus against each dealer on getdate-2 
	where sku doesnot exists in transaction table 

*/

-- exec sp_hrj_dist_rep_02_unmapped_excp


create proc [dbo].[sp_hrj_dist_rep_02_unmapped_excp]
as
begin
truncate table tb_rpt_dist_unmapped_excp
/*
create table tb_rpt_dist_unmapped_excp
(
r2_id int identity(1,1)
,r2_dist_code nvarchar(50)
,r2_distname nvarchar(100)
,r2_distregn nvarchar(100)
,r2_city nvarchar(100)
,r2_sl_id int
,r2_trans_date datetime
,r2_deal_sku nvarchar(50)
,r2_hrj_sku nvarchar(50)
,r2_sales_person nvarchar(100)
,ind01 int
)
*/

CREATE TABLE #Client_DIST_SALE_DATA_3    
(    
 [Distributor_code] [nvarchar] (100) NULL,    
 [Distributor_name]  [nvarchar] (200) NULL,    
 [Sold_party]  [nvarchar] (300) NULL,    
 [HRJ_SKU]  [nvarchar] (200) NULL,   
 [Distributor_Item_name]  [nvarchar] (300) NULL,    
 [Quantity] [float] NULL,    
 [Year]  [nvarchar] (100) NULL,    
 [Month]  [nvarchar] (100) NULL,    
 [Day]  [nvarchar] (100) NULL,    
 [gen_mm] [varchar](2) NULL,    
 [gen_dd] [varchar](2) NULL,    
 [gen_date] [datetime] NULL,
 [Clust_code]   [varchar](2)
) 

create table #distb
(
Distributor_code nvarchar(100)
,ind01 int default 0
)


------------------------------
insert into #Client_DIST_SALE_DATA_3(Distributor_code,Distributor_name,Sold_party,HRJ_SKU,Distributor_Item_name,Quantity,Year,Month,Day)    
select * from Client_DIST_SALE_DATA  

update #Client_DIST_SALE_DATA_3 set gen_mm='0'+month where len(month)=1    
update #Client_DIST_SALE_DATA_3 set gen_mm=month where len(month)=2    
    
update #Client_DIST_SALE_DATA_3 set gen_dd='0'+day where len(day)=1    
update #Client_DIST_SALE_DATA_3 set gen_dd=day where len(day)=2    
    
update #Client_DIST_SALE_DATA_3 set gen_date=convert(datetime,(year+'-'+gen_mm+'-'+gen_dd))    
 
--delete from #Client_DIST_SALE_DATA_3 where gen_date < getdate()-30 

insert into #distb(Distributor_code) select distinct [Distributor_code] from #Client_DIST_SALE_DATA_3 order by [Distributor_code]

declare @var_dist_cnt int,@var_distcode nvarchar(100),@var_slid  int

set @var_dist_cnt=(select count(*) from #distb)

while @var_dist_cnt<>0
begin
 set @var_distcode=(select top 1 Distributor_code from #distb where ind01=0)
 set @var_slid=(select top 1 stocklocationid from Symphony_StockLocations where stockLocationName=@var_distcode)

 insert into tb_rpt_dist_unmapped_excp(r2_dist_code,r2_sl_id,r2_hrj_sku,r2_deal_sku,r2_trans_date) 
 select @var_distcode,@var_slid,skuid,custom_txt8,(getdate()-1)  from Symphony_StockLocationSkus where stockLocationID=@var_slid and inventoryAtTransit > 0 and convert(date,convert(datetime,updateDate)-1)=convert(date,getdate()-1) and skuID not in 
 (select distinct skuid from Symphony_Transactions where receiver=@var_slid and reportedDate=convert(date,getdate()-1))

 update #distb set ind01=1 where Distributor_code=@var_distcode
 set @var_dist_cnt=@var_dist_cnt-1
end
/*
truncate table tb_rpt_dist_unmapped_excp
-- select * from tb_rpt_dist_buff_stk_eff
select * from Symphony_StockLocations where stockLocationName='BH0S0020'
select distinct stockLocationType from Symphony_StockLocations
select * from Stocklocations where stockLocationName='BH0S0020'
select * from Stocklocationlocationskus where stockLocationID=151

BH0S0020
SHIVAM ENTERPRISES

select skuid from Symphony_Transactions where receiver=52 and reportedDate='2018-10-24 00:00:00'

select * from Symphony_Transactions
select * from Symphony_Transactions where receiver <> -1 
select distinct transactiontype from Symphony_Transactions

--select * from Symphony_StockLocations
select * from Stocklocationlocationskus

/*
select distinct a.stockLocationName,a.slPropertyID1,b.slItemName from Stocklocations  a
left join Symphony_StockLocationPropertyItems b 
on convert(varchar(10),a.slPropertyID1)=convert(varchar(10),b.slItemID) and b.slPropertyID='slPropertyID1'
*/
--select * from Symphony_StockLocationSkuHistory
*/

update a set a.r2_distname=b.stockLocationDescription  from tb_rpt_dist_unmapped_excp a , Symphony_StockLocations b
where a.r2_dist_code =b.stockLocationName





update a set a.r2_city=b.slItemName from tb_rpt_dist_unmapped_excp a , (select distinct a.stockLocationName,a.slPropertyID1,b.slItemName from Symphony_StockLocations  a
left join Symphony_StockLocationPropertyItems b 
on convert(varchar(10),a.slPropertyID1)=convert(varchar(10),b.slItemID) and b.slPropertyID='slPropertyID1') as b
where a.r2_dist_code=b.stockLocationName 

update a set a.r2_distregn=b.slItemName from tb_rpt_dist_unmapped_excp a , (select distinct a.stockLocationName,a.slPropertyID2,b.slItemName from Symphony_StockLocations  a
left join Symphony_StockLocationPropertyItems b 
on convert(varchar(10),a.slPropertyID2)=convert(varchar(10),b.slItemID) and b.slPropertyID='slPropertyID2') as b
where a.r2_dist_code=b.stockLocationName 

update a set a.r2_sl_id = b.stockLocationID from tb_rpt_dist_unmapped_excp a, Symphony_StockLocations b where a.r2_dist_code=b.stockLocationName

--update a set a.r2_lastrec_date=b.updateDate from tb_rpt_dist_unmapped_excp a, (select distinct top 10  stocklocationid, updateDate from Symphony_StockLocationSkuHistory  where stocklocationid in (select distinct r2_sl_id from tb_rpt_dist_unmapped_excp as c) order by updateDate desc) b
--where a.r2_sl_id=b.stockLocationID

--update tb_rpt_dist_unmapped_excp set r2_lastrec_date=DATEDIFF(dd,getdate(),r2_lastrec_date)

--select * from tb_rpt_dist_unmapped_excp

select r2_id as 'Serial Number'
,r2_dist_code as 'Dealer Code as per SAP'
,r2_distname as 'Dealer Name'
,r2_distregn as 'Dealer Region'
,r2_city as 'Dealer City'
,convert(date,r2_trans_date) as 'Transaction Date'
,r2_deal_sku as 'Dealer SKU'
,r2_hrj_sku as 'HRJ SKU'
 from tb_rpt_dist_unmapped_excp
order by r2_id

end


----------------


GO
/****** Object:  StoredProcedure [dbo].[SP_Mtsskus]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[SP_Mtsskus] as

SELECT 
	   sl.stockLocationName [Stock Location]
	   ,sl.stockLocationDescription LocationDesc
      ,sls.[locationSkuName] SKU
	  ,sls.skuDescription
      ,cast([bufferSize] as decimal(18,0)) BufferSize
	  ,cast(sls.inventoryAtTransit as decimal(18,0)) Inv@transit
	  ,case   when transitColor =0  then 'Cyan'
			  when transitColor =1  then 'Green'
			  when transitColor =2  then 'Yellow'
			  when transitColor =3  then 'Red'
			  when transitColor =4  then 'Black'
	   end [Transit Color]
	   ,cast(sls.inventoryAtSite as decimal(18,0)) Inv@site
	   ,case   when siteColor =0  then 'Cyan'
			  when siteColor =1  then 'Green'
			  when siteColor =2  then 'Yellow'
			  when siteColor =3  then 'Red'
			  when siteColor =4  then 'Black'
	   end [Site Color]
	  ,u.uomName UOM
	  ,slo.stockLocationName Origin
	  ,[replenishmentTime] ReplTime
	  ,sls.custom_txt1 MVGR2
	  ,sls.custom_txt2 DPLMStatus
	  ,sls.custom_txt3 Business
	  ,sls.custom_txt4 Distributor_Sku
	  ,sls.custom_txt5 [Material Freight Group]
	  ,sls.custom_txt6 ProductionGroup
	  ,sls.custom_txt7 Quality
	  ,sls.custom_txt8 ParentCode
	  ,sls.custom_txt9 Created_Date
	  ,sls.custom_txt10 [HBT_National]
	  ,sp1.skuItemName Division
	  ,sp2.skuItemName SQM
	  ,sp3.skuItemName MVGR4
	  ,sp4.skuItemName Size
	  ,sp5.skuItemName HBT_Store
	  ,sp6.skuItemName [Design Name]
	  ,sp7.skuItemName CurrentStatus



  FROM [Symphony_StockLocationSkus] sls
  Join Symphony_stocklocations sl on sl.stocklocationid= sls.stockLocationID
  left Join Symphony_stocklocations slo on slo.stocklocationid= sls.originStockLocation
  left Join Symphony_UOM u on u.uomID=sls.uomID
  left join Symphony_SKUsPropertyItems sp1 on sp1.skuItemID=sls.skuPropertyID1
  left join Symphony_SKUsPropertyItems sp2 on sp2.skuItemID=sls.skuPropertyID2
  left join Symphony_SKUsPropertyItems sp3 on sp3.skuItemID=sls.skuPropertyID3
  left join Symphony_SKUsPropertyItems sp4 on sp4.skuItemID=sls.skuPropertyID4
  left join Symphony_SKUsPropertyItems sp5 on sp5.skuItemID=sls.skuPropertyID5
  left join Symphony_SKUsPropertyItems sp6 on sp6.skuItemID=sls.skuPropertyID6
  left join Symphony_SKUsPropertyItems sp7 on sp7.skuItemID=sls.skuPropertyID7

--where sl.stockLocationName='BH0M0010'
GO
/****** Object:  StoredProcedure [dbo].[SP_Mtsskus_List]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE Procedure [dbo].[SP_Mtsskus_List] as
SELECT 
	   sl.stockLocationName [Stock Location]
      ,sls.[locationSkuName] SKU
  FROM [Symphony_StockLocationSkus] sls
  Join Symphony_stocklocations sl on sl.stocklocationid= sls.stockLocationID
 
GO
/****** Object:  StoredProcedure [dbo].[sp_report_avrp_02]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

      
    -- exec sp_report_avrp_02  
        
/* Retailer Range penetration based on average range sold by cluster of retailers */         
CREATE proc [dbo].[sp_report_avrp_02]            
as            
begin        
CREATE TABLE #Client_DIST_SALE_DATA_1            
(            
 [Distributor_code] [nvarchar] (100) NULL,            
 [Distributor_name]  [nvarchar] (200) NULL,            
 [Sold_party]  [nvarchar] (300) NULL,            
 [HRJ_SKU]  [nvarchar] (200) NULL,           
 [Distributor_Item_name]  [nvarchar] (300) NULL,            
 [Quantity] [float] NULL,            
 [Year]  [nvarchar] (100) NULL,            
 [Month]  [nvarchar] (100) NULL,            
 [Day]  [nvarchar] (100) NULL,            
 [gen_mm] [varchar](2) NULL,            
 [gen_dd] [varchar](2) NULL,            
 [gen_date] [datetime] NULL,        
 [Clust_code]   [varchar](2)        
)          
        
create table #tb_dist            
(sno int identity(1,1)            
,dist_name  [nvarchar] (100) NULL              
,ret_qty float            
,ind01 int default 0            
)         
        
create table #tb_ret            
(sno int identity(1,1)            
,ret_name  [nvarchar] (300) NULL            
,ind01 int default 0            
)           
        
create table #tb_output            
(            
o_sno int identity(1,1)            
,o_Dist_name nvarchar(200)            
,o_Ret_name nvarchar(300)            
,o_Dis_SKU_Count_pur_Ret int            
,o_avg_rng_sold_dist int            
,o_Uni_sku_sold_dist float           
,o_uni_sku_in_stock float          
,o_uni_sku_with_buffer float           
,o_ret_range_pent varchar(100)          
,o_color_avg_soldby_clust_ret  varchar(20)           
,o_color varchar(20)           

,o_Dis_SKU_Count_pur_Ret1 int            
,o_avg_rng_sold_dist1 int            
,o_Uni_sku_sold_dist1 float           
,o_uni_sku_in_stock1 float          
,o_uni_sku_with_buffer1 float           
,o_ret_range_pent1 varchar(100)          
,o_color_avg_soldby_clust_ret1  varchar(20)           
,o_color1 varchar(20)           

,o_Dis_SKU_Count_pur_Ret2 int            
,o_avg_rng_sold_dist2 int            
,o_Uni_sku_sold_dist2 float           
,o_uni_sku_in_stock2 float          
,o_uni_sku_with_buffer2 float           
,o_ret_range_pent2 varchar(100)          
,o_color_avg_soldby_clust_ret2  varchar(20)           
,o_color2 varchar(20)           

,o_clust_code nvarchar(10)
,ind01 int    default 0        
)            
  
  /*Creating Dates*/
  declare @var_fdate varchar(10),@var_tdate varchar(10),@var_yr int,@var_date_cvt datetime
  declare @var_fdate1 varchar(10),@var_tdate1 varchar(10)
  declare @var_fdate2 varchar(10),@var_tdate2 varchar(10)
declare @var_cal varchar(2)


if datepart(mm,getdate())=1
begin
set @var_fdate=convert(varchar(4),datepart(yyyy,getdate())-1)+'-12-01'
set @var_tdate=convert(varchar(4),datepart(yyyy,getdate())-1)+'-12-31'
end

if datepart(mm,getdate())<>1
begin

if len(datepart(mm,getdate())-1) = 1
begin
set @var_cal='0'+convert(varchar(1),(datepart(mm,getdate())-1))
set @var_fdate=convert(varchar(4),datepart(yyyy,getdate()))+'-'+@var_cal+'-01'
set @var_tdate=substring(@var_fdate,1,8)+convert(varchar(2),datepart(dd,(dateadd(mm,1,convert(datetime,@var_fdate))-1)))
end

if len(datepart(mm,getdate())-1) = 2
begin
set @var_fdate=convert(varchar(4),datepart(yyyy,getdate()))+'-'+convert(varchar(2),datepart(mm,getdate())-1)+'-01'
set @var_tdate=substring(@var_fdate,1,8)+convert(varchar(2),datepart(dd,(dateadd(mm,1,convert(datetime,@var_fdate))-1)))
end


end

--------------------

set @var_date_cvt=convert(datetime,@var_fdate)

  if datepart(mm,@var_date_cvt)=1
begin
set @var_fdate1=convert(varchar(4),datepart(yyyy,@var_date_cvt)-1)+'-12-01'
set @var_tdate1=convert(varchar(4),datepart(yyyy,@var_date_cvt)-1)+'-12-31'
end

if datepart(mm,@var_date_cvt)<>1
begin

if len(datepart(mm,@var_date_cvt)-1) = 1
begin
set @var_cal='0'+convert(varchar(1),(datepart(mm,@var_date_cvt)-1))
set @var_fdate1=convert(varchar(4),datepart(yyyy,@var_date_cvt))+'-'+@var_cal+'-01'
set @var_tdate1=substring(@var_fdate1,1,8)+convert(varchar(2),datepart(dd,(dateadd(mm,1,convert(datetime,@var_fdate1))-1)))
end

if len(datepart(mm,@var_date_cvt)-1) = 2
begin
set @var_fdate1=convert(varchar(4),datepart(yyyy,@var_date_cvt))+'-'+convert(varchar(2),datepart(mm,@var_date_cvt)-1)+'-01'
set @var_tdate1=substring(@var_fdate1,1,8)+convert(varchar(2),datepart(dd,(dateadd(mm,1,convert(datetime,@var_fdate1))-1)))
end


end
---------

set @var_date_cvt=convert(datetime,@var_fdate1)

  if datepart(mm,@var_date_cvt)=1
begin
set @var_fdate2=convert(varchar(4),datepart(yyyy,@var_date_cvt)-1)+'-12-01'
set @var_tdate2=convert(varchar(4),datepart(yyyy,@var_date_cvt)-1)+'-12-31'
end

if datepart(mm,@var_date_cvt)<>1
begin

if len(datepart(mm,@var_date_cvt)-1) = 1
begin
set @var_cal='0'+convert(varchar(1),(datepart(mm,@var_date_cvt)-1))
set @var_fdate2=convert(varchar(4),datepart(yyyy,@var_date_cvt))+'-'+@var_cal+'-01'
set @var_tdate2=substring(@var_fdate2,1,8)+convert(varchar(2),datepart(dd,(dateadd(mm,1,convert(datetime,@var_fdate2))-1)))
end

if len(datepart(mm,@var_date_cvt)-1) = 2
begin
set @var_fdate2=convert(varchar(4),datepart(yyyy,@var_date_cvt))+'-'+convert(varchar(2),datepart(mm,@var_date_cvt)-1)+'-01'
set @var_tdate2=substring(@var_fdate2,1,8)+convert(varchar(2),datepart(dd,(dateadd(mm,1,convert(datetime,@var_fdate2))-1)))
end


end
  /*End Creating Dates*/
  /*  
 select skus.skuid,sku.skuName,skus.stockLocationID,sls.stockLocationName     
 into #tb_skucat_table    
 from Symphony_StockLocationSkus skus     
 left join Symphony_StockLocations sls on skus.stockLocationID=sls.stockLocationID    
 left join Symphony_SKUs sku on skus.skuID=sku.skuID    
 where skus.custom_txt3='JBD'    
 order by skus.skuid,skus.stockLocationID    
*/  
         
insert into #Client_DIST_SALE_DATA_1(Distributor_code,Distributor_name,Sold_party,HRJ_SKU,Distributor_Item_name,Quantity,Year,Month,Day)            
select * from Client_DIST_SALE_DATA          
--select a.Distributor_code, a.Distributor_Name, a.Sold_Party, a.HRJ_SKU, a.Distributor_Item_name, a.Qty ,a.Year, a.Month, a.Day from Client_DIST_SALE_DATA  a,#tb_skucat_table b where a.Distributor_code=b.stockLocationName and a.HRJ_SKU=b.skuName        
        
update #Client_DIST_SALE_DATA_1 set gen_mm='0'+month where len(month)=1            
update #Client_DIST_SALE_DATA_1 set gen_mm=month where len(month)=2            
            
update #Client_DIST_SALE_DATA_1 set gen_dd='0'+day where len(day)=1            
update #Client_DIST_SALE_DATA_1 set gen_dd=day where len(day)=2            
            
update #Client_DIST_SALE_DATA_1 set gen_date=convert(datetime,(year+'-'+gen_mm+'-'+gen_dd))            

select * into #Client_DIST_SALE_DATA_3 from #Client_DIST_SALE_DATA_1
        
delete from #Client_DIST_SALE_DATA_1 where gen_date < getdate()-30         
            
-- delete from #Client_DIST_SALE_DATA_1 where   Distributor_code <>'TN0S0014'        
        
update a set a.clust_code=b.cm_cl_code from #Client_DIST_SALE_DATA_1 a, tb_cluster_master b where a.Sold_party=b.cm_ret_name        
        
declare @var_cnt_dist int,@var_dist_name varchar(50)            
declare @var_ret_cnt int,@var_ret_name varchar(50)            
declare @var_dist_code int,@var_cnt_stock int,@var_cnt_buffer int          
declare @var_clus_code varchar(10),@var_clus_id int        
        
         
insert into #tb_dist(dist_name) select distinct Distributor_code from #Client_DIST_SALE_DATA_1            
         
set @var_cnt_dist=(select count(*) from #tb_dist where ind01=0)         
        
-- MAIN DIST        
while @var_cnt_dist<>0            
begin            
        
set @var_dist_name=(select top 1 dist_name from #tb_dist where ind01=0)            
set @var_dist_code=(Select top 1 stockLocationID from Symphony_StockLocations where stocklocationname=@var_dist_name)          
        
/*Cal for A- Clus*/        
truncate table #tb_ret           
        
insert into #tb_output(o_Dist_name,o_Ret_name)            
select distinct Distributor_code, sold_party from #Client_DIST_SALE_DATA_1            
where Distributor_code in (@var_dist_name)    and clust_code='A'        
--and sold_party in (select distinct cm_ret_name from tb_cluster_master where cm_cl_code=@var_clus_code)        
order by Distributor_code , sold_party         
        
insert into #tb_ret(ret_name) select distinct sold_party from #Client_DIST_SALE_DATA_1 where distributor_code=@var_dist_name  and   clust_code='A'        
set @var_ret_cnt=(select count(*) from #tb_ret)         
        
-- Retailer        
 while @var_ret_cnt<>0         
 begin        
 set @var_ret_name=(select top 1 ret_name from #tb_ret where ind01=0)        
          
  update #tb_output set o_Dis_SKU_Count_pur_Ret=( select count( distinct HRJ_SKU)  from #Client_DIST_SALE_DATA_1 where  Distributor_code=@var_dist_name and  sold_party=@var_ret_name)             
  from #tb_output   where o_Dist_name=@var_dist_name and o_ret_name=@var_ret_name and ind01=0        
  
   update #tb_output set o_Dis_SKU_Count_pur_Ret1=( select count( distinct HRJ_SKU)  from #Client_DIST_SALE_DATA_3 where  Distributor_code=@var_dist_name and  sold_party=@var_ret_name and gen_date between @var_fdate and @var_tdate)             
  from #tb_output   where o_Dist_name=@var_dist_name and o_ret_name=@var_ret_name and ind01=0      
  
   update #tb_output set o_Dis_SKU_Count_pur_Ret2=( select count( distinct HRJ_SKU)  from #Client_DIST_SALE_DATA_3 where  Distributor_code=@var_dist_name and  sold_party=@var_ret_name and gen_date between @var_fdate1 and @var_tdate1)             
  from #tb_output   where o_Dist_name=@var_dist_name and o_ret_name=@var_ret_name and ind01=0      
  
      
 update #tb_ret set ind01=1 where ret_name=@var_ret_name        
 set @var_ret_cnt=@var_ret_cnt-1        
 end           
-- Retailer-END        
        
 update a set a.o_clust_code=b.cm_cl_code from #tb_output a, tb_cluster_master b where a.o_Ret_name=b.cm_ret_name and a.ind01=0        
        
        
 update #tb_output set o_Uni_sku_sold_dist=(select count(distinct a.HRJ_SKU) from #Client_DIST_SALE_DATA_1 a where a.Distributor_code=@var_dist_name and a.sold_party in (select ret_name from #tb_ret))            
 where o_Dist_name=@var_dist_name and o_clust_code='A' and ind01=0        
 
 update #tb_output set o_Uni_sku_sold_dist1=(select count(distinct a.HRJ_SKU) from #Client_DIST_SALE_DATA_3 a where a.Distributor_code=@var_dist_name and a.sold_party in (select ret_name from #tb_ret) and a.gen_date between @var_fdate and @var_tdate)            
 where o_Dist_name=@var_dist_name and o_clust_code='A' and ind01=0        
 
 update #tb_output set o_Uni_sku_sold_dist2=(select count(distinct a.HRJ_SKU) from #Client_DIST_SALE_DATA_3 a where a.Distributor_code=@var_dist_name and a.sold_party in (select ret_name from #tb_ret) and a.gen_date between @var_fdate1 and @var_tdate1)            
 where o_Dist_name=@var_dist_name and o_clust_code='A' and ind01=0        
 
        
 update #tb_output set o_avg_rng_sold_dist=(select sum(isnull(o_Dis_SKU_Count_pur_Ret,0)) from #tb_output as a where a.ind01=0 and  a.o_clust_code='A')/(select count(*) from #tb_output as b where b.ind01=0  and  b.o_clust_code='A')          
 where ind01=0        
  
  update #tb_output set o_avg_rng_sold_dist1=(select sum(isnull(o_Dis_SKU_Count_pur_Ret1,0)) from #tb_output as a where a.ind01=0 and  a.o_clust_code='A')/(select count(*) from #tb_output as b where b.ind01=0  and  b.o_clust_code='A')          
 where ind01=0 
  
  update #tb_output set o_avg_rng_sold_dist2=(select sum(isnull(o_Dis_SKU_Count_pur_Ret2,0)) from #tb_output as a where a.ind01=0 and  a.o_clust_code='A')/(select count(*) from #tb_output as b where b.ind01=0  and  b.o_clust_code='A')          
 where ind01=0 
        
 update #tb_output set ind01=2 where ind01=0        
/*Cal for A- Clus-- END*/        
        
/*Cal for B- Clus*/        
truncate table #tb_ret           
        
insert into #tb_output(o_Dist_name,o_Ret_name)            
select distinct Distributor_code, sold_party from #Client_DIST_SALE_DATA_1            
where Distributor_code in (@var_dist_name)    and clust_code='B'        
--and sold_party in (select distinct cm_ret_name from tb_cluster_master where cm_cl_code=@var_clus_code)        
order by Distributor_code , sold_party         
        
insert into #tb_ret(ret_name) select distinct sold_party from #Client_DIST_SALE_DATA_1 where distributor_code=@var_dist_name  and   clust_code='B'        
set @var_ret_cnt=(select count(*) from #tb_ret)         
        
-- Retailer        
 while @var_ret_cnt<>0         
 begin        
 set @var_ret_name=(select top 1 ret_name from #tb_ret where ind01=0)        
          
  update #tb_output set o_Dis_SKU_Count_pur_Ret=( select count( distinct HRJ_SKU)  from #Client_DIST_SALE_DATA_1 where  Distributor_code=@var_dist_name and  sold_party=@var_ret_name)             
  from #tb_output   where o_Dist_name=@var_dist_name and o_ret_name=@var_ret_name and ind01=0        
        
  update #tb_output set o_Dis_SKU_Count_pur_Ret1=( select count( distinct HRJ_SKU)  from #Client_DIST_SALE_DATA_3 where  Distributor_code=@var_dist_name and  sold_party=@var_ret_name and gen_date between @var_fdate and @var_tdate)             
  from #tb_output   where o_Dist_name=@var_dist_name and o_ret_name=@var_ret_name and ind01=0        
  
  update #tb_output set o_Dis_SKU_Count_pur_Ret2=( select count( distinct HRJ_SKU)  from #Client_DIST_SALE_DATA_3 where  Distributor_code=@var_dist_name and  sold_party=@var_ret_name and gen_date between @var_fdate1 and @var_tdate1)             
  from #tb_output   where o_Dist_name=@var_dist_name and o_ret_name=@var_ret_name and ind01=0        
        
 update #tb_ret set ind01=1 where ret_name=@var_ret_name        
 set @var_ret_cnt=@var_ret_cnt-1        
 end           
-- Retailer-END        
        
 update a set a.o_clust_code=b.cm_cl_code from #tb_output a, tb_cluster_master b where a.o_Ret_name=b.cm_ret_name and a.ind01=0        
        
        
  update #tb_output set o_Uni_sku_sold_dist=(select count(distinct a.HRJ_SKU) from #Client_DIST_SALE_DATA_1 a where a.Distributor_code=@var_dist_name and a.sold_party in (select ret_name from #tb_ret))            
 where o_Dist_name=@var_dist_name and o_clust_code='B' and ind01=0        
  
   update #tb_output set o_Uni_sku_sold_dist1=(select count(distinct a.HRJ_SKU) from #Client_DIST_SALE_DATA_3 a where a.Distributor_code=@var_dist_name and a.sold_party in (select ret_name from #tb_ret) and a.gen_date between @var_fdate and @var_tdate)            
 where o_Dist_name=@var_dist_name and o_clust_code='B' and ind01=0 
  
   update #tb_output set o_Uni_sku_sold_dist2=(select count(distinct a.HRJ_SKU) from #Client_DIST_SALE_DATA_3 a where a.Distributor_code=@var_dist_name and a.sold_party in (select ret_name from #tb_ret) and a.gen_date between @var_fdate1 and @var_tdate1)            
 where o_Dist_name=@var_dist_name and o_clust_code='B' and ind01=0 
       
 update #tb_output set o_avg_rng_sold_dist=(select sum(isnull(o_Dis_SKU_Count_pur_Ret,0)) from #tb_output as a where a.ind01=0 and  a.o_clust_code='B')/(select count(*) from #tb_output as b where b.ind01=0  and  b.o_clust_code='B')          
 where ind01=0   
 
  update #tb_output set o_avg_rng_sold_dist1=(select sum(isnull(o_Dis_SKU_Count_pur_Ret1,0)) from #tb_output as a where a.ind01=0 and  a.o_clust_code='B')/(select count(*) from #tb_output as b where b.ind01=0  and  b.o_clust_code='B')          
 where ind01=0      
   
   update #tb_output set o_avg_rng_sold_dist2=(select sum(isnull(o_Dis_SKU_Count_pur_Ret2,0)) from #tb_output as a where a.ind01=0 and  a.o_clust_code='B')/(select count(*) from #tb_output as b where b.ind01=0  and  b.o_clust_code='B')          
 where ind01=0      
        
 update #tb_output set ind01=2 where ind01=0        
/*Cal for B- Clus-- END*/        
        
        
/*Cal for C- Clus*/        
        
truncate table #tb_ret           
        
insert into #tb_output(o_Dist_name,o_Ret_name)            
select distinct Distributor_code, sold_party from #Client_DIST_SALE_DATA_1            
where Distributor_code in (@var_dist_name)    and clust_code='C'        
--and sold_party in (select distinct cm_ret_name from tb_cluster_master where cm_cl_code=@var_clus_code)        
order by Distributor_code , sold_party         
        
insert into #tb_ret(ret_name) select distinct sold_party from #Client_DIST_SALE_DATA_1 where distributor_code=@var_dist_name  and   clust_code='C'        
set @var_ret_cnt=(select count(*) from #tb_ret)         
     
-- Retailer        
 while @var_ret_cnt<>0         
 begin        
 set @var_ret_name=(select top 1 ret_name from #tb_ret where ind01=0)        
          
  update #tb_output set o_Dis_SKU_Count_pur_Ret=( select count( distinct HRJ_SKU)  from #Client_DIST_SALE_DATA_1 where  Distributor_code=@var_dist_name and  sold_party=@var_ret_name)             
  from #tb_output   where o_Dist_name=@var_dist_name and o_ret_name=@var_ret_name and ind01=0        
   
   update #tb_output set o_Dis_SKU_Count_pur_Ret1=( select count( distinct HRJ_SKU)  from #Client_DIST_SALE_DATA_3 where  Distributor_code=@var_dist_name and  sold_party=@var_ret_name and gen_date between @var_fdate and @var_tdate)             
  from #tb_output   where o_Dist_name=@var_dist_name and o_ret_name=@var_ret_name and ind01=0        
        
   update #tb_output set o_Dis_SKU_Count_pur_Ret2=( select count( distinct HRJ_SKU)  from #Client_DIST_SALE_DATA_3 where  Distributor_code=@var_dist_name and  sold_party=@var_ret_name and gen_date between @var_fdate1 and @var_tdate1)             
  from #tb_output   where o_Dist_name=@var_dist_name and o_ret_name=@var_ret_name and ind01=0        
        
 update #tb_ret set ind01=1 where ret_name=@var_ret_name        
 set @var_ret_cnt=@var_ret_cnt-1        
 end           
-- Retailer-END        
        
 update a set a.o_clust_code=b.cm_cl_code from #tb_output a, tb_cluster_master b where a.o_Ret_name=b.cm_ret_name and a.ind01=0        
        
        
 update #tb_output set o_Uni_sku_sold_dist=(select count(distinct a.HRJ_SKU) from #Client_DIST_SALE_DATA_1 a where a.Distributor_code=@var_dist_name and a.sold_party in (select ret_name from #tb_ret))            
 where o_Dist_name=@var_dist_name and o_clust_code='C' and ind01=00        
 
 update #tb_output set o_Uni_sku_sold_dist1=(select count(distinct a.HRJ_SKU) from #Client_DIST_SALE_DATA_3 a where a.Distributor_code=@var_dist_name and a.sold_party in (select ret_name from #tb_ret) and a.gen_date between @var_fdate and @var_tdate)            
 where o_Dist_name=@var_dist_name and o_clust_code='C' and ind01=00        
 
 update #tb_output set o_Uni_sku_sold_dist2=(select count(distinct a.HRJ_SKU) from #Client_DIST_SALE_DATA_3 a where a.Distributor_code=@var_dist_name and a.sold_party in (select ret_name from #tb_ret) and a.gen_date between @var_fdate1 and @var_tdate1)            
 where o_Dist_name=@var_dist_name and o_clust_code='C' and ind01=00        
        
 update #tb_output set o_avg_rng_sold_dist=(select sum(isnull(o_Dis_SKU_Count_pur_Ret,0)) from #tb_output as a where a.ind01=0 and  a.o_clust_code='C')/(select count(*) from #tb_output as b where b.ind01=0  and  b.o_clust_code='C')          
 where ind01=0        
  
  update #tb_output set o_avg_rng_sold_dist1=(select sum(isnull(o_Dis_SKU_Count_pur_Ret1,0)) from #tb_output as a where a.ind01=0 and  a.o_clust_code='C')/(select count(*) from #tb_output as b where b.ind01=0  and  b.o_clust_code='C')          
 where ind01=0       

  update #tb_output set o_avg_rng_sold_dist2=(select sum(isnull(o_Dis_SKU_Count_pur_Ret2,0)) from #tb_output as a where a.ind01=0 and  a.o_clust_code='C')/(select count(*) from #tb_output as b where b.ind01=0  and  b.o_clust_code='C')          
 where ind01=0       

 update #tb_output set ind01=2 where ind01=0        
/*Cal for C- Clus-- END*/        
        
        
 /*Uniq cal for ea dist*/        
         
        
 set @var_cnt_stock=(Select count(distinct skuid) from Symphony_StockLocationSkus where stocklocationid=@var_dist_code and inventoryatsite > 0)          
     --select * from Symphony_StockLocationSkus          
    set @var_cnt_buffer=(Select count(distinct skuid) from Symphony_StockLocationSkus where stocklocationid=@var_dist_code and buffersize>0)        
        
 update #tb_output set o_ret_range_pent=round(((o_Dis_SKU_Count_pur_Ret/o_Uni_sku_sold_dist)*100),0)            
 where (o_Uni_sku_sold_dist is not null) and (o_Uni_sku_sold_dist <>0)    and ind01=2 
 
 update #tb_output set o_ret_range_pent1=round(((o_Dis_SKU_Count_pur_Ret1/o_Uni_sku_sold_dist1)*100),0)            
 where (o_Uni_sku_sold_dist1 is not null) and (o_Uni_sku_sold_dist1 <>0)    and ind01=2 
  
  
 update #tb_output set o_ret_range_pent2=round(((o_Dis_SKU_Count_pur_Ret2/o_Uni_sku_sold_dist2)*100),0)            
 where (o_Uni_sku_sold_dist2 is not null) and (o_Uni_sku_sold_dist2 <>0)    and ind01=2 
         
        
 update #tb_output set o_uni_sku_in_stock=@var_cnt_stock,o_uni_sku_with_buffer=@var_cnt_buffer,o_uni_sku_in_stock1=@var_cnt_stock,o_uni_sku_with_buffer1=@var_cnt_buffer,o_uni_sku_in_stock2=@var_cnt_stock,o_uni_sku_with_buffer2=@var_cnt_buffer,ind01=1 where  o_Dist_name=@var_dist_name         
 /*Uniq cal for ea dist - END*/        
          
update #tb_dist set ind01=1 where dist_name=@var_dist_name        
set @var_cnt_dist=@var_cnt_dist-1        
end        
        
update #tb_output set o_color_avg_soldby_clust_ret=(case when o_Dis_SKU_Count_pur_Ret < o_avg_rng_sold_dist then 'RED' when o_Dis_SKU_Count_pur_Ret = o_avg_rng_sold_dist  then 'YELLOW' when o_Dis_SKU_Count_pur_Ret > o_avg_rng_sold_dist then 'GREEN' when  
 o_Dis_SKU_Count_pur_Ret =0 then 'BLACK' end)          
 
update #tb_output set o_color_avg_soldby_clust_ret1=(case when o_Dis_SKU_Count_pur_Ret1 < o_avg_rng_sold_dist1 then 'RED' when o_Dis_SKU_Count_pur_Ret1 = o_avg_rng_sold_dist1  then 'YELLOW' when o_Dis_SKU_Count_pur_Ret1 > o_avg_rng_sold_dist1 then 'GREEN' when  
 o_Dis_SKU_Count_pur_Ret1 =0 then 'BLACK' end)
 
 update #tb_output set o_color_avg_soldby_clust_ret2=(case when o_Dis_SKU_Count_pur_Ret2 < o_avg_rng_sold_dist2 then 'RED' when o_Dis_SKU_Count_pur_Ret2 = o_avg_rng_sold_dist  then 'YELLOW' when o_Dis_SKU_Count_pur_Ret2 > o_avg_rng_sold_dist2 then 'GREEN' when  
 o_Dis_SKU_Count_pur_Ret2 =0 then 'BLACK' end)          
           
             
update #tb_output set o_color=(case when o_ret_range_pent <= 33 then 'RED' when o_ret_range_pent >= 34 and o_ret_range_pent <= 66 then 'YELLOW' when o_ret_range_pent >= 67 and o_ret_range_pent <= 100 then 'GREEN' when o_ret_range_pent <=0 then 'BLACK' end)
  
update #tb_output set o_color1=(case when o_ret_range_pent1 <= 33 then 'RED' when o_ret_range_pent1 >= 34 and o_ret_range_pent1 <= 66 then 'YELLOW' when o_ret_range_pent1 >= 67 and o_ret_range_pent1 <= 100 then 'GREEN' when o_ret_range_pent1 <=0 then 'BLACK' end)

update #tb_output set o_color2=(case when o_ret_range_pent2 <= 33 then 'RED' when o_ret_range_pent2 >= 34 and o_ret_range_pent2 <= 66 then 'YELLOW' when o_ret_range_pent2 >= 67 and o_ret_range_pent2 <= 100 then 'GREEN' when o_ret_range_pent2 <=0 then 'BLACK' end)

    
      
        
   
--select * from #tb_output        
select  o_Dist_name as 'Distributor Name',o_clust_code as 'Retailer Cluster Code', o_Ret_name as 'Retailer Name' 
, o_Dis_SKU_Count_pur_Ret as 'Distinct Count of SKU purchased by Retailer'          
,o_avg_rng_sold_dist as 'Average Range sold by the distributor'          
, o_Uni_sku_sold_dist as 'Unique SKUs sold by distributor in the report period'          
,o_uni_sku_in_stock as 'Unique SKUs in stock @ distributor as on date'          
,o_uni_sku_with_buffer as 'Unique SKUs for which distributor has buffer'          
, Concat(o_ret_range_pent ,'%') as 'Retailer range % compared to average range'          
 ,o_color_avg_soldby_clust_ret as 'Color based on average range sold by cluster of retailers'          
 , o_color as 'Color as per total range penetration' 

, o_Dis_SKU_Count_pur_Ret1 as 'Distinct Count of SKU purchased by Retailer Last Month'          
,o_avg_rng_sold_dist1 as 'Average Range sold by the distributor Last Month'          
, o_Uni_sku_sold_dist1 as 'Unique SKUs sold by distributor in the report period Last Month'          
,o_uni_sku_in_stock1 as 'Unique SKUs in stock @ distributor as on date Last Month'          
,o_uni_sku_with_buffer1 as 'Unique SKUs for which distributor has buffer Last Month'          
, Concat(o_ret_range_pent1 ,'%') as 'Retailer range % compared to average range Last Month'          
 ,o_color_avg_soldby_clust_ret1 as 'Color based on average range sold by cluster of retailers Last Month'          
 , o_color1 as 'Color as per total range penetration Last Month'          
 
 , o_Dis_SKU_Count_pur_Ret2 as 'Distinct Count of SKU purchased by Retailer 2nd Last Month'          
,o_avg_rng_sold_dist2 as 'Average Range sold by the distributor 2nd Last Month'          
, o_Uni_sku_sold_dist2 as 'Unique SKUs sold by distributor in the report period 2nd Last Month'          
,o_uni_sku_in_stock2 as 'Unique SKUs in stock @ distributor as on date 2nd Last Month'          
,o_uni_sku_with_buffer2 as 'Unique SKUs for which distributor has buffer 2nd Last Month'          
, Concat(o_ret_range_pent2 ,'%') as 'Retailer range % compared to average range 2nd Last Month'          
 ,o_color_avg_soldby_clust_ret2 as 'Color based on average range sold by cluster of retailers 2nd Last Month'          
 , o_color2 as 'Color as per total range penetration 2nd Last Month' 
 from #tb_output


              
 --where o_Dist_name='BH0S0020' and  o_clust_code='A'         
order by o_Dist_name,o_clust_code,o_Ret_name          
        
        
--select * from #Client_DIST_SALE_DATA_1        
        
        
end   
GO
/****** Object:  StoredProcedure [dbo].[sp_report_rrpr_01]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


--exec  sp_report_rrpr_01        
/* Retailer Range penetration as compared to total range penetration */        
CREATE  proc [dbo].[sp_report_rrpr_01]        
as        
begin        
-- select * from #tb_output        
--drop table #tb_dist        
--drop table #tb_ret        
--drop table #Client_DIST_SALE_DATA_2        
--drop table #tb_output        
        
CREATE TABLE #Client_DIST_SALE_DATA_2        
(        
 [Distributor_code] [nvarchar] (100) NULL,        
 [Distributor_name]  [nvarchar] (200) NULL,        
 [Sold_party]  [nvarchar] (300) NULL,        
 [HRJ_SKU]  [nvarchar] (200) NULL,       
 [Distributor_Item_name]  [nvarchar] (300) NULL,        
 [Quantity] [float] NULL,        
 [Year]  [nvarchar] (100) NULL,        
 [Month]  [nvarchar] (100) NULL,        
 [Day]  [nvarchar] (100) NULL,        
 [gen_mm] [varchar](2) NULL,        
 [gen_dd] [varchar](2) NULL,        
 [gen_date] [datetime] NULL        
)        
        
create table #tb_dist        
(sno int identity(1,1)        
,dist_name  [nvarchar] (200) NULL          
,ret_qty float        
,ind01 int default 0        
)        
        
create table #tb_ret        
(sno int identity(1,1)        
,ret_name  [nvarchar] (300) NULL        
,ind01 int default 0        
)        
        
create table #tb_output        
(        
o_sno int identity(1,1)        
,o_Dist_name [nvarchar] (200) NULL       
,o_Ret_name [nvarchar] (300) NULL       
,o_Dis_SKU_Count_pur_Ret int        
,o_avg_rng_sold_dist int        
,o_Uni_sku_sold_dist float        
,o_ret_range_pent varchar(100)        
,o_color varchar(20) 
,o_Dis_SKU_Count_pur_Ret1 int        
,o_Dis_SKU_Count_pur_Ret2 int        
,o_Dis_SKU_Count_pur_Ret3 int        
,o_Dis_SKU_Count_pur_Ret_ALL int        
,ind01 int        
)        
        
  
/*  
 select skus.skuid,sku.skuName,skus.stockLocationID,sls.stockLocationName   
 into #tb_skucat_table  
 from Symphony_StockLocationSkus skus   
 left join Symphony_StockLocations sls on skus.stockLocationID=sls.stockLocationID  
 left join Symphony_SKUs sku on skus.skuID=sku.skuID  
 where skus.custom_txt3='TILES'  
 order by skus.skuid,skus.stockLocationID  
 */  
        
--select Distributor_code,Distributor_name,Sold_party,HRJ_SKU,Distributor_Item_name,Quantity,Year,Month,Day into #Client_DIST_SALE_DATA_2 from Client_DIST_SALE_DATA         
insert into #Client_DIST_SALE_DATA_2(Distributor_code,Distributor_name,Sold_party,HRJ_SKU,Distributor_Item_name,Quantity,Year,Month,Day)        
select * from Client_DIST_SALE_DATA   
--select a.Distributor_code, a.Distributor_Name, a.Sold_Party, a.HRJ_SKU, a.Distributor_Item_name, a.Qty ,a.Year, a.Month, a.Day from Client_DIST_SALE_DATA  a,#tb_skucat_table b where a.Distributor_code=b.stockLocationName and a.HRJ_SKU=b.skuName      
--where HRJ_SKU in (select distinct sku.skuName from symphony_skus sku left join Symphony_StockLocationSkus sls on sku.skuID=sls.skuID where sls.custom_txt3='JBD')    
-- where HRJ_SKU in () and   
  
       
-- where gen_date between '2019-01-14' and '2019-03-19' order by Distributor_code        
-- drop table #Client_DIST_SALE_DATA_2        
        
update #Client_DIST_SALE_DATA_2 set gen_mm='0'+month where len(month)=1        
update #Client_DIST_SALE_DATA_2 set gen_mm=month where len(month)=2        
        
update #Client_DIST_SALE_DATA_2 set gen_dd='0'+day where len(day)=1        
update #Client_DIST_SALE_DATA_2 set gen_dd=day where len(day)=2        
        
update #Client_DIST_SALE_DATA_2 set gen_date=convert(datetime,(year+'-'+gen_mm+'-'+gen_dd))    

select * into #Client_DIST_SALE_DATA_3 from #Client_DIST_SALE_DATA_2    
        
delete from #Client_DIST_SALE_DATA_2 where gen_date < getdate()-30        
        
insert into #tb_dist(dist_name) select distinct Distributor_code from #Client_DIST_SALE_DATA_2        
--  where gen_date between '2019-01-14' and '2019-03-19' order by Distributor_code        
        
declare @var_cnt_dist int,@var_dist_name varchar(50)        
declare @var_ret_cnt int,@var_ret_name varchar(50)        
declare @var_cur_mth int,@var_cur_yr int

set @var_cur_mth=datepart(mm,getdate())
set @var_cur_yr=datepart(YYYY,getdate())

        
set @var_cnt_dist=(select count(*) from #tb_dist where ind01=0)        
        
--Main dist        
while @var_cnt_dist<>0        
begin        
        
truncate table #tb_ret        
set @var_dist_name=(select top 1 dist_name from #tb_dist where ind01=0)        
--Retailer        
        
insert into #tb_output(o_Dist_name,o_Ret_name)        
select distinct Distributor_code, sold_party from #Client_DIST_SALE_DATA_2        
where Distributor_code in (@var_dist_name)        
order by Distributor_code , sold_party         
        
insert into #tb_ret(ret_name) select distinct sold_party from #Client_DIST_SALE_DATA_2 where distributor_code=@var_dist_name        
        
set @var_ret_cnt=(select count(*) from #tb_ret)        
  while @var_ret_cnt<>0        
  begin        
  set @var_ret_name=(select top 1 ret_name from #tb_ret where ind01=0)        
        
  update #tb_output set o_Dis_SKU_Count_pur_Ret=( select count( distinct HRJ_SKU)  from #Client_DIST_SALE_DATA_2 where  Distributor_code=@var_dist_name and  sold_party=@var_ret_name)         
  from #tb_output   where o_Dist_name=@var_dist_name and o_ret_name=@var_ret_name        
        
  update #tb_ret set ind01=1 where ret_name=@var_ret_name        
  set @var_ret_cnt=@var_ret_cnt-1        
  end        
        
  update #tb_output set o_Uni_sku_sold_dist=(select count(distinct a.HRJ_SKU) from #Client_DIST_SALE_DATA_2 a where a.distributor_code=@var_dist_name)        
  where o_Dist_name=@var_dist_name         
        
update #tb_dist set ind01=1 where dist_name=@var_dist_name        
set @var_cnt_dist=@var_cnt_dist-1        
end        
        
update #tb_output set o_ret_range_pent=round(((o_Dis_SKU_Count_pur_Ret/o_Uni_sku_sold_dist)*100),0)        
where o_Uni_sku_sold_dist is not null        
        
update #tb_output set o_color=(case when o_ret_range_pent <= 33 then 'RED' when o_ret_range_pent >= 34 and o_ret_range_pent <= 66 then 'YELLOW' when o_ret_range_pent >= 67 and o_ret_range_pent <= 100 then 'GREEN' when o_ret_range_pent <=0 then 'BLACK' end
  
)        
  
/*P1M*/ 

declare @var_fdate varchar(10),@var_tdate varchar(10),@var_yr int,@var_date_cvt datetime
declare @var_cal varchar(2)

/*Dates for P1M*/
if datepart(mm,getdate())=1
begin
set @var_fdate=convert(varchar(4),datepart(yyyy,getdate())-1)+'-12-01'
set @var_tdate=convert(varchar(4),datepart(yyyy,getdate())-1)+'-12-31'
end

if datepart(mm,getdate())<>1
begin

if len(datepart(mm,getdate())-1) = 1
begin
set @var_cal='0'+convert(varchar(1),(datepart(mm,getdate())-1))
set @var_fdate=convert(varchar(4),datepart(yyyy,getdate()))+'-'+@var_cal+'-01'
set @var_tdate=substring(@var_fdate,1,8)+convert(varchar(2),datepart(dd,(dateadd(mm,1,convert(datetime,@var_fdate))-1)))
end

if len(datepart(mm,getdate())-1) = 2
begin
set @var_fdate=convert(varchar(4),datepart(yyyy,getdate()))+'-'+convert(varchar(2),datepart(mm,getdate())-1)+'-01'
set @var_tdate=substring(@var_fdate,1,8)+convert(varchar(2),datepart(dd,(dateadd(mm,1,convert(datetime,@var_fdate))-1)))
end


end

/*END - Dates for P1M*/
          
update a1  set a1.o_Dis_SKU_Count_pur_Ret1=b1.CNT from #tb_output a1,(select distinct Distributor_code,Sold_party,count(*) as 'CNT' from  #Client_DIST_SALE_DATA_3 where gen_date between @var_fdate and @var_tdate group by Distributor_code,Sold_party) b1
   where b1.Distributor_code=a1.o_Dist_name and b1.Sold_party=a1.o_Ret_name

 print   @var_fdate
  print   @var_tdate

 print 'Dates'
 -- print   @var_fdate
  --print   @var_tdate
  /*Date for 2P*/       
  set @var_date_cvt=convert(datetime,@var_fdate)

  if datepart(mm,@var_date_cvt)=1
begin
set @var_fdate=convert(varchar(4),datepart(yyyy,@var_date_cvt)-1)+'-12-01'
set @var_tdate=convert(varchar(4),datepart(yyyy,@var_date_cvt)-1)+'-12-31'
end

if datepart(mm,@var_date_cvt)<>1
begin

if len(datepart(mm,@var_date_cvt)-1) = 1
begin
set @var_cal='0'+convert(varchar(1),(datepart(mm,@var_date_cvt)-1))
set @var_fdate=convert(varchar(4),datepart(yyyy,@var_date_cvt))+'-'+@var_cal+'-01'
set @var_tdate=substring(@var_fdate,1,8)+convert(varchar(2),datepart(dd,(dateadd(mm,1,convert(datetime,@var_fdate))-1)))
end

if len(datepart(mm,@var_date_cvt)-1) = 2
begin
set @var_fdate=convert(varchar(4),datepart(yyyy,@var_date_cvt))+'-'+convert(varchar(2),datepart(mm,@var_date_cvt)-1)+'-01'
set @var_tdate=substring(@var_fdate,1,8)+convert(varchar(2),datepart(dd,(dateadd(mm,1,convert(datetime,@var_fdate))-1)))
end


end

--print @var_fdate
--print @var_tdate
  /*end dates 2P*/
 update a1  set a1.o_Dis_SKU_Count_pur_Ret2=b1.CNT from #tb_output a1,(select distinct Distributor_code,Sold_party,count(*) as 'CNT' from  #Client_DIST_SALE_DATA_3 where gen_date between @var_fdate and @var_tdate group by Distributor_code,Sold_party) b1
   where b1.Distributor_code=a1.o_Dist_name and b1.Sold_party=a1.o_Ret_name

  set @var_date_cvt=convert(datetime,@var_fdate)

  if datepart(mm,@var_date_cvt)=1
begin
set @var_fdate=convert(varchar(4),datepart(yyyy,@var_date_cvt)-1)+'-12-01'
set @var_tdate=convert(varchar(4),datepart(yyyy,@var_date_cvt)-1)+'-12-31'
end

if datepart(mm,@var_date_cvt)<>1
begin

if len(datepart(mm,@var_date_cvt)-1) = 1
begin
set @var_cal='0'+convert(varchar(1),(datepart(mm,@var_date_cvt)-1))
set @var_fdate=convert(varchar(4),datepart(yyyy,@var_date_cvt))+'-'+@var_cal+'-01'
set @var_tdate=substring(@var_fdate,1,8)+convert(varchar(2),datepart(dd,(dateadd(mm,1,convert(datetime,@var_fdate))-1)))
end

if len(datepart(mm,@var_date_cvt)-1) = 2
begin
set @var_fdate=convert(varchar(4),datepart(yyyy,@var_date_cvt))+'-'+convert(varchar(2),datepart(mm,@var_date_cvt)-1)+'-01'
set @var_tdate=substring(@var_fdate,1,8)+convert(varchar(2),datepart(dd,(dateadd(mm,1,convert(datetime,@var_fdate))-1)))
end


end

 --print @var_fdate
-- print @var_tdate

 update #tb_output set o_Dis_SKU_Count_pur_Ret3=( select count( distinct HRJ_SKU)  from #Client_DIST_SALE_DATA_3 where  Distributor_code=@var_dist_name and  sold_party=@var_ret_name and  gen_date between @var_fdate and @var_tdate)         
  from #tb_output   where o_Dist_name=@var_dist_name and o_ret_name=@var_ret_name           
   

   update a1  set a1.o_Dis_SKU_Count_pur_Ret_ALL=b1.CNT from #tb_output a1,(select distinct Distributor_code,Sold_party,count(*) as 'CNT' from  #Client_DIST_SALE_DATA_3 group by Distributor_code,Sold_party) b1
   where b1.Distributor_code=a1.o_Dist_name and b1.Sold_party=a1.o_Ret_name
/* Report  : 2. Retailer range penetration report  */        
        
select o_sno as 'ID', o_Dist_name as 'Distributor Name', o_Ret_name as 'Retailer Name' , o_Dis_SKU_Count_pur_Ret as 'Distinct Count of SKU purchased by Retailer', o_Uni_sku_sold_dist as 'Unique SKUs sold by distributor in the report period', o_ret_range_pent as 'Retailer Range Penetration', o_color as 'Color as per total range penetration',o_Dis_SKU_Count_pur_Ret1 as 'Distinct Count of SKU purchased by Retailer last month',o_Dis_SKU_Count_pur_Ret2 as 'Distinct Count of SKU purchased by Retailer 2nd last month',o_Dis_SKU_Count_pur_Ret3 as 'Distinct Count of SKU purchased by Retailer 3rd last month',o_Dis_SKU_Count_pur_Ret_ALL as 'Distinct Count of SKU purchased by Retailer From Beginning' from #tb_output        
order by o_Dist_name,o_Ret_name        
        
        
end 



GO
/****** Object:  StoredProcedure [dbo].[sp_SA_stg01]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
  
CREATE proc [dbo].[sp_SA_stg01]  
(@skuid nvarchar(50),@balstk float,@var_cnt int,@bal_out float output)  
as  
begin  
-- select * from tb_SA_output  
declare @var_stkout_ind int,@var_sku_rec_cnt int,@var_proc_ind int  
declare @var_skuid_sno int,@var_sl_priority int  
  
set @var_sl_priority=(select top 1 sl_priority from tb_SA_output where skuid=@skuid  and ind01=0 order by sno)  
set @var_stkout_ind=0  
--set @var_sku_rec_cnt=(select count(*) from tb_SA_output where skuid=@skuid  and ind01=0)  
set @var_sku_rec_cnt=@var_cnt  
  
while @var_sku_rec_cnt <> 0  
begin  
  
set @var_skuid_sno=(select top 1 sno from tb_SA_output where skuid=@skuid and ind01=0 order by sno)  
set @var_proc_ind=0  
  
if @balstk > (select exp_35 from tb_SA_output where sno=@var_skuid_sno)  
begin  
update tb_SA_output set alloc_35=exp_35 where sno=@var_skuid_sno  
set @balstk=@balstk-(select exp_35 from tb_SA_output where sno=@var_skuid_sno)  
set @var_proc_ind=1  
end  
  
if (@balstk = (select exp_35 from tb_SA_output where sno=@var_skuid_sno) and  (@var_proc_ind=0))  
begin  
update tb_SA_output set alloc_35=exp_35 where sno=@var_skuid_sno  
set @balstk=0  
set @var_proc_ind=1  
end  
  
if (@balstk < (select exp_35 from tb_SA_output where sno=@var_skuid_sno) and  (@var_proc_ind=0))  
begin  
update tb_SA_output set alloc_35=@balstk where sno=@var_skuid_sno  
set @balstk=0  
set @var_proc_ind=1  
end  
  
update tb_SA_output set ind01=2 where sno=@var_skuid_sno  
/*Chechk Stock out*/  
if @balstk<1  
begin  
set @var_stkout_ind=1  
update tb_SA_output set ind01=3 where skuid=@skuid  
end  
  
if @var_stkout_ind=1  
begin  
set @var_sku_rec_cnt=1  
update tb_SA_output set ind01=1 where skuid=@skuid  
end  
  
set @var_sku_rec_cnt=@var_sku_rec_cnt-1  
end  
  
  
/*Stage 2*/  
update tb_SA_output set ind01=0 where skuid=@skuid and ind01=2  
  
--set @var_sku_rec_cnt=(select count(*) from tb_SA_output where skuid=@skuid and ind01=0)  
set @var_sku_rec_cnt=@var_cnt  
  
while @var_sku_rec_cnt <> 0  
begin  
  
set @var_skuid_sno=(select top 1 sno from tb_SA_output where skuid=@skuid and ind01=0 order by sno)  
set @var_proc_ind=0  
  
if @balstk > (select exp_50 from tb_SA_output where sno=@var_skuid_sno)  
begin  
update tb_SA_output set alloc_50=exp_50 where sno=@var_skuid_sno  
set @balstk=@balstk-(select exp_50 from tb_SA_output where sno=@var_skuid_sno)  
set @var_proc_ind=1  
end  
  
if (@balstk = (select exp_50 from tb_SA_output where sno=@var_skuid_sno) and  (@var_proc_ind=0))  
begin  
update tb_SA_output set alloc_50=exp_50 where sno=@var_skuid_sno  
set @balstk=0  
set @var_proc_ind=1  
end  
  
if (@balstk < (select exp_50 from tb_SA_output where sno=@var_skuid_sno) and  (@var_proc_ind=0))  
begin  
update tb_SA_output set alloc_50=@balstk where sno=@var_skuid_sno  
set @balstk=0  
set @var_proc_ind=1  
end  
  
update tb_SA_output set ind01=2 where sno=@var_skuid_sno  
/*Chechk Stock out*/  
if @balstk<1  
begin  
set @var_stkout_ind=1  
update tb_SA_output set ind01=1 where skuid=@skuid  
end  
  
if @var_stkout_ind=1  
begin  
set @var_sku_rec_cnt=1  
end  
  
set @var_sku_rec_cnt=@var_sku_rec_cnt-1  
end  
  
  
/*Stage 3 Calculations*/  
  
print '3balc'  
print convert(varchar(10),@balstk)  
  
update tb_SA_output set ind01=0 where skuid=@skuid and ind01=2  
  
--set @var_sku_rec_cnt=(select count(*) from tb_SA_output where skuid=@skuid and ind01=0)  
set @var_sku_rec_cnt=@var_cnt  
  
while @var_sku_rec_cnt <> 0  
begin  
  
set @var_skuid_sno=(select top 1 sno from tb_SA_output where skuid=@skuid and ind01=0 order by sno)  
set @var_proc_ind=0  
  
if @balstk > (select exp_75 from tb_SA_output where sno=@var_skuid_sno)  
begin  
update tb_SA_output set alloc_75=exp_75 where sno=@var_skuid_sno  
set @balstk=@balstk-(select exp_75 from tb_SA_output where sno=@var_skuid_sno)  
set @var_proc_ind=1  
end  
  
if (@balstk = (select exp_75 from tb_SA_output where sno=@var_skuid_sno) and  (@var_proc_ind=0))  
begin  
update tb_SA_output set alloc_75=exp_75 where sno=@var_skuid_sno  
set @balstk=0  
set @var_proc_ind=1  
end  
  
if (@balstk < (select exp_75 from tb_SA_output where sno=@var_skuid_sno) and  (@var_proc_ind=0))  
begin  
update tb_SA_output set alloc_75=@balstk where sno=@var_skuid_sno  
set @balstk=0  
set @var_proc_ind=1  
end  
  
update tb_SA_output set ind01=2 where sno=@var_skuid_sno  
/*Chechk Stock out*/  
if @balstk<1  
begin  
set @var_stkout_ind=1  
update tb_SA_output set ind01=1 where skuid=@skuid  
end  
  
if @var_stkout_ind=1  
begin  
set @var_sku_rec_cnt=1  
end  
  
set @var_sku_rec_cnt=@var_sku_rec_cnt-1  
end  
  
  
/*Stage 4 Calculations*/  
  
update tb_SA_output set ind01=0 where skuid=@skuid and ind01=2  
  
--set @var_sku_rec_cnt=(select count(*) from tb_SA_output where skuid=@skuid and ind01=0)  
set @var_sku_rec_cnt=@var_cnt  
  
while @var_sku_rec_cnt <> 0  
begin  
  
set @var_skuid_sno=(select top 1 sno from tb_SA_output where skuid=@skuid and ind01=0 order by sno)  
set @var_proc_ind=0  
  
if @balstk > (select exp_100 from tb_SA_output where sno=@var_skuid_sno)  
begin  
update tb_SA_output set alloc_100=exp_100 where sno=@var_skuid_sno  
set @balstk=@balstk-(select exp_100 from tb_SA_output where sno=@var_skuid_sno)  
set @var_proc_ind=1  
end  
  
if (@balstk = (select exp_100 from tb_SA_output where sno=@var_skuid_sno) and  (@var_proc_ind=0))  
begin  
update tb_SA_output set alloc_100=exp_100 where sno=@var_skuid_sno  
set @balstk=0  
set @var_proc_ind=1  
end  
  
if (@balstk < (select exp_100 from tb_SA_output where sno=@var_skuid_sno) and  (@var_proc_ind=0))  
begin  
update tb_SA_output set alloc_100=@balstk where sno=@var_skuid_sno  
set @balstk=0  
set @var_proc_ind=1  
end  
  
update tb_SA_output set ind01=2 where sno=@var_skuid_sno  
/*Chechk Stock out*/  
if @balstk<1  
begin  
set @var_stkout_ind=1  
update tb_SA_output set ind01=1 where skuid=@skuid  
end  
  
if @var_stkout_ind=1  
begin  
set @var_sku_rec_cnt=1  
end  
  
set @var_sku_rec_cnt=@var_sku_rec_cnt-1  
end  
  
update tb_SA_output set ind01=1 where skuid=@skuid and sl_priority=@var_sl_priority  
  
set @bal_out=@balstk  
end  
  
GO
/****** Object:  StoredProcedure [dbo].[Symphony_spCopyExistingPurchasingOrders]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO



/******************************************/
/****** End Diagnostic Procedures *********/
/******************************************/

/******************************************/
/****** IST Compliance Procedures *********/
/******************************************/

/*****  IS EXECUTED BEFORE THE LOAD & RECALCULATE *****/


CREATE PROCEDURE [dbo].[Symphony_spCopyExistingPurchasingOrders]
AS
BEGIN

	TRUNCATE TABLE Symphony_PurchasingOrderPrev
	INSERT INTO [dbo].[Symphony_PurchasingOrderPrev] (
		ID
		,stockLocationID
		,skuID
		,skuDescription
		,quantity
		,orderID
		,clientOrderID
		,supplierID
		,bufferSize
		,isToOrder
		,orderPrice
		,orderDate
		,promisedDueDate
		,bufferPenetration
		,bufferColor
		,inputSuspicion
		,virtualStockLevel
		,bufferDueDate
		,considered
		,newRedBlack
		,calculateDueDate
		,oldBufferColor
		,neededDate
		,isShipped
		,supplierSkuName
		,note
		,needsMatch
		,purchasingPropertyID1
		,purchasingPropertyID2
		,purchasingPropertyID3
		,purchasingPropertyID4
		,purchasingPropertyID5
		,purchasingPropertyID6
		,purchasingPropertyID7
		,isISTOrder
		)
	SELECT ID
		,stockLocationID
		,skuID
		,skuDescription
		,quantity
		,orderID
		,clientOrderID
		,supplierID
		,bufferSize
		,isToOrder
		,orderPrice
		,orderDate
		,promisedDueDate
		,bufferPenetration
		,bufferColor
		,inputSuspicion
		,virtualStockLevel
		,bufferDueDate
		,considered
		,newRedBlack
		,calculateDueDate
		,oldBufferColor
		,neededDate
		,isShipped
		,supplierSkuName
		,note
		,needsMatch
		,purchasingPropertyID1
		,purchasingPropertyID2
		,purchasingPropertyID3
		,purchasingPropertyID4
		,purchasingPropertyID5
		,purchasingPropertyID6
		,purchasingPropertyID7
		,isISTOrder
	FROM [dbo].[Symphony_PurchasingOrder]
END
GO
/****** Object:  StoredProcedure [dbo].[Symphony_spHandleISTComplianceHistory]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
/*****  IS EXECUTED AFTER THE LOAD & RECALCULATE *****/
CREATE PROCEDURE [dbo].[Symphony_spHandleISTComplianceHistory]
AS
BEGIN
	INSERT INTO [Symphony_ISTComplianceHistory](
		   [orderID]
		  ,[stockLocationID]
		  ,[supplierID]
		  ,[skuID]
		  ,[quantity]
		  ,[orderPrice]
		  ,[orderDate]
		  ,[promisedDueDate]
		  ,[purchasingPropertyID1]
		  ,[purchasingPropertyID2]
		  ,[purchasingPropertyID3]
		  ,[purchasingPropertyID4]
		  ,[purchasingPropertyID5]
		  ,[purchasingPropertyID6]
		  ,[purchasingPropertyID7]
		  ,[closeDate]
		  ,[completionDate]
		  ,[unitsReceived]
		  ,[statusCode])
	SELECT OLD.orderID, 
		   OLD.stockLocationID, 
		   OLD.supplierID,
		   OLD.skuID,
		   OLD.quantity,
		   OLD.orderPrice,
		   OLD.orderDate,
		   OLD.promisedDueDate,
		   OLD.purchasingPropertyID1,
		   OLD.purchasingPropertyID2,
		   OLD.purchasingPropertyID3,
		   OLD.purchasingPropertyID4,
		   OLD.purchasingPropertyID5,
		   OLD.purchasingPropertyID6,
		   OLD.purchasingPropertyID7,
		   GETDATE(),
		   NULL,
		   0,
		   NULL 
	FROM 
	Symphony_PurchasingOrderPrev OLD Left Join Symphony_PurchasingOrder NEW
	ON OLD.orderID = NEW.orderID
	WHERE OLD.isISTOrder = 1 AND NEW.orderID IS NULL

END

GO
/****** Object:  StoredProcedure [dbo].[Symphony_spMtoSkuHistory]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[Symphony_spMtoSkuHistory]
        @stockLocationID INT=-1,
        @updateDate smalldatetime=null, 
        @yesterday smalldatetime=null,
        @doUpdateSkuTable bit=0
AS
BEGIN

    IF (@stockLocationID = -1 or @updateDate is null)
        return

        INSERT INTO Symphony_MTOSkusHistory(skuID, stockLocationID, 
        inventoryAtSite, totalIn, consumption, updateDate, inventoryAtTransit, inventoryAtProduction,
        unitPrice, throughput, tvc, tempInventoryAtSite,
        worstInventoryAtSite, avgInventoryAtSite, inventoryAtSiteUpdatesNum, isDuplicatedRow)
        
        SELECT skuID, @stockLocationID, inventoryAtSite, 0  as totalIn, 0 as consumption, @updateDate,
        inventoryAtTransit, inventoryAtProduction, unitPrice, throughput, tvc, inventoryAtSite as tempInventoryAtSite,
    inventoryAtSite as WorstInventoryAtSite, inventoryAtSite as avgInventoryAtSite ,1, 1
        
        FROM Symphony_MTOSkusHistory S WITH(NOLOCK)
        WHERE S.isDeleted = 0
        AND S.stockLocationID=@stockLocationID
        AND updateDate = @yesterday
        AND not exists (select 1 from Symphony_MTOSkusHistory
                                where skuID = S.skuID and
                                stockLocationID = S.stockLocationID and
                                updateDate = @updateDate)

    IF (@doUpdateSkuTable = 1)
    BEGIN
        update Symphony_MTOSkus set updateDate = @updateDate, totalIN = 0, consumption = 0
         WHERE Symphony_MTOSkus.stockLocationID=@stockLocationID
                and Symphony_MTOSkus.updateDate < @updateDate
    END

END
GO
/****** Object:  StoredProcedure [dbo].[Symphony_spMTOSkusToPurchaseData]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[Symphony_spMTOSkusToPurchaseData] 

AS
BEGIN
       -- SET NOCOUNT ON added to prevent extra result sets from
        -- interfering with SELECT statements.
        SET NOCOUNT ON;

   
        DECLARE @WOEXTENDED TABLE (woID nvarchar(100) NOT NULL
				,clientOrderID nvarchar(50)
                ,skuID INT NOT NULL
                ,plantID INT NOT NULL
                ,dueDate smalldatetime
                ,quantity decimal(18,5)
                ,bufferSize decimal(18,5)
                ,tractionHorizon int NULL
                ,materialReleaseActualDate smalldatetime
                ,materialReleaseScheduledDate smalldatetime)

        INSERT INTO @WOEXTENDED
                        SELECT 
                                WO.woid
                                ,WO.clientOrderID
                                ,WO.skuID
                                ,WO.plantID
                                ,WO.dueDate
                                ,WO.quantity
                                ,ISNULL(WO.bufferSize,CAST(PF.bufferSize as decimal(18,5))) AS bufferSize
                                ,CCR.tractionHorizon
                                ,WO.materialReleaseActualDate
                                ,WO.materialReleaseScheduledDate

                        FROM 
                          Symphony_WorkOrders WO
                          INNER JOIN Symphony_SKUs MSKU ON WO.componentID = '' 
                                                                                                AND WO.isPhantom = 0 
                                                                                                AND WO.orderType != 1 
                                                                                                AND WO.materialReleaseActualDate IS NULL 
                                                                                                AND MSKU.skuID = WO.skuID
                          LEFT JOIN Symphony_StockLocationSkusProductionData SLSPD ON SLSPD.stockLocationID = WO.plantID AND SLSPD.skuID = MSKU.skuID
                          LEFT JOIN Symphony_ProductionFamilies PF ON PF.ID = SLSPD.productionFamily
                          LEFT JOIN Symphony_CCRs CCR ON CCR.plantID = WO.plantID AND CCR.ID = PF.flowDictatorID

        DECLARE @CANDIDATES TABLE (
                ID int IDENTITY(1,1)
                ,woID nvarchar(100) NOT NULL
                ,clientOrderID nvarchar(50)
                ,plantID INT NOT NULL
                ,dueDate smalldatetime
                ,bufferSize decimal(18,5) NULL
                ,tractionHorizon int NULL
                ,materialReleaseActualDate smalldatetime
                ,materialReleaseScheduledDate smalldatetime
                ,quantityNeeded decimal(18,5)
                ,skuID INT NOT NULL
                ,skuName nvarchar(100) NOT NULL
                ,supplierID INT
                ,stockLocationID INT
                ,supplierLeadTime int NOT NULL
                ,timeProtection int NOT NULL
                ,quantityProtection decimal(18,5) NOT NULL
                ,minimumOrderQuantity decimal(18,5) NOT NULL
                ,orderMultiplications decimal(18,5) NOT NULL
                ,lastBatchReplenishment decimal(18,5) NOT NULL
                ,additionalTimeTillArrival int NOT NULL
                ,supplierSKUName nvarchar(100)
                ,mlSlID INT NOT NULL)

        -- Fill temporary table
        INSERT INTO @CANDIDATES
                SELECT 
                        WO.woid
                        ,WO.clientOrderID
                        ,WO.plantID
                        ,WO.dueDate
                        ,WO.bufferSize
                        ,WO.tractionHorizon
                        ,WO.materialReleaseActualDate
                        ,WO.materialReleaseScheduledDate
                        ,BOM.quantity * WO.quantity
                        ,BOM.skuID
                        ,PD.skuName
                        ,PD.supplierID
                        ,PD.stockLocationID
                        ,PD.supplierLeadTime
                        ,PD.timeProtection
                        ,PD.quantityProtection
                        ,PD.minimumOrderQuantity
                        ,PD.orderMultiplications
                        ,PD.lastBatchReplenishment
                        ,PD.additionalTimeTillArrival
                        ,PD.supplierSKUName
                        ,ml.stockLocationID
                FROM 
                  @WOEXTENDED WO
                  INNER JOIN Symphony_SkusBom BOM ON WO.plantID = BOM.plantID AND WO.skuID = BOM.masterSkuID
                  INNER JOIN Symphony_MaterialsStockLocations ML ON BOM.plantID = ML.plantID AND (BOM.skuID = ML.skuID OR ML.skuID = -1)
                  INNER JOIN Symphony_SKUs SKU ON BOM.skuID = SKU.skuID
                  INNER JOIN Symphony_SkuProcurementData PD ON SKU.skuName = PD.skuName AND PD.stockLocationID = ML.stockLocationID AND PD.isDefaultSupplier = 1
                --WHERE
                  --NOT EXISTS (SELECT skuID FROM Symphony_StockLocationSkus WHERE isDeleted = 0 AND skuID = BOM.skuID AND stockLocationID = ML.stockLocationID)
                  --AND NOT EXISTS (SELECT ID FROM Symphony_PurchasingRecommendation WHERE woid = WO.woid AND skuID = BOM.skuID AND stockLocationID = ML.stockLocationID AND (isAwaitsConfirmation = 1 OR isConfirmed = 1 OR isDeleted = 1))
                --ORDER BY WO.woid, WO.plantID, SKU.skuName, ML.skuID DESC

        -- Remove duplicates resulting from multiple matches in the MaterialsStockLocations table
        SELECT * FROM @CANDIDATES C1
                WHERE C1.ID = (SELECT TOP 1 C2.ID FROM @CANDIDATES C2 WHERE C1.woID = C2.woID AND C1.plantID = C2.plantID AND C1.skuID = C2.skuID) and
            NOT EXISTS (SELECT skuID FROM Symphony_StockLocationSkus WHERE isDeleted = 0 AND skuID = C1.skuID AND stockLocationID = c1.stockLocationID) and
            NOT EXISTS (SELECT ID FROM Symphony_PurchasingRecommendation WHERE woid = c1.woid AND skuID = c1.skuID AND stockLocationID = c1.mlSlID AND (isAwaitsConfirmation = 1 OR isConfirmed = 1 OR isDeleted = 1))
        ORDER BY c1.woid, c1.plantID, c1.skuName, c1.skuID DESC

END

IF OBJECT_ID('dbo.Symphony_spMTOSkusToPurchaseData') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE dbo.Symphony_spMTOSkusToPurchaseData >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE dbo.Symphony_spMTOSkusToPurchaseData >>>'
GO
/****** Object:  StoredProcedure [dbo].[Symphony_spMTOSkuToPurchaseData]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[Symphony_spMTOSkuToPurchaseData] 
        @woID NVarChar(50),
        @skuID INT,
        @supplierID INT

AS
BEGIN
        -- SET NOCOUNT ON added to prevent extra result sets from
        -- interfering with SELECT statements.
        SET NOCOUNT ON;

    -- Insert statements for procedure here
        -- Create a temporary table 

        DECLARE @WOEXTENDED TABLE (woID nvarchar(100) NOT NULL
				,clientOrderID nvarchar(50)
                ,skuID INT NOT NULL
                ,plantID INT NOT NULL
                ,dueDate smalldatetime
                ,quantity decimal(18,5)
                ,bufferSize decimal(18,5) NULL
                ,tractionHorizon int NULL
                ,materialReleaseActualDate smalldatetime
                ,materialReleaseScheduledDate smalldatetime)

        INSERT INTO @WOEXTENDED
                        SELECT 
                                WO.woid
								,WO.clientOrderID
                                ,WO.skuID
                                ,WO.plantID
                                ,WO.dueDate
                                ,WO.quantity
                                ,ISNULL(WO.bufferSize,CAST(PF.bufferSize as decimal(18,5))) AS bufferSize
                                ,CCR.tractionHorizon
                                ,WO.materialReleaseActualDate
                                ,WO.materialReleaseScheduledDate

                        FROM 
                          Symphony_WorkOrders WO
                          INNER JOIN Symphony_SKUs MSKU 
                                ON WO.woid = @woId
                                AND WO.componentID = '' 
                                AND WO.isPhantom = 0 
                                AND WO.orderType != 1 
                                AND WO.materialReleaseActualDate IS NULL 
                                AND MSKU.skuID = WO.skuID
                          LEFT JOIN Symphony_StockLocationSkusProductionData SLSPD ON SLSPD.stockLocationID = WO.plantID AND SLSPD.skuID = MSKU.skuID
                          LEFT JOIN Symphony_ProductionFamilies PF ON PF.ID = SLSPD.productionFamily
                          LEFT JOIN Symphony_CCRs CCR ON CCR.plantID = WO.plantID AND CCR.ID = PF.flowDictatorID

        DECLARE @CANDIDATES TABLE (
                ID int IDENTITY(1,1)
                ,woID nvarchar(100) NOT NULL
				,clientOrderID nvarchar(50)
                ,plantID INT NOT NULL
                ,dueDate smalldatetime
                ,bufferSize decimal(18,5) NULL
                ,tractionHorizon int NULL
                ,materialReleaseActualDate smalldatetime
                ,materialReleaseScheduledDate smalldatetime
                ,quantityNeeded decimal(18,5)
                ,skuID INT NOT NULL
                ,skuName nvarchar(100) NOT NULL
                ,supplierID INT
                ,stockLocationID INT
                ,supplierLeadTime int NOT NULL
                ,timeProtection int NOT NULL
                ,quantityProtection decimal(18,5) NOT NULL
                ,minimumOrderQuantity decimal(18,5) NOT NULL
                ,orderMultiplications decimal(18,5) NOT NULL
                ,lastBatchReplenishment decimal(18,5) NOT NULL
                ,additionalTimeTillArrival int NOT NULL
                ,supplierSKUName nvarchar(100))

        -- Fill temporary table
        INSERT INTO @CANDIDATES
                SELECT 
                        WO.woid
						,WO.clientOrderID
                        ,WO.plantID
                        ,WO.dueDate
                        ,WO.bufferSize
                        ,WO.tractionHorizon
                        ,WO.materialReleaseActualDate
                        ,WO.materialReleaseScheduledDate
                        ,BOM.quantity * WO.quantity
                        ,BOM.skuID
                        ,PD.skuName
                        ,PD.supplierID
                        ,PD.stockLocationID
                        ,PD.supplierLeadTime
                        ,PD.timeProtection
                        ,PD.quantityProtection
                        ,PD.minimumOrderQuantity
                        ,PD.orderMultiplications
                        ,PD.lastBatchReplenishment
                        ,PD.additionalTimeTillArrival
                        ,PD.supplierSKUName

                FROM 
                  @WOEXTENDED WO
                  INNER JOIN Symphony_SkusBom BOM ON BOM.skuID = @skuID AND WO.plantID = BOM.plantID AND WO.skuID = BOM.masterSkuID
                  INNER JOIN Symphony_MaterialsStockLocations ML ON BOM.plantID = ML.plantID AND (BOM.skuID = ML.skuID OR ML.skuID = -1)
                  INNER JOIN Symphony_SKUs SKU ON BOM.skuID = SKU.skuID
                  INNER JOIN Symphony_SkuProcurementData PD ON SKU.skuName = PD.skuName AND PD.stockLocationID = ML.stockLocationID AND PD.supplierID = @supplierID
                WHERE
                  NOT EXISTS (SELECT skuID FROM Symphony_StockLocationSkus WHERE isDeleted = 0 AND skuID = BOM.skuID AND stockLocationID = ML.stockLocationID)
                  AND NOT EXISTS (SELECT ID FROM Symphony_PurchasingRecommendation WHERE woid = WO.woid AND skuID = BOM.skuID AND stockLocationID = ML.stockLocationID 
                  AND (isConfirmed = 1 OR isDeleted = 1))
                ORDER BY WO.woid, WO.plantID, SKU.skuName, ML.skuID DESC

        -- Remove duplicates resulting from multiple matches in the MaterialsStockLocations table
        SELECT * FROM @CANDIDATES C1
                WHERE C1.ID = (SELECT TOP 1 C2.ID FROM @CANDIDATES C2 WHERE C1.woID = C2.woID AND C1.plantID = C2.plantID AND C1.skuID = C2.skuID)

END

IF OBJECT_ID('dbo.Symphony_spMTOSkuToPurchaseData') IS NOT NULL
    PRINT '<<< CREATED PROCEDURE dbo.Symphony_spMTOSkuToPurchaseData >>>'
ELSE
    PRINT '<<< FAILED CREATING PROCEDURE dbo.Symphony_spMTOSkuToPurchaseData >>>'
GO
/****** Object:  StoredProcedure [dbo].[Symphony_spProcurementMatching]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO


CREATE PROCEDURE [dbo].[Symphony_spProcurementMatching] 
        -- Add the parameters for the stored procedure here
AS
BEGIN
        -- SET NOCOUNT ON added to prevent extra result sets from
        -- interfering with SELECT statements.
        SET NOCOUNT ON;

	DECLARE @AllMatches TABLE(
		 [id] int IDENTITY(1,1)
		,[OrderID] [int]
		,[RecommendationID] [int]
	);

	DECLARE @MatchedRecommendations TABLE
	(
		[RecommendationID] int
	)
	
	DECLARE @Matches as TABLE(
		 [OrderID] [int]
		,[RecommendationID] [int]
	);

	-- orders
	INSERT INTO @AllMatches
	SELECT
		 PO.ID
		,PR.ID 
	FROM [dbo].[Symphony_PurchasingOrder] PO
	INNER JOIN [dbo].[Symphony_PurchasingRecommendation] PR
	ON PO.clientOrderID = PR.clientOrderID

	INSERT INTO @AllMatches
	SELECT
		 PO.ID
		,PR.ID 
	FROM [dbo].[Symphony_PurchasingOrder] PO
	INNER JOIN [dbo].[Symphony_PurchasingRecommendation] PR
	ON	PR.isDeleted = 0
		AND PO.isToOrder = 1  
		AND PO.needsMatch = 1
		AND PO.skuID = PR.skuID
		AND PO.stockLocationID = PR.stockLocationID
		AND DATEDIFF(DAY, PO.neededDate,PR.needDate) = 0
		AND PO.quantity BETWEEN 0.95 * PR.quantity AND 1.05 * PR.quantity
   where not exists (select PO.ID from @AllMatches a where a.[OrderID] = PO.ID)

	--Stock
	INSERT INTO @AllMatches
	SELECT
		 PO.ID
		,PR.ID 
		--,1
	FROM [dbo].[Symphony_PurchasingOrder] PO
		INNER JOIN [dbo].[Symphony_PurchasingRecommendation] PR ON 
		PO.isToOrder = 0  
		AND PO.needsMatch = 1
		AND PO.skuID = PR.skuID
		AND PO.stockLocationID = PR.stockLocationID
    where not exists (select PO.ID from @AllMatches a where a.[OrderID] = PO.ID)

	DECLARE 
		 @id int
		,@prID int
		,@poID int
		,@maxID int;
		
	SELECT @id = 1, @maxID = COUNT(1) FROM @AllMatches

	WHILE @id <= @maxID
	BEGIN
		SELECT @poID = [orderID], @prID = [RecommendationID] FROM @AllMatches WHERE [id] = @id;
		IF NOT EXISTS( SELECT [RecommendationID] FROM @MatchedRecommendations WHERE [RecommendationID] = @prID)
			BEGIN
				INSERT INTO @Matches SELECT @poID, @prID
				INSERT INTO @MatchedRecommendations SELECT @prID
			END
		SELECT @id = @id + 1	
	END

	UPDATE PO
		SET needsMatch = 0
    FROM [dbo].[Symphony_PurchasingOrder] PO
    INNER JOIN @Matches MPO 
		ON PO.ID = MPO.OrderID 
    WHERE PO.needsMatch = 1 

	UPDATE PR
		SET isConfirmed = 1
	FROM [dbo].[Symphony_PurchasingRecommendation] PR
	INNER JOIN @Matches MPO 
		ON PR.ID = MPO.RecommendationID 
	WHERE PR.orderType = 0

	DELETE FROM PR
    FROM [dbo].[Symphony_PurchasingRecommendation] PR
    INNER JOIN @Matches MPO
		ON PR.ID = MPO.RecommendationID 
    WHERE PR.orderType = 1
END
GO
/****** Object:  StoredProcedure [dbo].[Symphony_spRebuildIndexes]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[Symphony_spRebuildIndexes]
        @dbName nvarchar(100) 
AS
BEGIN
  SET NOCOUNT ON;
  SET QUOTED_IDENTIFIER OFF;

  DECLARE @Table VARCHAR(255)  
  DECLARE @cmd NVARCHAR(500)  
  DECLARE @fillfactor INT 

  SET @fillfactor = 90 

  SET @cmd = 'DECLARE TableCursor CURSOR FOR SELECT table_catalog + ''.'' + table_schema + ''.'' + table_name as tableName   
            FROM ' + @dbName + '.INFORMATION_SCHEMA.TABLES WHERE table_type = ''BASE TABLE'''   

  EXEC (@cmd)  
  OPEN TableCursor   

  FETCH NEXT FROM TableCursor INTO @Table   
   WHILE @@FETCH_STATUS = 0   
   BEGIN   
       print @Table

       SET @cmd = 'SET QUOTED_IDENTIFIER ON; ALTER INDEX ALL ON ' + @Table + ' REBUILD WITH (FILLFACTOR = ' + CONVERT(VARCHAR(3),@fillfactor) + ')'  
       EXEC (@cmd)  

       FETCH NEXT FROM TableCursor INTO @Table   
  END   

  CLOSE TableCursor   
  DEALLOCATE TableCursor  
  
  SET QUOTED_IDENTIFIER OFF;
  
END
GO
/****** Object:  StoredProcedure [dbo].[Symphony_spSalesOrderPastDueDate]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[Symphony_spSalesOrderPastDueDate]
AS
    BEGIN

                CREATE TABLE #countSalesOrder(
                        saleOrderID nvarchar(50) COLLATE database_default,
                        counter int)

                INSERT INTO #countSalesOrder
                select saleOrderID,count(*) as counter
                from Symphony_WorkOrders
                where   dueDate <= getdate() AND
                                saleOrderID IS NOT NULL AND
                                (LOWER(saleOrderID) NOT IN ('','0','null')) AND
                                orderType!=1
                group by saleOrderID

                select count(*) from #countSalesOrder

                drop table #countSalesOrder
    END
GO
/****** Object:  StoredProcedure [dbo].[Symphony_spSetChangeTriggersEnabled]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[Symphony_spSetChangeTriggersEnabled]
	 @ENABLED bit
	,@UPDATE_LAST_CHANGE_DATE bit = 0
AS
BEGIN
	-- SET NOCOUNT ON added to prevent extra result sets from
	-- interfering with SELECT statements.
	SET NOCOUNT ON;
	
	--Get trigger/table name pairs
	DECLARE @PARAMETERS AS TABLE([ID] [int] IDENTITY (0,1),[tableName] [nvarchar](100), [triggerName] [nvarchar](150))
	
	INSERT INTO @PARAMETERS
		SELECT [tableName], [triggerName] 
		FROM [dbo].[Symphony_DataChanged]
		
	DECLARE
		 @COUNT int
		,@INDEX int
		,@TABLE_NAME NVARCHAR(100)
		,@TRIGGER_NAME NVARCHAR(150)
		
	SELECT @COUNT = COUNT(1), @INDEX = 0 FROM @PARAMETERS;
	
	WHILE @INDEX < @COUNT
	BEGIN
	
		SELECT @TABLE_NAME = [tableName], @TRIGGER_NAME = [triggerName] 
			FROM @PARAMETERS
			WHERE [ID] = @INDEX
		
		IF @ENABLED = 0
			EXECUTE('DISABLE TRIGGER [dbo].[' + @TRIGGER_NAME + '] ON [dbo].[' + @TABLE_NAME + ']')
		ELSE
			BEGIN
				EXECUTE('ENABLE TRIGGER [dbo].[' + @TRIGGER_NAME + '] ON [dbo].[' + @TABLE_NAME + ']')
				IF @UPDATE_LAST_CHANGE_DATE = 1
					UPDATE [dbo].[Symphony_DataChanged]
					   SET[lastDataChange] = GETDATE()
			END
		SET @INDEX = @INDEX + 1;
		
	END
	
END
GO
/****** Object:  StoredProcedure [dbo].[Symphony_spSetISTComplianceStatuses]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
/*****  IS EXECUTED AFTER THE LOAD & RECALCULATE AND AFTER Symphony_spHandleISTComplianceHistory *****/
CREATE PROCEDURE [dbo].[Symphony_spSetISTComplianceStatuses] 
      @threshold1 int = 10,
      @threshold2 int = 30
AS
BEGIN

	DECLARE @statusNonCompliant int
	DECLARE @statusOnTime int 
	DECLARE @statusMissingUnits int
	DECLARE @statusLate int

	SELECT @statusNonCompliant = 0
	SELECT @statusOnTime = 1
	SELECT @statusMissingUnits = 2
	SELECT @statusLate = 3


	UPDATE Symphony_ISTComplianceHistory SET statusCode = @statusNonCompliant
	WHERE DATEDIFF(d, isnull(orderDate,closeDate), getdate()) > @threshold2
	AND statusCode IS NULL


	UPDATE H SET H.unitsReceived = T.quantity,
				 H.statusCode = CASE WHEN T.quantity < H.quantity THEN @statusMissingUnits
									 WHEN DATEDIFF(d, isnull(H.orderDate,H.closeDate),T.reportedDate) > @threshold1 THEN @statusLate
									 ELSE @statusOnTime END,
				H.completionDate = T.reportedDate
			  
	FROM 
	Symphony_ISTComplianceHistory H INNER JOIN 
	Symphony_Transactions T ON H.orderID = T.transactionID
	WHERE H.statusCode IS NULL AND T.transactionType = 1

END

GO
/****** Object:  StoredProcedure [dbo].[Symphony_spSLSkuHistory]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[Symphony_spSLSkuHistory]
        @stockLocationID INT=-1,
        @updateDate smalldatetime=null, 
        @yesterday smalldateTime=null,
        @doUpdateSkuTable bit=0
AS
BEGIN

    IF (@stockLocationID = -1 or @updateDate is null)
        return

        INSERT INTO Symphony_StockLocationSkuHistory(skuID, stockLocationID, bufferSize,
        inventoryAtSite, consumption, totalIn, irrConsumption, irrTotalIn,irrInvAtSite,irrInvAtTransit,irrInvAtProduction, updateDate, inventoryAtTransit, inventoryAtProduction,
        unitPrice, throughput, tvc, avgMonthlyConsumption, tempInventoryAtSite, 
        worstInventoryAtSite, avgInventoryAtSite, inventoryAtSiteUpdatesNum, originStockLocation, originSKU, originType,
        bpSite, bpTransit, bpProduction, greenBpLevel, redBpLevel, safetyStock, isDuplicatedRow)

        SELECT skuID, @stockLocationID, bufferSize, inventoryAtSite, 0 as consumption, 0 as totalIn, 0 as irrConsumption, 0 as irrTotalIn, irrInvAtSite, irrInvAtTransit, irrInvAtProduction, @updateDate as updateDate,
        inventoryAtTransit, inventoryAtProduction, unitPrice, throughput, tvc, avgMonthlyConsumption, inventoryAtSite as tempInventoryAtSite,
        inventoryAtSite as worstInventoryAtSite, inventoryAtSite as avgInventoryAtSite ,1, originStockLocation, originSKU,
        originType, bpSite, bpTransit, bpProduction, greenBpLevel, redBpLevel, safetyStock, 1

        FROM Symphony_StockLocationSkuHistory S WITH(NOLOCK)
             
        WHERE S.isDeleted = 0
        AND S.stockLocationID=@stockLocationID
        AND updateDate = @yesterday
        AND not exists (select 1 from Symphony_StockLocationSkuHistory
                                where skuID = S.skuID and
                                stockLocationID = S.stockLocationID and
                                updateDate = @updateDate)

    --IF (@doUpdateSkuTable = 1)
    --BEGIN
    --    update Symphony_StockLocationSkus set updateDate = @updateDate, consumption=0, totalIn=0, irrTotalIn = 0, irrConsumption = 0
    --     WHERE Symphony_StockLocationSkus.stockLocationID=@stockLocationID
    --            and Symphony_StockLocationSkus.updateDate < @updateDate
    --END

END

GO
/****** Object:  StoredProcedure [dbo].[Symphony_spStockLocationsAdjacent]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE PROCEDURE [dbo].[Symphony_spStockLocationsAdjacent]
AS
    BEGIN

        CREATE TABLE #StockLocationsAdjacent(
            stockLocationID1   INT,
            stockLocationID2   INT,
            stockLocationName1 nvarchar(100),
            stockLocationName2 nvarchar(100),
            inD1toD2NotNeeded     bit,
            inD2toD1NotNeeded     bit)

    INSERT INTO     #StockLocationsAdjacent
    SELECT DISTINCT stockLocationID1, stockLocationID2, '', '', inD1toD2NotNeeded, inD2toD1NotNeeded
    FROM            Symphony_StockLocationsAdjacent, Symphony_StockLocations
    WHERE           stockLocationID1=stockLocationID OR stockLocationID2=stockLocationID

    UPDATE      #StockLocationsAdjacent
    SET         stockLocationName1=stockLocationName
    FROM        Symphony_StockLocations
        WHERE   stockLocationID1=stockLocationID

    UPDATE      #StockLocationsAdjacent
    SET         stockLocationName2=stockLocationName
    FROM        Symphony_StockLocations
        WHERE   stockLocationID2=stockLocationID

    SELECT * from #StockLocationsAdjacent

    DROP TABLE #StockLocationsAdjacent

END
GO
/****** Object:  Trigger [dbo].[AfterChange_AssortmentGroups]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE TRIGGER [dbo].[AfterChange_AssortmentGroups] ON [dbo].[Symphony_AssortmentGroups]
					   AFTER INSERT,DELETE,UPDATE
					AS
					BEGIN
						UPDATE [dbo].[Symphony_DataChanged]
						SET [lastDataChange] = GETDATE()
						WHERE [tableName] = 'Symphony_AssortmentGroups';
					END
GO
ALTER TABLE [dbo].[Symphony_AssortmentGroups] ENABLE TRIGGER [AfterChange_AssortmentGroups]
GO
/****** Object:  Trigger [dbo].[AfterInsertDelete_Aux_RetailFamilyStockLocation]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE TRIGGER [dbo].[AfterInsertDelete_Aux_RetailFamilyStockLocation] ON [dbo].[Symphony_Aux_RetailFamilyStockLocation]
					   AFTER INSERT,DELETE
					AS
					BEGIN
						UPDATE [dbo].[Symphony_DataChanged]
						SET [lastDataChange] = GETDATE()
						WHERE [tableName] = 'Symphony_Aux_RetailFamilyStockLocation';
					END
GO
ALTER TABLE [dbo].[Symphony_Aux_RetailFamilyStockLocation] ENABLE TRIGGER [AfterInsertDelete_Aux_RetailFamilyStockLocation]
GO
/****** Object:  Trigger [dbo].[AfterInsertDelete_Aux_RetailStockLocationSku]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE TRIGGER [dbo].[AfterInsertDelete_Aux_RetailStockLocationSku] ON [dbo].[Symphony_Aux_RetailStockLocationSku]
					   AFTER INSERT,DELETE
					AS
					BEGIN
						UPDATE [dbo].[Symphony_DataChanged]
						SET [lastDataChange] = GETDATE()
						WHERE [tableName] = 'Symphony_Aux_RetailStockLocationSku';
					END
GO
ALTER TABLE [dbo].[Symphony_Aux_RetailStockLocationSku] ENABLE TRIGGER [AfterInsertDelete_Aux_RetailStockLocationSku]
GO
/****** Object:  Trigger [dbo].[AfterChange_CatalogSkus]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE TRIGGER [dbo].[AfterChange_CatalogSkus] ON [dbo].[Symphony_CatalogSkus]
					   AFTER INSERT,DELETE,UPDATE
					AS
					BEGIN
						UPDATE [dbo].[Symphony_DataChanged]
						SET [lastDataChange] = GETDATE()
						WHERE [tableName] = 'Symphony_CatalogSkus';
					END
GO
ALTER TABLE [dbo].[Symphony_CatalogSkus] ENABLE TRIGGER [AfterChange_CatalogSkus]
GO
/****** Object:  Trigger [dbo].[AfterChange_Categories]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE TRIGGER [dbo].[AfterChange_Categories] ON [dbo].[Symphony_Categories]
					   AFTER INSERT,DELETE,UPDATE
					AS
					BEGIN
						UPDATE [dbo].[Symphony_DataChanged]
						SET [lastDataChange] = GETDATE()
						WHERE [tableName] = 'Symphony_Categories';
					END
GO
ALTER TABLE [dbo].[Symphony_Categories] ENABLE TRIGGER [AfterChange_Categories]
GO
/****** Object:  Trigger [dbo].[AfterChange_CCRs]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE TRIGGER [dbo].[AfterChange_CCRs] ON [dbo].[Symphony_CCRs]
					   AFTER INSERT,DELETE,UPDATE
					AS
					BEGIN
						UPDATE [dbo].[Symphony_DataChanged]
						SET [lastDataChange] = GETDATE()
						WHERE [tableName] = 'Symphony_CCRs';
					END
GO
ALTER TABLE [dbo].[Symphony_CCRs] ENABLE TRIGGER [AfterChange_CCRs]
GO
/****** Object:  Trigger [dbo].[AfterChange_DisplayGroups]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE TRIGGER [dbo].[AfterChange_DisplayGroups] ON [dbo].[Symphony_DisplayGroups]
					   AFTER INSERT,DELETE,UPDATE
					AS
					BEGIN
						UPDATE [dbo].[Symphony_DataChanged]
						SET [lastDataChange] = GETDATE()
						WHERE [tableName] = 'Symphony_DisplayGroups';
					END
GO
ALTER TABLE [dbo].[Symphony_DisplayGroups] ENABLE TRIGGER [AfterChange_DisplayGroups]
GO
/****** Object:  Trigger [dbo].[AfterChange_DPLM_Policies]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE TRIGGER [dbo].[AfterChange_DPLM_Policies] ON [dbo].[Symphony_DPLM_Policies]
					   AFTER INSERT,DELETE,UPDATE
					AS
					BEGIN
						UPDATE [dbo].[Symphony_DataChanged]
						SET [lastDataChange] = GETDATE()
						WHERE [tableName] = 'Symphony_DPLM_Policies';
					END
GO
ALTER TABLE [dbo].[Symphony_DPLM_Policies] ENABLE TRIGGER [AfterChange_DPLM_Policies]
GO
/****** Object:  Trigger [dbo].[AfterChange_FileStructure]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE TRIGGER [dbo].[AfterChange_FileStructure] ON [dbo].[Symphony_FileStructure]
					   AFTER INSERT,DELETE,UPDATE
					AS
					BEGIN
						UPDATE [dbo].[Symphony_DataChanged]
						SET [lastDataChange] = GETDATE()
						WHERE [tableName] = 'Symphony_FileStructure';
					END
GO
ALTER TABLE [dbo].[Symphony_FileStructure] ENABLE TRIGGER [AfterChange_FileStructure]
GO
/****** Object:  Trigger [dbo].[AfterChange_FileStructureGlobal]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE TRIGGER [dbo].[AfterChange_FileStructureGlobal] ON [dbo].[Symphony_FileStructureGlobal]
					   AFTER INSERT,DELETE,UPDATE
					AS
					BEGIN
						UPDATE [dbo].[Symphony_DataChanged]
						SET [lastDataChange] = GETDATE()
						WHERE [tableName] = 'Symphony_FileStructureGlobal';
					END
GO
ALTER TABLE [dbo].[Symphony_FileStructureGlobal] ENABLE TRIGGER [AfterChange_FileStructureGlobal]
GO
/****** Object:  Trigger [dbo].[AfterChange_Symphony_Globals]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE TRIGGER [dbo].[AfterChange_Symphony_Globals] ON [dbo].[Symphony_Globals]
					   AFTER INSERT,DELETE,UPDATE
					AS
					BEGIN
						UPDATE [dbo].[Symphony_DataChanged]
						SET [lastDataChange] = GETDATE()
						WHERE [tableName] = 'Symphony_Globals';
					END
GO
ALTER TABLE [dbo].[Symphony_Globals] ENABLE TRIGGER [AfterChange_Symphony_Globals]
GO
/****** Object:  Trigger [dbo].[Symphony_VersionChange]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE TRIGGER [dbo].[Symphony_VersionChange] 
   ON  [dbo].[Symphony_Globals] 
   AFTER UPDATE
AS 
BEGIN
    DECLARE @nOldValue nvarchar(200),@nNewValue nvarchar(200)

	IF UPDATE([flag_value])
	BEGIN
        SELECT @nOldValue=b.flag_value, @nNewValue=a.flag_value 
        FROM inserted a, deleted b where a.flag_name = b.flag_name and a.flag_name = 'appVersion'

        IF @nOldValue != @nNewValue
        BEGIN
           insert into Symphony_DataLog (ConvertDate, ConvertFrom, ConvertTo) 
           Values (getdate(), @nOldValue, @nNewValue)
        END
	END
END
GO
ALTER TABLE [dbo].[Symphony_Globals] ENABLE TRIGGER [Symphony_VersionChange]
GO
/****** Object:  Trigger [dbo].[AfterChange_LocationAssortmentGroups]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE TRIGGER [dbo].[AfterChange_LocationAssortmentGroups] ON [dbo].[Symphony_LocationAssortmentGroups]
					   AFTER INSERT,DELETE,UPDATE
					AS
					BEGIN
						UPDATE [dbo].[Symphony_DataChanged]
						SET [lastDataChange] = GETDATE()
						WHERE [tableName] = 'Symphony_LocationAssortmentGroups';
					END
GO
ALTER TABLE [dbo].[Symphony_LocationAssortmentGroups] ENABLE TRIGGER [AfterChange_LocationAssortmentGroups]
GO
/****** Object:  Trigger [dbo].[AfterChange_LocationCatalogSkus]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE TRIGGER [dbo].[AfterChange_LocationCatalogSkus] ON [dbo].[Symphony_LocationCatalogSkus]
					   AFTER INSERT,DELETE,UPDATE
					AS
					BEGIN
						UPDATE [dbo].[Symphony_DataChanged]
						SET [lastDataChange] = GETDATE()
						WHERE [tableName] = 'Symphony_LocationCatalogSkus';
					END
GO
ALTER TABLE [dbo].[Symphony_LocationCatalogSkus] ENABLE TRIGGER [AfterChange_LocationCatalogSkus]
GO
/****** Object:  Trigger [dbo].[AfterChange_LocationCategories]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE TRIGGER [dbo].[AfterChange_LocationCategories] ON [dbo].[Symphony_LocationCategories]
					   AFTER INSERT,DELETE,UPDATE
					AS
					BEGIN
						UPDATE [dbo].[Symphony_DataChanged]
						SET [lastDataChange] = GETDATE()
						WHERE [tableName] = 'Symphony_LocationCategories';
					END
GO
ALTER TABLE [dbo].[Symphony_LocationCategories] ENABLE TRIGGER [AfterChange_LocationCategories]
GO
/****** Object:  Trigger [dbo].[AfterChange_LocationDisplayGroups]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE TRIGGER [dbo].[AfterChange_LocationDisplayGroups] ON [dbo].[Symphony_LocationDisplayGroups]
					   AFTER INSERT,DELETE,UPDATE
					AS
					BEGIN
						UPDATE [dbo].[Symphony_DataChanged]
						SET [lastDataChange] = GETDATE()
						WHERE [tableName] = 'Symphony_LocationDisplayGroups';
					END
GO
ALTER TABLE [dbo].[Symphony_LocationDisplayGroups] ENABLE TRIGGER [AfterChange_LocationDisplayGroups]
GO
/****** Object:  Trigger [dbo].[AfterChange_LocationFamilyAttributes]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE TRIGGER [dbo].[AfterChange_LocationFamilyAttributes] ON [dbo].[Symphony_LocationFamilyAttributes]
					   AFTER INSERT,DELETE,UPDATE
					AS
					BEGIN
						UPDATE [dbo].[Symphony_DataChanged]
						SET [lastDataChange] = GETDATE()
						WHERE [tableName] = 'Symphony_LocationFamilyAttributes';
					END
GO
ALTER TABLE [dbo].[Symphony_LocationFamilyAttributes] ENABLE TRIGGER [AfterChange_LocationFamilyAttributes]
GO
/****** Object:  Trigger [dbo].[AfterChange_MasterSkus]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE TRIGGER [dbo].[AfterChange_MasterSkus] ON [dbo].[Symphony_MasterSkus]
					   AFTER INSERT,DELETE,UPDATE
					AS
					BEGIN
						UPDATE [dbo].[Symphony_DataChanged]
						SET [lastDataChange] = GETDATE()
						WHERE [tableName] = 'Symphony_MasterSkus';
					END
GO
ALTER TABLE [dbo].[Symphony_MasterSkus] ENABLE TRIGGER [AfterChange_MasterSkus]
GO
/****** Object:  Trigger [dbo].[AfterChange_McrEvents]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE TRIGGER [dbo].[AfterChange_McrEvents] ON [dbo].[Symphony_McrEvents]
					   AFTER INSERT,DELETE,UPDATE
					AS
					BEGIN
						UPDATE [dbo].[Symphony_DataChanged]
						SET [lastDataChange] = GETDATE()
						WHERE [tableName] = 'Symphony_McrEvents';
					END
GO
ALTER TABLE [dbo].[Symphony_McrEvents] ENABLE TRIGGER [AfterChange_McrEvents]
GO
/****** Object:  Trigger [dbo].[AfterInsertDelete_McrEvents]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE TRIGGER [dbo].[AfterInsertDelete_McrEvents] ON [dbo].[Symphony_McrEvents]
					   AFTER INSERT,DELETE
					AS
					BEGIN
						UPDATE [dbo].[Symphony_DataChanged]
						SET [lastDataChange] = GETDATE()
						WHERE [tableName] = 'Symphony_McrEvents';
					END
GO
ALTER TABLE [dbo].[Symphony_McrEvents] ENABLE TRIGGER [AfterInsertDelete_McrEvents]
GO
/****** Object:  Trigger [dbo].[AfterInsertDelete_MTOSkus]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE TRIGGER [dbo].[AfterInsertDelete_MTOSkus] ON [dbo].[Symphony_MTOSkus]
					   AFTER INSERT,DELETE
					AS
					BEGIN
						UPDATE [dbo].[Symphony_DataChanged]
						SET [lastDataChange] = GETDATE()
						WHERE [tableName] = 'Symphony_MTOSkus';
					END
GO
ALTER TABLE [dbo].[Symphony_MTOSkus] ENABLE TRIGGER [AfterInsertDelete_MTOSkus]
GO
/****** Object:  Trigger [dbo].[AfterUpdate_MTOSkus]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE TRIGGER [dbo].[AfterUpdate_MTOSkus] 
		   ON  [dbo].[Symphony_MTOSkus] 
		   AFTER UPDATE
		AS 
		BEGIN
			IF UPDATE([isDeleted])
			BEGIN
				UPDATE [dbo].[Symphony_DataChanged]
				SET [lastDataChange] = GETDATE()
				WHERE [tableName] = 'Symphony_MTOSkus'
				OR [tableName] = 'Symphony_MTOSkus';
			END
		END
GO
ALTER TABLE [dbo].[Symphony_MTOSkus] ENABLE TRIGGER [AfterUpdate_MTOSkus]
GO
/****** Object:  Trigger [dbo].[AfterChange_NPISets]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE TRIGGER [dbo].[AfterChange_NPISets] ON [dbo].[Symphony_NPISets]
					   AFTER INSERT,DELETE,UPDATE
					AS
					BEGIN
						UPDATE [dbo].[Symphony_DataChanged]
						SET [lastDataChange] = GETDATE()
						WHERE [tableName] = 'Symphony_NPISets';
					END
GO
ALTER TABLE [dbo].[Symphony_NPISets] ENABLE TRIGGER [AfterChange_NPISets]
GO
/****** Object:  Trigger [dbo].[AfterChange_ProductionCalendarNonWorkingDays]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE TRIGGER [dbo].[AfterChange_ProductionCalendarNonWorkingDays] ON [dbo].[Symphony_ProductionCalendarNonWorkingDays]
					   AFTER INSERT,DELETE,UPDATE
					AS
					BEGIN
						UPDATE [dbo].[Symphony_DataChanged]
						SET [lastDataChange] = GETDATE()
						WHERE [tableName] = 'Symphony_ProductionCalendarNonWorkingDays';
					END
GO
ALTER TABLE [dbo].[Symphony_ProductionCalendarNonWorkingDays] ENABLE TRIGGER [AfterChange_ProductionCalendarNonWorkingDays]
GO
/****** Object:  Trigger [dbo].[AfterChange_ProductionWorkCenterGroup]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE TRIGGER [dbo].[AfterChange_ProductionWorkCenterGroup] ON [dbo].[Symphony_ProductionWorkCenterGroup]
					   AFTER INSERT,DELETE,UPDATE
					AS
					BEGIN
						UPDATE [dbo].[Symphony_DataChanged]
						SET [lastDataChange] = GETDATE()
						WHERE [tableName] = 'Symphony_ProductionWorkCenterGroup';
					END
GO
ALTER TABLE [dbo].[Symphony_ProductionWorkCenterGroup] ENABLE TRIGGER [AfterChange_ProductionWorkCenterGroup]
GO
/****** Object:  Trigger [dbo].[AfterChange_RetailAgDgConnection]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE TRIGGER [dbo].[AfterChange_RetailAgDgConnection] ON [dbo].[Symphony_RetailAgDgConnection]
					   AFTER INSERT,DELETE,UPDATE
					AS
					BEGIN
						UPDATE [dbo].[Symphony_DataChanged]
						SET [lastDataChange] = GETDATE()
						WHERE [tableName] = 'Symphony_RetailAgDgConnection';
					END
GO
ALTER TABLE [dbo].[Symphony_RetailAgDgConnection] ENABLE TRIGGER [AfterChange_RetailAgDgConnection]
GO
/****** Object:  Trigger [dbo].[AfterChange_RetailFamilyAgConnection]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE TRIGGER [dbo].[AfterChange_RetailFamilyAgConnection] ON [dbo].[Symphony_RetailFamilyAgConnection]
					   AFTER INSERT,DELETE,UPDATE
					AS
					BEGIN
						UPDATE [dbo].[Symphony_DataChanged]
						SET [lastDataChange] = GETDATE()
						WHERE [tableName] = 'Symphony_RetailFamilyAgConnection';
					END
GO
ALTER TABLE [dbo].[Symphony_RetailFamilyAgConnection] ENABLE TRIGGER [AfterChange_RetailFamilyAgConnection]
GO
/****** Object:  Trigger [dbo].[AfterChange_SkuFamilies]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE TRIGGER [dbo].[AfterChange_SkuFamilies] ON [dbo].[Symphony_SkuFamilies]
					   AFTER INSERT,DELETE,UPDATE
					AS
					BEGIN
						UPDATE [dbo].[Symphony_DataChanged]
						SET [lastDataChange] = GETDATE()
						WHERE [tableName] = 'Symphony_SkuFamilies';
					END
GO
ALTER TABLE [dbo].[Symphony_SkuFamilies] ENABLE TRIGGER [AfterChange_SkuFamilies]
GO
/****** Object:  Trigger [dbo].[AfterChange_SkuFamilyMembers]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE TRIGGER [dbo].[AfterChange_SkuFamilyMembers] ON [dbo].[Symphony_SkuFamilyMembers]
					   AFTER INSERT,DELETE,UPDATE
					AS
					BEGIN
						UPDATE [dbo].[Symphony_DataChanged]
						SET [lastDataChange] = GETDATE()
						WHERE [tableName] = 'Symphony_SkuFamilyMembers';
					END
GO
ALTER TABLE [dbo].[Symphony_SkuFamilyMembers] ENABLE TRIGGER [AfterChange_SkuFamilyMembers]
GO
/****** Object:  Trigger [dbo].[AfterChange_SkuGroups]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE TRIGGER [dbo].[AfterChange_SkuGroups] ON [dbo].[Symphony_SkuGroups]
					   AFTER INSERT,DELETE,UPDATE
					AS
					BEGIN
						UPDATE [dbo].[Symphony_DataChanged]
						SET [lastDataChange] = GETDATE()
						WHERE [tableName] = 'Symphony_SkuGroups';
					END
GO
ALTER TABLE [dbo].[Symphony_SkuGroups] ENABLE TRIGGER [AfterChange_SkuGroups]
GO
/****** Object:  Trigger [dbo].[Symphony_SkuLifeCycleChange]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE TRIGGER [dbo].[Symphony_SkuLifeCycleChange] 
   ON  [dbo].[Symphony_SkuLifeCycleEvents] 
   AFTER UPDATE
AS 
BEGIN
    DECLARE @sEventID nvarchar(200),@nNewValue int

	IF UPDATE([eventStatus])
	BEGIN
        SELECT @nNewValue = a.eventStatus, @sEventID = a.eventID FROM inserted a

        UPDATE  Symphony_ClientOrder SET skuLifeCycleStatus = @nNewValue WHERE clientOrderID = @sEventID
	END
END
GO
ALTER TABLE [dbo].[Symphony_SkuLifeCycleEvents] ENABLE TRIGGER [Symphony_SkuLifeCycleChange]
GO
/****** Object:  Trigger [dbo].[Symphony_SkuLifeCycleDelete]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO

CREATE TRIGGER [dbo].[Symphony_SkuLifeCycleDelete] 
   ON  [dbo].[Symphony_SkuLifeCycleEvents] 
   AFTER DELETE
AS 
BEGIN
    DECLARE @sEventID nvarchar(200)

	
	BEGIN
        SELECT  @sEventID = a.eventID FROM deleted a

        DELETE FROM Symphony_ClientOrder WHERE clientOrderID = @sEventID
	END
END
GO
ALTER TABLE [dbo].[Symphony_SkuLifeCycleEvents] ENABLE TRIGGER [Symphony_SkuLifeCycleDelete]
GO
/****** Object:  Trigger [dbo].[AfterChange_SKUs]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE TRIGGER [dbo].[AfterChange_SKUs] ON [dbo].[Symphony_SKUs]
					   AFTER INSERT,DELETE,UPDATE
					AS
					BEGIN
						UPDATE [dbo].[Symphony_DataChanged]
						SET [lastDataChange] = GETDATE()
						WHERE [tableName] = 'Symphony_SKUs';
					END
GO
ALTER TABLE [dbo].[Symphony_SKUs] ENABLE TRIGGER [AfterChange_SKUs]
GO
/****** Object:  Trigger [dbo].[AfterChange_SKUsPropertyItems]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE TRIGGER [dbo].[AfterChange_SKUsPropertyItems] ON [dbo].[Symphony_SKUsPropertyItems]
					   AFTER INSERT,DELETE,UPDATE
					AS
					BEGIN
						UPDATE [dbo].[Symphony_DataChanged]
						SET [lastDataChange] = GETDATE()
						WHERE [tableName] = 'Symphony_SKUsPropertyItems';
					END
GO
ALTER TABLE [dbo].[Symphony_SKUsPropertyItems] ENABLE TRIGGER [AfterChange_SKUsPropertyItems]
GO
/****** Object:  Trigger [dbo].[AfterChange_StockLocationPropertyItems]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE TRIGGER [dbo].[AfterChange_StockLocationPropertyItems] ON [dbo].[Symphony_StockLocationPropertyItems]
					   AFTER INSERT,DELETE,UPDATE
					AS
					BEGIN
						UPDATE [dbo].[Symphony_DataChanged]
						SET [lastDataChange] = GETDATE()
						WHERE [tableName] = 'Symphony_StockLocationPropertyItems';
					END
GO
ALTER TABLE [dbo].[Symphony_StockLocationPropertyItems] ENABLE TRIGGER [AfterChange_StockLocationPropertyItems]
GO
/****** Object:  Trigger [dbo].[AfterChange_StockLocations]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE TRIGGER [dbo].[AfterChange_StockLocations] ON [dbo].[Symphony_StockLocations]
					   AFTER INSERT,DELETE,UPDATE
					AS
					BEGIN
						UPDATE [dbo].[Symphony_DataChanged]
						SET [lastDataChange] = GETDATE()
						WHERE [tableName] = 'Symphony_StockLocations';
					END
GO
ALTER TABLE [dbo].[Symphony_StockLocations] ENABLE TRIGGER [AfterChange_StockLocations]
GO
/****** Object:  Trigger [dbo].[AfterInsertDelete_StockLocationSkus]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE TRIGGER [dbo].[AfterInsertDelete_StockLocationSkus] ON [dbo].[Symphony_StockLocationSkus]
					   AFTER INSERT,DELETE
					AS
					BEGIN
						UPDATE [dbo].[Symphony_DataChanged]
						SET [lastDataChange] = GETDATE()
						WHERE [tableName] = 'Symphony_StockLocationSkus';
					END
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ENABLE TRIGGER [AfterInsertDelete_StockLocationSkus]
GO
/****** Object:  Trigger [dbo].[AfterUpdate_StockLocationSkus]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE TRIGGER [dbo].[AfterUpdate_StockLocationSkus] 
		   ON  [dbo].[Symphony_StockLocationSkus] 
		   AFTER UPDATE
		AS 
		BEGIN
			IF UPDATE([isDeleted])	BEGIN
			
				DECLARE @isChanged bit = 0
				
				SELECT TOP 1
					@isChanged = CONVERT(bit, 1)
				FROM deleted 
				INNER JOIN inserted 
					ON inserted.skuID =deleted.skuID
					AND inserted.stockLocationID = deleted.stockLocationID
					AND inserted.[isDeleted] <> deleted.[isDeleted]
				
				IF @isChanged = 1
					UPDATE [dbo].[Symphony_DataChanged]
					SET [lastDataChange] = GETDATE()
					WHERE [tableName] = 'Symphony_StockLocationSkus'
					OR [tableName] = 'Symphony_SKUs';
				
			END
			ELSE IF UPDATE([originStockLocation])
			BEGIN
				UPDATE [dbo].[Symphony_DataChanged]
				SET [lastDataChange] = GETDATE()
				WHERE [tableName] = 'Symphony_StockLocationSkus' AND [type] = 2;
			END
		END
GO
ALTER TABLE [dbo].[Symphony_StockLocationSkus] ENABLE TRIGGER [AfterUpdate_StockLocationSkus]
GO
/****** Object:  Trigger [dbo].[AfterChange_TransparentLocations]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE TRIGGER [dbo].[AfterChange_TransparentLocations] ON [dbo].[Symphony_TransparentLocations]
					   AFTER INSERT,DELETE,UPDATE
					AS
					BEGIN
						UPDATE [dbo].[Symphony_DataChanged]
						SET [lastDataChange] = GETDATE()
						WHERE [tableName] = 'Symphony_TransparentLocations';
					END
GO
ALTER TABLE [dbo].[Symphony_TransparentLocations] ENABLE TRIGGER [AfterChange_TransparentLocations]
GO
/****** Object:  Trigger [dbo].[AfterChange_Symphony_WorkOrders]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE TRIGGER [dbo].[AfterChange_Symphony_WorkOrders] ON [dbo].[Symphony_WorkOrders]
					   AFTER INSERT,DELETE,UPDATE
					AS
					BEGIN
						UPDATE [dbo].[Symphony_DataChanged]
						SET [lastDataChange] = GETDATE()
						WHERE [tableName] = 'Symphony_WorkOrders';
					END
GO
ALTER TABLE [dbo].[Symphony_WorkOrders] ENABLE TRIGGER [AfterChange_Symphony_WorkOrders]
GO
/****** Object:  Trigger [dbo].[AfterChange_WorkOrdersPropertyItems]    Script Date: 4/18/2024 3:51:52 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER OFF
GO
CREATE TRIGGER [dbo].[AfterChange_WorkOrdersPropertyItems] ON [dbo].[Symphony_WorkOrdersPropertyItems]
					   AFTER INSERT,DELETE,UPDATE
					AS
					BEGIN
						UPDATE [dbo].[Symphony_DataChanged]
						SET [lastDataChange] = GETDATE()
						WHERE [tableName] = 'Symphony_WorkOrdersPropertyItems';
					END
GO
ALTER TABLE [dbo].[Symphony_WorkOrdersPropertyItems] ENABLE TRIGGER [AfterChange_WorkOrdersPropertyItems]
GO
USE [master]
GO
ALTER DATABASE [SYMPHONY_HRJ] SET  READ_WRITE 
GO
