<%@ Page Language="VB" ClassName="s1" %>
<%@ Reference Control="~/WebShellControls/GalleryEditorItem.ascx"  %>
<%@ Reference Control="~/WebShellControls/Spinner.ascx"  %>

<script runat="server">
    Private Spinner1 As ASP.s2
    'Private g As ASP.GalleryEditorItem
    Protected Sub Page_Load(ByVal sender As Object, _
            ByVal e As System.EventArgs)
        Spinner1 = CType(LoadControl("~\Controls\Spinner.ascx"),  _
            ASP.s2)
End Sub

Protected Sub Button1_Click(ByVal sender As Object, _
      ByVal e As System.EventArgs)
    PlaceHolder1.Controls.Add(Spinner1)
End Sub
</script>
<html>
<head id="Head1" runat="server">
  <title>Load User Control Programmatically</title>
</head>
<body>
  <form id="form1" runat="server">
    <div>
      <asp:PlaceHolder runat=server ID="PlaceHolder1" />
      <br />
      <asp:Button ID="Button1" runat="server" 
        Text="Button" 
        OnClick="Button1_Click" />
      <br />
      <br />
      <asp:Label ID="Label1" runat="server" Text=""></asp:Label>
    </div>
  </form>
</body>
</html>