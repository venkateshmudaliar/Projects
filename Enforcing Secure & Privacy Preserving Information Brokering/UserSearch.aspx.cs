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

public partial class UserSearch : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["cs"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {

        readXmlContent();
        txtSearchByDisease.Attributes.Add("autocomplete", "off");

    }

    protected void btnSearchUserByID_Click(object sender, EventArgs e)
    {
        readXmlContent();
        if (otable != null && otable.Rows.Count > 0)
        {
            DataView ofilterview = new DataView(otable);
            ofilterview.RowFilter = "DiseaseName like '%" + txtSearchByDisease.Text + "%'";
            drpSearchDiseaseList.DataSource = ofilterview;
            drpSearchDiseaseList.Items.Clear();
            drpSearchDiseaseList.DataValueField = "id_no";
            drpSearchDiseaseList.DataTextField = "DiseaseName";
            drpSearchDiseaseList.DataBind();

            for (int i = 0; i < drpSearchDiseaseList.Items.Count; i++)
            {
                drpSearchDiseaseList.SelectedIndex = i;
                string str = drpSearchDiseaseList.SelectedItem.ToString();
                for (int counter = i + 1; counter < drpSearchDiseaseList.Items.Count; counter++)
                {
                    drpSearchDiseaseList.SelectedIndex = counter;
                    string compareStr = drpSearchDiseaseList.SelectedItem.ToString();
                    if (str == compareStr)
                    {
                        drpSearchDiseaseList.Items.RemoveAt(counter);
                        counter = counter - 1;
                    }
                }
            }

        }
    }
    DataTable otable = new DataTable("New_Table");
    private void readXmlContent()
    {
        if (otable.Rows.Count > 0)
        {
            otable.Clear();
        }
        string filename = Server.MapPath("") + "\\userlist.xml";
        try
        {
            otable.ReadXml(filename);
            otable.AcceptChanges();
        }
        catch (Exception exp)
        {
            lblre.Text = "No File";
        }
    }
    protected void drpSearchDiseaseList_SelectedIndexChanged(object sender, EventArgs e)
    {

    }


    protected void btnsearch1_Click(object sender, EventArgs e)
    {
        string usid = Session["UserId"].ToString();

        SqlCommand cmd = new SqlCommand("insert into SearchDisease values(@SearchDisease,@Usr_Id)", conn);
        conn.Open();


        string dnamevalue = drpSearchDiseaseList.SelectedItem.Text;

        Session["dnameval"] = dnamevalue;


        cmd.Parameters.AddWithValue("@Usr_Id", usid);
        //cmd.Parameters.AddWithValue("@UserName", lblUserName.Text);

        //cmd.Parameters.AddWithValue("@EmailId", lblEmailId.Text);
        //cmd.Parameters.AddWithValue("@DiseaseName", lblDiseaseName.Text);
        cmd.Parameters.AddWithValue("@SearchDisease", drpSearchDiseaseList.SelectedItem.Text);
        //cmd.Parameters.AddWithValue("@Re_Password", txtrepass.Text);

        cmd.ExecuteNonQuery();
        conn.Close();

        Response.Redirect("UserRequest.aspx");
    }
}


    
  