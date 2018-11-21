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

public partial class forgotPassword : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["cs"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnEmail_Click(object sender, EventArgs e)
    {

        try
        {
            DataSet ds = new DataSet();
            {
                conn.Open();
                SqlCommand cmd = new SqlCommand("SELECT Usr_Id,UserName,Password FROM Registration Where EmailId= '" + txtEmailId.Text.Trim() + "'", conn);
                SqlDataAdapter da = new SqlDataAdapter(cmd);
                da.Fill(ds);
                conn.Close();
            }
            if (ds.Tables[0].Rows.Count > 0)
            {
                MailMessage Msg = new MailMessage();
                // Sender e-mail address.
                Msg.From = new MailAddress("venkymudaliar@gmail.com"); ;
                // Recipient e-mail address.
                Msg.To.Add(txtEmailId.Text);
                Msg.Subject = "Your Password Details";
                Msg.Body = "Hi, <br/>Please check your Login Detailss<br/><br/>Your User Id: " + ds.Tables[0].Rows[0]["Usr_Id"] + "<br/><br/>Your UserName: " + ds.Tables[0].Rows[0]["UserName"] + "<br/><br/>Your Password: " + ds.Tables[0].Rows[0]["Password"] + "<br/><br/>";
                Msg.IsBodyHtml = true;
                // your remote SMTP server IP.
                SmtpClient smtp = new SmtpClient();
                smtp.Host = "smtp.gmail.com";
                smtp.Port = 587;
                smtp.Credentials = new System.Net.NetworkCredential("venkymudaliar@gmail.com", "shakudodorox1");
                smtp.EnableSsl = true;
                smtp.Send(Msg);
                //Msg = null;
                lbl1Result.Text = "Password Details Sent to your EmailId";
                // Clear the textbox valuess
                txtEmailId.Text = "";
            }
            else
            {
                lbl1Result.Text = "The Email you entered does not exists.";
            }

            txtEmailId.Text = String.Empty;
        }


        catch (Exception ex)
        {
            lbl1Result.Text = ex.Message;
        }




    }
}