<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Users.master" CodeFile="UserDetailsSuccess.aspx.cs" Inherits="RegistrationSuccess" %>


<asp:Content ID="Content1" ContentPlaceHolderID="cntplaceholder2" Runat="Server">
<div style="border:1px solid #00C3A9;border-radius:5px;padding:10px;background-color:#171717;font-family:Arial;height:310px;">

<center><h2 style="color:#6697EE;">Submitted Successfully!</h2>
 </h2> </center>
 <br />
 <br />
 
 <center>
    <table>

    <tr>
    <td style="width: 187px; height: 26px;"><span id="success">Patient Name</span></td>
    <td style="width: 178px; height: 26px;"><asp:Label ID="pname" runat="server" Text="Label" style="font-size:16px;"></asp:Label></td>
    </tr>
    
    <tr>
    <td style="width: 187px; height: 26px;"><span id="success">Doctor Name</span></td>
    <td style="width: 178px; height: 26px;"><asp:Label ID="docname" runat="server" Text="Label" style="font-size:16px;"></asp:Label></td>
    </tr>
    
    <tr>
    <td style="width: 187px; height: 26px;"><span id="success">Age</span></td>
    <td style="width: 178px; height: 26px;"><asp:Label ID="ageval" runat="server" Text="Label" style="font-size:16px;"></asp:Label></td>
    </tr>

    <tr>
    <td style="width: 187px; height: 26px;"><span id="success">Disease</span></td>
    <td style="width: 178px; height: 26px;"><asp:Label ID="dname" runat="server" Text="Label" style="font-size:16px;"></asp:Label></td>
    </tr>

    <tr>
    <td style="width: 187px; height: 26px;"><span id="success">Email Id</span></td>
    <td style="width: 178px; height: 26px;"><asp:Label ID="email" runat="server" Text="Label" style="font-size:16px;"></asp:Label></td>
    </tr>

    <tr>
    <td style="width: 187px; height: 26px;"><span id="success">Disease Description</span></td>
    <td style="width: 178px; height: 26px;"><asp:Label ID="ddesc" runat="server" Text="Label" style="font-size:16px;"></asp:Label></td>
    </tr>


    <tr><td style="width: 187px">&nbsp;</td></tr>
    <tr>
    <td colspan="2"><span style="font-size:15px;color:#6697EE;"><asp:Label ID="emailconf" runat="server" Text="emailconf"></asp:Label></span></td>
    </tr>

    
    </table>
</center>
</div>


    





</asp:Content>