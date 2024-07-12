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

public partial class user_ViewBookedDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string q = "";
        q = "select * from Packages where id=" + Request.QueryString["id"].ToString();
        SqlDataSource1.SelectCommand = q;


        DataView dv = (DataView)SqlDataSource1.Select(new DataSourceSelectArguments());
        if (dv.Count > 0)
        {
            Image2.ImageUrl = "../Admin/package_photos/" + dv[0][9].ToString();
            hfusername.Value = dv[0][10].ToString();

        }

        if (!this.IsPostBack)
        {
            //Load Rating for Location
            DataTable dt = this.GetData("SELECT ISNULL(AVG(Rating), 0) AverageRating, COUNT(Rating) RatingCount FROM UserRatings where pid=" + Request.QueryString["id"].ToString() + " and status='Location'");
            // Rating1.CurrentRating = Convert.ToInt32(dt.Rows[0]["AverageRating"]);
            Rating1.CurrentRating = 2;
            //  lblRatingStatus.Text = string.Format("{0} Users have rated. Average Rating {1}", dt.Rows[0]["RatingCount"], dt.Rows[0]["AverageRating"]);

            //Load Rating for Cost
            DataTable dt2 = this.GetData("SELECT ISNULL(AVG(Rating), 0) AverageRating, COUNT(Rating) RatingCount FROM UserRatings where pid=" + Request.QueryString["id"].ToString() + " and status='Cost'");
            Rating2.CurrentRating = Convert.ToInt32(dt2.Rows[0]["AverageRating"]);

            //Load Rating for Service
            DataTable dt3 = this.GetData("SELECT ISNULL(AVG(Rating), 0) AverageRating, COUNT(Rating) RatingCount FROM UserRatings where pid=" + Request.QueryString["id"].ToString() + " and status='Service'");
            Rating3.CurrentRating = Convert.ToInt32(dt3.Rows[0]["AverageRating"]);


        }

        if (checkUserBlockTime(getFeedback_Allow_Date()) == true)
        {
            //  unblockUser();
            //  Response.Write("Feedback Allow");


        }
        else
        {
            //Login1.FailureText = "You are blocked by Admin";
            // Response.Write("Feedback Not Allow");
            Rating1.ReadOnly = true;
            Rating2.ReadOnly = true;
            Rating3.ReadOnly = true;

            btnFeedback.Enabled = false;
        }

    }

    public string getFeedback_Allow_Date()
    {
        //Response.Write("getFeedaback Date");
        SqlConnection cn;
        SqlCommand cmd;
        cn = new SqlConnection(ConfigurationManager.AppSettings["LIS"]);
        cmd = new SqlCommand();
        cn.Open();
        cmd.CommandText = "select feedback_allow_date from Booking where username=@username and pid=@pid";
        cmd.Parameters.AddWithValue("@username", Session["userid"].ToString());
        cmd.Parameters.AddWithValue("@pid", Request.QueryString["id"].ToString());
        cmd.Connection = cn;
        Object obj = cmd.ExecuteScalar();

        cn.Close();

        if (obj == null)
        {
            Response.Write(DateTime.Now.ToShortDateString());
            return DateTime.Now.ToShortDateString();
        }
        else
        {
            return obj.ToString();
        }
    }

    protected bool checkUserBlockTime(string dt)
    {
        DateTime d = DateTime.Now;
        int d1 = d.Day;
        int m = d.Month;
        int y = d.Year;

        String td = d.ToShortDateString();

        String vd = dt; // Block date by admin
        DateTime td1 = Convert.ToDateTime(td);
        DateTime vd1 = Convert.ToDateTime(vd);

        int result = DateTime.Compare(td1, vd1);

        if (result >= 0)
        {
            return true;
        }
        else
        {
            return false;
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
                    cmd.Parameters.AddWithValue("@pid", Request.QueryString["id"].ToString());
                    cmd.Connection = con;
                    con.Open();
                    cmd.ExecuteNonQuery();
                    con.Close();
                }
            }
        }
        // Response.Redirect(Request.Url.AbsoluteUri);
        // lblmsg.Text = " Event : " + e.Value;

    }
   
    protected void btnFeedback_Click(object sender, EventArgs e)
    {
        Response.Redirect("Feedback.aspx?id=" + Request.QueryString["id"].ToString());
    }
    protected void btnCancel_Click(object sender, EventArgs e)
    {
        SqlConnection cn;
        SqlCommand cmd;
        cn = new SqlConnection(ConfigurationManager.AppSettings["LIS"]);
        cmd = new SqlCommand();
        cn.Open();
        cmd.CommandText = "Delete from Booking where username=@username and pid=@pid";
        cmd.Parameters.AddWithValue("@username", Session["userid"].ToString());
        cmd.Parameters.AddWithValue("@pid", Request.QueryString["id"].ToString());
        cmd.Connection = cn;
        cmd.ExecuteNonQuery();
        cn.Close();

        Response.Redirect("BookedPackageList.aspx");
    }
}