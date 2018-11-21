<%@ Page Title="" Language="C#" MasterPageFile="~/Users.master" AutoEventWireup="true" CodeFile="UserRequest.aspx.cs" Inherits="UserRequest" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cntplaceholder2" Runat="Server">
<div style="border:1px solid #00C3A9;border-radius:5px;padding-top:30px;padding-bottom:30px;background-color:#171717;font-family:Arial;">
<center>
    <table> 
        <tr>
            <td class="auto-style1">
                <span id="success" >User Id</span>
            </td>
            <td>
                
               <span id="disp" style="color:#D4D4D4"> <asp:Label ID="lblUserId" Width="150px" runat="server" /></span>
            </td>
        </tr>
        <tr>
            <td>
                <span id="success">User Name</span>
            </td>
            <td><span id="disp" style="color:#D4D4D4"> <asp:Label ID="lblUserName" Width="150px" runat="server" /></span> </td>
        </tr>
        <tr>
            <td class="auto-style2">
                <span id="success">Email Id</span>
            </td>
            <td class="auto-style2">
               
               <span id="disp" style="color:#D4D4D4"><asp:Label ID="lblEmailId" runat="server" Width="150px" /></span>
            </td>
        </tr>
        <tr>
            <td>
                <span id="success">Disease Name</span>
            </td>
            <td>
                <span id="disp" style="color:#D4D4D4"><asp:Label ID="lblDiseaseName" runat="server" Width="150px" /></span>
            </td>
        </tr>
        <tr><td>&nbsp</td></tr>
        <tr>

            <td>
                <asp:Button ID="btnSubmit" class="button" runat="server" Width="150px" Text="Submit" OnClick="btnSubmit_Click" />
            
            </td>
        </tr>
        <tr><td>&nbsp</td></tr>
        <tr>
        <td colspan="2"  style="font-size:13px;"><asp:Label ID="lblresult" Width="305px" 
                runat="server" style="font-size:15px;"/></td>
        </tr>

    </table>
    </center>
    </div>

</asp:Content>

