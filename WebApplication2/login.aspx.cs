using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class login : System.Web.UI.Page
    {
        CourseDBEntities db = new CourseDBEntities();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void btnLogin_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                var MyUser = db.Users.Where(u => u.UserName == txtUserName.Text && u.PassWord == txtPassword.Text);
                if (MyUser.Count() > 0)
                {
                    HttpCookie MyCookie = new HttpCookie("cooklogin");
                    MyCookie.Values.Add("username", HttpUtility.UrlEncode(txtUserName.Text.ToUpper()));
                    if (ChbRemember.Checked)
                        MyCookie.Expires = DateTime.Now.AddYears(10);
                    Response.Cookies.Add(MyCookie);
                    Response.Redirect("default.aspx");
                }
                else
                {
                    Label1.Text = "البيانات غير صحيحة";
                }
                
            }
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("default.aspx");
        }
    }
}