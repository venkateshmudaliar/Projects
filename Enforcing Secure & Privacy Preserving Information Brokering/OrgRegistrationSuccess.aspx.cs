using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class OrgRegistrationSuccess : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string Oname, Olocation;

        Oname = Session["oname"].ToString();
        Olocation = Session["olocation"].ToString();


        oname.Text = Oname;
        olocation.Text = Olocation;
        
        
    }
}