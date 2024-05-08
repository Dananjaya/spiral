
Imports VBCode.StoreEntity

Partial Class test
    Inherits System.Web.UI.Page

    Private Sub test_Load(sender As Object, e As EventArgs) Handles Me.Load

        Dim BoydsContext As New BoydsEntities
        'BoydsContext.ExecuteStoreCommand("truncate table Store_Filter")
        Dim oc As HttpContext = HttpContext.Current

        For Each c As Object In oc.Cache
            oc.Response.Write("<br>" & c.Key.ToString())
        Next
    End Sub
End Class
