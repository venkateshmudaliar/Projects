using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Broker : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserId"] != null)
        {
           
            logOutLink.Visible = true;
        }

        string Name = (string)(Session["UserId"]);
        Label1.Text = Name;

    }
}
