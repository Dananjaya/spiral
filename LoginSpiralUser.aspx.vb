
Partial Class LoginSpiralUser
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        'Dim CacheStuffBL As New CacheStuffBL
        ' CacheStuffBL.PageCacheClear()

        Dim UserSv As New UserService.UserService
        Dim SiteID As Integer = System.Configuration.ConfigurationManager.AppSettings("DashBoardSiteID")

        Dim ReturnStr As String = UserSv.SiteUserLoginConfirm(Request.QueryString("v"), SiteID)

        Dim UserId As Integer = 0
        Int32.TryParse(ReturnStr, UserId)

        If UserId = 0 Then
            Response.Write(ReturnStr)
        Else
            Dim Md5String As String = DateTime.Now.ToLongTimeString
            Md5String = FormsAuthentication.HashPasswordForStoringInConfigFile(Md5String, "MD5")
            Md5String = Right(Md5String, 5)
            Dim Sess As New SessionVars
            Sess.AdminID = UserId
            Sess.AdminName = UserSv.UserNameByID(UserId)
            Sess.Refresh()

            If Request.QueryString("il") = "" Then
                Response.Redirect("/?a=" & Md5String)
            Else
                Response.Redirect(UserSv.DecryptedString(Request.QueryString("il")))
            End If
            Response.Redirect("/?a=" & Md5String)
        End If
    End Sub
End Class
