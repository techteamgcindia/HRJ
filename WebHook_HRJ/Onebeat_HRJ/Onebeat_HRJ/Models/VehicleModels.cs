using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Data.SqlClient;
using Onebeat_HRJ.Models;

namespace Onebeat_HRJ.Models
{
    public class VehicleModels
    {
        public string @event { get; set; }
        public EventData data { get; set; }
        public DateTime triggeredAt { get; set; }


        public void getVehicleDetails(VehicleModels eventObject)
        {
            DBHelperModels objdBHelper = new DBHelperModels();

            foreach (var vehicles in eventObject.data.vehicles)
            {
                string sqlText = "sp_AddVehiclesDetails";
                SqlParameter[] sqlparam = new SqlParameter[8];
                sqlparam[0] = new SqlParameter("@id", eventObject.data.id);
                sqlparam[1] = new SqlParameter("@orderId", eventObject.data.orderId);
                sqlparam[2] = new SqlParameter("@vehiclesID", vehicles.id);
                sqlparam[3] = new SqlParameter("@registrationPermitNumber", vehicles.registrationPermitNumber);
                sqlparam[4] = new SqlParameter("@bidId", vehicles.bidId);
                sqlparam[5] = new SqlParameter("@username", vehicles.username);
                sqlparam[6] = new SqlParameter("@status", vehicles.status);
                sqlparam[7] = new SqlParameter("@attachedAt", vehicles.attachedAt);
                int i = objdBHelper.ExecuteNonQuery(sqlText, sqlparam);
            }


        }


    }
    public class EventData
    {
        public string id { get; set; }
        public string orderId { get; set; }
        public List<Vehicles> vehicles { get; set; }
    }

    public class Vehicles
    {
        public string id { get; set; }
        public string registrationPermitNumber { get; set; }
        public string bidId { get; set; }
        public string username { get; set; }
        public string status { get; set; }
        public DateTime attachedAt { get; set; }
    }
}