
Imports WebShell_VB

Partial Class Sitemap
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load


        Dim WebShellContext As New WebShell_3Entities
        Dim site As WebShell_Site = (From u In WebShellContext.WebShell_Site
                                     Select u).First

        Dim Sess As New SessionVars

        If Sess.AdminID > 0 Then
            xds1.Data = site.Menu_XML_Admin.ToString
        Else
            If Sess.CustomerID = 0 Then
                xds1.Data = site.Menu_XML_Public.ToString
            Else
                xds1.Data = site.Menu_XML_Public.ToString
            End If
        End If

    End Sub
End Class
