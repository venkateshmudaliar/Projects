<%@ Page Title="" Language="C#" MasterPageFile="~/Broker.master" AutoEventWireup="true" EnableEventValidation="false" CodeFile="BrokerReqCoordinator.aspx.cs" Inherits="BrokerReqCoordinator" %>


<asp:Content ID="Content1" ContentPlaceHolderID="cntplaceholder2" Runat="Server">

<style type="text/css">

td{height:22px;}
</style>


<div style="border:1px solid #00C3A9;border-radius:5px;padding-top:30px;padding-bottom:30px;background-color:#171717;font-family:Arial;">
<center>
<h3 style= "color:#D4D4D4;">User Requests</h3>
<br />
        <p>
        <div  class="sc" id="scrolling-table-container" style="font-size:12px;max-height:300px;overflow:auto;margin-right:5px;">

        

        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" 
            onselectedindexchanged="GridView1_SelectedIndexChanged2" 
            ForeColor="#333333" GridLines="Both" Width="622px" >

            <AlternatingRowStyle BackColor="#434343" />
            <Columns>
                <asp:BoundField DataField="UserId" HeaderText="User Id"/>
                <asp:BoundField DataField="UserName" HeaderText="User Name" />
                   <asp:BoundField DataField="EmailId" HeaderText="Email Id" />
                <asp:BoundField DataField="DiseaseName" HeaderText="Disease Name" />                      
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button Text="Select" ID="btnSelect"
                                 runat="server" CommandArgument='<%# Eval("UserId") + ";" + Eval("UserName") + ";" + Eval("EmailId") + ";" + Eval("DiseaseName") %>' CommandName="Select" OnCommand="btnSelect_Command"
                            />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField>
                    <ItemTemplate>
                   
                       <asp:Button Text="Delete" ID="Delete"
                                 runat="server" CommandArgument='<%# Eval("UserId") + ";" + Eval("UserName") + ";" + Eval("EmailId") + ";" + Eval("DiseaseName") %>' CommandName="Select" OnCommand="btnSelect2_Command"
                            />
                          
                           
                


                    </ItemTemplate>
                </asp:TemplateField>

            </Columns>

            



            <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#434343" ForeColor="#D4D4D4" />

            <SelectedRowStyle BackColor="green" Font-Bold="True" ForeColor="yellow" />

            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
        </div>
    </p>
    

</center>
   
  
    <br />
    <br />
 <hr style="border: 0;color: #00C3A9;background-color: #00C3A9;height: 1px;"> 
 <br />
  
 <center>
    
     <table> 
        <tr>
            <td class="auto-style1">
                <span id="disp">User Id</span>
            </td>
            <td>
                
                <span id="disp" style="color:#D4D4D4"><asp:Label ID="lblUserId" Width="150px" runat="server" /></span>
            </td>
        </tr>
        <tr>
            <td>
                <span id="disp">User Name</span>
            </td>
            <td> <span id="disp" style="color:#D4D4D4"><asp:Label ID="lblUserName" Width="150px" runat="server" /></span> </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <span id="disp">Email Id</span>
            </td>
            <td class="auto-style2">
               
              <span id="disp" style="color:#D4D4D4"> <asp:Label ID="lblEmailId" runat="server" Width="150px" /></span>
            </td>
        </tr>
        <tr>
            <td>
                <span id="disp">Disease Name</span>
            </td>
            <td>
                <span id="disp" style="color:#D4D4D4"><asp:Label ID="lblDiseaseName" runat="server" /></span>
            </td>
        </tr>
       
         <tr>
             <td><span id="disp">
                 <asp:Label ID="bname" runat="server" Text="Label">Broker Name</asp:Label></span> </td>
             <td>

                 <span id="disp" style="color:#D4D4D4"><asp:TextBox class="textbox"  ID="txtName" runat="server" /></span>

             </td>
             <td>
                <asp:RequiredFieldValidator ForeColor="#6697EE" ErrorMessage="Broker Name Required" ControlToValidate="txtName"
                        runat="server" ID="RequiredFieldValidator2" ValidationGroup="BrokerReq" style="font-size:14px;" />
             </td>

         </tr>
          </tr>
        <tr><td>&nbsp;</td></tr>
         
          <tr>

            
            <td>
                <asp:Button ID="btnSubmit"  class="button"  runat="server" Width="150px" Text="Submit" OnClick="btnSubmit_Click" ValidationGroup="BrokerReq" />
                
            </td>
        </tr>
        <tr>

            
            <td>
              <asp:Button ID="Deletes" class="button" runat="server" Width="150px" Text="Delete" OnClick="btndelete" ValidationGroup="BrokerReq" />
                            
            </td>
        </tr>
        <tr><td>&nbsp;</td></tr>

        <tr>
        <td colspan="2"><asp:Label ID="lblresult" Width="300px" runat="server" style="font-size:15px;"/></td></tr>

    </table>
</center>   
    </div>
</asp:Content>

