using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class newcustomer : System.Web.UI.Page
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
                    Response.Redirect("login.aspx");
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Customers.aspx");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                var customer = new Customer
                {
                    CustomerID = txtCustomerID.Text,
                    CompanyName = txtCompanyName.Text,
                    ContactName = txtContactName.Text,
                    ContactTitle = txtContactTitle.Text,
                    Address = txtAddress.Text,
                    City = txtCity.Text,
                    Country = txtCountry.Text,
                    PostalCode = txtPostCode.Text,
                    Phone = txtPhone.Text,
                    Region = txtRegion.Text,
                    Fax = txtFax.Text
                };
                db.Customers.Add(customer);
                db.SaveChanges();
                Response.Redirect("Customers.aspx");
            }

        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            var Cust = db.Customers.FirstOrDefault(c => c.CustomerID == txtCustomerID.Text);
            if(Cust == null)
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
            var Cust = db.Customers.FirstOrDefault(c => c.ContactName == txtContactName.Text);
            if (Cust == null)
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