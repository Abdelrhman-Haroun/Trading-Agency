using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class newSupplier : System.Web.UI.Page
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
            Response.Redirect("Suppliers.aspx");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                var supplier = new Supplier
                {
                    SupplierID = Convert.ToInt32(txtSupplierID.Text),
                    CompanyName = txtCompanyName.Text,
                    ContactName = txtContactName.Text,
                    ContactTitle = txtSupplierTitle.Text,
                    Address = txtAddress.Text,
                    City = txtCity.Text,
                    Country = txtCountry.Text,
                    PostalCode = txtPostCode.Text,
                    Phone = txtPhone.Text,
                    Region = txtRegion.Text,
                    Fax = txtFax.Text
                };
                db.Suppliers.Add(supplier);
                db.SaveChanges();
                Response.Redirect("Suppliers.aspx");
            }
        }

        protected void CustomValidator1_ServerValidate(object source, ServerValidateEventArgs args)
        {
            var Sup = db.Suppliers.Find(Convert.ToInt32(txtSupplierID.Text));
            if (Sup == null)
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
            var Sup = db.Suppliers.FirstOrDefault(c => c.ContactName == txtContactName.Text);
            if (Sup == null)
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