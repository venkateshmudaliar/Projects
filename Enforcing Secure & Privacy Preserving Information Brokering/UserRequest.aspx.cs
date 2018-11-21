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


public partial class UserRequest : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["cs"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {

        Read();
        Read1();

        

    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("insert into UserReq values(@UserId,@UserName,@EmailId,@DiseaseName)", conn);
        conn.Open();
        cmd.Parameters.AddWithValue("@UserId", lblUserId.Text);
        cmd.Parameters.AddWithValue("@UserName", lblUserName.Text);

        cmd.Parameters.AddWithValue("@EmailId", lblEmailId.Text);
        cmd.Parameters.AddWithValue("@DiseaseName", lblDiseaseName.Text);
        //cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
        //cmd.Parameters.AddWithValue("@Re_Password", txtrepass.Text);

        cmd.ExecuteNonQuery();
        conn.Close();
       // lblresult.Text = "Request Submitted Successfully";

        Response.Redirect("UserRequestSuccess.aspx");

    }

    public void Read()
    {
       /* string uid = Session["UserId"].ToString();
        string query = "SELECT [Usr_Id],[UserName],[EmailId] FROM [dbo].[Registration] WHERE [Usr_Id]= @uid  ";
        DataSet ods = new DataSet();
        using (SqlConnection osql = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["cs"].ConnectionString))
        {
            using (SqlCommand ocmd = new SqlCommand(query, osql))
            {
                SqlDataAdapter odap = new SqlDataAdapter(ocmd);
                odap.Fill(ods);
            }
        }*/

        SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["cs"].ConnectionString);
        string usid = Session["UserId"].ToString();
        
        SqlCommand cmd = new SqlCommand("select Usr_Id,Username,EmailId from Registration where Usr_Id=@uid", conn);
        cmd.Parameters.AddWithValue("@uid", usid);
       

        DataSet odataset = new DataSet();
        SqlDataAdapter odap = new SqlDataAdapter(cmd);
        odap.Fill(odataset);

        lblUserId.Text = odataset.Tables[0].Rows[0]["Usr_Id"].ToString();
        lblUserName.Text = odataset.Tables[0].Rows[0]["UserName"].ToString();
        lblEmailId.Text = odataset.Tables[0].Rows[0]["EmailId"].ToString();
        //lblRoleID.Text = ods.Tables[0].Rows[0]["Usr_RoleId"].ToString();
        //lblDepartment.Text = ods.Tables[0].Rows[0]["Usr_Department"].ToString();
        //lblBranch.Text = ods.Tables[0].Rows[0]["Usr_Branch"].ToString();
        //lblDesignation.Text = ods.Tables[0].Rows[0]["Usr_Designation"].ToString();
       
    }

    public void Read1()
    {
        string query = @"SELECT [SearchDisease] FROM [dbo].[SearchDisease] where Usr_Id=" + Session["UserId"].ToString();
        DataSet ods = new DataSet();
        using (SqlConnection osql = new SqlConnection(System.Configuration.ConfigurationManager.ConnectionStrings["cs"].ConnectionString))
        {
            using (SqlCommand ocmd = new SqlCommand(query, osql))
            {
                SqlDataAdapter odap = new SqlDataAdapter(ocmd);
                odap.Fill(ods);
            }
        }
        string newdname = Session["dnameval"].ToString();
        lblDiseaseName.Text = newdname;
        //lblRoleID.Text = ods.Tables[0].Rows[0]["Usr_RoleId"].ToString();
        //lblDepartment.Text = ods.Tables[0].Rows[0]["Usr_Department"].ToString();
        //lblBranch.Text = ods.Tables[0].Rows[0]["Usr_Branch"].ToString();
        //lblDesignation.Text = ods.Tables[0].Rows[0]["Usr_Designation"].ToString();
    }
}