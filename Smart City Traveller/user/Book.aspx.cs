using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
public partial class user_Book : System.Web.UI.Page
{
    string bookdate;
    string feedback_date;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, ImageClickEventArgs e)
    {
        string name = txtBookDate.Text; //main code

        System.DateTime myDate = new System.DateTime();
        myDate =Convert.ToDateTime(name);
        
        System.DateTime fdate=myDate.AddDays(Convert.ToInt32(Request.QueryString["d"].ToString()));

        bookdate = myDate.ToString("dd/MM/yyyy");

        feedback_date = fdate.ToString("dd/MM/yyyy");

        //Response.Write("Bookdate : " + bookdate + " Feedback Date : " + feedback_date);

        bookPakage();

      //  SqlDataSource1.Insert();
      //  Response.Redirect("PaySucess.aspx");
    }

    protected void bookPakage()
    {
        SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["LIS"]);        
        SqlCommand cmd = new SqlCommand();

        con.Open();
        cmd.CommandText = "insert into Booking(username,pid,regdate,bookdate,feedback_allow_date)values(@username,@pid,@regdate,@bookdate,@feedback_allow_date)";

        cmd.Parameters.AddWithValue("@username",Session["userid"].ToString());
        cmd.Parameters.AddWithValue("@pid",Request.QueryString["pid"].ToString());
        cmd.Parameters.AddWithValue("@regdate",DateTime.Now.ToShortDateString());

        cmd.Parameters.AddWithValue("@bookdate",bookdate);
        cmd.Parameters.AddWithValue("@feedback_allow_date", feedback_date);
        
        cmd.Connection = con;

        int n = cmd.ExecuteNonQuery();
        if (n > 0)
        {
            Response.Redirect("PaySucess.aspx");
        }
        else
        {

        }
    }
}