using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;
using AjaxControlToolkit;
using System.Data;

public partial class user_Feedback : System.Web.UI.Page
{
    SqlConnection cn;
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {
        generateID();

        if (!this.IsPostBack)
        {
            //Load Rating for Location
            DataTable dt = this.GetData("SELECT ISNULL(AVG(Rating), 0) AverageRating, COUNT(Rating) RatingCount FROM UserRatings where pid=" + Request.QueryString["id"].ToString() + " and status='Location'");
            Rating1.CurrentRating = Convert.ToInt32(dt.Rows[0]["AverageRating"]);
            //  lblRatingStatus.Text = string.Format("{0} Users have rated. Average Rating {1}", dt.Rows[0]["RatingCount"], dt.Rows[0]["AverageRating"]);

            //Load Rating for Cost
            DataTable dt2 = this.GetData("SELECT ISNULL(AVG(Rating), 0) AverageRating, COUNT(Rating) RatingCount FROM UserRatings where pid=" + Request.QueryString["id"].ToString() + " and status='Cost'");
            Rating2.CurrentRating = Convert.ToInt32(dt2.Rows[0]["AverageRating"]);

            //Load Rating for Service
            DataTable dt3 = this.GetData("SELECT ISNULL(AVG(Rating), 0) AverageRating, COUNT(Rating) RatingCount FROM UserRatings where pid=" + Request.QueryString["id"].ToString() + " and status='Service'");
            Rating3.CurrentRating = Convert.ToInt32(dt3.Rows[0]["AverageRating"]);
        }

        DataView dv= (DataView)SqlDataGetData.Select(new DataSourceSelectArguments());
        if (dv.Count > 0)
        {
           txtpackname.Text=dv[0][0].ToString();
            hfusername.Value=dv[0][1].ToString();

        }

    }
        private DataTable GetData(string query)
    {
        DataTable dt = new DataTable();
        string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand(query))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Connection = con;
                    sda.SelectCommand = cmd;
                    sda.Fill(dt);
                }
            }
            return dt;
        }
    }

    protected void OnRatingChanged(object sender, RatingEventArgs e)
    {        
        //string s = "unknown button";
        if (sender == Rating1)
        {
            hfStatus.Value = "Location";
        }
        if (sender == Rating2)
        {
            hfStatus.Value = "Cost";
        }
        if (sender == Rating3)
        {
            hfStatus.Value = "Service";
        }

        string constr = ConfigurationManager.ConnectionStrings["constr"].ConnectionString;
        using (SqlConnection con = new SqlConnection(constr))
        {
            using (SqlCommand cmd = new SqlCommand("INSERT INTO UserRatings(Rating,status,username,pid) VALUES(@Rating,@status,@username,@pid)"))
            {
                using (SqlDataAdapter sda = new SqlDataAdapter())
                {
                    cmd.CommandType = CommandType.Text;
                    cmd.Parameters.AddWithValue("@Rating", e.Value);
                    cmd.Parameters.AddWithValue("@status", hfStatus.Value);                        
                    cmd.Parameters.AddWithValue("@username", hfusername.Value);
                    cmd.Parameters.AddWithValue("@pid",Request.QueryString["id"].ToString());                    
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        SqlDataInsert.Insert();
        lblmsg.Text = "Thank You For Your Valuable Feedback !";
    }
    protected void generateID()
    {
        cn = new SqlConnection(ConfigurationManager.AppSettings["LIS"]);
        cmd = new SqlCommand();
        cn.Open();
        cmd.CommandText = "select id from Feedback order by id desc";
        cmd.Connection = cn;

        object obj = cmd.ExecuteScalar();
        if (obj == null)
        {
            txtid.Text = "1";
        }
        else
        {
            int n = Convert.ToInt32(obj);
            n = n + 1;
            txtid.Text = n.ToString();
        }
        cn.Close();

    }
}