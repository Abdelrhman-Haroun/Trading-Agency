using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class newproduct : System.Web.UI.Page
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
            if(Page.IsPostBack == false)
            {
                fillLists();
            }
        }

        void fillLists()
        {
            ddlSupplier.DataSource = db.Suppliers.ToList();
            ddlSupplier.DataValueField = "SupplierID";
            ddlSupplier.DataTextField = "ContactName";
            ddlSupplier.DataBind();
            ddlCategory.DataSource = db.Categories.ToList();
            ddlCategory.DataValueField = "CategoryID";
            ddlCategory.DataTextField = "CategoryName";
            ddlCategory.DataBind();
        }

        protected void btnBack_Click(object sender, EventArgs e)
        {
            Response.Redirect("Products.aspx");
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                var product = new Product
                {
                    ProductName = txtProductName.Text,
                    SupplierID = Convert.ToInt32(ddlSupplier.SelectedValue.ToString()),
                    CategoryID = Convert.ToInt32(ddlCategory.SelectedValue.ToString()),
                    UnitPrice = Convert.ToDecimal(txtUnitPrice.Text)
                };
                db.Products.Add(product);
                db.SaveChanges();
                Response.Redirect("Products.aspx");
            }
        }

        protected void CustomValidator2_ServerValidate(object source, ServerValidateEventArgs args)
        {
            var Sup = db.Products.FirstOrDefault(c => c.ProductName == txtProductName.Text);
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