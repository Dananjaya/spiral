
Partial Class NoPagesYet
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim Sess As New SessionVars
        If Not Sess.AdminID = 0 Then
            AdminOnly.Visible = True
        End If
    End Sub
End Class
