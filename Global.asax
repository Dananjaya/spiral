<%@ Application Language="VB" %>
<%@ Import Namespace="System.Web.Optimization" %>
<%@ Import Namespace="System.Web.Routing" %>

<script runat="server">

    Sub Application_Start(ByVal sender As Object, ByVal e As EventArgs)
        BundleTable.EnableOptimizations = True
        RegisterBundles(BundleTable.Bundles)
        RegisterRoutes(RouteTable.Routes)
        Dim tco As New TempClearOut()
        tco.DeleteOldFiles()
        Dim ThumbClean As New ThumbCleanUp()
        ThumbClean.DeleteOldFiles()
    End Sub
    Sub RegisterRoutes(ByVal routes As RouteCollection)
        Dim PagePathL As New PagePath
        PagePathL.RegisterRoutes()
    End Sub
    Sub RegisterBundles(ByVal Bundles As BundleCollection)
        Dim RegBundlesL As New RegBundles
        RegBundlesL.BundleSetup()
    End Sub

    Sub Application_End(ByVal sender As Object, ByVal e As EventArgs)
        Dim MenuBuilderL As New MenuBuilder
        MenuBuilderL.UpdateAllMeuns()
    End Sub

    Sub Application_Error(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when an unhandled error occurs
    End Sub

    Sub Session_Start(ByVal sender As Object, ByVal e As EventArgs)
        ' Code that runs when a new session is started
    End Sub

    Sub Session_End(ByVal sender As Object, ByVal e As EventArgs)
        Dim tco As New TempClearOut()
        tco.DeleteOldFiles()
        Dim ThumbClean As New ThumbCleanUp()
        ThumbClean.DeleteOldFiles()
    End Sub
</script>