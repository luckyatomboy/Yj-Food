<%@ Page Language="Vb"%>
<%@ Import Namespace="System.IO"%>
<HTML>
  <HEAD>
  </HEAD>
  <BODY>
<%
	dim username,password
	username=Request.Form("Text1")
	password=Request.Form("Password1")
	
	Response.Write("你的用户名为：" & username &"<br>")
	Response.Write("你输入的密码为：" & password &"<br>")
%>
  </BODY>
</HTML>