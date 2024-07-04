using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class ucSignUp : System.Web.UI.UserControl
    {
        CourseDBEntities db = new CourseDBEntities();
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("default.aspx");
        }

        protected void btnSignUp_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                User user = new User
                {
                    UserName = txtUserName.Text,
                    PassWord = txtPassword.Text,
                    UserAddress = txtAddress.Text,
                    UserPhone = txtPhone.Text,
                    UserEmail = txtEmail.Text
                };
                db.Users.Add(user);
                db.SaveChanges();
                HttpCookie MyCookie = new HttpCookie("cooklogin");
                MyCookie.Values.Add("username",HttpUtility.UrlEncode( txtUserName.Text.ToUpper()));
                Response.Cookies.Add(MyCookie);
                Response.Redirect("default.aspx");
            }
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            var user = db.Users.FirstOrDefault(x => x.UserName == txtUserName.Text);
            if(user == null)
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }

        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            var user = db.Users.FirstOrDefault(x => x.UserEmail == txtEmail.Text);
            if (user == null)
            {
                args.IsValid = true;
            }
            else
            {
                args.IsValid = false;
            }
        }
    }
}