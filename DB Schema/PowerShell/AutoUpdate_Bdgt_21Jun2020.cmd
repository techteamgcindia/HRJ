cd\
cd "C:\Program Files\Symphony\Symphony Auto Load"
sqlcmd U sa -P sa@123 -SHRJPOWERBI -d Symphony_HRJ -Q "exec [dbo].[SP_Budget_Update]"