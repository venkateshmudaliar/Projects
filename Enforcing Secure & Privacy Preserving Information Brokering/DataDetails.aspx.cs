using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Xml;

public partial class DataDetails : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string filename = Server.MapPath("") + "\\userlist.xml";
        DataTable otable = new DataTable();
        otable.ReadXml(filename);
        if (otable != null && otable.Rows.Count > 0 && Session["sceretKey"]!=null)
        {
            DataView ofilterview = new DataView(otable);
            ofilterview.RowFilter = "SecretKey ='" + Session["sceretKey"].ToString() + "'";

            lblPatientName.Text = ofilterview[0]["PatientName"].ToString();
            lblDoctorName.Text = ofilterview[0]["DoctorName"].ToString();
            lblAge.Text = ofilterview[0]["Age"].ToString();
            lblDisease.Text = ofilterview[0]["DiseaseName"].ToString();
            lblEmailID.Text = ofilterview[0]["Email"].ToString();
            lblDescription.Text = ofilterview[0]["DiseaseDescription"].ToString();
        }
       

    }
    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {

    }
}