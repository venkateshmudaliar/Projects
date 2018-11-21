<%@ Page Title="" Language="C#" MasterPageFile="~/CoOrdinator.master" AutoEventWireup="true" CodeFile="CoReceivedDetails.aspx.cs" Inherits="CoReceivedTask" %>






<asp:Content ID="Content1" ContentPlaceHolderID="cntplaceholderr2" Runat="Server">
<style type="text/css">
    
::-webkit-scrollbar {
    width: 9px;   
}

::-webkit-scrollbar-track {
    -webkit-box-shadow:  0 0 4px rgba(190,190,190,0.3);
    -webkit-border-radius: 11px;
    border-radius: 11px;
    border:0.1px solid #323232;
    background-color:#202125;
 
}

::-webkit-scrollbar-thumb {
    -webkit-border-radius: 11px;
    border-radius: 11px;
    
    -webkit-box-shadow: inset 0 0 6px rgba(63,63,63,0.5);
    background: #83838A;
}
::-webkit-scrollbar-thumb:window-inactive {
	background: rgba(63,63,63,0.8);
}

  
  </style>

<div style="border:1px solid #00C3A9;border-radius:5px;padding-top:30px;padding-bottom:30px;background-color:#171717;font-family:Arial;">
<%-- %><form id="formm1" runat="server">--%>

<center>
<h3 style= "color:#D4D4D4;">Received Details</h3><br />
  <td>
  <div  class="sc" id="scrolling-table-container" style="font-size:12px;max-height:300px;overflow:auto;margin-right:5px;" >

                <asp:GridView ID="GridView1" runat="server" BackColor="#434343" 
                    CellPadding="4" AutoGenerateColumns="False" 
                    GridLines="Both" onselectedindexchanged="GridView1_SelectedIndexChanged1"
                    DataKeyNames="id_no" OnRowDeleting="gvProducts_RowDeleting" Width="762px"
                    >

                    

                   <%-- %> <AlternatingRowStyle BackColor="#434343" />--%>

                   <Columns>
                    <asp:BoundField DataField="id_no" HeaderText="Id No"/>
                    <asp:BoundField DataField="PatientName" HeaderText="PatientName"/>
                    <asp:BoundField DataField="DoctorName" HeaderText="DoctorName"/>
                    <asp:BoundField DataField="Age" HeaderText="Age"/>
                    <asp:BoundField DataField="DiseaseName" HeaderText="DiseaseName"/>
                     <asp:BoundField DataField="Email" HeaderText="Email"/>
                     <asp:BoundField DataField="DiseaseDescription" HeaderText="DiseaseDescription"/>
                    
                    <asp:TemplateField>
                    <ItemTemplate>
                   
                      <asp:LinkButton ID="btnDelete" runat="server" CommandName="Delete" Text="Delete"/>

                          
                           
                


                    </ItemTemplate>
                </asp:TemplateField>
               


                </Columns>

                   <FooterStyle BackColor="#990000" ForeColor="White" Font-Bold="True" />
            <HeaderStyle BackColor="#333333" Font-Bold="True" ForeColor="White"    />
            <PagerStyle BackColor="#FFCC66" ForeColor="#333333" HorizontalAlign="Center" />
            <RowStyle BackColor="#434343" ForeColor="#D4D4D4" />

            <SelectedRowStyle BackColor="green" Font-Bold="True" ForeColor="yellow" />

            <SortedAscendingCellStyle BackColor="#FDF5AC" />
            <SortedAscendingHeaderStyle BackColor="#4D0000" />
            <SortedDescendingCellStyle BackColor="#FCF6C0" />
            <SortedDescendingHeaderStyle BackColor="#820000" />
                    
                </asp:GridView>
                </div>

            </td>
         
            </center>
            <%-- </form>--%>
          
</div>
</asp:Content>

