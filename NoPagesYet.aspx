<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="NoPagesYet.aspx.vb" Inherits="NoPagesYet" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolderLeft" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentPlaceHolderRight" Runat="Server">
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="Body" Runat="Server">
    <h1>This site has no pages yet</h1>
    <h2>Please check back soon</h2>
    <div id="AdminOnly" class="AdminBit" visible="false" runat="server">
        <p>There are no publicly available pages yet. The first you add will automatically become your home page</p>
        <br />
	    <a href="/editing/Admin.aspx?page=0&parentpage=0" >[ New  Page ]</a>
    </div>
</asp:Content>

