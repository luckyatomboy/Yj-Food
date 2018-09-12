<%@language="VBscript"%>
<%Response.Expires=0%>
<!--#include file="../include/checkadmin.asp"--><!--#include file="../include/conn.asp"-->
<!--#include file="../include/tools.asp"-->
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>信息发布系统</title>
<link href="css.css" rel="stylesheet" type="text/css">
<link href="../../style/style.css" rel="stylesheet" type="text/css">
<style>
body {
	background-color:#FFFFFF;
}
</style>
</head>

<body>
<br>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#C4D8ED">
<tr>
<td><img src="../../images/r_1.gif" alt="" /></td>
<td width="100%" background="../../images/r_0.gif">
  <table cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td>&nbsp;在线新闻</td>
	  <td align="right">　</td>
    
    </tr>
  </table>
  </table>
<%
set rs_column=conn.execute("select columnid,columnname from tbl_news_column order by columnid desc")
do while not rs_column.eof
%>

<table width="90%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td width="88%" height="24" background="../../images/r_1.gif"> <b><%=rs_column("columnname")%></b> </td>
  </tr>
</table>
<table width="90%" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="e8e8e8">
  <tr> 
    <td width="90%" bgcolor="#FFFFFF"> 
      <table width="88%" border="0" align="center" cellpadding="0">
		<%
		set rs=conn.execute("select top 6 id,title,regdate from tbl_news where columnid="&rs_column("columnid")&" order by id desc")
		do while not rs.eof
		%>
        <tr> 
          <td width="87%">·<a href="news_detail.asp?id=<%=rs("id")%>"><%=rs("title")%></a> <font color="#666666"><%=formatdatetime(rs("regdate"),2)%></font></td>
        </tr>
		<%
			rs.movenext
		loop
		%>
        <tr>
          <td height="20"> 
            <div align="right"><a href="news_list.asp?columnid=<%=rs_column("columnid")%>"><img src="images/more.gif" width="60" height="20" border="0"></a></div></td>
        </tr>
      </table> </td>
  </tr>
</table>
<br>
<%
	rs_column.movenext
loop
set rs_column=nothing
%>
</body>
</html>