<%@language="VBscript"%>
<%Response.Expires=0%>
<!--#include file="../include/conn.asp"-->
<!--#include file="../include/tools.asp"-->
document.write("<table align=center width=98% border=0 cellspacing=0 cellpadding=0>");
<%
'訳方
n=request.querystring("n")
if n="" or isnull(n) or not isnumeric(n) then n=6
sqlstr="select top "&n&" id,title,regdate from tbl_news order by hits desc"
'生朕
columnid=request.querystring("columnid")
if columnid<>"" and isnumeric(columnid) then
	sqlstr="select top "&n&" id,title,regdate from tbl_news where columnid="&columnid&" order by hits desc"
end if

set rs=conn.execute(sqlstr)
do while not rs.eof
%>
document.write("<tr><td height=23> ， <a href='news_detail.asp?id=<%=rs("id")%>' target='_blank'><%=replace(rs("title"),"""","\""")%></a> <font color=#666666><%=formatdatetime(rs("regdate"),2)%></font></td><tr>");
<%
	rs.movenext
loop
set rs=nothing
%>
document.write('</table>');