using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Admin : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["UserId"] != null)
        {
            
            logOutLink.Visible = true;
        }

        string Name = (string)(Session["UserId"]);
        Label1.Text = Name;
        TextBox1.Text = Name;

        //changepw.ServerClick += new EventHandler(demofunct);
        

    }


    /*

    protected void demofunct(object sender, EventArgs e)
    {
        string UID = Session["UserId"].ToString();
        Session["uidd"] = UID;
    }
    */


    
}
