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

public partial class BrokerAssReUser : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["cs"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        Button1.Visible = false;
        btnSubmit.Visible = false;
        conn.Open();
        SqlCommand cmd = new SqlCommand("select * from UserTask  ORDER BY ino DESC", conn);
        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);
        conn.Close();
        GridView1.DataSource = ds;
        GridView1.DataBind();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {

        lblVerify.Visible = false;

        

        SqlCommand cmd = new SqlCommand("insert into BrokerAssReUser values(@UserId,@UserName,@EmailId,@SelectedDiseaseName,@RequestedDiseaseName,@AssignedBroker)", conn);
        conn.Open();
        cmd.Parameters.AddWithValue("@UserId", lblUserId.Text);
        cmd.Parameters.AddWithValue("@UserName", lblUserName.Text);

        cmd.Parameters.AddWithValue("@EmailId", lblEmailId.Text);
        cmd.Parameters.AddWithValue("@SelectedDiseaseName", lblDiseaseName.Text);
        cmd.Parameters.AddWithValue("@RequestedDiseaseName", lblReDisease.Text);

        cmd.Parameters.AddWithValue("@AssignedBroker", lblAssBroker.Text);

        cmd.ExecuteNonQuery();
        conn.Close();
        //lblresult.Text = "Data Assigned Successfully!";

        Response.Redirect("BrokerAssReUserSuccess.aspx");


    }


    protected void btnSelect_Command(object sender, CommandEventArgs e)
    {
        //lblErrorStatus.Text = e.CommandArgument.ToString();
        btnSubmit.Visible = true;
        Button1.Visible = false;
        SqlCommand cmd = new SqlCommand("select * from UserTask where  RequestedDisease=@RequestedDisease AND  UserId=@Userid", conn);

        string[] arg = new string[6];
        arg = e.CommandArgument.ToString().Split(';');

        string selectedd = arg[0];
        string requestedd = arg[1];
        string assignedbroker = arg[2];
        string userid = arg[3];
        string usern = arg[4];
        string mail = arg[5];




        cmd.Parameters.Add("@SelectedDisease", selectedd);
        cmd.Parameters.Add("@RequestedDisease", requestedd);
        cmd.Parameters.Add("@AssignedBroker", assignedbroker);
        cmd.Parameters.Add("@UserId", userid);
        cmd.Parameters.Add("@UserName", usern);
        cmd.Parameters.Add("@EmailId", mail);

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);

        if (ds.Tables[0].Rows.Count > 0)
        {
            lblDiseaseName.Text = ds.Tables[0].Rows[0]["SelectedDisease"].ToString();
            lblReDisease.Text = ds.Tables[0].Rows[0]["RequestedDisease"].ToString();
            lblAssBroker.Text = ds.Tables[0].Rows[0]["AssignedBroker"].ToString();

            lblUserId.Text = ds.Tables[0].Rows[0]["UserId"].ToString();
           lblUserName.Text = ds.Tables[0].Rows[0]["UserName"].ToString();
           lblEmailId.Text = ds.Tables[0].Rows[0]["EmailId"].ToString();


           

            lblVerify.Text = "Details of UserName are verified. Please Proceed!";
            
        }
    }

    protected void btnSelect1_Command(object sender, CommandEventArgs e)
    {
        //lblErrorStatus.Text = e.CommandArgument.ToString();  

        btnSubmit.Visible = false;
        Button1.Visible = true;
        lblVerify.Visible = false;

        SqlCommand cmd = new SqlCommand("select * from UserTask where  RequestedDisease=@RequestedDisease AND  UserId=@Userid", conn);

        string[] arg = new string[6];
        arg = e.CommandArgument.ToString().Split(';');

        string selectedd = arg[0];
        string requestedd = arg[1];
        string assignedbroker = arg[2];
        string userid = arg[3];
        string usern = arg[4];
        string mail = arg[5];




        cmd.Parameters.Add("@SelectedDisease", selectedd);
        cmd.Parameters.Add("@RequestedDisease", requestedd);
        cmd.Parameters.Add("@AssignedBroker", assignedbroker);
        cmd.Parameters.Add("@UserId", userid);
        cmd.Parameters.Add("@UserName", usern);
        cmd.Parameters.Add("@EmailId", mail);

        SqlDataAdapter da = new SqlDataAdapter(cmd);
        DataSet ds = new DataSet();
        da.Fill(ds);

        if (ds.Tables[0].Rows.Count > 0)
        {
            lblDiseaseName.Text = ds.Tables[0].Rows[0]["SelectedDisease"].ToString();
            lblReDisease.Text = ds.Tables[0].Rows[0]["RequestedDisease"].ToString();
            lblAssBroker.Text = ds.Tables[0].Rows[0]["AssignedBroker"].ToString();

            lblUserId.Text = ds.Tables[0].Rows[0]["UserId"].ToString();
            lblUserName.Text = ds.Tables[0].Rows[0]["UserName"].ToString();
            lblEmailId.Text = ds.Tables[0].Rows[0]["EmailId"].ToString();




            //lblVerify.Text = "Details of UserName are verified. Please Proceed!";

        }
    }

    protected void GridView1_SelectedIndexChanged2(object sender, EventArgs e)
    {

    }
    protected void btnSubmit1_Click(object sender, EventArgs e)
    {
        lblVerify.Visible = false;

        SqlCommand cmd = new SqlCommand("DELETE FROM UserTask WHERE SelectedDisease=@SelectedDiseaseName AND RequestedDisease=@RequestedDiseaseName AND AssignedBroker=@AssignedBroker AND UserId=@UserId AND UserName=@UserName AND EmailId=@EmailId", conn);
        conn.Open();
        cmd.Parameters.AddWithValue("@UserId", lblUserId.Text);
        cmd.Parameters.AddWithValue("@UserName", lblUserName.Text);

        cmd.Parameters.AddWithValue("@EmailId", lblEmailId.Text);
        cmd.Parameters.AddWithValue("@SelectedDiseaseName", lblDiseaseName.Text);
        cmd.Parameters.AddWithValue("@RequestedDiseaseName", lblReDisease.Text);

        cmd.Parameters.AddWithValue("@AssignedBroker", lblAssBroker.Text);

        cmd.ExecuteNonQuery();
        conn.Close();
        //lblresult.Text = "Data Assigned Successfully!";

        Response.Redirect("BrokerAssReUser.aspx");
    }
}