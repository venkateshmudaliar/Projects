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
        string Pname,Docname,Dname,Ddesc,Age,Email,Emailconf;

        Pname = Session["pname"].ToString();
        Docname = Session["docname"].ToString();
        Dname = Session["diname"].ToString();
        Email = Session["email"].ToString(); 
        Emailconf = Session["emailconf"].ToString();
        Ddesc= Session["ddesc"].ToString();
        Age = Session["ageval"].ToString();

        pname.Text = Pname;
        docname.Text = Docname;
        ageval.Text=Age;
        dname.Text=Dname;
        email.Text=Email;
        ddesc.Text=Ddesc;
        emailconf.Text = Emailconf;
        
    }
}