using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Data;
using System.Configuration;
using System.Data.SqlClient;

public partial class BrokerReqCoordinator : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["cs"].ToString());

    protected void Page_Load(object sender, EventArgs e)
    {
        Deletes.Visible = false;
        conn.Open();
        SqlCommand cmd = new SqlCommand("select DISTINCT * from UserReq ORDER BY ino DESC", conn);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        conn.Close();
        GridView1.DataSource = ds;
        GridView1.DataBind();

       
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("insert into BrokerReq values(@UserId,@UserName,@EmailId,@DiseaseName,@BrokerName)", conn);
        conn.Open();
        cmd.Parameters.AddWithValue("@UserId", lblUserId.Text);
        cmd.Parameters.AddWithValue("@UserName", lblUserName.Text);

        cmd.Parameters.AddWithValue("@EmailId", lblEmailId.Text);
        cmd.Parameters.AddWithValue("@DiseaseName", lblDiseaseName.Text);
        cmd.Parameters.AddWithValue("@BrokerName", txtName.Text);
        //cmd.Parameters.AddWithValue("@Re_Password", txtrepass.Text);

        cmd.ExecuteNonQuery();
        conn.Close();
        //lblresult.Text = "Request Sent To Coordinator.";

        Response.Redirect("BrokerReqCoordinatorSuccess.aspx");
       
       
    }


    protected void btnSelect_Command(object sender, CommandEventArgs e)
    {
        //lblErrorStatus.Text = e.CommandArgument.ToString();  
        txtName.Attributes.Add("autocomplete", "off");
        txtName.Visible = true;
        btnSubmit.Visible = true;
        Deletes.Visible = false;
        bname.Visible = true;

        SqlCommand cmd = new SqlCommand("select * from UserReq where UserId=@UserId AND UserName=@UserName AND EmailId=@EmailId AND DiseaseName=@DiseaseName", conn);

        string[] arg = new string[4];
        arg = e.CommandArgument.ToString().Split(';');

        string uid = arg[0];
        string uname = arg[1];
        string emaild = arg[2];
        string dname = arg[3];




        cmd.Parameters.Add("@UserId", uid);
        cmd.Parameters.Add("@UserName", uname);
        cmd.Parameters.Add("@EmailId", emaild);
        cmd.Parameters.Add("@DiseaseName", dname);

        
        
        
        
        
        

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            lblUserId.Text = ds.Tables[0].Rows[0]["UserId"].ToString();
            lblUserName.Text = ds.Tables[0].Rows[0]["UserName"].ToString();
            lblEmailId.Text = ds.Tables[0].Rows[0]["EmailId"].ToString();
            lblDiseaseName.Text = ds.Tables[0].Rows[0]["DiseaseName"].ToString();


        }

        
        
    }

    protected void GridView1_SelectedIndexChanged2(object sender, EventArgs e)
    {
    }

    protected void btnSelect2_Command(object sender, CommandEventArgs e)
    {
        //lblErrorStatus.Text = e.CommandArgument.ToString();  
        txtName.Attributes.Add("autocomplete", "off");
        txtName.Visible = false;
        btnSubmit.Visible = false;
        bname.Visible = false;
        Deletes.Visible = true;
        SqlCommand cmd = new SqlCommand("select * from UserReq where UserId=@UserId AND UserName=@UserName AND EmailId=@EmailId AND DiseaseName=@DiseaseName", conn);

        string[] arg = new string[4];
        arg = e.CommandArgument.ToString().Split(';');

        string uid = arg[0];
        string uname = arg[1];
        string emaild = arg[2];
        string dname = arg[3];




        cmd.Parameters.Add("@UserId", uid);
        cmd.Parameters.Add("@UserName", uname);
        cmd.Parameters.Add("@EmailId", emaild);
        cmd.Parameters.Add("@DiseaseName", dname);








        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        if (ds.Tables[0].Rows.Count > 0)
        {
            lblUserId.Text = ds.Tables[0].Rows[0]["UserId"].ToString();
            lblUserName.Text = ds.Tables[0].Rows[0]["UserName"].ToString();
            lblEmailId.Text = ds.Tables[0].Rows[0]["EmailId"].ToString();
            lblDiseaseName.Text = ds.Tables[0].Rows[0]["DiseaseName"].ToString();


        }



    }


    protected void btndelete(object sender, EventArgs e)
    {
        SqlCommand cmd = new SqlCommand("DELETE FROM UserReq where UserId=@UserId AND UserName=@UserName AND EmailId=@EmailId AND DiseaseName=@DiseaseName", conn);
        conn.Open();
        cmd.Parameters.AddWithValue("@UserId", lblUserId.Text);
        cmd.Parameters.AddWithValue("@UserName", lblUserName.Text);

        cmd.Parameters.AddWithValue("@EmailId", lblEmailId.Text);
        cmd.Parameters.AddWithValue("@DiseaseName", lblDiseaseName.Text);
        //cmd.Parameters.AddWithValue("@BrokerName", txtName.Text);
        //cmd.Parameters.AddWithValue("@Re_Password", txtrepass.Text);

        cmd.ExecuteNonQuery();
        conn.Close();
        //lblresult.Text = "Request Sent To Coordinator.";

        Response.Redirect("BrokerReqCoordinator.aspx");


    }



       
        


   
}