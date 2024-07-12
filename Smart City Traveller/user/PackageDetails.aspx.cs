using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_PackageDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnBook_Click(object sender, EventArgs e)
    {
        Response.Redirect("Book.aspx?pid=" + Request.QueryString["id"].ToString() + "&d=" + DetailsView1.Rows[4].Cells[1].Text);
    }
}