using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.IO;
using System.Configuration;

public partial class MainAdmin_Default : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void GridView1_SelectedIndexChanged(object sender, EventArgs e)
    {
        setActive(GridView1.SelectedRow.Cells[1].Text);
    }

    protected void setActive(string id)
    {
        SqlConnection cn = new SqlConnection(ConfigurationManager.AppSettings["LIS"]);
        SqlCommand cmd = new SqlCommand();
        cn.Open();

        cmd.CommandText = "Update Packages set status='Active' where id=@id";        
        cmd.Parameters.AddWithValue("@id",id);        

        cmd.Connection = cn;

        int n = cmd.ExecuteNonQuery();

        cn.Close();

        if (n > 0)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Package Activate Successfully')", true);
        }
        GridView1.DataBind();
        cn.Close();
    }
}