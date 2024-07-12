using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class Login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {
        hfUser.Value = Request.Form["txtuser"];
        hfPwd.Value = Request.Form["txtpwd"];

        DataView dv = (DataView)SqlDataLogin.Select(new DataSourceSelectArguments());
        if (dv.Count == 1)
        {
            Session.Add("userid", hfUser.Value);
            Session.Add("pwd", hfPwd.Value);
           
            Session.Add("profession", dv[0][2].ToString());
            Session.Add("interest_status", dv[0][3].ToString());

            Response.Redirect("user/Default.aspx");

        }
        else
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Invalid Username and Password')", true);
        }
    }
}