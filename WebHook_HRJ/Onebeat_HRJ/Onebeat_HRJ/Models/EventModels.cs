using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.IO;
using System.Linq;
using System.Text;
using System.Web;
using Onebeat_HRJ.Models;

namespace Onebeat_HRJ.Models
{
    public class EventModels
    {
        #region properties

        public string @event { get; set; }
        public EventBID data { get; set; }
        public DateTime triggeredAt { get; set; }

        #endregion
        public void AddBidingDetails(EventModels objeventmodels)
        {
            try
            {
                StringBuilder sb = new StringBuilder();
                DBHelperModels objdBHelper = new DBHelperModels();
                string sqlText = "sp_API_add_selectedbidDetails";
                string bidid = "";
                SqlParameter[] sqlparam = new SqlParameter[14];
                sqlparam[0] = new SqlParameter("@id", objeventmodels.data.id);
                sqlparam[1] = new SqlParameter("@orderId", objeventmodels.data.orderId);
                sqlparam[2] = new SqlParameter("@bookedQuantity", objeventmodels.data.bookedQuantity);

                foreach (var bid in objeventmodels.data.bids)
                {
                    sqlparam[3] = new SqlParameter("@IDnewBid", bid.id);
                    bidid = bid.bidid;
                    sqlparam[4] = new SqlParameter("@bidid", bid.bidid);
                    sqlparam[5] = new SqlParameter("@username", bid.username);
                    sqlparam[6] = new SqlParameter("@organization", bid.organization);
                    sqlparam[7] = new SqlParameter("@amount", bid.amount);
                    sqlparam[8] = new SqlParameter("@status", bid.status);
                    sqlparam[9] = new SqlParameter("@created", bid.created);
                    sqlparam[10] = new SqlParameter("@matchedAt", bid.matchedAt);
                    sqlparam[11] = new SqlParameter("@matchedPrice", bid.matchedPrice);
                    sqlparam[12] = new SqlParameter("@quantity", bid.quantity);
                    sqlparam[13] = new SqlParameter("@amountPerUnit", bid.amountPerUnit);
                }
                string sqlText1 = "sp_API_add_BiddingHistory";
                foreach (var bidhs in objeventmodels.data.bidSelectionHistory)
                {

                    SqlParameter[] sqlparamBidHis = new SqlParameter[7];
                    sqlparamBidHis[0] = new SqlParameter("@id", objeventmodels.data.id);
                    sqlparamBidHis[1] = new SqlParameter("@bidid", bidid);
                    sqlparamBidHis[2] = new SqlParameter("@orderId", objeventmodels.data.orderId);
                    sqlparamBidHis[3] = new SqlParameter("@event", bidhs.@event);
                    sqlparamBidHis[4] = new SqlParameter("@reason", bidhs.reason);
                    sqlparamBidHis[5] = new SqlParameter("@user", bidhs.user);
                    sqlparamBidHis[6] = new SqlParameter("@created", bidhs.created);
                    
                    int j=objdBHelper.ExecuteNonQuery(sqlText1, sqlparamBidHis);
                }

                int i = objdBHelper.ExecuteNonQuery(sqlText, sqlparam);
              
              
                File.AppendAllText(@"C:\Log\" + "log2.txt", sb.ToString());
                sb.Clear();
            }
            catch (Exception ex)
            {
                StringBuilder sb = new StringBuilder();
                sb.Append("Error in=" + ex.Message.ToString());
                File.AppendAllText(@"C:\Log\" + "log2.txt", sb.ToString());
                sb.Clear();
            }
        }
    }

    public class EventBID
    {
        public string id { get; set; }
        public string orderId { get; set; }

        public List<Bid> bids { get; set; }
        public int bookedQuantity { get; set; }

        public List<BidSelectionHistory> bidSelectionHistory { get; set; }

    }
    public class Bid
    {
        public string id { get; set; }
        public string bidid { get; set; }
        public string username { get; set; }

        public string organization { get; set; }
        public int amount { get; set; }

        public string status { get; set; }
        public DateTime created { get; set; }

        public DateTime matchedAt { get; set; }
        public int matchedPrice { get; set; }

        public int quantity { get; set; }

        public int amountPerUnit { get; set; }

    }
    public class BidSelectionHistory
    {


        public string @event { get; set; }
        public string reason { get; set; }
        public DateTime created { get; set; }
        public string user { get; set; }
        public string bidId { get; set; }
    }
}