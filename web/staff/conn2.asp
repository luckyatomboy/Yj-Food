<!--#include file="dbconn.asp"-->
<%
set rs=server.createobject("adodb.recordset")
set conn=server.createobject("adodb.connection")
mypath=server.mappath("../"+dbname)
conn.open "driver={microsoft access driver (*.mdb)};dbq="&mypath&";uid=;pwd=DBAdmin2015!;"
''论坛用函数
function connClose
Conn.close
Set conn = Nothing
End Function
function errmsg(message)
session("err")=message
response.redirect"../gbook/err.asp"
End Function
''通迅录用连接
function dbconn(sessionname)
	dim conn
	Set conn=Server.CreateObject("ADODB.Connection")
	conn.Open "Driver={Microsoft Access Driver (*.mdb)}; DBQ=" & Server.MapPath("../"+dbname)&";uid=;pwd=DBAdmin2015!;"
	set session(sessionname)=conn
	set dbconn=session(sessionname)
end function
%>
<!--
''文件共享用
connstr = "Provider=Microsoft.Jet.Oledb.4.0;data source="&Server.MapPath("../"+dbname)
set myconn = Server.CreateObject("adodb.connection")
myconn.open connstr
''邮件用
set conn1=server.createobject("adodb.connection")
mypath=server.mappath("../"+dbname)
conn1.open "driver={microsoft access driver (*.mdb)};dbq="&mypath&";uid=;pwd=123;"
''备份用
DataName = "../"+dbname
SelectDataType = "Access"
-->