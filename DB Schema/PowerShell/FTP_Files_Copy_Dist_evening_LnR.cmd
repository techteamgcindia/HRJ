move "E:\SymphonyData\HistoryFolder\"*.* "E:\SymphonyData\History_Folder_Archive"

sqlcmd -S localhost -U sa -P sa@123 -d Symphony_HRJ -Q "EXEC [dbo].[Client_SP_SFTP_Filecopy_Transaction]"


sqlcmd -S localhost -U sa -P sa@123 -d Symphony_HRJ -Q "EXEC [dbo].[Client_SP_SFTP_Filecopy_status]"


move "E:\SymphonyData\SFTP_files\"*.* "E:\SymphonyData\SFTP_files\Archive\"


cd "C:\Program Files\Symphony\Symphony Auto Load\" 
AutoLoadFiles.exe -DB=SYMPHONY_HRJ

