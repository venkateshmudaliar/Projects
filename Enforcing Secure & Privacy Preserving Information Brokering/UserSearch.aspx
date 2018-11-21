<%@ Page Title="" Language="C#" MasterPageFile="~/Users.master" AutoEventWireup="true" CodeFile="UserSearch.aspx.cs" Inherits="UserSearch" %>

<asp:Content ID="Content1" ContentPlaceHolderID="cntplaceholder2" Runat="Server">


<div style="border:1px solid #00C3A9;border-radius:5px;padding-top:30px;padding-bottom:30px;background-color:#171717;font-family:Arial;">

    <center>
<table>

   <tr>
                                                    <td>
                                                      <span id="disp">Enter Disease Name</span>
                                                    </td>
                                                    <td>
                                                        <asp:TextBox  class="textbox" SkinID="textBox" ValidationGroup="UserSearchInformation" runat="server" ID="txtSearchByDisease" Width="150px"/>
                                                    </td>
                                                    
                                                    <td>
                                                         <asp:Button  class="button" runat="server" Width="150px" ValidationGroup="UserSearchInformation" 
                                                                        AutoPostBack="false" ID="btnSearchDiseaseByID" Text="Find Disease" 
                                                                        OnClick="btnSearchUserByID_Click" AppendDataBoundItems="true" 
                                                             Height="26px" />         
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td align="justify" style="height: 26px">
                                                        <span id="disp" >Select Disease</span> 
                                                    </td>
                                                    <td style="height: 26px">
                                                        <asp:dropdownlist ID="drpSearchDiseaseList" 
                                                             Width="150px" OnSelectedIndexChanged="drpSearchDiseaseList_SelectedIndexChanged"
                                                              AutoPostBack="true" AppendDataBoundItems="true"
                                                            runat="server" Height="25px" CausesValidation="True"  EnableClientScript="True" 

                                                            > 
                                                            <asp:ListItem  Value="Select" Text="Select"></asp:ListItem>                                                    
                                                        </asp:dropdownlist>
                                                    </td>
                                                <td style="height: 26px"><asp:Label ID="lblre" runat="server" /> </td>
                                                <td style="width: 80px">
                                                <asp:RequiredFieldValidator
                                                ID="drpMasterdsv"
                                                runat="server"
                                                ErrorMessage="*Required"
                                                ControlToValidate="drpSearchDiseaseList"
                                                InitialValue="Select"
                                                Display="dynamic"
                                               ValidationGroup="UserSearch"
                                                 ForeColor="#6697EE" 
                                                style="font-size:14px;"
                                                 >
</asp:RequiredFieldValidator>
                                                
                                                
                                                   </td>

                                                </tr>
                                                <tr><td>&nbsp</td></tr>
                                                <tr>
                                                <td>
                                                <asp:Button  class="button" ID="btnsearch1" runat="server" Width="150px" Text="RequestData" 
                                                        onclick="btnsearch1_Click" Height="26px" ValidationGroup="UserSearch" />
                                                </td>
                                                </tr>


</table>
</center>
</div>
</asp:Content>

