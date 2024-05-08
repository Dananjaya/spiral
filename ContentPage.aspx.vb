Imports System.Linq
Imports WebShell_VB
Partial Class ContentPage
    Inherits System.Web.UI.Page
    Property _iPageID As Long
    Public Property iPageID() As Long
        Get
            If _iPageID = 0 Then
                Dim RouteName As String = Page.RouteData.Values("RouteName")
                Dim PagePathL As New PagePath
                _iPageID = PagePathL.PageIDByRouteOrDefault(RouteName)
            End If
            Return _iPageID
        End Get
        Set(ByVal Value As Long)
            _iPageID = "" & Value
        End Set
    End Property
    Public Property MetaDescriptionSt As String
    Protected Sub Page_Load(sender As Object, e As System.EventArgs) Handles Me.Load
        Dim WebShell As New WebShell_3Entities
        Dim ThisPage As WebShell_Pages = (From u In WebShell.WebShell_Pages
                                          Where u.PageID = iPageID
                                          Select u).FirstOrDefault

        PageTitle.InnerHtml = ThisPage.HeaderTitle
        Dim Sess As New SessionVars

        If Not ThisPage.redirectToPage = "" Then
            If Sess.AdminID = 0 Then
                Response.Redirect(ThisPage.redirectToPage.ToString)
            Else
                PageTitle.InnerHtml = "This page is redirected so its content is not visible to non admin users. This can be changed in page admin."
            End If
        End If
        If ThisPage.RestrictAccess = 1 Then
            If Sess.AdminID = 0 Then
                CheckUserGroups()
            End If
        End If

        Dim ThisSite As WebShell_Site = (From u In WebShell.WebShell_Site
                                         Select u).FirstOrDefault

        Dim CssList As List(Of String) = ThisPage.ExtraCss.Split(",").ToList
        RptCSS.DataSource = CssList
        RptCSS.DataBind()

        Dim CacheStuffL As New CacheStuffBL
        CacheStuffL.SetupCacheIfNotAdmin(iPageID)

        Master.Page.Title = ThisSite.SiteName & " - " & ThisPage.HeaderTitle
        MetaDescriptionSt = ThisPage.page_desc
    End Sub

    Protected Sub Page_PreLoad(sender As Object, e As System.EventArgs) Handles Me.PreLoad
        If Not IsPostBack Then
            Dim RouteName As String = Page.RouteData.Values("RouteName")
            Dim PagePathL As New PagePath
            Dim PageID As Long = PagePathL.PageIDByRouteOrDefault(RouteName)
            Dim PageIDNotDefault As Long = PagePathL.PageIDByRoute(RouteName)
            If PageID = 0 Then
                Response.Redirect("/NoPagesYet.aspx")
            Else
                If PageIDNotDefault = 0 Then
                    If Not RouteName = "" Then
                        Response.Redirect(PagePathL.RouteByPageID(PageID))
                    End If
                End If
            End If
        End If
    End Sub
    Private Sub CheckUserGroups()
        Dim Sess As New SessionVars
        Dim WebShell As New WebShell_3Entities
        Dim GroupIDs As List(Of Long) = (From u In WebShell.WebShell_UserGroupVsPage
                                         Where u.PageID = iPageID
                                         Select u.GroupID).ToList

        If Not GroupIDs.Contains(Sess.GuestUserGroupID) Then
            Response.Redirect("/")
        End If
    End Sub

End Class
