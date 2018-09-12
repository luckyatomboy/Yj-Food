<!--#include file="dbconn.asp"-->
<%
'response.write("billy test")
set conn=server.createobject("adodb.connection")
mypath=server.mappath(dbname)
conn.open "driver={microsoft access driver (*.mdb)};dbq="&mypath&";uid=;pwd=DBAdmin2015!;"

function connClose
Conn.close
Set conn = Nothing
End Function
function errmsg(message)
session("err")=message
response.redirect"../gbook/err.asp"
End Function
%>                                                                                                                                                                                                                                                                
