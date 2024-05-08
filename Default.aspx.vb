
Imports VBCode.StoreEntity

Partial Class _Default
    Inherits System.Web.UI.Page
    Public conv As New Conversions
    Private Sub _Default_Load(sender As Object, e As EventArgs) Handles Me.Load

        '  Dim RegBundlesL As New RegBundles
        '  RegBundlesL.BundleSetup()

        Dim BannerL As New BannerGraphics
        BannerL.deleteHourOldBanners()
        BannerL.CreateAllBanners


        Dim dtN As DateTime = DateTime.Now
        Dim dtSaleEnd As DateTime = "10/07/2017 01:00:01"
        WideSale.Visible = conv.SecondDateISBiggerDownToSecond(dtN, dtSaleEnd)
        WideFOX.Visible = Not conv.SecondDateISBiggerDownToSecond(dtN, dtSaleEnd)
    End Sub

    Public Function rptBrandPromos_GetData() As IEnumerable(Of VBCode.StoreEntity.BannerCreationLog)
        Dim BoydsContext As New BoydsEntities
        Dim ListBanners As List(Of BannerCreationLog) = (From u In BoydsContext.BannerCreationLogs
                                                         Where u.TypeCreated.Contains("InStore") And Not u.TypeCreated.Contains("_Fail")
                                                         Select u).ToList

        ListBanners.Sort(New Randomizer(Of BannerCreationLog)())

        Dim iBanners As IEnumerable(Of BannerCreationLog) = (From u In ListBanners
                                                             Select u)
        Return iBanners
    End Function
    Public Function rptFeaturedBike_GetData() As IEnumerable(Of VBCode.StoreEntity.BannerCreationLog)
        Dim BoydsContext As New BoydsEntities
        Dim iBanners As IEnumerable(Of BannerCreationLog) = (From u In BoydsContext.BannerCreationLogs
                                                             Where u.TypeCreated = "FeaturedBike"
                                                             Select u).Take(1)
        Return iBanners
    End Function
    Public Function ActiveIfZero(int As Integer) As String
        If int = 0 Then
            Return " active"
        Else
            Return ""
        End If
    End Function

    Public Function RptSales_GetData() As IEnumerable(Of VBCode.StoreEntity.BannerCreationLog)
        Dim BoydsContext As New BoydsEntities
        Dim iBanners As IEnumerable(Of BannerCreationLog) = (From u In BoydsContext.BannerCreationLogs
                                                             Where u.TypeCreated.Contains("OnSale_") And Not u.TypeCreated.Contains("_Fail")
                                                             Select u).Take(1)
        RptSales.Visible = iBanners.Count > 0
        LinkNoSales.Visible = iBanners.Count = 0
        Return iBanners
    End Function


    Public Function RPTDiscountGroupBanners_GetData() As List(Of String)

        Dim EditablePath As String
        EditablePath = (Hosting.HostingEnvironment.MapPath("~\images\home\DiscountGroupBanners"))

        Dim di As New IO.DirectoryInfo(EditablePath)
        Dim diar1 = di.GetFiles()

        Dim CurrentFileNames As List(Of String) = (From FileInfo In diar1
                                                   Where FileInfo.Extension = ".jpg"
                                                   Select FileInfo.Name).ToList
        If CurrentFileNames.Count = 0 Then
            Return CurrentFileNames
        Else

            Dim AllWithoutExtension As New List(Of String)
            For Each fn In CurrentFileNames
                AllWithoutExtension.Add(fn.Replace(".jpg", ""))
            Next

            Dim BoydsContext As New BoydsEntities
            Dim DGs As List(Of String) = (From u In BoydsContext.DiscountGroups
                                          Where AllWithoutExtension.Contains(u.wdgCode)
                                          Select u.wdgCode).ToList
            If DGs.Count = 0 Then
                Return DGs
            Else
                DGs.Sort(New Randomizer(Of String)())
                Dim ListOfOne As New List(Of String)
                ListOfOne.Add(DGs.First)
                Return ListOfOne
            End If

        End If
    End Function
End Class
