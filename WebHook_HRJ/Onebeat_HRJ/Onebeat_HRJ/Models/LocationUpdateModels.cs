using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using Onebeat_HRJ.Models;

namespace Onebeat_HRJ.Models
{
    public class LocationUpdateModels
    {
        public string @event { get; set; }
        public EventLocationupdate data { get; set; }
        public DateTime triggeredAt { get; set; }


        public void GetlocationUpdate(LocationUpdateModels objLocationUpdate)
        {
            DBHelperModels objdBHelper = new DBHelperModels();
            string sqlText = "sp_GetLocationUpdate";
            SqlParameter[] sqlparam = new SqlParameter[9];
            sqlparam[0] = new SqlParameter("@id", objLocationUpdate.data.id);
            sqlparam[1] = new SqlParameter("@orderId", objLocationUpdate.data.orderId);
            sqlparam[2] = new SqlParameter("@vehiclesID", objLocationUpdate.data.vehicles[0].id);
            sqlparam[3] = new SqlParameter("@registrationPermitNumber", objLocationUpdate.data.vehicles[0].registrationPermitNumber);
            sqlparam[4] = new SqlParameter("@lastLocation", objLocationUpdate.data.lastLocation);
            sqlparam[5] = new SqlParameter("@lastLocationUpdatedAt", objLocationUpdate.data.lastLocationUpdatedAt);
            sqlparam[6] = new SqlParameter("@remainingDistance", objLocationUpdate.data.vehicles[0].remainingDistance);
            sqlparam[7] = new SqlParameter("@bidId", objLocationUpdate.data.bids[0].bidId);
            sqlparam[8] = new SqlParameter("@bidnewid", objLocationUpdate.data.bids[0].id);
            int i=objdBHelper.ExecuteNonQuery(sqlText, sqlparam);
        }
    }
    public class EventLocationupdate
    {
        public string id { get; set; }
        public string orderId { get; set; }
        public List<BidNew> bids { get; set; }
        public List<Vehicle> vehicles { get; set; }
        public string lastLocation { get; set; }
        public DateTime lastLocationUpdatedAt { get; set; }
    }
    public class BidNew
    {
        public string id { get; set; }
        public string bidId { get; set; }
        public string username { get; set; }
        public string organization { get; set; }
        public int amount { get; set; }
        public string status { get; set; }
        public DateTime created { get; set; }
        public DateTime matchedAt { get; set; }
        public string lastLocation { get; set; }
        public DateTime lastLocationUpdatedAt { get; set; }
        public int matchedPrice { get; set; }
        public int quantity { get; set; }
        public int amountPerUnit { get; set; }
    }

    public class Vehicle
    {
        public string id { get; set; }
        public string registrationPermitNumber { get; set; }
        public string bidId { get; set; }
        public string username { get; set; }
        public string status { get; set; }
        public DateTime attachedAt { get; set; }
        public string lastLocation { get; set; }
        public DateTime lastLocationUpdatedAt { get; set; }
        public int remainingDistance { get; set; }
    }


}