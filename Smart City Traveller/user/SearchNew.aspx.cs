using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class user_SearchNew : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void txtSearch_Click(object sender, EventArgs e)
    {
        try
        {

            //if (Convert.ToInt32(txtMinCost.Text) > Convert.ToInt32(txtMaxCost.Text))
            //{
            //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please Enter Proper Cost !')", true);
            //}

            //if (Convert.ToInt32(txtMinDay.Text) > Convert.ToInt32(txtMaxDay.Text))
            //{
            //    ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please Enter Proper Days !')", true);
            //}

            string q = "";
            // Check if Location is present
            if (txtMinCost.Text == "" && txtMaxCost.Text == "" && ddlSeason.SelectedItem.Value.ToString() == "Select" && txtMinDay.Text == "" && txtMaxDay.Text == "")
            {
                //q = "SELECT [id], [pname], [season], [theme], [duration], [location], [cost], [username] FROM [Packages] where location LIKE '%" + txtLocation.Text + "%'";
                q = "SELECT [id], [pname], [season], [theme], [duration], [location], [cost], [username] FROM [Packages] where pname LIKE '" + txtLocation.Text + "%'";
            }
            // Check if Location,Cost is present
            if (txtLocation.Text != "" && txtMinCost.Text != "" && ddlSeason.SelectedItem.Value.ToString() == "Select" && txtMinDay.Text == "" && txtMaxDay.Text == "")
            {
                //q = "SELECT [id], [pname], [season], [theme], [duration], [location], [cost], [username] FROM [Packages] where location LIKE '%" + txtLocation.Text + "%' and cost between " + txtMinCost.Text + " and " + txtMaxCost.Text;
                q = "SELECT [id], [pname], [season], [theme], [duration], [location], [cost], [username] FROM [Packages] where pname LIKE '" + txtLocation.Text + "%' and cost between " + txtMinCost.Text + " and " + txtMaxCost.Text;

            }
            // Check if Location,Cost,season is present
            if (txtLocation.Text != "" && txtMinCost.Text != "" && ddlSeason.SelectedItem.Value.ToString() != "Select" && txtMinDay.Text == "" && txtMaxDay.Text == "")
            {
                //q = "SELECT [id], [pname], [season], [theme], [duration], [location], [cost], [username] FROM [Packages] where location LIKE '%" + txtLocation.Text + "%' and cost between " + txtMinCost.Text + " and " + txtMaxCost.Text + " and season='" + ddlSeason.SelectedItem.Value.ToString() + "'";
                q = "SELECT [id], [pname], [season], [theme], [duration], [location], [cost], [username] FROM [Packages] where pname LIKE '" + txtLocation.Text + "%' and cost between " + txtMinCost.Text + " and " + txtMaxCost.Text + " and season='" + ddlSeason.SelectedItem.Value.ToString() + "'";
            }

            // Check if Location,Cost,season,days is present
            if (txtLocation.Text != "" && txtMinCost.Text != "" && ddlSeason.SelectedItem.Value.ToString() != "Select" && txtMinDay.Text != "" && txtMaxDay.Text != "")
            {
                //q = "SELECT [id], [pname], [season], [theme], [duration], [location], [cost], [username] FROM [Packages] where location LIKE '%" + txtLocation.Text + "%' and cost between " + txtMinCost.Text + " and " + txtMaxCost.Text + " and season='" + ddlSeason.SelectedItem.Value.ToString() + "' and duration between " + txtMinDay.Text + " and " + txtMaxDay.Text;
                q = "SELECT [id], [pname], [season], [theme], [duration], [location], [cost], [username] FROM [Packages] where pname LIKE '" + txtLocation.Text + "%' and cost between " + txtMinCost.Text + " and " + txtMaxCost.Text + " and season='" + ddlSeason.SelectedItem.Value.ToString() + "' and duration between " + txtMinDay.Text + " and " + txtMaxDay.Text;

            }

            // Check if Location,season is present
            if (txtLocation.Text != "" && ddlSeason.SelectedItem.Value.ToString() != "Select" && txtMinCost.Text == "" && txtMaxCost.Text == "" && txtMinDay.Text == "" && txtMaxDay.Text == "")
            {
                //q = "SELECT [id], [pname], [season], [theme], [duration], [location], [cost], [username] FROM [Packages] where location LIKE '%" + txtLocation.Text + "%' and season='" + ddlSeason.SelectedItem.Value.ToString() + "'";
                q = "SELECT [id], [pname], [season], [theme], [duration], [location], [cost], [username] FROM [Packages] where pname LIKE '" + txtLocation.Text + "%' and season='" + ddlSeason.SelectedItem.Value.ToString() + "'";

            }


            // Check if Location,Cost,days is present
            if (txtLocation.Text != "" && txtMinCost.Text != "" && ddlSeason.SelectedItem.Value.ToString() == "Select" && txtMinDay.Text != "" && txtMaxDay.Text != "")
            {
                //q = "SELECT [id], [pname], [season], [theme], [duration], [location], [cost], [username] FROM [Packages] where location LIKE '%" + txtLocation.Text + "%' and cost between " + txtMinCost.Text + " and " + txtMaxCost.Text + " and duration between " + txtMinDay.Text + " and " + txtMaxDay.Text;
                q = "SELECT [id], [pname], [season], [theme], [duration], [location], [cost], [username] FROM [Packages] where pname LIKE '" + txtLocation.Text + "%' and cost between " + txtMinCost.Text + " and " + txtMaxCost.Text + " and duration between " + txtMinDay.Text + " and " + txtMaxDay.Text;

            }


            // check if only cost is given
            if (txtMinCost.Text != "" && txtLocation.Text == "" && ddlSeason.SelectedItem.Value.ToString() == "Select" && txtMinDay.Text == "" && txtMaxDay.Text == "")
            {
                //q = "SELECT [id], [pname], [season], [theme], [duration], [location], [cost], [username] FROM [Packages] where cost between " + txtMinCost.Text + " and " + txtMaxCost.Text;
                q = "SELECT [id], [pname], [season], [theme], [duration], [location], [cost], [username] FROM [Packages] where cost between " + txtMinCost.Text + " and " + txtMaxCost.Text;

                //Response.Write("Execute"+q);
            }

            // check if only cost,season is given
            if (txtMinCost.Text != "" && ddlSeason.SelectedItem.Value.ToString() != "Select" && txtLocation.Text == "" && txtMinDay.Text == "" && txtMaxDay.Text == "")
            {
                q = "SELECT [id], [pname], [season], [theme], [duration], [location], [cost], [username] FROM [Packages] where cost between " + txtMinCost.Text + " and " + txtMaxCost.Text + "and season='" + ddlSeason.SelectedItem.Value.ToString() + "'";
                // Response.Write("Execute");
            }


            // check if only cost,season,days is given
            if (txtMinCost.Text != "" && ddlSeason.SelectedItem.Value.ToString() != "Select" && txtMinDay.Text != "" && txtLocation.Text == "")
            {
                q = "SELECT [id], [pname], [season], [theme], [duration], [location], [cost], [username] FROM [Packages] where cost between " + txtMinCost.Text + " and " + txtMaxCost.Text + "and season='" + ddlSeason.SelectedItem.Value.ToString() + "' and duration between " + txtMinDay.Text + " and " + txtMaxDay.Text;
                // Response.Write("Execute");
            }
            // check if only Season is given
            if (ddlSeason.SelectedItem.Value.ToString() != "Select" && txtLocation.Text == "" && txtMinCost.Text == "" && txtMaxCost.Text == "" && txtMinDay.Text == "" && txtMaxDay.Text == "")
            {
                q = "SELECT [id], [pname], [season], [theme], [duration], [location], [cost], [username] FROM [Packages] where season='" + ddlSeason.SelectedItem.Value.ToString() + "'";
                //  Response.Write("Execute" + q);
            }

            // check if only Season,Days is given
            if (ddlSeason.SelectedItem.Value.ToString() != "Select" && txtMinDay.Text != "" && txtLocation.Text == "" && txtMinCost.Text == "" && txtMaxCost.Text == "")
            {
                q = "SELECT [id], [pname], [season], [theme], [duration], [location], [cost], [username] FROM [Packages] where season='" + ddlSeason.SelectedItem.Value.ToString() + "' and duration between " + txtMinDay.Text + " and " + txtMaxDay.Text;
                //  Response.Write("Execute" + q);
            }

            SqlDataGetData.SelectCommand = q;

        }
        catch (Exception er)
        {
            ScriptManager.RegisterClientScriptBlock(this, this.GetType(), "alertMessage", "alert('Please give proper input !')", true);
        }
    }
}