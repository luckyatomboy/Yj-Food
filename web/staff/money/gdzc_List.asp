<!--#include file="Conn.asp"-->
<!--#include file="Check.asp"-->
<!--#include file="Inc/Function.asp"-->
<!--#include file ="Inc/Date.asp"-->
<!-- #include file="../const.asp" --> 
<%
if fla88="0" and session("redboy_id")<>"1" then
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
sqltext = "Select * From [gdzcgl] "
If Request.QueryString("action") = "search" Then
selname = Request.Form("selname")
seltype = Request.Form("seltype")
adddate = Request.Form("adddate")
ordernum = Request.Form("ordernum")
listid = Trim(Request.Form("listid"))
pjname = Trim(Request.Form("pjname"))
   If selname=""  and adddate="" and listid=""  Then
   sqltext = sqltext & " Order By ID Desc"
   Else
      sqltext = sqltext & " Where "
      If selname<>"" Then 
	     sqltext = sqltext & "class='"&selname&"' "
	  End if
			 If adddate<>"" Then
			    If seltype<>"" Then sqltext = sqltext & "and "
			    sqltext = sqltext & "caigoudate=#"&adddate&"# "
			  End if
				If listid<>"" Then
				   If adddate<>"" Then sqltext = sqltext & "and "
				   sqltext = sqltext & "sb_id='"&listid&"' "
				End if
   End if
Else

sqltext = sqltext & " Order By ID Desc"
End if
'response.write sqltext
rs.Open sqltext,Conn,1,3

MaxPerPage=200
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
  <table width="98%" class="toptable grid" border="1" cellpadding="0" cellspacing="0" align="center" class=TableBorder>
    <tr height="22" valign="middle" align="center"> 
     <th width="9%"  colspan="6" ><b><font color=FF0000>固定资产管理</b></th>
    <tr height="22" valign="middle" align="center"> 
      <th width="9%">类别</th>
      <th width="23%">采购日期</th>
      <th width="16%">设备编号</th>
      <th width="9%">&nbsp;</th>
    </tr>
    <tr height="22" valign="middle" align="center"> 
      <td><select name="selname" id="selname">
	   <option value="">全部</option>
<%
Dim pa,pt
Set pa=Conn.Execute("Select class From [gdzcgl] group by class")
Do While Not pa.Eof
Response.write "<option value='" & pa(0) & "'>" & pa(0) & "</option>"
pa.MoveNext
Loop
pa.Close
Set pa=Nothing
%>
        </select></td>

      <td><input name="adddate" type="text" id="adddate" size="12" maxlength="12" readonly> 
        <input name="button" type="button" onclick="popUpCalendar(this, form1.adddate, 'yyyy-mm-dd')" value="请选择日期"></td>
      <td><input name="listid" type="text" id="listid" size="20" maxlength="20"></td>
      <td><input type="submit" name="Submit" value="提交">
        <input type="reset" name="Submit2" value="重置"></td>
    </tr>
  </table>
</form>
<p align="center">
<a href="gdzc_add.asp"  class="category"><font color=FF0000><B>( 新增固定资产 )</B></a>
<table width="98%" class="toptable grid" border="1" cellpadding="2" cellspacing="0" align="center" class=TableBorder> 
<tr height="22" valign="middle" align="center"> 
    <th colspan="10">所有固定资产清单</th>
  </tr>
  <tr> 
    <td width="8%" height="25" class="category"><div align="center">类别</div></td>
    <td width="8%" class="category"> <div align="center">设备号</div></td>
    <td width="10%" class="category"> <div align="center">名称</div></td>
    <td width="10%" class="category"> <div align="center">使用部门</div></td>
    <td width="8%" class="category"> <div align="center">数量</div></td>
    <td width="10%" class="category"> <div align="center">价值</div></td>
    <td width="10%" class="category"><div align="center">折旧</div></td>
    <td width="10%" class="category"> <div align="center">采购日期</div></td>
    <td width="6%" class="category"> <div align="center">状态</div></td>
    <td width="10%" class="category"> <div align="center"></div></td>
  </tr>
<%
i=0
If rs.Eof Then
Response.Write "<tr><td colspan='8'>没有该记录!</td></tr>"
Else
Do While Not rs.Eof
id = rs("id")
%>  
   <tr>
    <td height="25"><div align="center"><%=rs("class")%></div></td>
    <td><div align="center"><a href="gdzc_view.asp?id=<%=id%>"><%=rs("sb_id")%></a></div></td>
    <td><div align="center"><%=rs("name")%></div></td>
    <td><div align="center"><%=rs("department")%></div></td>
    <td><div align="center"><%=rs("department")%></div></td>
    <td><div align="center"><%=rs("money")%></div></td>
    <td><div align="center"><%=rs("zejiu")%>%</div></td>
    <td><div align="center"><%=rs("caigoudate")%></div></td>
    <td><div align="center"><%=rs("score")%></div></td>
    <td><div align="center"><a href="gdzc_Edit.asp?id=<%=id%>">修改</a> | <a href="?action=del&id=<%=id%>" onClick="return delpay();">删除</a></div></td>
  </tr>
<%
i=i+1 
if i >= MaxPerpage then exit do 
rs.MoveNext
Loop
End if
Response.Write "</table>"
showpage()
Response.Write "</html>"
If Request.QueryString("action") = "del" Then
Dim dd,delid

delid=Request("id")
Set dd = Conn.Execute("Delete * From [gdzcgl] Where ID ="&id)
Response.Redirect "gdzc_List.asp"
End if
rs.Close
Conn.Close
Set rs = Nothing
Set Conn = Nothing
%>

