<%@ Page Title="" Language="VB" MasterPageFile="~/MasterPage.master" AutoEventWireup="false" CodeFile="testmaster.aspx.vb" Inherits="testmaster" %>


<asp:Content ID="Content2" ContentPlaceHolderID="Head" Runat="Server">
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="Body" Runat="Server">
    
                                <asp:CheckBoxlist ID="cb1" AutoPostBack="true" OnSelectedIndexChanged="cbTags_SelectedIndexChanged" runat="server" >
                                    <asp:ListItem Value="1" />
                                    <asp:ListItem Value="2" />
                                </asp:CheckBoxlist>
</asp:Content>

