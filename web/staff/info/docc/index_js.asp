<%@language="VBscript"%>
<%Response.Expires=0%>
<!--#include file="../include/conn.asp"-->
<!--#include file="../include/tools.asp"-->
<%
'ÌõÊý
n=request.querystring("n")
if n="" or isnull(n) or not isnumeric(n) then n=5
sqlstr="select top "&n&" id,title,left(content,30) as content2,regdate from tbl_news where index='1'"
'
set rs=conn.execute(sqlstr)
do while not rs.eof
%>
      document.write("<table width=\"273\" height=\"85\" align=\"center\">");
      document.write("  <tr> ");
      document.write("    <td width=\"265\" height=\"21\"><a href='news_detail.asp?id=<%=rs("id")%>' target='_blank'><strong><%=rs("title")%></strong></a> <font color=#666666>(<%=formatdatetime(rs("regdate"),2)%>)</font></td>");
      document.write("  </tr>");
      document.write("  <tr> ");
      document.write("    <td height=\"32\"><a href=\"#\"><%=repSquote(rs("content2"))%>....</a></td>");
      document.write("  </tr>");
      document.write("</table>");
	  document.write("<div align=\"center\"><img src=\"images/line.gif\" width=\"280\" height=\"3\"></div>")
<%
	rs.movenext
loop
set rs=nothing

function repSquote(srcstr)
	if srcstr="" then
		repSquote="" 
		exit function 
	end if
	dim targetstr
	targetstr=trim(srcstr)
	targetstr=replace(targetstr,vbcrlf,"")
	targetstr=replace(targetstr,chr(13),"")
	targetstr=replace(targetstr,"'","\'")
	targetstr=replace(targetstr,"""","\""")
	repSquote=targetstr
end function
%>
	  document.write("<div align=\"right\"><a href=\"news.asp\"><img src=\"images/more.gif\" width=\"60\" height=\"20\" border=\"0\"></a>&nbsp; &nbsp;</div>");