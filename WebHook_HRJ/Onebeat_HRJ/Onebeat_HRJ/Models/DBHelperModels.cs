using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;
using System.Text;
using System.IO;

namespace Onebeat_HRJ.Models
{
    public class DBHelperModels
    {
        #region private Instance-Variable

        public SqlConnection con = new SqlConnection();
        public DBHelperModels()
        {
            con.ConnectionString = ConfigurationManager.ConnectionStrings["ConString"].ConnectionString;
        }

        #endregion
        #region bulkinsert
        public void BulkInsert(DataTable dt, string TableName)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConString"].ConnectionString);

            if (con.State.ToString() == "Closed")
                con.Open();
            SqlBulkCopy bulkCopy = new SqlBulkCopy(
                                                     con,
                                                     SqlBulkCopyOptions.TableLock |
                                                     SqlBulkCopyOptions.FireTriggers |
                                                     SqlBulkCopyOptions.UseInternalTransaction,
                                                     null
                                                  );

            // set the destination table name
            bulkCopy.DestinationTableName = TableName;


            // write the data in the "dataTable"
            bulkCopy.WriteToServer(dt);


        }
        #endregion

        #region ExecuteNonQuery-Method For Insert/Delete/Update
        public int ExecuteNonQuery(string sql, SqlParameter[] sqlparam)
        {

            int j;
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConString"].ConnectionString);
            SqlCommand cmd = new SqlCommand(sql, con);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 1000;
         
            if (sqlparam != null)
            {
                for (int i = 0; i < sqlparam.Length; i++)
                {
                    cmd.Parameters.Add(sqlparam[i]);
                   
                  
                   
                }
            }
           
            try
            {
                if (con.State == ConnectionState.Closed)
                {

                   
                    con.Open();
                }
                j = cmd.ExecuteNonQuery();
                con.Close();
                if (j > 0)
                {
                    j = 1;
                }
                else
                {
                    j = 0;
                }
                con.Close();

            }
            catch (SqlException ex)
            {
                if (ex.Number == 2627) // Handle unique key constraint violation.It's useful in duplicate record.
                {
                    j = 2627;
                }
                else if (ex.Number == 547) //Handle Foreign Key constraint violation. It's useful when delete parent record who have already child records exists.
                {
                    j = 547;
                }
                else
                {
                    j = 0;
                }
                con.Close();
            }
            finally
            {
                con.Close();
                //  con.Dispose();
            }

            return j;

        }
        #endregion

        #region GetData-Method
        public DataSet GetData(string sql, SqlParameter[] sqlparam)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.ConnectionStrings["ConString"].ConnectionString);
            SqlCommand cmd = new SqlCommand(sql, con);
            SqlDataAdapter dptGet = new SqlDataAdapter(cmd);
            cmd.CommandType = CommandType.StoredProcedure;
            cmd.CommandTimeout = 0;
            if (con.State == ConnectionState.Closed)
            {
                con.Open();
            }
            DataSet dsGet = new DataSet();
            if (sqlparam != null)
            {
                for (int i = 0; i < sqlparam.Length; i++)
                {
                    cmd.Parameters.Add(sqlparam[i]);
                }
            }
            try
            {
                int j = dptGet.Fill(dsGet);

            }
            catch (Exception ex)
            {
                con.Close();
                con.Dispose();
                throw;
            }
            finally
            {
                dsGet.Dispose();
                con.Close();
                con.Dispose();
            }
            return dsGet;
        }
        #endregion
    }
}