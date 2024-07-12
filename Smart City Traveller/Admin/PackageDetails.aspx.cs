using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Configuration;
using System.Data.SqlClient;
using AjaxControlToolkit;
using System.Data;

public partial class Admin_PackageDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnDelete_Click(object sender, EventArgs e)
    {
        SqlConnection cn;
        SqlCommand cmd;
        cn = new SqlConnection(ConfigurationManager.AppSettings["LIS"]);
        cmd = new SqlCommand();
        cn.Open();
        cmd.CommandText = "Update Packages set status=@status where username=@username and id=@pid";
        cmd.Parameters.AddWithValue("@status", "Deactive");
        cmd.Parameters.AddWithValue("@username", Session["userid"].ToString());
        cmd.Parameters.AddWithValue("@pid", Request.QueryString["id"].ToString());
        cmd.Connection = cn;
        cmd.ExecuteNonQuery();
        cn.Close();

        Response.Redirect("ShowPackages.aspx");
    }
}