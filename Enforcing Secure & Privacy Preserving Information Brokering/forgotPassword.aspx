<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="forgotPassword.aspx.cs" Inherits="forgotPassword" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cntplaceholder1" Runat="Server">

       <div style="border:1px solid #00C3A9;border-radius:5px;padding:10px;background-color:#171717;font-family:Arial;">
 <span id="disp">Enter the Email address you used, to Sign in.</span>
 <br />
 <br />
 

 
     <table border="0" cellpadding="3" cellspacing="5" style="margin-left:40px;">



 <tr>
                <td align=center>
                 <span id="disp">Email Id</span>
                </td>
                <td>
                    <asp:TextBox runat="server" ID="txtEmailId" 
                        ValidationGroup="LoginValidation"  Width="150px" class="textbox"/>
                </td>
                <td>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator3" ForeColor="#6697EE" 
                        ErrorMessage="EmailId Required" ControlToValidate="txtEmailId"
                        runat="server" ValidationGroup="LoginValidation" />
                    <asp:RegularExpressionValidator ID="validid" runat="server" 
                            ErrorMessage="Enter a valid email id" ForeColor="#6697EE" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                            ControlToValidate="txtemailid" ValidationGroup="Registration"></asp:RegularExpressionValidator>
                </td>
            </tr>

  <tr>
  <td align=center>
  <asp:Button ID="btnEmail" runat="server"  ValidationGroup="LoginValidation" class="button" Text="Submit" onclick="btnEmail_Click" />
      
  </td>
  </tr>
  <tr><td></td>
    <td colspan=2><span id="disp" style="color:#6697EE;"><asp:Label ID="lbl1Result" runat="server"></asp:Label></span>
    </td>
  </tr>
 </table>
           </div>

</asp:Content>

