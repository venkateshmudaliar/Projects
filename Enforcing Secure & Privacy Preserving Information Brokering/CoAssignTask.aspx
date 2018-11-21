<%@ Page Title="" Language="C#" MasterPageFile="~/CoOrdinator.master" AutoEventWireup="true" EnableEventValidation="false" CodeFile="CoAssignTask.aspx.cs" Inherits="CoRec" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cntplaceholderr2" Runat="Server">
<div style="border:1px solid #00C3A9;border-radius:5px;padding-top:30px;padding-bottom:30px;background-color:#171717;font-family:Arial;">
   

 
   <%--  <form id="frm1" runat="server"> --%>


  <asp:Label ID="lblMessage" runat="server" />
  <center>

  <h3 style= "color:#D4D4D4;">Requested Tasks</h3><br />
  <panel style="font-size:12px;">

      <p >

      <div style="font-size:12px;max-height:300px;overflow:auto;margin-right:5px;">
        <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CellPadding="4" 
            onselectedindexchanged="GridView1_SelectedIndexChanged2" 
            ForeColor="#333333" GridLines="Both" Width="622px">
            <%-- %><AlternatingRowStyle BackColor="White" />--%>
            <Columns>

                <asp:BoundField DataField="UserId" HeaderText="User Id" />
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
    </p>

    </panel>
</center>
     <br />
    <br />
<hr style="border: 0;color: #00C3A9;background-color: #00C3A9;height: 1px;"> 
<br />

<center>
 <table class="TabContainerFont">
                                                <tr style="height: 25px">
                                                    <td style="width: 164px">
                                                       <span id="disp">Enter Disease Name</span>
                                                    </td>
                                                    <td style="width: 176px">
                                                        <asp:TextBox  class="textbox" SkinID="textBox"  
                                                            runat="server" ID="txtSearchByDisease" Width="150px" 
                                                            ontextchanged="txtSearchByDisease_TextChanged"/>
                                                    </td>
                                                    <td style="width: 79px">
                                                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1"  ControlToValidate="txtSearchByDisease" ValidationGroup="UserSearchInformatio" runat="server" ErrorMessage="*req" ForeColor="#6697EE" 
    style="font-size:14px;"></asp:RequiredFieldValidator>
                                                    </td>
                                                    
                                                    <td style="width: 151px">
                                                         <asp:Button class="button"  runat="server" Width="150px" ValidationGroup="UserSearchInformatio" 
                                                                        AutoPostBack="false" ID="btnSearchDiseaseByID" Text="Find Disease" 
                                                                        OnClick="btnSearchUserByID_Click" AppendDataBoundItems="true" 
                                                             Height="26px" />         
                                                    </td>
                                                </tr>
                                                <tr style="height: 25px">
                                                    <td align="justify" style="width: 164px">
                                                        <span id="disp">Select Disease</span>
                                                    </td>
                                                    <td style="width: 176px">
                                                        <asp:dropdownlist ID="drpSearchDiseaseList" 
                                                             Width="150px" OnSelectedIndexChanged="drpSearchDiseaseList_SelectedIndexChanged"
                                                              AutoPostBack="true" AppendDataBoundItems="true"
                                                            runat="server" Height="24px"  CausesValidation="True" EnableClientScript="True" > 
                                                             <asp:ListItem  Value="Select" Text="Select"></asp:ListItem>                                                         
                                                        </asp:dropdownlist>
                                                    </td>

                                                    <td style="width: 79px">
                                                    <asp:RequiredFieldValidator
                                                    ID="drpMasterv"
                                                    runat="server"
                                                    ErrorMessage="*Required"
                                                    ControlToValidate="drpSearchDiseaseList"
                                                    InitialValue="Select"
                                                    Display="dynamic"
                                                    ValidationGroup="ConfVale"
                                                    ForeColor="#6697EE" 
                                                    style="font-size:14px;"
                                                    >
                                                    </asp:RequiredFieldValidator>
                                                    </td>
                                                </tr>
                                                


                                                <tr style="height: 25px"> 
                                                <td style="width: 164px"><span id="disp">Requested Disease</span> </td>
                                                <td style="width: 176px"> <asp:Label ID="lblReDisease" runat="server" style="font-size:14px;color:#D4D4D4;" /> </td>

                                                </tr>



                                                <tr style="height: 25px">
                                                <td style="width: 164px"><span id="disp">Assigned Broker</span></td>
                                                <td style="width: 176px"> <asp:DropDownList ID="drpName" runat="server" 
                                                        Width="150px" Height="24px" > 
                                                        
                                                        </asp:DropDownList>
                                                        
                                                        </td>
                                                        <td>
                                                         
                                                    </asp:RequiredFieldValidator>

                                                        </td>
                                                </tr>

                                                <tr>
                                         <td style="height: 25px; width: 164px;">
                                         <span id="disp">User Id</span>
                                         </td>
                                         <td style="height: 25px; width: 176px;"><span id="disp"><asp:Label ID="lblUserId" runat="server" style="font-size:14px;color:#D4D4D4;" /></span> </td>
                                         </tr>

                                           <tr>
                                         <td style="height: 25px; width: 164px;">
                                         <span id="disp">User Name</span>
                                         </td>
                                         <td style="height: 25px; width: 176px;"><span id="disp"><asp:Label ID="lblName" runat="server" style="font-size:14px;color:#D4D4D4;"/></span> </td>
                                         </tr>


                                         <tr>
                                         <td class="auto-style1" style="height: 31px; width: 164px;">
                                             <span id="disp">Email Id</span></td>
                                         <td class="auto-style1" style="height: 31px; width: 176px;">
                                         <span id="disp"><asp:Label ID="lblMail1" runat="server"  /></span> </td>

                                        <td style="height: 31px;float:right; width: 79px;"><asp:Button class="button"  ID="btnSend" 
                                                Text="Send Key" runat="server" OnClick="btnSend_Click" Width="89px" 
                                                Height="24px" /> </td>
                                           <td style="height: 31px; width: 151px;">&nbsp;</td>
                                                </tr>

 
    <tr><td style="width: 164px"><asp:Label ID="lblMail" runat="server" style="color:#6697EE;font-size:12px;" /> </td></tr>
                                                <td  style="height: 30px; width: 164px;"><asp:Button class="button"  
                                                        ID="btnViewDetails" Text="Assign Task" 
                                                        runat="server" onclick="btnViewDetails_Click" Width="116px" 
                                                        Height="24px" ValidationGroup="ConfVale" /> </td>
                                                        <td style="height: 30px; width: 176px;"> <asp:Label ID="lbl1Result" runat="server" /> </td>
                                                </tr> 
                                         
                                               

</table>
<%-- </form> --%>
</center>
    
</div>
</asp:Content>

