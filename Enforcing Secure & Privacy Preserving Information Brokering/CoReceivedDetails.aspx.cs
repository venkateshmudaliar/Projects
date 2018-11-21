using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Xml;

public partial class CoReceivedTask : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!Page.IsPostBack)
            BindData();

    }
    protected void GridView1_SelectedIndexChanged1(object sender, EventArgs e)
    {
       
    }

    protected void gvProducts_RowDeleting(Object sender, GridViewDeleteEventArgs e)
    {
        
        DataSet dsProducts = ViewState["New_Table"] as DataSet;

       
        dsProducts.Tables[0].Rows[e.RowIndex].Delete();

        
        dsProducts.WriteXml(GetXMLSourcePath());
        ViewState["New_Table"] = dsProducts;

        //change gridview back to normal window
        GridView1.EditIndex = -1;

        //rebind the gridview with latest data
        BindData();
    }
    private void BindData()
    {
        
        GridView1.DataSource = RetrieveProducts();
        GridView1.DataBind();
    }
    private DataSet RetrieveProducts()
    {

        if (ViewState["New_Table"] != null)
            return ViewState["New_Table"] as DataSet;

        DataSet dsProducts = new DataSet();

       
        dsProducts.ReadXml(Server.MapPath("userlist.xml"));




        ViewState["New_Table"] = dsProducts;

        return dsProducts;
    }
    private string GetXMLSourcePath()
    {
        return Server.MapPath(@"userlist.xml");
    }

}