using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data.SqlClient;
using System.Configuration;
using System.Data;

public partial class RegistrationSuccess : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string Uname, Oname, Rname, Email,EmailConf;

        Oname = Session["oname"].ToString();
        Uname = Session["uname"].ToString();
        Rname = Session["rname"].ToString();
        Email = Session["email"].ToString();
        EmailConf = Session["emailconf"].ToString();

        uname.Text = Uname;
        rname.Text = Rname;
        oname.Text = Oname;
        email.Text = Email;
        emailconf.Text = EmailConf;
        
    }
}