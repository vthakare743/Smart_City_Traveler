using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;

public partial class Admin_Reg : System.Web.UI.Page
{

    SqlConnection cn;
    SqlCommand cmd;
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        generateID();
        string fname = "DummyPhoto.jpg";

        if (FileUpload1.HasFile)
        {
        string str = FileUpload1.FileName;
        int pos = str.LastIndexOf(".");
        string ext = str.Substring(pos + 1);
        fname = "p_" + hfid.Value.ToString() + "." + ext;

        string upath = Server.MapPath("Admin");

        String ppath = upath + "/photos" + "\\" + fname;

        FileUpload1.SaveAs(ppath);

        }
            SqlConnection con = new SqlConnection(ConfigurationManager.AppSettings["LIS"]);

            con.Open();
            SqlCommand cmd = new SqlCommand();
            cmd.CommandText = "insert into AdminReg(id,name,address,mobile,email,username,pwd,photo)values(@id,@name,@address,@mobile,@email,@username,@pwd,@photo)";

            cmd.Parameters.AddWithValue("@id", hfid.Value);
            cmd.Parameters.AddWithValue("@name", txtname.Text);
            
            cmd.Parameters.AddWithValue("@email", txtemail.Text);
            cmd.Parameters.AddWithValue("@address", txtadd.Text);
            cmd.Parameters.AddWithValue("@mobile", txtmob.Text);
          
            cmd.Parameters.AddWithValue("@username", txtuser.Text);
            cmd.Parameters.AddWithValue("@pwd", txtpwd.Text);

            cmd.Parameters.AddWithValue("@photo", fname);

            cmd.Connection = con;

            int n = cmd.ExecuteNonQuery();
            if (n > 0)
            {
                //FileUpload1.SaveAs(ppath);
                txtadd.Text = "";
                txtemail.Text = "";
                txtmob.Text = "";
                txtname.Text = "";
                txtuser.Text = "";

                lblmsg.Text = "Registration Successful !";
            }
            else
            {
                Response.Write("Error!");
            }
            con.Close();

       


    }
    protected void generateID()
    {
        cn = new SqlConnection(ConfigurationManager.AppSettings["LIS"]);
        cmd = new SqlCommand();
        cn.Open();

        cmd.CommandText = "select id from AdminReg order by id desc";
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