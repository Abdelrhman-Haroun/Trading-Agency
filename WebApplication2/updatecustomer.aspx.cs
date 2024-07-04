using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class updatecustomer : System.Web.UI.Page
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
                        txtCustomerID.Text = Request.QueryString["id"];
                        var Cust = db.Customers.FirstOrDefault(c => c.CustomerID == txtCustomerID.Text);
                        txtContactName.Text = Cust.ContactName;
                        txtContactTitle.Text = Cust.ContactTitle;
                        txtCompanyName.Text = Cust.CompanyName;
                        txtCity.Text = Cust.City;
                        txtCountry.Text = Cust.Country;
                        txtAddress.Text = Cust.Address;
                        txtPostCode.Text = Cust.PostalCode;
                        txtRegion.Text = Cust.Region;
                        txtPhone.Text = Cust.Phone;
                        txtFax.Text = Cust.Fax;
                    }
                }
            }

        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                txtCustomerID.Text = Request.QueryString["id"];
                var Cust = db.Customers.FirstOrDefault(c => c.CustomerID == txtCustomerID.Text);
                Cust.ContactName = txtContactName.Text;
                Cust.ContactTitle = txtContactTitle.Text;
                Cust.CompanyName = txtCompanyName.Text;
                Cust.City = txtCity.Text;
                Cust.Country = txtCountry.Text;
                Cust.Address = txtAddress.Text;
                Cust.PostalCode = txtPostCode.Text;
                Cust.Region = txtRegion.Text;
                Cust.Phone = txtPhone.Text;
                Cust.Fax = txtFax.Text;
                db.SaveChanges();
                Response.Redirect("Customers.aspx");
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Customers.aspx");
        }

    }
}