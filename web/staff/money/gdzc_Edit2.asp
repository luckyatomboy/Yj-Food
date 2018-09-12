<!--#include file="Conn.asp"-->
<!--#include file="Check.asp"-->
<%
Dim listid
Dim sListID,sPayer,sPayType,sMoney,sProject,sMenu,sTime,sInOut
Dim rs,Sql
listid = Request("id")
caigoudate = Trim(Request.Form("caigoudate"))
sbname = Trim(Request.Form("name"))
department = Trim(Request.Form("department"))
quantity = Trim(Request.Form("quantity"))
money = Trim(Request.Form("money"))
zejiu = Trim(Request.Form("zejiu"))
score = Trim(Request.Form("score"))
remark = Trim(Request.Form("remark"))



If Request.QueryString("action")="add" Then
Set rs = Server.CreateObject("ADODB.RecordSet")
Sql = "Select * From [gdzcgl] Where ID=" & listid
rs.Open Sql,Conn,1,3
''rs("class") = class
''rs("fapiao_id") = fapiao_id
rs("caigoudate") = caigoudate
rs("name") = sbname 
rs("department") = department
rs("quantity") = quantity
rs("money") = money
rs("zejiu") = zejiu
rs("score") = score
rs("Remark") = Remark
rs.Update
rs.Close
Set rs=Nothing
Conn.Close
Set Conn=Nothing
Response.write "<script language='javascript'>alert('ÐÞ¸Ä³É¹¦!');" & chr(13)
Response.write "window.document.location.href='gdzc_List.asp';</script>"
Else
Response.Redirect "Index.asp"
End if
%>