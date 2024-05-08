<%@ Page Language="VB" AutoEventWireup="false" CodeFile="iframeRefresh.aspx.vb" Inherits="iframeRefresh" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">


<HTML>
<HEAD>
<script language="JavaScript" type="text/JavaScript">
<!--
function MM_goToURL() { //v3.0
  var i, args=MM_goToURL.arguments; document.MM_returnValue = false;
  for (i=0; i<(args.length-1); i+=2) eval(args[i]+".location='"+args[i+1]+"'");
}

function TimesUp()
{
//input_box=confirm("Your session will soon expire. Click OK to stay logged on or Cancel to logout");
//if (input_box==true)
//	{ 
		desitnation = "iFrameRefresh.Aspx"
//	}else{
//		desitnation = " iFrameRefresh.Aspx?LogMeOut=true"
//	}
window.location = desitnation
} 
//-->
</script>
</HEAD>
<body onload="<%=WhatJava%>">

</BODY>
</HTML>