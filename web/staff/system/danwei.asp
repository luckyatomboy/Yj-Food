<%
if session("redboy_username")="" then
%>
<script language="javascript">
top.location.href="../index.asp"
</script>
<%  
  response.end
end if
%>
<!-- #include file="../conn2.asp" -->
<!-- #include file="../const.asp" -->

<html>
<head>
<title><%=dianming%> - 计量单位管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../style/style.css" rel="stylesheet" type="text/css">
<style>
body {
	background-color:#FFFFFF;
}
</style>
<script>
function CheckAll(form)  {
  for (var i=0;i<form.elements.length;i++)    {
    var e = form.elements[i];
    if (e.name != 'chkall')       e.checked = form.chkall.checked; 
   }
  }
</script>
</HEAD>

<BODY>
<%
if fla56="0" and session("redboy_id")<>"1" then
%>
<br><center><img src="../images/note.gif" align="absmiddle">&nbsp;<font color="#FF0000">你不具备此权限，请与管理员联系！</font></center>
<%  
  response.end
end if
%>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#C4D8ED">
<tr>
<td><img src="../images/r_1.gif" alt="" /></td>
<td width="100%" background="../images/r_0.gif">
  <table cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td>&nbsp;修改 / 删除计量单位</td>
	  <td align="right"><%if fla55="1" or session("redboy_id")="1" then%><input type="button" value="添加计量单位" onClick="window.location.href='danwei_add.asp'" class="button"><%end if%>&nbsp;</td>
    </tr>
  </table>
</td>
<td><img src="../images/r_2.gif" alt="" /></td>
</tr>
<tr>
<td></td>
<td>
<form name="form1" action="danwei_del.asp">
<table align="center" cellpadding="4" cellspacing="1" class="toptable grid" border="1">
  <tr align="center">
    <td height="30" class="category">计量单位名称</td>
	<%if fla57="1" or session("redboy_id")="1" then%>
    <td width="8%" class="category">修改</th>
	<%end if%>
	<%if fla58="1" or session("redboy_id")="1" then%>
    <td width="5%" class="category">删除</th>
	<%end if%>
  </tr>
  <%
  sql="select * from danwei order by id"
  set rs_danwei=conn.execute(sql)
  do while rs_danwei.eof=false
  %>
  <tr onMouseOver="this.className='highlight'" onMouseOut="this.className=''">
    <td align="center" height="25"><%=rs_danwei("danwei")%></td>
    <%if fla57="1" or session("redboy_id")="1" then%>
	<td align="center"><a href="danwei_modi.asp?id=<%=rs_danwei("id")%>"><img src="../images/res.gif" border="0" hspace="2" align="absmiddle">修改</a></td>
	<%end if%>
	<%if fla58="1" or session("redboy_id")="1" then%>
    <td align="center"><input type="checkbox" name="ID" value="<%=rs_danwei("id")%>" style="border:0"></td>
	<%end if%>
  </tr>
  <%
    rs_danwei.movenext
  loop
  %>
  <tr>
    <td colspan="7" height="30" class="category">
	<table cellpadding=0 cellspacing=0 width="100%">
	<tr>
	<td align="left" style="color:#FF0000;">&nbsp;</td>  
	<td align="right">
	<%if fla58="1" or session("redboy_id")="1" then%>
    <input name="chkall" type="checkbox" id="chkall" value="select" onClick="CheckAll(this.form)" style="border:0"> 全选
	<input type="submit" value="删 除" class="button" onClick="return confirm('此操作无法恢复！！！请慎重！！！\n\n确定要删除此计量单位吗？')">
	<%end if%>
  </td>
  </tr></table></td></tr>  
</table>
</form>
</td>
<td></td>
</tr>
<tr>
<td><img src="../images/r_4.gif" alt="" /></td>
<td></td>
<td><img src="../images/r_3.gif" alt="" /></td>
</tr>
</table>
</body>
</html>