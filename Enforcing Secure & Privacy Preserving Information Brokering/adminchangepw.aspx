<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="adminchangepw.aspx.cs" Inherits="AdminDefault" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cntplaceholder4" Runat="Server">

<div style="border:1px solid #00C3A9;border-radius:5px;padding-top:30px;padding-bottom:30px;background-color:#171717;font-family:Arial;">
<p style="padding-left:20px;color:#E8E8E8;font-size:15px;">Change Password</p>
<div style="padding-left:30px;padding-top:20px;padding-bottom:20px;">
         <table border="0" cellpadding="4" cellspacing="5" style="color:white;font-size:medium">     
         <tr>
         
         <td style="width: 217px"><span id="disp">Old Password</span></td>
                <td style="width: 178px">
                    <asp:TextBox class="textbox" runat="server" ID="oldpass" TextMode="Password" Width="150px" 
                        ValidationGroup="Registration" MaxLength="20"/></td>
              <td style="height: 33px;font-size:13px; width: 257px;">

                    <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                        ControlToValidate="oldpass" ErrorMessage="Field Required" 
                        ForeColor="#6697EE" ValidationGroup="Registration"></asp:RequiredFieldValidator>
                        <br />
                        <asp:Label ID="Label1" runat="server" style="color:#6697EE"></asp:Label>
         
         </tr>
         <tr>
                <td style="width: 217px"><span id="disp">New Password</span></td>
                <td style="width: 178px">
                    <asp:TextBox class="textbox"  runat="server" ID="newpass" TextMode="Password" Width="150px" 
                        ValidationGroup="Registration" MaxLength="20"/></td>
              <td style="height: 33px;font-size:13px; width: 257px;">

                    <asp:RequiredFieldValidator ID="Password" runat="server" 
                        ControlToValidate="newpass" ErrorMessage="Field Required" 
                        ForeColor="#6697EE" ValidationGroup="Registration"></asp:RequiredFieldValidator>

                    <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                                             ControlToValidate="newpass" 
                                              ValidationExpression="((?=.*\d)(?=.*[a-zA-Z])(?=.*[\W]).{8,15})"
                                               ErrorMessage="(min 8,max 15,atleast 1 character,1 number,1 special characters)" ValidationGroup="Registration" ForeColor="#6697EE"  />


                    </td>
                </tr>
                <tr>
                <td class="style1" style="width: 217px"><span id="disp">Re-Type New Password</span></td>
                <td class="style1" style="width: 178px">
                    <asp:TextBox class="textbox"  runat="server" ID="newrepass" TextMode="Password" Width="150px" 
                        ValidationGroup="Registration" MaxLength="20"/>  
                    </td>
                
                <td style="height: 33px;font-size:13px; width: 257px;">
                    <asp:RequiredFieldValidator ID="Rpassword" runat="server" 
                        ControlToValidate="newrepass" ErrorMessage="Field Required" 
                        ForeColor="#6697EE" ValidationGroup="Registration"></asp:RequiredFieldValidator>
                        <br />
                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                        ErrorMessage="Passwords do not match" ControlToCompare="newpass" 
                        ControlToValidate="newrepass" ValidationGroup="Registration" 
                        ForeColor="#6697EE"></asp:CompareValidator>
                    </td>
                </tr>

                <tr><td></td></tr>
                <tr>
                  <td colspan="3">
                     
                      <asp:Button class="button" ID="btnSubmit" width="100px" runat="server" Text="submit"
                          onclick="btnSubmit_Click" validationgroup="Registration" />
                       
                          </td>
                </tr>

                <tr>
                <td></td>
                  <td colspan="2">
                  
                     <asp:Label ID="lbl1Result" runat="server" style="color:#6697EE"></asp:Label>
                    </td>

                </td>
         </tr>
         
                  
</table>
</div>


 
 </div>




</asp:Content>

