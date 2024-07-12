using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_Package : System.Web.UI.Page
{
    SqlConnection cn;
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSubmit_Click(object sender, ImageClickEventArgs e)
    {
        generateID();

        string str = FileUpload1.FileName;
        int pos = str.LastIndexOf(".");
        string ext = str.Substring(pos + 1);
        string fname = "pk_" + hfid.Value.ToString() + "." + ext;

        string upath = Server.MapPath("package_photos");

        String ppath = upath +"\\" + fname;

        FileUpload1.SaveAs(ppath);

        if (FileUpload1.HasFile)
        {
            SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["LIS"]);

            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "insert into Packages(id,pname,season,theme,duration,location,details,subpack,cost,photo,username,status,hotelname,hoteldetails)values(@id,@pname,@season,@theme,@duration,@location,@details,@subpack,@cost,@photo,@username,@status,@hotelname,@hoteldetails)";

            cmd.Parameters.AddWithValue("@id", hfid.Value);
            cmd.Parameters.AddWithValue("@pname", txtpname.Text);
            cmd.Parameters.AddWithValue("@season", ddlSeason.SelectedItem.Value.ToString());
            cmd.Parameters.AddWithValue("@theme", ddlTheme.SelectedItem.Value.ToString());
            
            cmd.Parameters.AddWithValue("@duration",txtduration.Text);
            cmd.Parameters.AddWithValue("@location", txtloc.Text);

            cmd.Parameters.AddWithValue("@details",txtdesc.Text);
            cmd.Parameters.AddWithValue("@subpack",txtsub.Text);
            cmd.Parameters.AddWithValue("@cost", txtcost.Text);

            cmd.Parameters.AddWithValue("@username", Session["userid"].ToString());           
            cmd.Parameters.AddWithValue("@photo", fname);
            //cmd.Parameters.AddWithValue("@status","Active");
            cmd.Parameters.AddWithValue("@status", "Pending");
            cmd.Parameters.AddWithValue("@hotelname",txtHotelName.Text);
            cmd.Parameters.AddWithValue("@hoteldetails", txtHotelDetails.Text);


            cmd.Connection = con;

            int n = cmd.ExecuteNonQuery();
            if (n > 0)
            {
                FileUpload1.SaveAs(ppath);
                lblmsg.Text = "Package Add Successfully !";

                txtcost.Text = "";
                txtdesc.Text = "";
                txtduration.Text = "";
                txtloc.Text = "";
                txtpname.Text = "";
                txtsub.Text = "";

                ddlSeason.SelectedIndex = -1;
                ddlTheme.SelectedIndex = -1;

            }
            else
            {
                Response.Write("Error!");
            }
            con.Close();

        }


    }
    protected void generateID()
    {
        cn = new SqlConnection(ConfigurationManager.AppSettings["LIS"]);
        cmd = new SqlCommand();
        cn.Open();

        cmd.CommandText = "select id from Packages order by id desc";
        cmd.Connection = cn;

        object obj = cmd.ExecuteScalar();
        if (obj == null)
        {
            hfid.Value = "1";
        }
        else
        {
            int n = Convert.ToInt32(obj);
            n = n + 1;
            hfid.Value = n.ToString();
        }
        cn.Close();

    }
}