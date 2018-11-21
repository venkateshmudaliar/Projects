<%@ Page Title="" Language="C#" MasterPageFile="~/Admin.master" AutoEventWireup="true" CodeFile="OrgRegistration.aspx.cs" Inherits="OrgRegistration" %>





<asp:Content ID="Content1" ContentPlaceHolderID="cntplaceholder4" Runat="Server">





<div style="border:1px solid #00C3A9;border-radius:5px;padding:10px;background-color:#171717;font-family:Arial;">
    <center>
        <table border="0" cellpadding="4" cellspacing="5" 
            style="color:white;font-size:medium; font-weight: normal;" >  
        <br /> 


         <tr style="padding-top:20px;" >
                
                <td> <span id="disp">Select Organization Type</span> </td>
       <td>
   
       
 <asp:DropDownList ID="drpMaster" Width="150px" runat="server"  AutoPostBack="true" 
               OnSelectedIndexChanged="drpMaster_SelectedIndexChanged" Height="25px" 
               CausesValidation="True" EnableClientScript="True" 
              
               
               >

 <asp:ListItem  Value="Select" Text="Select"></asp:ListItem>
 <asp:ListItem Text="Broker" Value="broker" />

 <asp:ListItem Text="Co-Ordinator" Value="coord"/>

  <asp:ListItem Text="Users" Value="user" />

    <%--   <asp:ListItem Text="DataOwner" />--%>

      <asp:ListItem Text="Admin" Value="admin" />


   
 </asp:DropDownList>

 </td>

 <td>
 <asp:RequiredFieldValidator
    ID="drpMasterv"
    runat="server"
    ErrorMessage="*Required"
    ControlToValidate="drpMaster"
    InitialValue="Select"
    Display="dynamic"
    ValidationGroup="ConfVale"
     ForeColor="#6697EE" 
    style="font-size:14px;"
    >
</asp:RequiredFieldValidator>
 </td>
 </tr>

           

 
 
 <tr>
 <td>
        <span id="disp" >Select Organization Id</span></td>
 <td>
 
 <asp:DropDownList ID="drpChild" Width="150px" runat="server" AutoPostBack="True" 
         onselectedindexchanged="drpChild_SelectedIndexChanged" Height="25px"  >

 </asp:DropDownList>
 
 </td>


                
                </tr>



                                        
                                               
                                               
                                                                                 
                                        
                                        <tr>
                                            <td>
                                                <span id="disp">Select Location</span>
                                            </td>
                                            <td>
                                                <asp:DropDownList OnSelectedIndexChanged="confDrpCompany_SelectedIndexChanged"
                                                     runat="server" ID="drpOrgLocation" AutoPostBack="true" AppendDataBoundItems="true"
                                                    Width="150px" ValidationGroup="ConfVale" style="height: 25px" >
                                                      <asp:ListItem  Value="Select" Text="Select"></asp:ListItem>
                                                    <asp:ListItem>Mumbai</asp:ListItem>
                                                    <asp:ListItem>New Delhi</asp:ListItem>
                                                    <asp:ListItem>Bangalore</asp:ListItem>
                                                    <asp:ListItem>Hyderabad</asp:ListItem>
                                                    <asp:ListItem>Pune</asp:ListItem>
                                                    <asp:ListItem>Kolkata</asp:ListItem>
                                                   

                                                    </asp:DropDownList>
                                            </td>
                                           <td >
                                            <asp:RequiredFieldValidator
    ID="RequiredFieldValidator2"
    runat="server"
    ErrorMessage="*Required"
    ControlToValidate="drpMaster"
    InitialValue="Select"
    Display="dynamic" 
    ValidationGroup="ConfVale"
     ForeColor="#6697EE" style="font-size:14px;"
    >
</asp:RequiredFieldValidator>
                                           </td>
                                        </tr>
        

        <tr>
                                            <td>
                                               <span id="disp">Organization Name</span></td>

                                                <td>
                                                <asp:TextBox  SkinID="textBox" runat="server" ID="OrgName" 
                                                    Width="150px" OnTextChanged="txtName_TextChanged" class="textbox"/>  
                                            </td>
                                              <td style="height: 33px;font-size:14px;">

                                                <asp:RequiredFieldValidator ErrorMessage="*Required"  ForeColor="#6697EE" 
                                                    ControlToValidate="OrgName" ID="RequiredFieldValidator16" ValidationGroup="ConfVale" runat="server" />
                                                
                                                <asp:RegularExpressionValidator ID="regName" runat="server" 
                                             ControlToValidate="OrgName" 
                                              ValidationExpression="^[a-zA-Z'.\s]{8,30}"
                                               ErrorMessage="Invalid Name(min 8,max 30,only chars)" ValidationGroup="ConfVale" ForeColor="#6697EE"  />   

                                            </td>
                                           
                                         <td> <%-- <h5> For Admin Please Give organization Name as "ADMIN" </h5> --%> </td>

                                        </tr>

                                        <tr>
                                        <td></td>
                                        <td></td>
                                        
                                        </tr>

     
                                        <tr >
                                           
                                            <td>
                                                <asp:Button Text="Register" ValidationGroup="ConfVale"  Width="150px" 
                                                    OnClick="btnSaveConfig_Click" ID="btnSaveConfig"  class="button"
runat="server"  />
                                            </td>
                                             
                                        </tr>



                                        </table>
                                        <div style="margin-top:20px;">
                                        <span id="disp" style="color:#6999EF;font-size:15px;">
                                        <asp:Label ID="lblReply" runat="server" Text=""></asp:Label></span>
                                        </div>

        </center>

 </div>  
 
 <asp:Label ID="Label2" runat="server" ></asp:Label>     
</asp:Content>


