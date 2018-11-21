using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class Login : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["cs"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        txtLoginUserID.Attributes.Add("autocomplete", "off");
        txtLoginPassword.Attributes.Add("autocomplete", "off");
        
    }
    protected void btnLogin_Click(object sender, EventArgs e)
    {

        string id = txtLoginUserID.Text;
        string pass = txtLoginPassword.Text;
        string drop = drpMaster.SelectedItem.Text;
        SqlCommand cmd = new SqlCommand("select * from Registration where UserName=@uid and Password=@passw and RegRole=@dropd", conn);
        cmd.Parameters.AddWithValue("@uid", id);
        cmd.Parameters.AddWithValue("@passw", pass);
        cmd.Parameters.AddWithValue("@dropd", drop);

        DataSet odataset = new DataSet();
        SqlDataAdapter odap = new SqlDataAdapter(cmd);
        odap.Fill(odataset);

        if (odataset.Tables[0].Rows.Count == 0)
        {
            lblErrorr.Text = "Invalid User";
            txtLoginUserID.Text = String.Empty;

        }
        else
        {
            Session["UserId"] = odataset.Tables[0].Rows[0]["Usr_Id"].ToString();
            Session["RoleType"] = odataset.Tables[0].Rows[0]["RoleType"].ToString();


            Session["Uname"] = txtLoginUserID.Text;


            switch (drop)
            {

                case "Broker":

                    Response.Redirect("BrokerDefault.aspx");

                    break;

                case "Co-Ordinator":

                    Response.Redirect("CoDefault.aspx");

                    break;


                case "Users":

                    Response.Redirect("UserDefault.aspx");

                    break;





                case "Admin":

                    Response.Redirect("AdminDefault.aspx");

                    break;



                default:

                    break;

            }
           // Response.Redirect("DefaultMaster.aspx");
        }

   
    }
    protected void lnkforgetUser_Click(object sender, EventArgs e)
    {
        Response.Redirect("ForgotPassword.aspx");
    }
    protected void drpMaster_SelectedIndexChanged(object sender, EventArgs e)
    {
        txtLoginUserID.Attributes.Add("autocomplete", "off");
        txtLoginPassword.Attributes.Add("autocomplete", "off");
    }
}