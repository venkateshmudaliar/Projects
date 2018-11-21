<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin.master" CodeFile="RegistrationSuccess.aspx.cs" Inherits="RegistrationSuccess" %>


<asp:Content ID="Content1" ContentPlaceHolderID="cntplaceholder4" Runat="Server">
<div style="border:1px solid #00C3A9;border-radius:5px;padding:10px;background-color:#171717;font-family:Arial;">
<center><h2 style="color:#6697EE;">Registered Successfully!</h2>
 </h2> </center>
 <br />
 <br />
 <center>
 
    <table>

    <tr>
    <td style="width: 163px"><span id="success">Username</span></td>
    <td style="width: 142px"><asp:Label ID="uname" runat="server" Text="Label" style="font-size:16px;"></asp:Label></td>
    </tr>
    
    <tr>
    <td style="width: 163px"><span id="success">Registered Role</span></td>
    <td style="width: 142px"><asp:Label ID="rname" runat="server" Text="Label" style="font-size:16px;"></asp:Label></td>
    </tr>
    
    <tr>
    <td style="width: 163px"><span id="success">Organization Name</span></td>
    <td style="width: 142px"><asp:Label ID="oname" runat="server" Text="Label" style="font-size:16px;"></asp:Label></td>
    </tr>

    <tr>
    <td style="width: 163px"><span id="success">EmaiId</span></td>
    <td style="width: 142px"><asp:Label ID="email" runat="server" Text="Label" style="font-size:16px;"></asp:Label></td>
    </tr>

    <tr><td style="width: 163px">&nbsp;</td></tr>
    <tr>
    <td colspan="2" style="text-align:center;"><span style="font-size:15px;color:#6697EE;"><asp:Label ID="emailconf" runat="server" Text="emailconf"></asp:Label></span></td>
    </tr>

    
    </table>

    </center>


    



</div>
</asp:Content>