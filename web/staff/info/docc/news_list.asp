<%@language="VBscript"%>
<%Response.Expires=0%>
<!--#include file="../include/checkadmin.asp"--><!--#include file="../include/conn.asp"-->
<!--#include file="../include/tools.asp"-->
<title>新闻列表</title>
<style>
	td{font-size:13px;}
</style>
<%
columnid=request.querystring("columnid")
if columnid="" or isnull(columnid) or not isnumeric(columnid) then
	response.write("<p align=center>对不起，目录不存在或者目录已经被删除！</p>")
	response.end
end if
set rs_column=conn.execute("select columnname from tbl_news_column where columnid="&columnid)
if rs_column.eof then
	response.write("<p align=center>对不起，目录不存在或者目录已经被删除！</p>")
	response.end
end if
sqlstr="select id,title,regdate from tbl_news where columnid="&columnid&" order by id desc"
%>
<link href="../../style/style.css" rel="stylesheet" type="text/css">
<style>
body {
	background-color:#FFFFFF;
}
</style>

<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#C4D8ED">
<tr>
<td><img src="../../images/r_1.gif" alt="" /></td>
<td width="100%" background="../../images/r_0.gif">
  <table cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td>&nbsp;在线新闻</td>
	  <td align="right">&nbsp;</td>
    
    </tr>
  </table>
  </table>
<table width="535" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="24" background="../../images/r_1.gif"> <b><%=rs_column("columnname")%></b> </td>
  </tr>
</table>
<table width="535" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="e8e8e8">
  <tr> 
    <td width="533" bgcolor="#FFFFFF"> 
	<%
	set rs=server.createobject("adodb.recordset")
	rs.open sqlstr,conn,3,1
	if rs.eof then
		response.write("<p align=center>对不起，找不到相关新闻！</p>")
	else
		intRecordcount=rs.recordcount
		rs.pagesize=10
		intPagecount=rs.pagecount
		intPage=request.form("intPage")
		if intPage="" or isnull(intPage) or not isnumeric(intPage) then intPage=1
		intPage=cint(intPage)
		rs.absolutepage=intPage
	%>
      <table width="511" border="0" align="center" cellpadding="0">
		<%
		for i=1 to rs.pagesize
		%>
		  <tr>
			<td height=23> · <a href='news_detail.asp?id=<%=rs("id")%>' ><%=rs("title")%></a> <font color=#666666><%=formatdatetime(rs("regdate"),2)%></font></td>
		  <tr>
		<%
			rs.movenext
			if rs.eof then exit for
		next
		set rs=nothing
		%>
      </table>
	<%
	end if
	%>
	</td>
  </tr>
</table>
<%if intPagecount>1 then%>
<table width="535" border="0" align="center" cellpadding="0" cellspacing="0">
<form name="frmpage" method="post">
<input type="hidden" name="columnid" value="<%=columnid%>">
  <tr> 
    <td align="center" height="24" background="../../images/r_1.gif"><!--#include file="../include/showpage.asp"--></td>
  </tr>
</form>
</table>
<%end if%>