<%@language="VBscript"%>
<%Response.Expires=0%>
<!--#include file="../include/checkadmin.asp"-->
<!--#include file="../include/conn.asp"-->
<%
action=request.form("action")

columnid=request.form("columnid")
columnname=request.form("columnname")

if action="addnew" then
	conn.execute "insert into tbl_news_column(columnname,columnparentid) values('"&columnname&"',"&columnid&")"
elseif action="edit" then
	conn.execute "update tbl_news_column set columnname='"&columnname&"' where columnid="&columnid
elseif action="delete" then
	conn.execute "delete from tbl_news_column where columnid="&columnid
	conn.execute "delete from tbl_news where columnid="&columnid
end if

response.redirect "add_news_catalog.asp"
%>