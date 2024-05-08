Imports WebShell_VB

Partial Class GoogleMap
    Inherits System.Web.UI.Page
    Public iSiteID, iPageID As Integer
    Dim ReturnThis, PrimaryURL As String
    Dim Conversions As New Conversions

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        Dim WebShellContext As New WebShell_3Entities

        Response.AppendHeader("Content-Disposition", "application/xml")

        Dim ThisSite As WebShell_Site = (From u In WebShellContext.WebShell_Site
                                         Select u).FirstOrDefault
        PrimaryURL = ThisSite.PrimaryURL


        Dim PageListPublic As List(Of WebShell_Pages) = (From u In WebShellContext.WebShell_Pages
                                               Where u.RestrictAccess = 0 And u.OnNav = 1
                                                 Order By u.SortOrder Ascending
                                                 Select u).ToList

        ReturnThis = "<?xml version='1.0' encoding='UTF-8'?>"
        ReturnThis = ReturnThis & vbCrLf
        ReturnThis = ReturnThis & "<urlset xmlns='http://www.google.com/schemas/sitemap/0.84'>"
        ReturnThis = ReturnThis & vbCrLf

        For Each PageRow As WebShell_Pages In PageListPublic
            PageXMl(PageRow)
        Next

        ReturnThis = ReturnThis & "</urlset>"

        Response.ContentType = "text/xml"
        Response.Write(ReturnThis)
        Response.End()
    End Sub
    Sub PageXMl(PageRow As WebShell_Pages)

        Dim MenuLink As String
        Dim MenuLinkNoRedirect As String = "/c/" & PageRow.RouteName

        If (PageRow.redirectToPage & "") = "" Then
            MenuLink = MenuLinkNoRedirect
        Else
            MenuLink = "/" & PageRow.redirectToPage
        End If

        ReturnThis = ReturnThis & "<url>"
        ReturnThis = ReturnThis & vbCrLf
        ReturnThis = ReturnThis & " <loc>http://" & PrimaryURL
        ReturnThis = ReturnThis & MenuLink
        ReturnThis = ReturnThis & "</loc>"
        ReturnThis = ReturnThis & vbCrLf
        ReturnThis = ReturnThis & "</url>"
        ReturnThis = ReturnThis & vbCrLf
    End Sub
End Class
