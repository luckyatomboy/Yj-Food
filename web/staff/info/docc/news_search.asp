<%@language="VBscript"%>
<%Response.Expires=0%>
<!--#include file="../include/checkadmin.asp"--><!--#include file="../include/conn.asp"-->
<!--#include file="../include/tools.asp"-->
<title>高级搜索</title>
<style>
	td{font-size:13px;}
</style>

<table align="center" width="380" cellpadding="1" cellspacing="1" bgcolor="#D6DFF7">
  <tr>
	<td height="23" colspan="2">高级搜索</td>
  </tr>
  <form name="frmsearch" method="post" action="news_search_list.asp">
  <input type="hidden" name="action" value="asearch">
  <tr bgcolor="#FFFFFF">
	<td>
	<br>
	<table align="center" border="0" width="98%">
	  <tr>
		<td width="60">目录：</td>
		<td>
		<select name="columnid">
		<option value="">所有目录</option>
		<%
		set rs=conn.execute("select columnid,columnname from tbl_news_column order by columnid desc")
		do while not rs.eof
			response.write("<option value="&rs("columnid")&">"&rs("columnname")&"</option>")
			rs.movenext
		loop
		set rs=nothing
		%>
		</select>
		</td>
	  </tr>
	  <tr>
		<td>日期：</td>
		<td><input type="text" name="regdate_s" style="width:80px;"> - <input type="text" name="regdate_e" style="width:80px;"></td>
	  </tr>
	  <tr>
		<td>关键字：</td>
		<td><input type="text" name="keyword"></td>
	  </tr>
	  <tr>
		<td>范围：</td>
		<td>
		<input type="radio" name="range" value="0">标题
		<input type="radio" name="range" value="1">内容
		<input type="radio" name="range" checked value="2">全文
		</td>
	  </tr>
	  <tr>
		<td colspan="2" align="center">
		<input type="submit" name="btnSubmit" value="搜索" style="width:60px;">
		<input type="reset" name="btnReset" value="取消" style="width:60px;">
		</td>
	  </tr>
	</table>
	<br>
	</td>
  </tr>
  </form>
</table>