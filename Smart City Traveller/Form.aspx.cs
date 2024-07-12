using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
public partial class Form : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["LIS"]);
        con.Open();

        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "insert into Stud_Data(name,rollno) values(@nm,@rn)";
        cmd.Parameters.AddWithValue("@nm", txtname.Text);
        cmd.Parameters.AddWithValue("@rn", txtrollno.Text);

        cmd.Connection = con;
        int n=cmd.ExecuteNonQuery();

        if (n > 0)
        {
            Label1.Text = "Record Save Successfully !";
        }

        con.Close();
        
    }
}