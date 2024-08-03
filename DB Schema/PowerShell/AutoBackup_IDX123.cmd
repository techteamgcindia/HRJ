cd "C:\Program Files\Symphony\Symphony Auto Load\"
AutoLoadFiles.exe -DB=Symphony_HRJ -BACKUP=Z:\SymphonyData\Backup\BackupSYMPHONY_HRJ.bak


forfiles /p "Z:\SymphonyData\Backup" /s /m *.* /c "cmd /c Del @path" /d -7


cd "C:\ProgramFiles\Symphony\SymphonyAutoLoad\"
AutoLoadFiles.exe -DB=Symphony_HRJ -IDX