using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class KeyValidation : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        txtsecretkey.Attributes.Add("autocomplete", "off");
    }
    protected void btnKey_Click(object sender, EventArgs e)
    {
        string scretKey = "";
        readXmlContent();
        if (otable != null && otable.Rows.Count > 0)
        {
            DataView ofilterview = new DataView(otable);
            ofilterview.RowFilter = "SecretKey ='" + txtsecretkey.Text + "'";
            if (ofilterview != null && ofilterview.Count > 0)
            {
                lblMessage.Text = "Valid USer";
                Session["sceretKey"] =txtsecretkey.Text;
                Response.Redirect("DataDetails.aspx");

                //Query string:
                //?Keys="+txtscretkey.Text
            }
            else
            {
                lblMessage.Text = "Invalid Key!";
            }
        }
        txtsecretkey.Text = String.Empty;
    }

    DataTable otable = new DataTable("New_Table");
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
           // lblMessage.Text = "New file will be created";
        }
    


       
    }
}