using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_ChangePwd : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnChange_Click(object sender, EventArgs e)
    {
        if (txtOld.Text == (String)Session["pwd"])
        {
            sqlpwd.Update();
            lblmsg.Text = "Password Changed..";
        }
        else
            lblmsg.Text = "Invalid Password";
    }
}