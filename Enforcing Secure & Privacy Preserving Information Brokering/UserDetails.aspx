<%@ Page Title="" Language="C#" MasterPageFile="~/Users.master" AutoEventWireup="true" CodeFile="UserDetails.aspx.cs" Inherits="PatientDetailsaspx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cntplaceholder2" Runat="Server">


<style type="text/css">

td{
        height: 24px;
        font-size: small;
    }
</style>



<div style="border:1px solid #00C3A9;border-radius:5px;padding:10px;background-color:#171717;font-family:Arial;">


        <%-- <center>Existisng record count: <asp:Label ID="lblCount" runat="server"></asp:Label> </center>--%>
<center>
<table style="padding:20px;">

<tr>
                <td class="auto-style1" style="width: 165px"><span id="disp">Patient Name</span></td>
                <td class="auto-style1">
                    <asp:TextBox  class="textbox" runat="server" ID="txtPatientName" Width="150px" 
                        ValidationGroup="Registration" MaxLength="20"/>
                </td>
                 <td class="auto-style1">
                    <asp:RequiredFieldValidator ID="pname" runat="server" 
                        ControlToValidate="txtPatientName" ErrorMessage="Field Required" 
                        ForeColor="#6697EE" ValidationGroup="Registration"></asp:RequiredFieldValidator>
                    </td>
                </tr>


             <tr>
                    <td style="width: 165px">
                     <span id="disp">Doctor Name</span>
                    </td>
                    
                   <td>
                        <asp:TextBox class="textbox"  runat="server"  ID="txtDoctorName" Width="150px" 
                            ValidationGroup="Registration" MaxLength="40" />
                    </td>
                    <td> 
                        <asp:RequiredFieldValidator ID="dname" runat="server" 
                            ControlToValidate="txtDoctorName" ErrorMessage="Field Required" 
                            ForeColor="#6697EE" ValidationGroup="Registration"></asp:RequiredFieldValidator>
                    </td>
                    
                        </tr>


     <tr>
                    <td class="auto-style1" style="width: 165px">
                       <span id="disp">Age</span>
                    </td>
                    
                   <td class="auto-style1">
                        <asp:TextBox  class="textbox" runat="server"  ID="txtAge" Width="150px" 
                            ValidationGroup="Registration" MaxLength="40"/>
                    </td>
                    <td> 
                        <asp:RequiredFieldValidator ID="ageval" runat="server" 
                            ControlToValidate="txtAge" ErrorMessage="Field Required" 
                            ForeColor="#6697EE" ValidationGroup="Registration"></asp:RequiredFieldValidator>
                    </td>
                    
                        </tr>


  <tr>
                    <td class="auto-style1" style="width: 165px">
                       <span id="disp">Disease</span>
                    </td>
                    
                   <td class="auto-style1">
                        <asp:TextBox  class="textbox" runat="server"  ID="txtDisease" Width="150px" 
                            ValidationGroup="Registration" MaxLength="40"/>
                    </td>
                    <td> 
                        <asp:RequiredFieldValidator ID="diname" runat="server" 
                            ControlToValidate="txtDisease" ErrorMessage="Field Required" 
                            ForeColor="#6697EE" ValidationGroup="Registration"></asp:RequiredFieldValidator>
                    </td>
                    
                        </tr>



                          <tr>
                    <td style="width: 165px">
                        <span id="disp">Email Id</span></td>
                    
                   <td>
                        <asp:TextBox  class="textbox" runat="server"  ID="txtEmailID" Width="150px" 
                             MaxLength="40"/>
                    </td>
                              <td> 
                        <asp:RequiredFieldValidator ID="emailval" runat="server" 
                            ControlToValidate="txtEmailID" ErrorMessage="Field Required" 
                            ForeColor="#6697EE" ValidationGroup="Registration"></asp:RequiredFieldValidator>
                            <asp:RegularExpressionValidator ID="validid" runat="server" 
                            ErrorMessage="Enter a valid email id" ForeColor="#6697EE" 
                            ValidationExpression="\w+([-+.']\w+)*@\w+([-.]\w+)*\.\w+([-.]\w+)*" 
                            ControlToValidate="txtemailid" ValidationGroup="Registration"></asp:RegularExpressionValidator>
                    </td>
                    
                        </tr>


  <tr>
                    <td style="width: 165px">
                       <span id="disp">Disease Description</span>
                    </td>
                    
                   <td>
                        <asp:TextBox  class="textbox" runat="server"  ID="txtDescription" Width="150px" 
                            ValidationGroup="Registration" MaxLength="40"/>
                    </td>
                    <td><asp:RequiredFieldValidator ID="ddesc" runat="server" 
                            ControlToValidate="txtDescription" ErrorMessage="Field Required" 
                            ForeColor="#6697EE" ValidationGroup="Registration"></asp:RequiredFieldValidator>
                      </td>
                   </tr>

                    <tr><td style="width: 165px"></td>
                    </tr>
                        <tr>
                        <td style="width: 165px">
                            <asp:Button width="78px" class="button"  ID="btnSubmit" runat="server" 
                                Text="Submit" OnClick="btnSubmit_Click" Height="26px" 
                                validationgroup="Registration"/>
                            </td>
                        </tr>

                        <tr >
                        
                        <td colspan=2 align="center"><span style="font-size:13px;">
                     <asp:Label ID="lblResult" runat="server" /> </span>
                            </td>
                        </tr>

</table>
  </center>  
  
</div>
</asp:Content>

