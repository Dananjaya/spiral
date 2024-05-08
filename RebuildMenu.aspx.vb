
Partial Class RebuildMenu
    Inherits System.Web.UI.Page

    Protected Sub Page_PreInit(sender As Object, e As System.EventArgs) Handles Me.PreInit
        Dim MemuB As New MenuBuilder

        MemuB.UpdateAllMeuns()

    End Sub
End Class
