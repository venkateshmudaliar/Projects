<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cntplaceholder1" Runat="Server" >

<div style="border:1px solid #00C3A9;border-radius:5px;padding:10px;background-color:#171717;font-family:Arial; font-size: small;">

<center>
<table>

   

    <tr>
 
    
         <div id="div1" runat="server" align="right" style="margin-right:150px;">
     <div class="regis" style="text-align:left;margin-left:20px;font-size:14px;color: #6697EE;padding-top:15px;">
     Login Page
 </div>
             
        <table border="0" cellpadding="3" cellspacing="5">
        <tr>
            <td colspan="3" align="center">
                <asp:Label ID="lblErrorStatus" ForeColor="Red" Font-Size="medium" runat="server" />
            </td>
        </tr>
        <tr>
                <td>
               <span id="disp">Select Role</span> 
                </td>
                <td>
                    <asp:DropDownList ID="drpMaster" clas="textbox" Width="150px" runat="server"  
                        AutoPostBack="true" OnSelectedIndexChanged="drpMaster_SelectedIndexChanged" 
                        required Height="25px"
                         
                         CausesValidation="True" 
                        EnableClientScript="True" 

                         >

                        
                        <asp:ListItem  Value="Select" Text="Select"></asp:ListItem>
                        <asp:ListItem Text="Admin" />

                        <asp:ListItem Text="Broker" />

                        <asp:ListItem Text="Co-Ordinator" />

                        <asp:ListItem Text="Users" />
                        <%--
                              <asp:ListItem Text="Data User" />
                        --%>
                        <%-- OnSelectedIndexChanged="drpMaster_SelectedIndexChanged" --%>
   
                    </asp:DropDownList>
                </td>

                <td>
              <asp:RequiredFieldValidator
    ID="drpMasterv"
    runat="server"
    ErrorMessage="*Required"
    ControlToValidate="drpMaster"
    InitialValue="Select"
    Display="dynamic"
    ValidationGroup="LoginValidation"
    ForeColor="#6697EE" 
    style="font-size:13px;"
    >
</asp:RequiredFieldValidator>
                



            </tr>
            <tr>
                <td style="height: 33px">
                    <span id="disp">User Name</span>
                </td>
                <td style="height: 33px">
                    <asp:TextBox runat="server" ID="txtLoginUserID" 
                    ValidationGroup="LoginValidation" Width="150px" class="textbox"  />
                </td>
                <td style="height: 33px; font-size: small;">
                    <asp:RequiredFieldValidator ForeColor="#6697EE" ErrorMessage="User Name Required" ControlToValidate="txtLoginUserID"
                        runat="server" ID="RequiredFieldValidator2" ValidationGroup="LoginValidation" />
                        <br />
                <asp:RegularExpressionValidator ForeColor="#6697EE"  ControlToValidate = "txtLoginUserID" ValidationGroup="LoginValidation" ID="RegularExpressionValidator3" ValidationExpression = "^[\s\S]{8,30}$" runat="server" ErrorMessage="Minimum 8 and Maximum 30 characters required."></asp:RegularExpressionValidator>
                </td>
            </tr>
            <tr>
                <td>
                   <span id="disp">Password</span>
                </td>
                <td>
                    <asp:TextBox runat="server" ID="txtLoginPassword" 
                        ValidationGroup="LoginValidation" TextMode="Password" Width="150px" class="textbox" />
                </td>
               
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="#6697EE" 
                        ErrorMessage="Password Required" ControlToValidate="txtLoginPassword"
                        runat="server" ValidationGroup="LoginValidation" /> <br />
                    <asp:RegularExpressionValidator ForeColor="#6697EE"  ControlToValidate = "txtLoginPassword" ValidationGroup="LoginValidation" ID="RegularExpressionValidator1" ValidationExpression = "^[\s\S]{8,15}$" runat="server" ErrorMessage="Minimum 8 and Maximum 15 characters required."></asp:RegularExpressionValidator>
                </td>
            </tr>
            

          
            <tr>
                <td >
                    <asp:Button ID="btnLogin" Text="Login" Width="100" runat="server" 
                        onclick="btnLogin_Click" ValidationGroup="LoginValidation" style="margin-top:10px;" class="button"/>
                </td>
          
            
                <td style="margin:5px;">
                   <asp:Label ID="lblErrorr" runat="server" Text="" style="font-size:15px;"></asp:Label>
                </td>
            </tr>

            <tr>
                <td>
                    &nbsp;</td>
                
                
            </tr>
            <tr>
                <td>
                    <asp:LinkButton class="forgotpw" ID="lnkforgetUser"  Text="Forgot Password?" runat="server" 
                        onclick="lnkforgetUser_Click"  style="font-size:15px;color:#61C5DA;margin-top:20px;" align="right"/>
                </td>
            </tr>
        </table>
    </div>

    </tr>

</table>
</center>
</div>
</asp:Content>

