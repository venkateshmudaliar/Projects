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

public partial class CoRec : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["cs"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        txtSearchByDisease.Attributes.Add("autocomplete", "off");
        conn.Open();
        SqlCommand cmd = new SqlCommand("select * from BrokerReq ORDER BY ino DESC", conn);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        conn.Close();
        GridView1.DataSource = ds;
        GridView1.DataBind();


        readXmlContent();

        string query = @"SELECT DISTINCT [BrokerName] FROM [dbo].[BrokerReq]";
        DataSet ods = new DataSet();
        using (SqlConnection osql = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["cs"].ConnectionString))
        {
            using (SqlCommand ocmd = new SqlCommand(query, osql))
            {
                SqlDataAdapter odap = new SqlDataAdapter(ocmd);
                odap.Fill(ods);
            }
        }
        //lblBrokerName.Text = ods.Tables[0].Rows[0]["BrokerName"].ToString();
        //txtEmailId.Text = ods.Tables[0].Rows[0]["Usr_EmailId"].ToString();
        //drpRoleId.SelectedItem.Text = ods.Tables[0].Rows[0]["Usr_RoleId"].ToString();
        //drpMaster.SelectedItem.Text = ods.Tables[0].Rows[0]["Usr_Department"].ToString();
        //drpChild.Text = ods.Tables[0].Rows[0]["Usr_Branch"].ToString();
        drpName.Items.Add(ods.Tables[0].Rows[0]["BrokerName"].ToString());
        //txtUserId.Text = ods.Tables[0].Rows[0]["Usr_Id"].ToString();

        for (int i = 0; i < drpName.Items.Count; i++)
        {
            drpName.SelectedIndex = i;
            string str = drpName.SelectedItem.ToString();
            for (int counter = i + 1; counter < drpName.Items.Count; counter++)
            {
                drpName.SelectedIndex = counter;
                string compareStr = drpName.SelectedItem.ToString();
                if (str == compareStr)
                {
                    drpName.Items.RemoveAt(counter);
                    counter = counter - 1;
                }
            }
        }
    }
   
    protected void btnViewDetails_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("insert into UserTask values(@SelectedDisease,@RequestedDisease,@AssignedBroker,@UserId,@UserName,@EmailId,@SecretKey)", conn);

       

        cmd.Parameters.AddWithValue("@SelectedDisease", drpSearchDiseaseList.SelectedItem.Text);
        cmd.Parameters.AddWithValue("@RequestedDisease", lblReDisease.Text);
        cmd.Parameters.AddWithValue("@AssignedBroker", drpName.SelectedItem.Text);
        
        cmd.Parameters.AddWithValue("@UserId", lblUserId.Text);

        cmd.Parameters.AddWithValue("@UserName", lblName.Text);



        string secret = ViewState["secretkey"].ToString();
        cmd.Parameters.AddWithValue("@EmailId", lblMail1.Text);
        cmd.Parameters.AddWithValue("@SecretKey", secret);
      



        conn.Open();
        cmd.ExecuteNonQuery();
        conn.Close();
        //lbl1Result.Text = "Succesfully Inserted...";

        Response.Redirect("CoAssignTaskSuccess.aspx");

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
    protected void btnSend_Click(object sender, EventArgs e)
    {
        string secretKey = "";
        readXmlContent();
        if (otable != null && otable.Rows.Count > 0)
        {
            DataView ofilterview = new DataView(otable);
            ofilterview.RowFilter = "id_no ='" + drpSearchDiseaseList.SelectedItem.Value + "'";
            secretKey = ofilterview[0]["SecretKey"].ToString();
            ViewState["secretkey"] = secretKey;
        }

        try
        {
                MailMessage Msg = new MailMessage();
                // Sender e-mail address.
                Msg.From = new MailAddress("venkymudaliar@gmail.com"); 
                // Recipient e-mail address.
                Msg.To.Add( lblMail1.Text );
                Msg.Subject = "Your Password Details";
                Msg.Body = "Hi, <br/>Please check your Login Detailss<br/><br/>Your SecretKey: " + secretKey + "<br/><br/>";
                Msg.IsBodyHtml = true;
                // your remote SMTP server IP.
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.Credentials = new System.Net.NetworkCredential("venkymudaliar@gmail.com","shakudodorox1");
                smtp.EnableSsl = true;
                smtp.Send(Msg);
                //Msg = null;
                lblMail.Text = "Key sent to EmaiId";
                // Clear the textbox valuess
                
            }
        catch (Exception ex)
        {
            lblMail.Text = ex.Message;
        }
    }

    DataTable otable = new DataTable("New_Table");
    private object SecretKey;
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
            lblMessage.Text = "";
        }
    }
    protected void drpSearchDiseaseList_SelectedIndexChanged(object sender, EventArgs e)
    {

    }


    protected void btnSelect_Command(object sender, CommandEventArgs e)
    {
        //Label1.Text = e.CommandArgument.ToString();        
        string dname = e.CommandArgument.ToString();
        SqlCommand cmd = new SqlCommand("select * from UserReq where UserId=@UserId AND UserName=@UserName AND EmailId=@EmailId AND DiseaseName=@DiseaseName", conn);

        string[] arg = new string[4];
        arg = e.CommandArgument.ToString().Split(';');

        string uidd = arg[0];
        string unamed = arg[1];
        string emaildd = arg[2];
        string disnamed = arg[3];




        cmd.Parameters.Add("@UserId", uidd);
        cmd.Parameters.Add("@UserName", unamed);
        cmd.Parameters.Add("@EmailId", emaildd);
        cmd.Parameters.Add("@DiseaseName", disnamed);


        
        
         
        
        
        
        
        
        
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            lblUserId.Text = ds.Tables[0].Rows[0]["UserId"].ToString();
            lblName.Text = ds.Tables[0].Rows[0]["UserName"].ToString();
            lblMail1.Text = ds.Tables[0].Rows[0]["EmailId"].ToString();
            lblReDisease.Text = ds.Tables[0].Rows[0]["DiseaseName"].ToString();
                    }
    }

    protected void GridView1_SelectedIndexChanged2(object sender, EventArgs e)
    {

    }
    protected void txtSearchByDisease_TextChanged(object sender, EventArgs e)
    {

    }
}