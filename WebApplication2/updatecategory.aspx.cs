using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class updatecategory : System.Web.UI.Page
    {
        CourseDBEntities db = new CourseDBEntities();
        protected void Page_Load(object sender, EventArgs e)
        {
            HttpCookie MyCookie = new HttpCookie("cooklogin");
            MyCookie = Request.Cookies["cooklogin"];
            if (MyCookie == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                if (MyCookie["username"] != HttpUtility.UrlDecode("ADMIN"))
                {
                    Response.Redirect("login.aspx");
                }
                else
                {
                    if (Page.IsPostBack == false)
                    {
                        txtCategoryID.Text = Request.QueryString["id"];
                        var Cat = db.Categories.Find(Convert.ToInt32(txtCategoryID.Text));
                        txtContactName.Text = Cat.CategoryName;
                        txtDescription.Text = Cat.Description;
                    }
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                txtCategoryID.Text = Request.QueryString["id"];
                var Cat = db.Categories.Find(Convert.ToInt32(txtCategoryID.Text));
                Cat.CategoryName = txtContactName.Text;
                Cat.Description = txtDescription.Text;
                db.SaveChanges();
                Response.Redirect("Categories.aspx");
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Categories.aspx");
        }
    }
}