<%@ Page Language="VB" AutoEventWireup="false" CodeFile="testNotMaster.aspx.vb" Inherits="testNotMaster" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
                                <asp:CheckBoxlist ID="cbTags" AutoPostBack="true" OnSelectedIndexChanged="cbTags_SelectedIndexChanged" runat="server" >
                                    <asp:ListItem Value="1" />
                                    <asp:ListItem Value="2" />
                                </asp:CheckBoxlist>
    </div>
    </form>
</body>
</html>
