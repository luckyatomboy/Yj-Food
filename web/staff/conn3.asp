<!--#include file="dbconn.asp"-->
<%
set conn=server.createobject("adodb.connection")
mypath=server.mappath("../../"+dbname)
conn.open "driver={microsoft access driver (*.mdb)};dbq="&mypath&";uid=;pwd=DBAdmin2015!;"
function connClose
Conn.close
Set conn = Nothing
End Function
function errmsg(message)
session("err")=message
response.redirect"err.asp"
End Function
%>