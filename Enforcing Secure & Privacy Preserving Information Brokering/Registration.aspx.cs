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

public partial class Registration : System.Web.UI.Page
{
    SqlConnection conn = new SqlConnection(ConfigurationManager.ConnectionStrings["cs"].ToString());
    protected void Page_Load(object sender, EventArgs e)
    {
        txtusername.Attributes.Add("autocomplete", "off");
        txtFirstName1.Attributes.Add("autocomplete", "off");
        txtlastname.Attributes.Add("autocomplete", "off");
        txtdob.Attributes.Add("autocomplete", "off");
        txtemailid.Attributes.Add("autocomplete", "off");
        if (!Page.IsPostBack)
        {
            


            //drpCompanyName.Items.Clear();



            SqlCommand com = new SqlCommand("select * from Organization", conn); // table name 
            SqlDataAdapter da = new SqlDataAdapter(com);
            DataSet ds = new DataSet();
            da.Fill(ds);  // fill dataset

            drpCompanyName.DataTextField = ds.Tables[0].Columns["Org_Name"].ToString(); // text field name of table dispalyed in dropdown
          // drpCompanyName.DataValueField = ds.Tables[0].Columns["Org_Id"].ToString();             // to retrive specific  textfield name 
            drpCompanyName.DataSource = ds.Tables[0];      //assigning datasource to the dropdownlist
            drpCompanyName.DataBind();  //binding dropdownlist
            drpCompanyName.Items.Insert(0, "Select");

            for (int i = 1; i <= drpCompanyName.Items.Count; i++)
            {
                drpCompanyName.SelectedIndex = i;
                string str = drpCompanyName.SelectedItem.ToString();
                for (int counter = i + 1; counter < drpCompanyName.Items.Count; counter++)
                {
                    drpCompanyName.SelectedIndex = counter;
                    string compareStr = drpCompanyName.SelectedItem.ToString();
                    if (str == compareStr)
                    {
                        drpCompanyName.Items.RemoveAt(counter);
                        counter = counter - 1;
                    }
                }
            }

            drpCompanyName.SelectedIndex = 0;
        }
        
        
        
        
        
        
        
        
        
        
        
        
        
        
        //drpCompanyName.Items.Clear();
        //SqlCommand cmd = new SqlCommand( "SELECT Org_Name FROM Organization",conn);
        //DataSet odataset = new DataSet();
        //SqlDataAdapter odap = new SqlDataAdapter(cmd);
        //odap.Fill(odataset);

        //drpCompanyName.DataSource = odataset;
        //drpCompanyName.DataBind();


        //txtfirstname.Text = ods.Tables[0].Rows[0]["Usr_UserName"].ToString();
        //txtEmailId.Text = ods.Tables[0].Rows[0]["Usr_EmailId"].ToString();
        //drpRoleId.SelectedItem.Text = ods.Tables[0].Rows[0]["Usr_RoleId"].ToString();
        //drpMaster.SelectedItem.Text = ods.Tables[0].Rows[0]["Usr_Department"].ToString();
        //drpChild.Text = ods.Tables[0].Rows[0]["Usr_Branch"].ToString();
        
        //drpCompanyName.Items.Add(odataset.Tables[0].Rows[0]["Org_Name"].ToString());
        //txtUserId.Text = ods.Tables[0].Rows[0]["Usr_Id"].ToString();
    }
    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        
        

        //validateprocess();
        SqlCommand valid = new SqlCommand("select * from Registration WHERE Username = @Name", conn);
        valid.Parameters.AddWithValue("@Name", this.txtusername.Text.Trim()); 
        SqlDataAdapter davalid = new SqlDataAdapter(valid);
        DataSet dsvalid = new DataSet();
        davalid.Fill(dsvalid);  // fill dataset
        if (dsvalid.Tables[0].Rows.Count > 0)
        {
            this.invalidusername.Text = "Username Already Exists! Try other Username ";
        }

        else
        {
            SqlCommand cmd = new SqlCommand("insert into Registration values(@UserName,@FirstName,@LastName,@DOB,@Password,@Re_Password,@EmailId,@RegRole,@RoleType,@CompanyName)", conn);

            string Date = txtdob.Text;
            string compname = drpCompanyName.SelectedItem.Text;
            cmd.Parameters.AddWithValue("@UserName", txtusername.Text);
            cmd.Parameters.AddWithValue("@FirstName", txtFirstName1.Text);
            cmd.Parameters.AddWithValue("@LastName", txtlastname.Text);
            cmd.Parameters.AddWithValue("@DOB", Date);
            cmd.Parameters.AddWithValue("@Password", txtPassword.Text);
            cmd.Parameters.AddWithValue("@Re_Password", txtrepass.Text);

            cmd.Parameters.AddWithValue("@EmailId", txtemailid.Text);
            cmd.Parameters.AddWithValue("@RegRole", drpMaster.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@RoleType", drpChild.SelectedItem.Text);
            cmd.Parameters.AddWithValue("@CompanyName", compname);



            conn.Open();
            cmd.ExecuteNonQuery();
            conn.Close();

            Session["uname"] = txtusername.Text;
            Session["email"] = txtemailid.Text;
            Session["rname"] = drpMaster.SelectedItem.Text;
            Session["oname"] = drpCompanyName.SelectedItem.Text;


            //lbl1Result.Text = "Succesfully Inserted...";


            MailMessage msg = new MailMessage();
            msg.From = new MailAddress("venkymudaliar@gmail.com");
            msg.To.Add(txtemailid.Text);
            msg.Subject = "Password";
            msg.Body = "Your password is '" + txtPassword.Text + "'. Change your password asap. <br/>";
            msg.Body += "your UserName is'" + txtusername.Text + "'.....";
            msg.IsBodyHtml = true;
            SmtpClient sc = new SmtpClient();
            sc.Host = "smtp.gmail.com";
            sc.Credentials = new NetworkCredential("venkymudaliar@gmail.com", "shakudodorox1");
            lbl1Result.Visible = true;
            sc.Port = 587;
            sc.EnableSsl = true;
            try
            {
                sc.Send(msg);
                string m="Details successfully sent to the EmailId !";
                Session["emailconf"] = m;


            }

            catch (Exception ex)
            {
                Session["emailconf"] = ex.Message;
            }

            

            Response.Redirect("RegistrationSuccess.aspx");


            mailPrcess();
        }

    }

    protected void drpChild_SelectedIndexChanged(object sender, EventArgs e)
    {
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


           


            case "Admin":

                for (int i = 0; i < 1; i++)
                {

                    oList.Add("4");


                }

                break;





            default:

                break;

        }

        if (drpChild.Items.Count > 0) drpChild.Items.Clear();

        drpChild.DataSource = oList;

        drpChild.DataBind();
    }

    private void mailPrcess()
    {

       

        
        txtusername.Text = String.Empty;
        txtFirstName1.Text = String.Empty;
        txtlastname.Text = String.Empty;
        txtdob.Text = String.Empty;
        txtemailid.Text = String.Empty;
    }

    protected void drpCompanyName_SelectedIndexChanged(object sender, EventArgs e)
    {

    }



    


}