<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="Registration.aspx.cs" Inherits="Registration" %>

<%@ Register Assembly="AjaxControlToolkit" Namespace="AjaxControlToolkit" TagPrefix="cc1" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cntplaceholder4" Runat="Server">
   <head id="Head1" runat="server" />

<div style="border:1px solid #00C3A9;border-radius:5px;padding:10px;background-color:#171717;font-family:Arial;">
    <center>
      <form id="registrationform" action="#" method="post">
      
    <div id="divRegistration" runat="server" visible="true">

    <div class="regis" style="text-align:left;margin-left:20px;font-size:14px;color: #d4d4d4;padding-top:10px;">
     <span id="disp" >Registration Form</span>
 </div>
         <table border="0" cellpadding="4" cellspacing="5" style="color:white;font-size:medium">              
          

            
             
                 <tr>
             <td style="width: 217px">
             </td>
             <td style="width: 178px"><asp:Label Text="" ID="lblUserId" runat="server" /> </td>
             <td style="width: 257px" class="section_w260"> <asp:Label ID="invalidusername" runat="server" style="color:#6697EE;font-size:13px;"></asp:Label></td>
         </tr>
         
            


             
         <tr>
                <td style="width: 217px"><span id="disp">UserName</span></td>
                <td style="width: 178px">
                    <asp:TextBox runat="server" ID="txtusername" Width="150px" 
                        ValidationGroup="Registration" MaxLength="20" class="textbox"/>
                </td>
                 <td style="height: 33px;font-size:13px; width: 257px;">

                    <asp:RequiredFieldValidator ID="UserName" runat="server" 
                        ControlToValidate="txtusername" ErrorMessage="Field Required" 
                        ForeColor="#6697EE" ValidationGroup="Registration"></asp:RequiredFieldValidator>
                        <br />
                    <asp:RegularExpressionValidator ID="regName" runat="server" 
       ControlToValidate="txtusername" 
       ValidationExpression="^[a-zA-Z'.\s][a-zA-Z0-9]{8,30}"
       ErrorMessage="Invalid name(min 8 & max 30,chars and digits needed)" ForeColor="#6697EE" ValidationGroup="Registration" />   
                    </td>
                </tr>


             <tr>
                    <td style="width: 217px">
                        <span id="disp">First Name</span>
                    </td>
                    
                   <td style="width: 178px">
                        <asp:TextBox runat="server"  ID="txtFirstName1" Width="150px" 
                            ValidationGroup="Registration" MaxLength="40" class="textbox" />
                    </td>
                      <td style="height: 33px;font-size:13px; width: 257px;"> 
                        <asp:RequiredFieldValidator ID="firstname" runat="server" 
                            ControlToValidate="txtFirstName1" ErrorMessage="Field Required" 
                            ForeColor="#6697EE" ValidationGroup="Registration"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                                             ControlToValidate="txtFirstName1" 
                                              ValidationExpression="^[a-zA-Z'.\s]{3,20}"
                                               ErrorMessage="(min 3,max 20,only chars)" ValidationGroup="Registration" ForeColor="#6697EE"  />
                    </td>
                    
                        </tr>
             
             <tr>
                <td style="width: 217px"><span id="disp">Last Name</span></td>
                <td style="width: 178px">
                    <asp:TextBox runat="server" ID="txtlastname" Width="150px" 
                        ValidationGroup="Registration" MaxLength="30" class="textbox" />
                </td>
              <td style="height: 33px;font-size:13px; width: 257px;">
                    <asp:RequiredFieldValidator ID="LastName" runat="server" 
                        ControlToValidate="txtlastname" ErrorMessage="Field Required" 
                        ForeColor="#6697EE" ValidationGroup="Registration"></asp:RequiredFieldValidator>
                         <br />
                        <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                                             ControlToValidate="txtlastname" 
                                              ValidationExpression="^[a-zA-Z'.\s]{3,20}"
                                               ErrorMessage="(min 3,max 20,only chars)" ValidationGroup="Registration" ForeColor="#6697EE"  />
                    </td>
                <td>
                    &nbsp;</td>
                </tr>

                
<tr><td>&nbsp;</td></tr>
               
   <tr>
                
                <td style="width: 217px"><span id="disp"> Registered Role</span> </td>
       <td style="width: 178px">
       
 <asp:DropDownList ID="drpMaster" Width="150px" runat="server"  AutoPostBack="true" OnSelectedIndexChanged="drpMaster_SelectedIndexChanged" style="height: 22px"
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


   
 </asp:DropDownList>

 </td>
 
 <td><asp:RequiredFieldValidator
    ID="drpMasterv"
    runat="server"
    ErrorMessage="*Required"
    ControlToValidate="drpMaster"
    InitialValue="Select"
    Display="dynamic"
    ValidationGroup="Registration"
     ForeColor="#6697EE" 
    style="font-size:13px;"
    >
</asp:RequiredFieldValidator></td></tr>

 

 <tr style="display: none;">
 <td style="width: 217px" >
        <br />
        <span id="disp" style="display:none;">Role Type</span></td>
 <td style="width: 178px">

 <asp:DropDownList ID="drpChild" Width="150px" runat="server" AutoPostBack="True" 
         onselectedindexchanged="drpChild_SelectedIndexChanged" Visible="false">

 </asp:DropDownList>

 </td>
                
                </tr>

                <tr style="top:20px;">
                <td style="width: 217px;height: 33px"><span id="disp">Select Organization Name</span>
                </td>
                <td style="width: 178px;">
                    <asp:DropDownList ID="drpCompanyName" Width="150px" runat="server" AutoPostBack="True"
                        onselectedindexchanged="drpCompanyName_SelectedIndexChanged" 
                        style="height: 22px;"  DataTextField="Org_Name" 
                        DataValueField="Org_Name">
                        
                        <asp:ListItem Text="Select" />
    </asp:DropDownList>

                   
                
                   

                   
                
                </td>


                </tr>

                <tr>
                <td style="width: 217px"><span id="disp">Date Of Birth (yyyy-mm-dd)</span></td>
                <td style="width: 178px">

                <cc1:ToolkitScriptManager ID="ToolkitScriptManager1" runat="server">
    </cc1:ToolkitScriptManager>
                    <asp:TextBox runat="server" ID="txtdob" Width="150px" 
                        ValidationGroup="Registration" style="margin-bottom: 3px" /> 

                 <asp:ImageButton ID="imgPopup" ImageUrl="images/calendar.png" ImageAlign="Bottom"
        runat="server" />

    <cc1:CalendarExtender ID="Calendar1" PopupButtonID="imgPopup" runat="server" TargetControlID="txtdob"
        Format="yyyy-MM-dd">
    </cc1:CalendarExtender>   
                    
                </td>
               <td style="height: 33px;font-size:13px; width: 257px;">
                    <asp:RequiredFieldValidator ID="dob" runat="server" 
                        ErrorMessage="Field Required" ControlToValidate="txtdob" ForeColor="#6697EE" 
                        ValidationGroup="Registration"></asp:RequiredFieldValidator>
                        <br />
                    <asp:RangeValidator ID="RangeValidator1" runat="server"  ForeColor="#6697EE" ValidationGroup="Registration" ErrorMessage="invalid date" ControlToValidate="txtdob" MinimumValue="1980-01-01" MaximumValue="1995-12-30" Type="Date"></asp:RangeValidator> 
                    </td>
             </tr>


                
                <tr>
                <td style="width: 217px"><span id="disp">Password</span></td>
                <td style="width: 178px">
                    <asp:TextBox runat="server" ID="txtPassword" TextMode="Password" Width="150px" 
                        ValidationGroup="Registration" MaxLength="20" class="textbox" /></td>
              <td style="height: 33px;font-size:13px; width: 257px;">

                    <asp:RequiredFieldValidator ID="Password" runat="server" 
                        ControlToValidate="txtpassword" ErrorMessage="Field Required" 
                        ForeColor="#6697EE" ValidationGroup="Registration"></asp:RequiredFieldValidator>

                    <br />
                    <asp:RegularExpressionValidator ID="RegularExpressionValidator3" runat="server" 
                                             ControlToValidate="txtPassword" 
                                              ValidationExpression="((?=.*\d)(?=.*[a-zA-Z])(?=.*[\W]).{8,15})"
                                               ErrorMessage="(min 8,max 15,atleast 1 character,1 number,1 special characters)" ValidationGroup="Registration" ForeColor="#6697EE"  />


                    </td>
                </tr>
                <tr>
                <td class="style1" style="width: 217px"><span id="disp">Re-Type Password</span></td>
                <td class="style1" style="width: 178px">
                    <asp:TextBox runat="server" ID="txtrepass" TextMode="Password" Width="150px" 
                        ValidationGroup="Registration" MaxLength="20" class="textbox" />  
                    </td>
                
                <td style="height: 33px;font-size:13px; width: 257px;">
                    <asp:RequiredFieldValidator ID="Rpassword" runat="server" 
                        ControlToValidate="txtrepass" ErrorMessage="Field Required" 
                        ForeColor="#6697EE" ValidationGroup="Registration"></asp:RequiredFieldValidator>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" 
                        ErrorMessage="Passwords do not match" ControlToCompare="txtPassword" 
                        ControlToValidate="txtrepass" ValidationGroup="Registration" 
                        ForeColor="#6697EE"></asp:CompareValidator>
                    </td>
                </tr>
             
                <%--<tr>
                <td>Telephone Number</td>
                <td>
                    <asp:TextBox runat="server" ID="txttelephone" Width="150px" 
                        ValidationGroup="Registration"/>
                </td>
            
                <td>
                    &nbsp;</td>
                </tr>--%>                
            
              
      <tr>
                <td style="width: 217px"><span id="disp">Email ID</span></td>
                <td style="width: 178px">
                    <asp:TextBox runat="server" class="textbox" ID="txtemailid" Width="150px" 
                        ValidationGroup="Registration"/></td>
                    <td style="height: 33px;font-size:13px; width: 257px;">
                        <asp:RequiredFieldValidator ID="EmailId" runat="server" 
                            ErrorMessage="Field Required" ForeColor="#6697EE" 
                            ControlToValidate="txtemailid" ValidationGroup="Registration"></asp:RequiredFieldValidator>
                        <br />
                        <asp:RegularExpressionValidator ID="validid" runat="server" 
                            ErrorMessage="Enter a valid email id" ForeColor="#6697EE" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                            ControlToValidate="txtemailid" ValidationGroup="Registration"></asp:RegularExpressionValidator>
                    </td>
                </tr>    









                  
   
              

                <tr>
                  <td colspan="3">
                     
                      <asp:Button class="button" ID="btnSubmit" width="100px" runat="server" Text="submit"
                          onclick="btnSubmit_Click" validationgroup="Registration" />
                       
                          </td>
                </tr>
       
                 <tr>
                     <td style="width: 217px">
                       

                          
                      
                          </td>
                    <td style="width: 178px">
                    </td>
                    <td style="width: 257px" class="section_w260">
                     <asp:Label ID="lbl1Result" runat="server" style="color:#6697EE"></asp:Label>
                    </td>
                 </tr>

                 <tr><td>&nbsp;</td></tr>
       
     </table>
 
 </div>

 


 </form>
   
 
  </center>
</div>

</asp:Content>

