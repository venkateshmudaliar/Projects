﻿using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class BrokerDefault : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string NAME = Session["Uname"].ToString();
        Label1.Text = NAME;


    }
}