using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class updatesupplier : System.Web.UI.Page
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
                        txtSupplierID.Text = Request.QueryString["id"];
                        var Sup = db.Suppliers.Find(Convert.ToInt32(txtSupplierID.Text));
                        txtContactName.Text = Sup.ContactName;
                        txtContactTitle.Text = Sup.ContactTitle;
                        txtCompanyName.Text = Sup.CompanyName;
                        txtCity.Text = Sup.City;
                        txtCountry.Text = Sup.Country;
                        txtAddress.Text = Sup.Address;
                        txtPostCode.Text = Sup.PostalCode;
                        txtRegion.Text = Sup.Region;
                        txtPhone.Text = Sup.Phone;
                        txtFax.Text = Sup.Fax;
                    }
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                txtSupplierID.Text = Request.QueryString["id"];
                var Sup = db.Suppliers.Find(Convert.ToInt32(txtSupplierID.Text));
                Sup.ContactName = txtContactName.Text;
                Sup.ContactTitle = txtContactTitle.Text;
                Sup.CompanyName = txtCompanyName.Text;
                Sup.City = txtCity.Text;
                Sup.Country = txtCountry.Text;
                Sup.Address = txtAddress.Text;
                Sup.PostalCode = txtPostCode.Text;
                Sup.Region = txtRegion.Text;
                Sup.Phone = txtPhone.Text;
                Sup.Fax = txtFax.Text;
                db.SaveChanges();
                Response.Redirect("Suppliers.aspx");
            }
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Suppliers.aspx");
        }
    }
}