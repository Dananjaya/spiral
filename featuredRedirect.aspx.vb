
Partial Class featuredRedirect
    Inherits System.Web.UI.Page

    Protected Sub form1_Load(sender As Object, e As EventArgs) Handles form1.Load

        Dim ProductL As New ProductsBS
        Dim ProductTable As BoydsStore.Store_ProductsDataTable = ProductL.FeaturedVehicle()

        If ProductTable.Count = 0 Then
            'Response.Write("No Featured Bike Found <br>")
            Response.Redirect("/c/No-Featured-Bike")
        Else
            Dim ProductRow As BoydsStore.Store_ProductsRow = ProductTable(0)
            Dim conv As New Conversions
            Dim Redir As String = conv.ProductLink(ProductRow.ProductID)
            Response.Redirect(Redir)
        End If
    End Sub
End Class
