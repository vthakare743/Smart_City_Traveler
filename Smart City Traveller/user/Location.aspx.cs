using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class user_Location : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (this.IsPostBack == false)
        {
            checkTable(); // check whether table present or not       
        }
        SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["LIS"]);
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "select username, pid, sum(rating) rating into SearchResult from UserRatings where status='Location' group by pid,username order by rating desc";
        cmd.Connection = con;
        cmd.ExecuteReader();
        con.Close();        
    }

    protected void checkTable()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["LIS"]);
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "SELECT * FROM sysobjects WHERE xtype = 'U' AND name = 'SearchResult'";
        cmd.Connection = con;
        Object obj = cmd.ExecuteScalar();
        if (obj == null)
        {
            
        }
        else
        {
            DelTable(); //Delete SearchResult Table
        }
        con.Close();
    }

    protected void DelTable()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["LIS"]);
        con.Open();
        SqlCommand cmd = new SqlCommand();
        cmd.CommandText = "Drop table SearchResult";
        cmd.Connection = con;
        cmd.ExecuteReader();
        con.Close();
    }



}