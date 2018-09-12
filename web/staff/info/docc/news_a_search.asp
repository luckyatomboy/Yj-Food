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
</head>

<body>
<table width="304" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td><img src="images/index2_1.gif" width="304" height="27"></td>
  </tr>
  <tr> 
    <td background="images/index_2.gif"> 
		<br>
		<form name="frmsearch" method="post" action="news_search_list.asp">
		<input type="hidden" name="action" value="a_search">
		<table align="center" border="0" width="90%">
		  <tr>
			<td width="60" height="26">目录</td>
			<td>
			<select name="columnid" style="width:200px;">
			<option value="">所有目录</option>
			<%
			set rs=conn.execute("select columnid,columnname from tbl_news_column where columnparentid=0 order by columnid desc")
			do while not rs.eof
				response.write("<option value="&rs("columnid")&">◎"&rs("columnname")&"</option>")
				set rs_child=conn.execute("select columnid,columnname from tbl_news_column where columnparentid="&rs("columnid")&" order by columnid desc")
				do while not rs_child.eof
					response.write("<option value="&rs_child("columnid")&">┣"&rs_child("columnname")&"</option>")
					rs_child.movenext
				loop
				rs.movenext
			loop
			set rs=nothing
			%>
			</select>
			</td>
		  </tr>
		  <tr>
			<td height="26">日期</td>
			<td><input type="text" name="regdate_s" style="width:91px;"> - <input type="text" name="regdate_e" style="width:91px;"></td>
		  </tr>
		  <tr>
			<td height="26">关键字</td>
			<td><input type="text" name="keyword" style="width:200px;"></td>
		  </tr>
		  <tr>
			<td height="26">范围</td>
			<td>
			<input type="radio" name="range" value="0">标题
			<input type="radio" name="range" value="1">内容
			<input type="radio" name="range" checked value="2">全文
			</td>
		  </tr>
		  <tr>
			<td colspan="2" align="center" height="26">
			<input type="submit" name="btnSubmit" value="搜索" style="width:60px;">
			<input type="reset" name="btnReset" value="取消" style="width:60px;">
			</td>
		  </tr>
		</table>
		</form>
	  </td>
  </tr>
  <tr> 
    <td><img src="images/index_4.gif" width="304" height="17"></td>
  </tr>
</table>
<br>
</body>
</html>
