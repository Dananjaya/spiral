<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="ContentPage.aspx.vb" Inherits="ContentPage" %>
<%@ Register Src="~/WebShellControls/ContentWithEditor.ascx"  TagPrefix="WebShell" TagName="ContentWithEditor" %>
<%@ Register Src="~/WebShellControls/PageAdminLinks.ascx"  TagPrefix="WebShell" TagName="PageAdminLinks" %>
<%@ Register Src="~/WebShellControls/GalleryOrSelector.ascx"  TagPrefix="WebShell" TagName="GalleryOrSelector" %>

<asp:Content ID="Content1" ContentPlaceHolderID="Head" Runat="Server">
    <asp:Repeater ID="RptCSS" runat="server">
        <ItemTemplate>        
            <link rel="stylesheet" type="text/css" href="/Style/OptionalCss/<%#Container.DataItem %>" />
        </ItemTemplate> 
    </asp:Repeater>
    <script src="/galleria/galleria-1.2.8.min.js"></script>
    <meta name="description" content="<%=MetaDescriptionSt%>">
</asp:Content>
<asp:Content ID="Content6" ContentPlaceHolderID="Body" Runat="Server">
    
      <div class="row">
            <h1 id="PageTitle" runat="server" />
             <WebShell:PageAdminLinks id="PageAdminLinks1" runat="server" /> 
              <WebShell:ContentWithEditor id="ContentWithEditorCenter" AreaName="Main"  runat="server" />  
        </div>   
        
      <div class="row">
             &nbsp;
        </div> 
      <div class="row">
              <WebShell:ContentWithEditor id="ContentWithEditor1" AreaName="SideBar"  runat="server" />  
        </div>   
        
</asp:Content>