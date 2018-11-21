using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Net;
using System.Net.Mail;

public partial class OrgRegistration : System.Web.UI.Page
{

    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["cs"].ToString());
    private string Admin;

    protected void Page_Load(object sender, EventArgs e)
    {
        OrgName.Attributes.Add("autocomplete", "off");

    }
    protected void drpMaster_SelectedIndexChanged(object sender, EventArgs e)
    {
        
        
        List<string> oList = new List<string>();

        switch (drpMaster.SelectedItem.Text)
        {

           

            case "Broker":

                for (int i = 0; i < 1; i++)
                {

                    oList.Add("2");


                }

                break;

            case "Co-Ordinator":

                for (int i = 0; i < 1; i++)
                {

                    oList.Add("1");


                }

                break;


            case "Users":

                for (int i = 0; i < 1; i++)
                {

                    oList.Add("3");


                }

                break;


            //case "DataOwner":

            //    for (int i = 0; i < 1; i++)
            //    {

            //        oList.Add("4");


            //    }

            //    break;


            case "Admin":

                for (int i = 0; i < 1; i++)
                {

                    oList.Add("4");


                }

                break;





            

        }

        if (drpChild.Items.Count > 0) drpChild.Items.Clear();

        drpChild.DataSource = oList;

        drpChild.DataBind();

        if (drpMaster.SelectedItem.Text == Admin)
        {
            OrgName.Visible = false;
        }
       

    }
    protected void drpChild_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void confDrpCompany_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void txtName_TextChanged(object sender, EventArgs e)
    {

    }


    protected void btnSaveConfig_Click(object sender, EventArgs e)
    {

        

        SqlCommand cmd = new SqlCommand("insert into Organization values(@Org_Type,@Org_Name,@Org_Id,@Org_Location)", conn);
        
        cmd.Parameters.AddWithValue("@Org_Type", drpMaster.SelectedItem.Text);

        cmd.Parameters.AddWithValue("@Org_Id", drpChild.SelectedItem.Text);
        cmd.Parameters.AddWithValue("@Org_Name", OrgName.Text);
        cmd.Parameters.AddWithValue("@Org_Location", drpOrgLocation.SelectedItem.Text);
        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
       //lblReply.Text = "Saved Successfully !";

        Session["oname"] = OrgName.Text;
        Session["olocation"] = drpOrgLocation.SelectedItem.Text;
        
        

       Response.Redirect("OrgRegistrationSuccess.aspx");
        //Response.Redirect(Request.Url.AbsoluteUri);



       OrgName.Text = String.Empty;
        
    
    
    
    }

    
}