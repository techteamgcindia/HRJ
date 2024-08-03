move "E:\SymphonyData\HistoryFolder\"*.* "E:\SymphonyData\History_Folder_Archive"

sqlcmd -S localhost -U sa -P sa@123 -d Symphony_HRJ -Q "EXEC [dbo].[Client_SP_NewStatus]"

move "E:\SymphonyData\InputFolder\"Status_site_2*.* "E:\SymphonyData\InputFolder\Archive\"

sqlcmd -S localhost -U sa -P sa@123 -d Symphony_HRJ -Q "EXEC [dbo].[Client_SP_Site_Qty_Reset_newD20]"


sqlcmd -S localhost -U sa -P sa@123 -d Symphony_HRJ -Q "EXEC [dbo].[Client_SP_NewTransit]"

move "E:\SymphonyData\InputFolder\"STATUS_TRANSIT_Z*.* "E:\SymphonyData\InputFolder\Archive\"


sqlcmd -S localhost -U sa -P sa@123 -d Symphony_HRJ -Q "EXEC [dbo].[Client_SP_Transit_Qty_Reset_newD20]"


sqlcmd -S localhost -U sa -P sa@123 -d Symphony_HRJ -Q "EXEC [dbo].[Client_SP_PARENT_CHILD_BEFORE_LNR]"


sqlcmd -S localhost -U sa -P sa@123 -d Symphony_HRJ -Q "EXEC [dbo].[Client_SP_PARENT_CHILD_BEFORE_LNR_1]"


sqlcmd -S localhost -U sa -P sa@123 -d Symphony_HRJ -Q "EXEC [dbo].[sp_EquivSKUCombineTransactions]"

move "E:\SymphonyData\InputFolder\"Transactions_2*.* "E:\SymphonyData\InputFolder\Archive\"
move "E:\SymphonyData\InputFolder\"Transactions_R*.* "E:\SymphonyData\InputFolder\Archive\"

sqlcmd -S localhost -U sa -P sa@123 -d Symphony_HRJ -Q "EXEC [dbo].[Client_SP_PRODUCTION_FILE_CONSOLIDATION]"
move "E:\SymphonyData\InputFolder\"PRODUCTION_*.* "E:\SymphonyData\InputFolder\Archive\"


sqlcmd -S localhost -U sa -P sa@123 -d Symphony_HRJ -Q "EXEC [dbo].[Client_SP_Location_conversion_UpdateSKUs_Pendi]"
move "E:\SymphonyData\InputFolder\"UPDATESKUS_HRJ_Pendi*.* "E:\SymphonyData\InputFolder\Archive\"

cd "C:\Program Files\Symphony\Symphony Auto Load\" 
AutoLoadFiles.exe -DB=SYMPHONY_HRJ
