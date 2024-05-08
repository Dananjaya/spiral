
Partial Class CreateBannerTEst
    Inherits System.Web.UI.Page

    Private Sub CreateBannerTEst_Load(sender As Object, e As EventArgs) Handles Me.Load
        Dim BannerL As New BannerGraphics
        BannerL.CreateAllBanners(True)
    End Sub
End Class
