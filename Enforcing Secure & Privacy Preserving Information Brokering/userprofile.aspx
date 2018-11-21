<%@ Page Title="" Language="C#" MasterPageFile="~/Users.master" AutoEventWireup="true" CodeFile="userprofile.aspx.cs" Inherits="AdminDefault" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cntplaceholder2" Runat="Server">

<div style="border:1px solid #00C3A9;border-radius:5px;padding-top:30px;padding-bottom:30px;background-color:#171717;font-family:Arial;">
<p style="padding-left:30px;color:#E8E8E8;font-size:15px;">
</p>
<div style="padding-left:30px;padding-top:20px;padding-bottom:20px;">
         <table border="0" cellpadding="4" cellspacing="5" style="color:white;font-size:medium">     
      
         
         <asp:Button class="button"  ID="proview" runat="server" Text="User Profile" 
                 onclick="proview_Click" style="font-size:15px;" />
                 <tr><td></td></tr>
       
         <tr>
         
         <td style="width: 102px" ><span id="disp">UserName</span></td>
                <td >
                    :</td>
                <td >
                    <span id="disp">  <asp:Label ID="username" runat="server" Width="150px" ></asp:Label> </span></td>
         </tr>  
         
        <tr>
         <td style="width: 102px" ><span id="disp">FirstName</span></td>
                <td >
                    :</td>
                <td >
                    <span id="disp">  <asp:Label ID="firstname" runat="server" Width="150px" ></asp:Label> </span></td>
         </tr>  
          
         <tr>
         <td style="width: 102px" ><span id="disp">LastName</span></td>
                <td >
                    :</td>
                <td >
                    <span id="disp">  <asp:Label ID="lastname" runat="server" Width="150px" ></asp:Label> </span></td>
         </tr>  
         
          
         
         <tr>
         <td style="width: 102px" ><span id="disp">DOB</span></td>
                <td >
                    :</td>
                <td >
                    <span id="disp">  <asp:Label ID="dob" runat="server" Width="150px" ></asp:Label> </span></td>
         </tr>  
         
         <tr>
         <td style="width: 102px" ><span id="disp">EmailId</span></td>
                <td >
                    :</td>
                <td >
                    <span id="disp">  <asp:Label ID="email" runat="server" Width="150px" ></asp:Label> </span></td>
         </tr>  
         
         <tr>
         <td style="width: 102px" ><span id="disp">Role</span></td>
                <td >
                    :</td>
                <td >
                    <span id="disp">  <asp:Label ID="role" runat="server" Width="150px" ></asp:Label> </span></td>
         </tr>
         
         <tr>
         <td style="width: 102px" ><span id="disp">Organization</span></td>
                <td >
                    :</td>
                <td >
                    <span id="disp">  <asp:Label ID="organization" runat="server" Width="150px" ></asp:Label> </span></td>
         </tr>  
           
         
      
         
             <asp:TextBox ID="tb" runat="server" Visible="false"></asp:TextBox>
             
                  
</table>
</div>


 
 </div>




</asp:Content>

