<%@ Page Title="" Language="C#" MasterPageFile="~/Users.master" AutoEventWireup="true" CodeFile="KeyValidation.aspx.cs" Inherits="KeyValidation" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cntplaceholder2" Runat="Server">
<div style="border:1px solid #00C3A9;border-radius:5px;padding-top:30px;padding-bottom:30px;background-color:#171717;font-family:Arial;">

    <center> 
   <table border="0" cellpadding="4" cellspacing="5" style="color:white;font-size:medium">  
  
      
        <tr>
        <td>

            <span id="disp">Enter the Key</span>
            </td>
           <td> <asp:TextBox  class="textbox" ID="txtsecretkey" Width="150px" runat="server"></asp:TextBox></td> 
           <td> 
                        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                            ControlToValidate="txtsecretkey" ErrorMessage="Field Required" 
                            ForeColor="#6697EE" ValidationGroup="Registration"></asp:RequiredFieldValidator>
                    </td>
           </tr>
           <tr>
           <td><asp:Button ID="btnKey"  class="button"  runat="server" ValidationGroup="Registration" 
                   Text="Validate" onclick="btnKey_Click" Width="99px" />
           </td>
           <td colspan="2"><asp:Label ID="lblMessage"  runat="server" style="font-size:14px; color:#6697EE;" /></td>
           </tr>
  
        </table>
        </center>
</div>
</asp:Content>

