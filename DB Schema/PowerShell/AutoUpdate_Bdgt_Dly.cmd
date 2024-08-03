cd\
cd /D "C:\Program Files\Symphony\Symphony Auto Load\"
sqlcmd -Usa -Psa@123 -SHRJPOWERBI -dSymphony_HRJ -Q "exec [dbo].[SP_Budget_Update_Dly]"