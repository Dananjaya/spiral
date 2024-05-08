
Partial Class MasterPage
    Inherits System.Web.UI.MasterPage
    Private Sub MasterPage_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim Sess As New SessionVars
        Dim CartLogic As New CartBS
        CartLink.Visible = CartLogic.CartForPage.Count > 0
        If Sess.CustomerName IsNot "" Then
            UserLink.InnerHtml = "Hi, " & Sess.CustomerName & "!"
        Else
            UserLink.Visible = False
            LogOutLink.Visible = False
        End If

    End Sub

    Public Sub LogOut_Click()
        UserLink.Visible = False
        LogOutLink.Visible = False
        Dim Sess As New SessionVars
        Sess.CustomerID = 0
        Sess.CustomerName = String.Empty
        Response.Redirect("/BoydLogin/Login.aspx")
    End Sub
End Class

