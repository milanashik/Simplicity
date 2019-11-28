<%@ Page Title="Home Page" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="Simplicity._Default" %>

<asp:Content ID="BodyContent" ContentPlaceHolderID="MainContent" runat="server">

    <div class="jumbotron">
        <h1>Visitor Tracker</h1>
    </div>

    <div class="row">
        <div class="col-md-12">
            <h2>Top 10 latest visitor</h2>
             <asp:GridView ID="gridViewVisitorInfo" runat="server" CssClass="table table-responsive">    
            <HeaderStyle BackColor="#4A3C8C" Font-Bold="True" ForeColor="#E7E7FF" />    
        </asp:GridView> 
        </div>
    </div>

</asp:Content>
