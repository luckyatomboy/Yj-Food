<!--#include file="Conn.asp"-->
<!--#include file="Check.asp"-->
<!--#include file="Inc/Function.asp"-->
<!--#include file ="Inc/Date.asp"-->
<!-- #include file="../const.asp" --> 
<%
if fla87="0" and session("redboy_id")<>"1" then
%>
<br><center><img src="../images/note.gif" align="absmiddle">&nbsp;<font color="#FF0000">你不具备此权限，请与管理员联系！</font></center>
<%  
  response.end
end if
%>
<%
Dim rs,news,sqltext
Dim id,lid,per,ptype,money,pj,menu,tm,io
Dim selname,seltype,listid,pjname,adddate
Set rs=Server.Createobject("Adodb.RecordSet")
sqltext = "Select score,XJCODE,max(xjname) as xjname1,max(qc*fh) as aqc From [V_CWPZRP]"
selname = Request.Form("selname")
seltype = Request.Form("seltype")
adddate = Request.Form("adddate")
adddate2 = Request.Form("adddate2")
listid = Trim(Request.Form("listid"))
if adddate="" then
adddate=date()
end if

if adddate2="" then
adddate2=date()
end if
If Request.QueryString("action") = "search" Then
selname = Request.Form("selname")
seltype = Request.Form("seltype")
adddate = Request.Form("adddate")
adddate2 = Request.Form("adddate2")
listid = Trim(Request.Form("listid"))
if adddate="" then
adddate=date()
end if

if adddate2="" then
adddate2=date()
end if

   If adddate="" and adddate2="" and selname="" and seltype="" and listid="" Then
   sqltext = sqltext & " Where zt='已审' group by XJCODE,score order by score,XJCODE"
   Else
      sqltext = sqltext & " Where zt='已审' and "
      If selname<>"" Then 
	     sqltext = sqltext & "score='"&selname&"' and "
	  End if
          If seltype<>"" Then 
		     If selname<>"" Then sqltext = sqltext & "and "
		     sqltext = sqltext & "lb='"&seltype&"' "
		  End if

			 If adddate<>"" and adddate2<>"" Then
			    If seltype<>"" Then sqltext = sqltext & "and "
			    sqltext = sqltext & "CZRQ>=#"&adddate&"# and CZRQ<=#"&adddate2&"#"
			  End if

			 If adddate<>"" and adddate2="" Then
			    If seltype<>"" Then sqltext = sqltext & "and "
			    sqltext = sqltext & "CZRQ=#"&adddate&"# "
			  End if


				If listid<>"" Then
				   If adddate<>"" Then sqltext = sqltext & "and "
				   sqltext = sqltext & "XJNAME='"&listid&"' "
				End if
sqltext = sqltext & "  group by XJCODE,score order by score,XJCODE"
   End if

Else
	sqltext = sqltext & " Where zt='已审'  group by XJCODE,score order by score,XJCODE"
End if
'response.write sqltext
rs.Open sqltext,Conn,1,3

MaxPerPage=2000
text="0123456789"
rs.PageSize=MaxPerPage
for i=1 to Len(Request.QueryString("page"))
checkpage = Instr(1,text,mid(Request.QueryString("page"),i,1))
if checkpage=0 then
exit for
end if
next

If checkpage<>0 then
If NOT IsEmpty(Request.QueryString("page")) Then
CurrentPage=Cint(Request.QueryString("page"))
If CurrentPage < 1 Then CurrentPage = 1
If CurrentPage > rs.PageCount Then CurrentPage = rs.PageCount
Else
CurrentPage= 1
End If
If not rs.eof Then rs.AbsolutePage = CurrentPage end if
Else
CurrentPage=1
End if
%>
<html>
<head>
<title>管理中心</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../style/style.css" rel="stylesheet" type="text/css">
<style>
body {
	background-color:#FFFFFF;
}
</style>

<script language="JavaScript" src="Image/js.js"></SCRIPT>
</head>
<body text="#000000">
<script language="JavaScript" type="text/JavaScript">
function delpay()
{
   if(confirm("确定要删除此吗？"))
     return true;
   else
     return false;	 
}
</script>
<form name="form1" method="post" action="?action=search">
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#C4D8ED">
<tr>
<td><img src="../images/r_1.gif" alt="" /></td>
<td width="100%" background="../images/r_0.gif">
  <table cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td>&nbsp;财务管理</td>
	  <td align="right">&nbsp;</td>
    </tr>
  </table>
  <table width="98%" class="toptable grid" border="1" cellpadding="0" cellspacing="0" align="center" >
    <tr height="22" valign="middle" align="center"> 
      <th width="9%">标志</th>
      <th width="18%">类别</th>
      <th width="23%">开始日期</th>
      <th width="23%">结束日期</th>
      <th width="16%">科目</th>
      <th width="9%">&nbsp;</th>
    </tr>
    <tr height="22" valign="middle" align="center"> 
      <td><select name="selname" id="selname">
	   <option value="">全部</option>
<%
Dim pa,pt
Set pa=Conn.Execute("Select score From [XJLB] group by score")
Do While Not pa.Eof
Response.write "<option value='" & pa(0) & "'>" & pa(0) & "</option>"
pa.MoveNext
Loop
pa.Close
Set pa=Nothing
%>
        </select></td>
      <td><select name="seltype" id="seltype">
	     <option value="">全部</option>
<%
Set pt=Conn.Execute("Select lb From [XJLB] group by lb")
Do While Not pt.Eof
Response.write "<option value='" & pt(0) & "'>" & pt(0) & "</option>"
pt.MoveNext
Loop
pt.Close
Set pt=Nothing
%>
        </select></td>
      <td><input name="adddate" type="text" id="adddate" size="12" maxlength="12" value=<%=adddate%> readonly> 
        <input name="button" type="button" onclick="popUpCalendar(this, form1.adddate, 'yyyy-mm-dd')" value="选择"></td>
      <td><input name="adddate2" type="text" id="adddate2" size="12" maxlength="12" value=<%=adddate2%> readonly> 
        <input name="button" type="button" onclick="popUpCalendar(this, form1.adddate2, 'yyyy-mm-dd')" value="选择"></td>

      <td><input name="listid" type="text" id="listid" size="20" maxlength="30"></td>

      <td><input type="submit" name="Submit" value="提交">
        <input type="reset" name="Submit2" value="重置"></td>
    </tr>
  </table>
</form>
<table width="98%" class="toptable grid" border="1" cellpadding="2" cellspacing="0" align="center" > 
<tr height="22" valign="middle" align="center"> 
    <th colspan="10">财务凭证统计(已审)</th>
  </tr>
  <tr> 
<td width="15%" class="category"> <div align="center">标志</div></td>
<td width="15%" class="category"> <div align="center">科目代码</div></td>
    <td width="15%" class="category"> <div align="center">科目名称</div></td>
    <td width="15%" class="category"> <div align="center">其初金额</div></td>
    <td width="15%" class="category"> <div align="center">其间借方</div></td>
    <td width="15%" class="category"><div align="center">其间贷方</div></td>
    <td width="15%" class="category"><div align="center">其末金额</div></td>    
  </tr>
<%
i=0
If rs.Eof Then
Response.Write "<tr><td colspan='8'>没有该记录!</td></tr>"
Else
jhj=0
dhj=0
qc=0
qr=0
qc=0
qm=0
Do While Not rs.Eof
%>  
   <tr>

<td><div align="center"><%=rs(0)%></div></td>
    <td><div align="center"><%=rs(1)%></a></div></td>
    <td><div align="center"><%=rs(2)%></a></div></td>
<%
   Set pro = Conn.Execute("Select sum(xjmoney*fh) as xmoney From [V_CWPZRP] Where XJCODE='"&rs(1)&"' and CZRQ<=#"&adddate&"# and zt='已审'")
'response.write "Select sum(xjmoney*fh) as money From [V_CWPZRP] Where XJCODE='"&rs(1)&"' and CZRQ<=#"&adddate&"#"
if not pro.eof then
   qc = pro(0)
end if   
'response.write rs(3)
if qc="" or isnull(qc) then
qc=0
end if
qc=qc+cdbl(rs(3))
   pro.Close
%>
    <td><div align="center"><%=qc%></a></div></td>
<%
   Set pro = Conn.Execute("Select sum(xjmoney) as xmoney From [V_CWPZRP] Where XJCODE='"&rs(1)&"' and CZRQ>#"&adddate&"# and CZRQ<=#"&adddate2&"# and score='借' and zt='已审'")
if not pro.eof then
   qr = pro(0)
end if   
   pro.Close
if qr="" or isnull(qr) then
qr=0
end if
%>
    <td><div align="center"><%=qr%></a></div></td>
<%
   Set pro = Conn.Execute("Select sum(xjmoney) as xmoney From [V_CWPZRP] Where XJCODE='"&rs(1)&"' and CZRQ>#"&adddate&"# and CZRQ<=#"&adddate2&"# and score='贷' and zt='已审'")
if not pro.eof then
   qc = pro(0)
end if   
   pro.Close
if qc="" or isnull(qc) then
qc=0
end if
%>
    <td><div align="center"><%=qc%></a></div></td>
<%
   Set pro = Conn.Execute("Select sum(xjmoney*fh) as xmoney From [V_CWPZRP] Where XJCODE='"&rs(1)&"' and CZRQ<=#"&adddate2&"# and zt='已审'")
'response.write "Select sum(xjmoney*fh) as money From [V_CWPZRP] Where XJCODE='"&rs(1)&"' and CZRQ<=#"&adddate&"#"
if not pro.eof then
   qm = pro(0)
end if   
   pro.Close
if qm="" or isnull(qm) then
qm=0
end if
qm=qm+cdbl(rs(3))
%>
    <td><div align="center"><%=qm%></a></div></td>
  </tr>
<%
i=i+1 
if i >= MaxPerpage then exit do 
rs.MoveNext
Loop
End if

showpage()
Response.Write "</html>"
If Request.QueryString("action") = "del" Then
Dim dd,delid
delid=Request("id")
Set dd = Conn.Execute("Delete * From [PayList] Where ID ="&delid)
Response.Redirect "Pay_List3.asp"
End if
rs.Close
Conn.Close
Set rs = Nothing
Set Conn = Nothing
%>

