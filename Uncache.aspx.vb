
Partial Class Uncache
    Inherits System.Web.UI.Page

    Private Sub Uncache_Load(sender As Object, e As EventArgs) Handles Me.Load

        Dim CacheStuffBL As New CacheStuffBL
        CacheStuffBL.PageCacheClear()
    End Sub
End Class
