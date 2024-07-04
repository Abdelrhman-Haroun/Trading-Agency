using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class MainMaster : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie MyCookie = new HttpCookie("cooklogin");
            MyCookie = Request.Cookies["cooklogin"];
            if(MyCookie == null)
            {
                lstWelcome.Visible = false;
                lstData.Visible = false;
                lstLog.Visible = true;
            }
            else
            {
                lstWelcome.Visible = true;
                lstData.Visible = true;
                lstLog.Visible = false;
                btnUser.Text =HttpUtility.UrlDecode( MyCookie["username"].ToUpper());
            }
           
        }

        protected void btnLogOut_Click(object sender, EventArgs e)
        {
            HttpCookie MyCookie = new HttpCookie("cooklogin");
            MyCookie.Expires = DateTime.Now.AddDays(-1);
            Response.Cookies.Add(MyCookie);
            Response.Redirect("default.aspx");
        }
    }
}