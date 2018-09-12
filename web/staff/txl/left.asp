<%response.expires=0%>
<!--#include file="conn.asp"-->
<!-- #include file="../const.asp" --> 
<%
if fla92="0" and session("redboy_id")<>"1" then
%>
<br><center><img src="../images/note.gif" align="absmiddle">&nbsp;<font color="#FF0000">你不具备此权限，请与管理员联系！</font></center>
<%  
  response.end
end if
%>
<%

set conn=dbconn("conn")
%>
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>企业通迅录</title>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#C4D8ED">
<tr>
<td><img src="../images/r_1.gif" alt="" /></td>
<td width="100%" background="../images/r_0.gif">
  <table cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td>&nbsp;在线通迅录</td>
	  <td align="right">&nbsp;</td>
    
    </tr>
  </table>
  </table>

<link href="../style/style.css" rel="stylesheet" type="text/css">
<style>
body {
	background-color:#FFFFFF;
}
</style>
</head>
<body bgcolor="#ffffff" topmargin="5" leftmargin="5">
<div align="center">
  <center>
  <table border="0" cellpadding="0" cellspacing="0" width="120">
    <tr>
      <td width="13"><img border="0" src="images/openfld.gif" align="absmiddle" width="16" height="16"></td>
    </center>
    <td width="103">
      <p align="left"><img border="0" src="images/treeline1.gif" align="absmiddle" width="18" height="16">企业通迅录</td>
  </tr>
  <center>
  <tr>
 
<%

set rs=server.createobject("adodb.recordset")
sql="select * from fenlei order by xh"
rs.open sql,conn,1
%>
  <tr>
    <td width="13"><img border="0" src="images/midopenedfolder.gif" align="top" width="16" height="22"></td>
    <td width="103"><img border="0" src="images/menu_admin.gif" align="absmiddle" width="16" height="16"> 
      按分类</td>
  </tr>
<%
j=1
do while not rs.eof
%>
  <tr>
    <td width="13"><img border="0" src="images/vertline.gif" align="top" width="16" height="22"></td>
    <td width="103">
<%
	if j<rs.recordcount then
%>	
	<img border="0" src="images/midnodeline.gif" align="absmiddle" width="16" height="22">
<%
	else
%>
	<img border="0" src="images/lastnodeline.gif" align="absmiddle" width="16" height="22">
<%
	end if
%>
	<img border="0" src="images/menu_about.gif" align="absmiddle" width="16" height="16"><a href="dispinfo.asp?page=1&typenumber=2&lookstr=<%=rs("leibie")%>" target="mainFrame"><%=server.htmlencode(trim(rs("leibie")))%></a></td>
  </tr>
<%
	rs.movenext
	j=j+1
loop
conn.close
set rs=nothing
set conn=nothing
%>
  <tr>
    <td width="13"><img border="0" src="images/midopenedfolder.gif" align="top" width="16" height="22"></td>
    <td width="103"><img border="0" src="images/menu_admin.gif" align="absmiddle" width="16" height="16">&nbsp;<a href="findinfo.asp" target="mainFrame">通迅录查询</a></td>
  </tr>
  <tr>
    <td width="13"><img border="0" src="images/midopenedfolder.gif" align="top" width="16" height="22"></td>
    <td width="103"><img border="0" src="images/menu_admin.gif" align="absmiddle" width="16" height="16">&nbsp;<a href="addtype.asp" target="mainFrame">类别管理</a></td>
  </tr>
  <tr>
    <td width="13"><img border="0" src="images/lastnodeline.gif" width="16" height="22"></td>
    <td width="103"><img border="0" src="images/menu_admin.gif" align="absmiddle" width="16" height="16">&nbsp;<a href="inputinfo.asp" target="mainFrame">增加通迅录</a></td>
  </tr>
  <tr>
    <td width="13"></td>
    <td width="103"></td>
  </tr>
  </table>
  </center>
</div>

</body>

</html>
