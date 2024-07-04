using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace WebApplication2
{
    public partial class Suppliers : System.Web.UI.Page
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
                var Mysuppliers = from s in db.Suppliers
                                  select new { s.SupplierID, s.CompanyName, s.ContactName, s.City, s.Country };
                grd.DataSource = Mysuppliers.ToList();
                grd.DataBind();
            }
        }

        protected void grd_RowDataBound1(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.Header)
            {
                e.Row.Cells[0].Text = "تعديل";
                e.Row.Cells[1].Text = "حذف";
                e.Row.Cells[2].Text = "الكود";
                e.Row.Cells[3].Text = "الشركة";
                e.Row.Cells[4].Text = "اسم المورد";
                e.Row.Cells[5].Text = "المدينة";
                e.Row.Cells[6].Text = "الدولة";

            }
        }


        protected void grd_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            HttpCookie MyCookie = new HttpCookie("cooklogin");
            MyCookie = Request.Cookies["cooklogin"];
            if (MyCookie == null)
            {
                Response.Redirect("login.aspx");
            }
            else
            {
                if (MyCookie["username"] == HttpUtility.UrlDecode("ADMIN"))
                {
                    lblName.Text = grd.Rows[e.RowIndex].Cells[4].Text;
                    hf.Value = grd.Rows[e.RowIndex].Cells[2].Text;
                    MultiView1.ActiveViewIndex = 1;
                }
            }
        }

        protected void btnCancel_Click(object sender, EventArgs e)
        {
            MultiView1.ActiveViewIndex = 0;
        }

        protected void btnDelete_Click(object sender, EventArgs e)
        {
            var Cust = db.Suppliers.Find(Convert.ToInt32(hf.Value));
            db.Suppliers.Remove(Cust);
            db.SaveChanges();
            Response.Redirect("suppliers.aspx");
            MultiView1.ActiveViewIndex = 0;
        }
    }
}