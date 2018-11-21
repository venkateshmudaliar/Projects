<%@ Page Title="" Language="C#" MasterPageFile="~/Broker.master" AutoEventWireup="true" EnableEventValidation="false" CodeFile="BrokerAssReUser.aspx.cs" Inherits="BrokerAssReUser" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cntplaceholder2" Runat="Server">
<div style="border:1px solid #00C3A9;border-radius:5px;padding-top:30px;padding-bottom:30px;background-color:#171717;font-family:Arial;">


<center style="font-size:12px;">
<div style="font-size:12px;max-height:300px;overflow:auto;margin-right:5px;">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" 
            onselectedindexchanged="GridView1_SelectedIndexChanged2" 
            ForeColor="#333333" GridLines="Both" Width="807px">
            <%-- %><AlternatingRowStyle BackColor="White" />--%>
            <Columns>
                <asp:BoundField DataField="SelectedDisease" HeaderText="SelectedDisease" />
                <asp:BoundField DataField="RequestedDisease" HeaderText="RequestedDisease" />
                   <asp:BoundField DataField="AssignedBroker" HeaderText="AssignedBroker" />
<asp:BoundField DataField="UserId" HeaderText="UserId" />  
<asp:BoundField DataField="UserName" HeaderText="UserName" /> 
<asp:BoundField DataField="EmailId" HeaderText="EmailId" /> 
                 
                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button Text="Select" ID="btnSelect"
                                 runat="server" CommandArgument='<%# Eval("SelectedDisease") + ";" + Eval("RequestedDisease") + ";" + Eval("AssignedBroker") + ";" + Eval("UserId") + ";" + Eval("UserName") + ";" + Eval("EmailId") %>' CommandName="Select" OnCommand="btnSelect_Command"
                            />
                    </ItemTemplate>
                </asp:TemplateField>

                <asp:TemplateField>
                    <ItemTemplate>
                        <asp:Button Text="Delete" ID="btnSelect1"
                                 runat="server" CommandArgument='<%# Eval("SelectedDisease") + ";" + Eval("RequestedDisease") + ";" + Eval("AssignedBroker") + ";" + Eval("UserId") + ";" + Eval("UserName") + ";" + Eval("EmailId") %>' CommandName="Select" OnCommand="btnSelect1_Command"
                            />
                    </ItemTemplate>
                </asp:TemplateField>
            </Columns>

            <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White" />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#434343" ForeColor="#D4D4D4" />
            <SelectedRowStyle BackColor="#FFCC66" Font-Bold="True" ForeColor="Navy" />
            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
        </asp:GridView>
        </div>
    </center>

   <br /><br />
    <hr style="border: 0;color: #00C3A9;background-color: #00C3A9;height: 1px;"> 
    <br />
    
    
    <center>
    
     <table align="center"> 
        <tr style="height=25px;">
            <td class="auto-style1" style="width: 214px">
                <span id="disp">User Id</span>
            </td>
            <td style="width: 215px">
                
               <span id="disp"> <asp:Label ID="lblUserId" Width="150px" runat="server" /></span>
            </td>
        </tr>
        <tr style="height=25px;">
            <td style="width: 214px">
                <span id="disp">User Name</span>
            </td>
            <td style="width: 215px"><span id="disp"><asp:Label ID="lblUserName" Width="150px" runat="server" /></span> </td>
        </tr>
        <tr style="height=25px;">
            <td class="auto-style2" style="width: 214px">
                <span id="disp">Email Id</span>
            </td>
            <td class="auto-style2" style="width: 215px">
               
               <span id="disp"><asp:Label ID="lblEmailId" runat="server" Width="150px" /></span>
            </td>
        </tr>
        <tr style="height=25px;">
            <td style="width: 214px"><span id="disp">
                Selected
                Disease Name</span>
            </td>
            <td style="width: 215px">
                <span id="disp"><asp:Label ID="lblDiseaseName" runat="server" /></span>
            </td>
        </tr>

           <tr style="height=25px;">
            <td style="width: 214px"><span id="disp">
                Requested
                Disease Name</span>
            </td>
            <td style="width: 215px">
                 <span id="disp">   <asp:Label ID="lblReDisease" runat="server" /></span>
            </td>
        </tr>
       
         <tr style="height=25px;">
             <td style="width: 214px"><span id="disp">Assigned Broker</span> </td>
             <td style="width: 215px">
             <span id="disp">
                  <asp:Label ID="lblAssBroker" runat="server" />
                  </span>
             </td>

         </tr>

           <tr style="height=25px;"><td style="width: 214px">&nbsp;</td></tr>
         
          <tr style="height=25px;">

            
            <td style="width: 214px" colspan="2">
             
             <asp:Label ID="lblVerify" ForeColor="#6697EE" runat="server" style="font-size:13px;"/> </td>
        </tr>

        <tr style="height=25px;"><td style="width: 214px">&nbsp;</td></tr>

        <tr><td>
                <asp:Button ID="btnSubmit" class="button"  runat="server" Width="150px" Text="Submit" OnClick="btnSubmit_Click" Height="27px" />
            
            </td></tr>
            <tr><td>
                <asp:Button ID="Button1" class="button"  runat="server" Width="150px" Text="Delete" OnClick="btnSubmit1_Click" Height="27px" />
            
            </td></tr>
        <tr>
        <td colspan="2" style="height: 23px">
        <asp:Label ID="lblresult" Width="350px" runat="server" 
                
                style="color:#6697EE;font-size:14px;float:right;" /></td> </tr>

    </table>
    </center>
</div>
</asp:Content>

