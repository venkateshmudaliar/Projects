using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Security.Cryptography;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Xml;
using System.Net;
using System.Net.Mail;

public partial class PatientDetailsaspx : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        txtPatientName.Attributes.Add("autocomplete", "off");
        txtDoctorName.Attributes.Add("autocomplete", "off");
        txtAge.Attributes.Add("autocomplete", "off");
        txtDisease.Attributes.Add("autocomplete", "off");
        txtEmailID.Attributes.Add("autocomplete", "off");
        txtDescription.Attributes.Add("autocomplete", "off");


        if (!Page.IsPostBack)
        {
            readXmlContent();
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
        //if (otable.Rows.Count>0)
        //{
        //    otable.Clear();
        //}
        try
        {
            otable.ReadXml(filename);
            otable.AcceptChanges();
            //lblCount.Text = otable.Rows.Count.ToString();
        }
        catch (Exception exp)
        {
            //lblCount.Text = "New file will be created";
        }
    }

    protected void btnSubmit_Click(object sender, EventArgs e)
    {
        
        readXmlContent();
        string filename = Server.MapPath("") + "\\userlist.xml";
        string secretkey = StringBuilder();
        //MailProcess(secretkey);        
        //DataTable otable = new DataTable("");
        if (otable.Columns.Count==0)
        {
            DataColumn odc = new DataColumn("id_no", typeof(int));
            odc.AutoIncrement = true;
            odc.AutoIncrementStep = 1;
            odc.AutoIncrementSeed = 1;
            otable.Columns.Add(odc);

            otable.Columns.Add("PatientName", typeof(string));
            otable.Columns.Add("DoctorName", typeof(string));
            otable.Columns.Add("Age", typeof(string));
            otable.Columns.Add("DiseaseName", typeof(string));
            otable.Columns.Add("Email", typeof(string));
            otable.Columns.Add("DiseaseDescription", typeof(string));
            otable.Columns.Add("SecretKey", typeof(string));
        }
        
        DataRow odr = otable.NewRow();
        odr["PatientName"] = txtPatientName.Text;
        odr["DoctorName"] = txtDoctorName.Text;
        odr["Age"] = txtAge.Text;
        odr["DiseaseName"] = txtDisease.Text;
        odr["Email"] = txtEmailID.Text;
        odr["DiseaseDescription"] = txtDescription.Text;
        odr["SecretKey"] = secretkey;
        
        otable.Rows.Add(odr);

        otable.AcceptChanges();

        otable.WriteXml(filename, XmlWriteMode.WriteSchema);
        readXmlContent();

        Session["pname"] = txtPatientName.Text;
        Session["docname"] = txtDoctorName.Text;
        Session["ageval"] = txtAge.Text;
        Session["diname"] = txtDisease.Text;
        Session["email"] = txtEmailID.Text;
        Session["ddesc"] = txtDescription.Text;




        MailMessage msg = new MailMessage();
        msg.From = new MailAddress("venkymudaliar@gmail.com");
        msg.To.Add(txtEmailID.Text);
        msg.Subject = "Password";
        msg.Body = "Your password is '" + secretkey + "'. Change your password asap. <br/>";

        msg.IsBodyHtml = true;
        SmtpClient sc = new SmtpClient();
        sc.Host = "smtp.gmail.com";
        sc.Credentials = new NetworkCredential("venkymudaliar@gmail.com", "shakudodorox1");
        lblResult.Visible = true;
        sc.EnableSsl = true;
        sc.Port = 587;
        try
        {
            sc.Send(msg);
            string m = "Details submitted successfully.";
            Session["emailconf"] = m;
            


        }

        catch (Exception ex)
        {
            Session["emailconf"] = ex.Message;
        }

        Response.Redirect("UserDetailsSuccess.aspx");

        txtPatientName.Text=String.Empty;
        txtDoctorName.Text = String.Empty;
        txtAge.Text = String.Empty;
        txtDisease.Text = String.Empty;
        txtEmailID.Text = String.Empty;
        txtDescription.Text = String.Empty;


    }
    private void BindData()
    {
        XmlTextReader xmlReader = new XmlTextReader(Server.MapPath("InsertData.xml"));

        xmlReader.Close();

    }

    public string StringBuilder()
    {
        var chars = "abcdefghijklmopqrstuvwxyz0123456789";
        var random = new Random();
        var result = new string(Enumerable.Repeat(chars, 8).Select(s => s[random.Next(s.Length)]).ToArray());
        return result;
    }

    public void MailProcess(string secret)
    {
        

    }
}