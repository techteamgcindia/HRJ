cd "C:\Program Files\Symphony\Symphony Auto Load\"
AutoLoadFiles.exe -DB=Symphony_HRJ -BACKUP=E:\SymphonyData\Backup\BackupSYMPHONY_HRJ.bak


forfiles /p "E:\SymphonyData\Backup" /s /m *.* /c "cmd /c Del @path" /d -7