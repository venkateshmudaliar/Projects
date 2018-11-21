<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="About.aspx.cs" Inherits="Logout" %>








<asp:Content ID="Content1" ContentPlaceHolderID="cntplaceholder1" Runat="Server">

 <h2 style="color:#6697EE;">About The Project</h2>

 <h3 style="color:White;">
    The project has 4 entities: Admin,User,Broker,Coordinator.
 </h3>
 <br />
 <br />
<div  style="border:1px solid #00C3A9;border-radius:5px;padding:15px;background:#171717;">
<h4 id="ab">User:</h4> <span id="about">Submits data and requests data from system by sending query to broker.</span>
<br />
<h4 id="ab">Broker:</h4> <span id="about"> Receives search query from user, processes it and passes the query to coordinator.</span>
<br />
<h4 id="ab">Coordinator:</h4> <span id="about">Receives Request from Broker, searches for data and sends back the retrieved data to 
    Broker. Coordinator also sends SecretKeys to User for validating User's identity.</span>
<br />
<h4 id="ab">Admin:</h4> <span id="about">Manages the Registration of Organization,Users,Brokers,Coordinators.</span>


<br />
<br />
<br />
<br />


<center>
<div>
<img src="images/about.jpg" alt="PPIB Architecture" style="border:1px solid #C3C3C3;" />
</div>
</center>
<br />

<br />
<br />
</div>
 









</asp:Content>

