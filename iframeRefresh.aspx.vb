
Partial Class iframeRefresh
    Inherits System.Web.UI.Page

    Public i As Integer
    Public WhatJava As String
    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        WhatJava = "window.setTimeout('TimesUp()' , 100000);"

        For i = 0 To (Session.Contents.Count - 1)
            Session(Session.Keys(i).ToString) = Session(i)
        Next

        If Session("Editor") <> "1" Then
            WhatJava = ""
        End If

        If Request.QueryString("LogMeOut") = "true" Then
            Session("Guest") = "0"
            Session("Editor") = "0"
            WhatJava = "MM_goToURL('parent','default.aspx');return"
        End If
    End Sub
End Class
