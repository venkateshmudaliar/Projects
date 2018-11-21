<%@ Page Language="C#" AutoEventWireup="true" MasterPageFile="~/Admin.master" CodeFile="OrgRegistrationSuccess.aspx.cs" Inherits="OrgRegistrationSuccess" %>


<asp:Content ID="Content1" ContentPlaceHolderID="cntplaceholder4" Runat="Server">

<div style="border:1px solid #00C3A9;border-radius:5px;padding:10px;background-color:#171717;font-family:Arial;">
<center><h2 style="color:#6697EE;">Organization Registered Successfully!</h2>
 </h2> </center>
 <br />
 <br />
 <center>
 <table>

    <tr>
    <td style="width: 181px"><span id="success">Organization Name</span></td>
    <td style="width: 142px"><asp:Label ID="oname" runat="server" Text="Label" style="font-size:16px;"></asp:Label></td>
    </tr>
    
    <tr>
    <td style="width: 181px"><span id="success">Organization Location</span></td>
    <td style="width: 142px"><asp:Label ID="olocation" runat="server" Text="Label" style="font-size:16px;"></asp:Label></td>
    </tr>

    
    

    
    </table></center>
    <br />





 
 </div>
</asp:Content>