using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class updateproduct : System.Web.UI.Page
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
                        fillLists();
                        txtProductID.Text = Request.QueryString["id"];
                        var Sup = db.Products.Find(Convert.ToInt32(txtProductID.Text));
                        txtContactName.Text = Sup.ProductName;
                        ddlSupplier.SelectedValue = Sup.SupplierID.ToString();
                        ddlCategory.SelectedValue = Sup.CategoryID.ToString();
                        txtUnitPrice.Text = Sup.UnitPrice.ToString();
                    }
                }
            }
        }

        protected void btnSave_Click(object sender, EventArgs e)
        {
            if (Page.IsValid)
            {
                txtProductID.Text = Request.QueryString["id"];
                var Sup = db.Products.Find(Convert.ToInt32(txtProductID.Text));
                Sup.ProductName = txtContactName.Text;
                Sup.SupplierID = Convert.ToInt32(ddlSupplier.SelectedValue.ToString());
                Sup.CategoryID = Convert.ToInt32(ddlCategory.SelectedValue.ToString());
                Sup.UnitPrice = Convert.ToDecimal(txtUnitPrice.Text);
                db.SaveChanges();
                Response.Redirect("Products.aspx");
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
    }
}
