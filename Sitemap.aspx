<%@ Page Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="Sitemap.aspx.vb" Inherits="Sitemap" title="Sitemap" %>
<asp:Content ID="Content1" ContentPlaceHolderID="Body" Runat="Server">
	<asp:xmldatasource id="xds1"  runat="server" xPath="/MenuItems/*" EnableCaching="False" EnableViewState="False"
> </asp:xmldatasource>
    <asp:TreeView ID="TreeView1" runat="server" DataSourceID="xds1" >
    <DataBindings>
                  <asp:TreeNodebinding depth="0"  textfield="display" NavigateUrlField="url"/>
                  <asp:TreeNodebinding depth="1"  textfield="display" NavigateUrlField="url"/>
                  <asp:TreeNodebinding depth="2"  textfield="display" NavigateUrlField="url"/>
                  <asp:TreeNodebinding depth="3"  textfield="display" NavigateUrlField="url"/>
                  <asp:TreeNodebinding depth="4"  textfield="display" NavigateUrlField="url"/>
                  <asp:TreeNodebinding depth="5"  textfield="display" NavigateUrlField="url"/>
                  <asp:TreeNodebinding depth="6"  textfield="display" NavigateUrlField="url"/>
                  <asp:TreeNodebinding depth="7"  textfield="display" NavigateUrlField="url"/>
                  <asp:TreeNodebinding depth="8"  textfield="display" NavigateUrlField="url"/>
                  <asp:TreeNodebinding depth="9"  textfield="display" NavigateUrlField="url"/>
                  <asp:TreeNodebinding depth="10"  textfield="display" NavigateUrlField="url"/>
                  <asp:TreeNodebinding depth="11"  textfield="display" NavigateUrlField="url"/>
                  <asp:TreeNodebinding depth="12"  textfield="display" NavigateUrlField="url"/>                  
                </DataBindings>
                 

    </asp:TreeView>

</asp:Content>

