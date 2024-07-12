using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MainAdmin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        hfUser.Value = Request.Form["txtuser"];
        hfPwd.Value = Request.Form["txtpwd"];

        if(hfUser.Value=="admin" && hfPwd.Value=="admin")
        {
            Session.Add("Userid", "admin");
            Response.Redirect("MainAdmin/Default.aspx");
        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Invalid Username and Password')", true);
        }

    }

}