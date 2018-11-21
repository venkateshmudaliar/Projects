<%@ Page Title="" Language="C#" MasterPageFile="~/Users.master" AutoEventWireup="true" CodeFile="DataDetails.aspx.cs" Inherits="DataDetails" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cntplaceholder2" Runat="Server">



<div style="border:1px solid #00C3A9;border-radius:5px;padding-top:30px;padding-bottom:30px;background-color:#171717;font-family:Arial;">

    <center>

<table style="height: 201px; width: 470px;">

<tr>
                <td><span id="disp" style="font-size:16px;">Patient Name</span></td>
                <td style="width: 223px">
                  <span id="disp" style="color:#6697EE;font-size:16px;"><asp:Label ID="lblPatientName" runat="server" /></span>
                </td>
                 
                </tr>


             <tr>
                    <td>
                        <span id="disp" style="font-size:16px;">Doctor Name</span>
                    </td>
                    
                   <td style="width: 223px">
                  <span id="disp" style="color:#6697EE;font-size:16px;">       
                  <asp:Label ID="lblDoctorName" runat="server" />
                    </span>
                 
                    </td>
                    
                        </tr>


     <tr>
                    <td class="auto-style1">
                       <span id="disp" style="font-size:16px;">Age</span>
                    </td>
                    
                   <td class="auto-style1" style="width: 223px">
                          <span id="disp" style="color:#6697EE;font-size:16px;">
                  <asp:Label ID="lblAge" runat="server" /></span>
                
                 
                    </td>
                  
                        </tr>


  <tr>
                    <td class="auto-style1">
                       <span id="disp" style="font-size:16px;">Disease</span>
                    </td>
                     <td style="width: 223px">

                  <span id="disp" style="color:#6697EE;font-size:16px;"><asp:Label ID="lblDisease" runat="server" /></span>
                </td>
                 
                   
                        </tr>



                          <tr>
                    <td>
                       <span id="disp" style="font-size:16px;"> Email Id</span></td>
                    
                <td style="width: 223px">
                  <span id="disp" style="color:#6697EE;font-size:16px;"><asp:Label ID="lblEmailID" runat="server" /></span>
                </td>
                 
                    
                        </tr>


  <tr>
                    <td>
                       <span id="disp" style="font-size:16px;">Disease Description</span>
                    </td>
                    
                     <td style="width: 223px">
                  <span id="disp" style="color:#6697EE;font-size:16px;"><asp:Label ID="lblDescription" runat="server" /></span>
                </td>
                 
                        </tr>


       <%-- <tr>
            <td>
                <asp:GridView ID="GridView1" runat="server" BackColor="White" 
                    BorderColor="#999999" BorderStyle="None" BorderWidth="1px" CellPadding="3" 
                    GridLines="Vertical" onselectedindexchanged="GridView1_SelectedIndexChanged1">
                    <AlternatingRowStyle BackColor="#DCDCDC" />
                    <FooterStyle BackColor="#CCCCCC" ForeColor="Black" />
                    <HeaderStyle BackColor="#000084" Font-Bold="True" ForeColor="White" />
                    <PagerStyle BackColor="#999999" ForeColor="Black" HorizontalAlign="Center" />
                    <RowStyle BackColor="#EEEEEE" ForeColor="Black" />
                    <SelectedRowStyle BackColor="#008A8C" Font-Bold="True" ForeColor="White" />
                    <SortedAscendingCellStyle BackColor="#F1F1F1" />
                    <SortedAscendingHeaderStyle BackColor="#0000A9" />
                    <SortedDescendingCellStyle BackColor="#CAC9C9" />
                    <SortedDescendingHeaderStyle BackColor="#000065" />
                </asp:GridView>

            </td>

        </tr>--%>


           </center>
                        


</div>
</asp:Content>

