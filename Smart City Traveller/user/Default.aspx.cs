﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string q="";

        q= "SELECT [id], [pname], [season], [cost], [photo], [username] FROM [Packages] where theme='" + Session["interest_status"].ToString() + "'";

        SqlDataSource2.SelectCommand = q;



    }
}