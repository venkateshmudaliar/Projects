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

    
    protected void proview_Click(object sender, EventArgs e)
    {
        Label str = Master.FindControl("Label1") as Label;



        conn.Open();
        SqlCommand cmd = new SqlCommand("SELECT * FROM Registration  WHERE  Usr_Id=@uid", conn);

        cmd.Parameters.AddWithValue("@uid", str.Text);

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);

        if (ds.Tables[0].Rows.Count > 0)
        {
            username.Text = ds.Tables[0].Rows[0]["UserName"].ToString();
            firstname.Text = ds.Tables[0].Rows[0]["FirstName"].ToString();
           lastname.Text = ds.Tables[0].Rows[0]["LastName"].ToString();
            dob.Text = ds.Tables[0].Rows[0]["DOB"].ToString();
            email.Text = ds.Tables[0].Rows[0]["EmailId"].ToString();
            role.Text = ds.Tables[0].Rows[0]["RegRole"].ToString();
            organization.Text = ds.Tables[0].Rows[0]["CompanyName"].ToString();



        }
    }
}