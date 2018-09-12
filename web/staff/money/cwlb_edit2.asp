<!--#include file="Conn.asp"-->
<!--#include file="Check.asp"-->
<%
Dim listid
Dim sListID,sPayer,sPayType,sMoney,sProject,sMenu,sTime,sInOut
Dim rs,Sql
XID = Trim(Request.Form("XID"))
LB = Trim(Request.Form("LB"))
XJCODE = Trim(Request.Form("XJCODE"))
XJNAME = Trim(Request.Form("XJNAME"))
XJYH = Trim(Request.Form("XJYH"))
YHZH = Trim(Request.Form("YHZH"))
YHLXR = Trim(Request.Form("YHLXR"))
XGDH = Trim(Request.Form("XGDH"))
SCORE = Trim(Request.Form("SCORE"))
remark = Trim(Request.Form("remark"))
qc = Trim(Request.Form("qc"))
Set se=Conn.Execute("Select * From [XJLB] Where XJCODE='"&XJCODE&"' and id<>"&XID&"")
If Not se.Eof Then
Response.Write "<script language=javascript>alert('财务科目已存在!');"
Response.Write "window.document.location.href='javascript:history.go(-1)';</script>"
response.end
end if


If Request.QueryString("action")="add" Then
Set rs = Server.CreateObject("ADODB.RecordSet")
Sql = "Select top 1 * From [XJLB] where id="&XID&""
rs.Open Sql,Conn,1,3
rs("XJCODE") = XJCODE
rs("XJNAME") = XJNAME
rs("XJYH") = XJYH
rs("YHZH") = YHZH
rs("YHLXR") = YHLXR
rs("XGDH") = XGDH
rs("SCORE") = SCORE
rs("LB") = LB
rs("qc") = qc
rs("Remark") = Remark
rs.Update
rs.Close
Set rs=Nothing
Conn.Close
Set Conn=Nothing
Response.write "<script language='javascript'>alert('修改成功!');" & chr(13)
Response.write "window.document.location.href='cwlb.asp';</script>"
Else
Response.Redirect "Index.asp"
End if
%>