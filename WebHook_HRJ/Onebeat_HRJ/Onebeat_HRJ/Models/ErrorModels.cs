using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using Onebeat_HRJ.Models;

namespace Onebeat_HRJ.Models
{
    public class ErrorModels
    {
        public string Error { get; set; }
        public DateTime Date { get; set; }

        public string Response { get; set; }


        public void GetError(ErrorModels objError)
        {
            DBHelperModels objdBHelper = new DBHelperModels();
            string sqlText = "sp_Response_Error_Log";
            SqlParameter[] sqlparam = new SqlParameter[3];
            sqlparam[0] = new SqlParameter("@Error", objError.Error);
            sqlparam[1] = new SqlParameter("@Date", objError.Date);
            sqlparam[2] = new SqlParameter("@Response", objError.Response);
            int i=objdBHelper.ExecuteNonQuery(sqlText, sqlparam);
        }
    }
}