using Simplicity.DAL;
using Simplicity.Model;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;


namespace Simplicity
{
    public partial class _Default : Page
    {
        private VisitorDAL visitorDAL = new VisitorDAL();
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                //show previous visitor information
                GetVisitorInformation();
                //add visitor to the database tracking ip Address
                TrackVisitor(); 
            }
        }

        /*
         * To Track the ip Address of the visitor
         * */
        private void TrackVisitor()
        {
            string ipAddress;
            string strHostName = "";
            strHostName = System.Net.Dns.GetHostName();
            IPHostEntry ipEntry = System.Net.Dns.GetHostEntry(strHostName);
            IPAddress[] addr = ipEntry.AddressList;
            ipAddress = addr[addr.Length - 2].ToString();
            InsertVisitorInfo(ipAddress, DateTime.Now);
        }

        /*
         * To insert new visitor into database records
         */
        private void InsertVisitorInfo(string ipAddress, DateTime now)
        {
            VisitorDetails visitorDetails = new VisitorDetails();
            visitorDetails.ipAddress = ipAddress;
            visitorDetails.dateTime = now;

            visitorDAL = new VisitorDAL();
           int result = visitorDAL.InsertVisitorRecord(visitorDetails);
            if (result > 0)
            {
                Response.Write("<script>alert('Welcome to the page');</script>");
            }
        }

        /*
         * To get the list of previous visitor
         */
        private void GetVisitorInformation()
        {
            gridViewVisitorInfo.DataSource = visitorDAL.GetVisitorDetails();
            //bind data to gridview
            gridViewVisitorInfo.DataBind();
            gridViewVisitorInfo.HeaderRow.Cells[0].Text = "IP Address";
            gridViewVisitorInfo.HeaderRow.Cells[1].Text = "Visited Date and Time";
        }
    }
}