using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Http;
using System.Web;
using System.Web.Http;
using Onebeat_HRJ.Models;
using System.Threading.Tasks;
using System.Web.Http.Cors;
using System.IO;
using System.Text;
using Onebeat_HRJ.Controllers;

namespace Onebeat_HRJ.Controllers
{
    [EnableCors(origins: "*", headers: "*", methods: "*")]
   
    [Authorize]
    public class orderController : ApiController
    {
        #region receive Webhook


        [HttpPost]
        public async Task<IHttpActionResult> ReceiveNotification()
        {
            
            try
            {

                //Console.WriteLine("");
                // Read the request content as string
                string requestBody = await Request.Content.ReadAsStringAsync();

                StringBuilder sb = new StringBuilder();
                sb.Append(requestBody);
                File.AppendAllText(@"C:\Log\" + "log.txt", sb.ToString());
                sb.Clear();
                // Process the received notification
                ProcessNotification(requestBody);


               // var resp = JsonConvert.SerializeObject(responseData);
                return Ok();
            }
            catch(Exception ex)
            {
                ErrorModels objerror = new ErrorModels();
                objerror.Error = ex.Message.ToString();
                objerror.Date = Convert.ToDateTime(System.DateTime.Now.ToString());
                objerror.Response = ex.Message.ToString();
                objerror.GetError(objerror);
                var responseData = new
                {
                    message = "Failure",
                    data = new
                    {

                    }
                };
               // var resp = JsonConvert.SerializeObject(responseData);
                return Ok();
            }
        }

        private void ProcessNotification(string requestBody)
        {
            try
            {

                dynamic jsonrespose = JsonConvert.DeserializeObject(requestBody);
                dynamic eventName = jsonrespose["event"];
                if (eventName == "vehicle_attached" || eventName == "vehicle_detached" || eventName == "vehicle_rejected" || eventName == "vehicle_replaced" || eventName == "vehicle_status_change")
                {
                    var obj = JsonConvert.DeserializeObject<VehicleModels>(requestBody);
                    VehicleModels ObjVehicleModels = new VehicleModels();
                    ObjVehicleModels.getVehicleDetails(obj);
                }
                else if (eventName == "bid_selected" || eventName == "bid_selection_request_accepted")
                {
                   
                    var obj = JsonConvert.DeserializeObject<EventModels>(requestBody);
                    StringBuilder sb = new StringBuilder();
                    sb.Append(requestBody);
                    File.AppendAllText(@"C:\Log\" + "log1.txt", sb.ToString());
                    sb.Clear();
                    EventModels ObjEventModels = new EventModels();
                    ObjEventModels.AddBidingDetails(obj);
                }
                else if (eventName == "location_update")
                {
                    var obj = JsonConvert.DeserializeObject<LocationUpdateModels>(requestBody);
                    LocationUpdateModels ObjLocationUpdateModels = new LocationUpdateModels();
                    ObjLocationUpdateModels.GetlocationUpdate(obj);
                }
                var responseData = new
                {
                    message = "Success!",
                    data = new
                    {

                    }
                };
               // var resp = JsonConvert.SerializeObject(responseData);
                //return Ok();

            }
            catch (Exception ex)
            {
                ErrorModels objerror = new ErrorModels();
                objerror.Error = ex.Message.ToString();
                objerror.Date = Convert.ToDateTime(System.DateTime.Now.ToString());
                objerror.Response = requestBody;
                objerror.GetError(objerror);
                var responseData = new
                {
                    message = "Failure",
                    data = new
                    {

                    }
                };
                //var resp = JsonConvert.SerializeObject(responseData);
                //return Ok();



            }


        }





        #endregion
    }
}