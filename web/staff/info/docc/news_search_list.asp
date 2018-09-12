<%@language="VBscript"%>
<%Response.Expires=0%>
<!--#include file="../include/checkadmin.asp"--><!--#include file="../include/conn.asp"-->
<!--#include file="../include/tools.asp"-->
<title>高级搜索</title>
<style>
	td{font-size:13px;}
</style>
<%
search_string=""
sqlstr="select id,title,regdate from tbl_news"
action=request.form("action")
if action="a_search" then
	'目录
	columnid=request.form("columnid")
	if columnid<>"" then search_string=search_string & " and columnid="&columnid
	'日期
	regdate_s=request.form("regdate_s")
	if regdate_s<>"" then  search_string=search_string & " and datediff('d','"&regdate_s&"',regdate)<=0"
	regdate_e=request.form("regdate_e")
	if regdate_e<>"" then  search_string=search_string & " and datediff('d','"&regdate_e&"',regdate)>=0"
	'关键字范围
	keyword=request.form("keyword")
	range=request.form("range")
	if keyword<>"" then
		if range="0" then
			search_string=search_string & " and title like '%"&keyword&"%'"
		elseif range="1" then
			search_string=search_string & " and content like '%"&keyword&"%'"
		elseif range="2" then
			search_string=search_string & " and (title like '%"&keyword&"%' or content like '%"&content&"%')"
		end if
	end if
end if
if search_string<>"" then
	sqlstr=sqlstr & " where 1<>0 " & search_string
end if
%>

<table width="535" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr> 
    <td height="24" background="../../images/r_1.gif">搜索结果 </td>
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
		rs.pagesize=6
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
			<td height=23> · <a href='news_detail.asp?id=<%=rs("id")%>' target='_blank'><%=rs("title")%></a> <font color=#666666><%=formatdatetime(rs("regdate"),2)%></font></td>
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
<input type="hidden" name="regdate_s" value="<%=regdate_s%>">
<input type="hidden" name="regdate_e" value="<%=regdate_e%>">
<input type="hidden" name="keyword" value="<%=keyword%>">
<input type="hidden" name="range" value="<%=range%>">
  <tr> 
    <td align="center" height="24" background="../../images/r_1.gif"><!--#include file="../include/showpage.asp"--></td>
  </tr>
</form>
</table>
<%end if%>