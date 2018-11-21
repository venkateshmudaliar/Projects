using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["RoleType"] != null)
        {
           
            int roleiD = Convert.ToInt32(Session["RoleType"]);
            switch (roleiD)
            {
                case 1:
                    CoordinatorLink.Visible = true;
                    BrokerLink.Visible = false;
                    UserLink.Visible = false;
                    AdminLink.Visible = false;
                    break;
                case 2:
                    CoordinatorLink.Visible = false;
                    BrokerLink.Visible = true;
                    UserLink.Visible = false;
                     AdminLink.Visible = false;
                    break;
                case 3:
                    CoordinatorLink.Visible = false;
                    BrokerLink.Visible = false;
                    UserLink.Visible = true;
                     AdminLink.Visible = false;
                    break;
                case 4:
                    CoordinatorLink.Visible = false;
                    BrokerLink.Visible = false;
                    UserLink.Visible = false;
                    AdminLink.Visible = true;
                    break;
                default:
                    break;
            }
        }
        else {
            CoordinatorLink.Visible = false;
            BrokerLink.Visible = false;
            UserLink.Visible = false;
              AdminLink.Visible = false;
        }

        if (Session["UserId"] != null)
            {
                loginLink.Visible = false;
                logOutLink.Visible = true;

                //Session["uidd"] = Session["UserId"].ToString(); ;
            }
        }    
    }
