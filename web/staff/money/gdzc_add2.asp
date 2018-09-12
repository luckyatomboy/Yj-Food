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
sbclass=Trim(Request.Form("sbclass"))
sb_id=Trim(Request.Form("sb_id"))
'response.write "Select * From [gdzcgl] Where sb_id='"&sb_id&"'"
Set se=Conn.Execute("Select * From [gdzcgl] Where sb_id='"&sb_id&"'")
If Not se.Eof Then
Response.Write "<script language=javascript>alert('设备编号已存在!');"
Response.Write "window.document.location.href='javascript:history.go(-1)';</script>"
response.end
end if

If Request.QueryString("action")="add" Then
Set rs = Server.CreateObject("ADODB.RecordSet")
Sql = "Select top 1 * From [gdzcgl]"
rs.Open Sql,Conn,1,3
rs.addnew
rs("class") = sbclass
rs("sb_id") = sb_id
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
Response.write "<script language='javascript'>alert('新增成功!');" & chr(13)
Response.write "window.document.location.href='gdzc_List.asp';</script>"
Else
Response.Redirect "Index.asp"
End if
%>