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


public partial class AdminDefault : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["cs"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        
        SqlCommand valid = new SqlCommand("select * from Registration WHERE Password = @Name", conn);
        valid.Parameters.AddWithValue("@Name", this.oldpass.Text);
        SqlDataAdapter davalid = new SqlDataAdapter(valid);
        DataSet dsvalid = new DataSet();
        davalid.Fill(dsvalid);  // fill dataset
        if (dsvalid.Tables[0].Rows.Count == 0)
        {
            this.Label1.Text = "Old Password doesnt match";
        }

        else
        {
            //string SUSRID = Session["uidd"].ToString();

            Label str = Master.FindControl("Label1") as Label;
            string SUSRID = str.Text;


            SqlCommand cmd = new SqlCommand("UPDATE Registration SET Password=@pass,Re_password=@repass WHERE Password=@oldpass AND Usr_Id=@uid", conn);
            cmd.Parameters.AddWithValue("@pass", newpass.Text);
            cmd.Parameters.AddWithValue("@repass", newrepass.Text);
            cmd.Parameters.AddWithValue("@oldpass", oldpass.Text);
            cmd.Parameters.AddWithValue("@uid", SUSRID);


            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();


           // lbl1Result.Text = "Password Changed Successfully !";
            Response.Redirect("userchangepwsuccess.aspx");

        }
    }
}