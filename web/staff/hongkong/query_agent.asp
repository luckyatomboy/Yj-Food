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
<title><%=dianming%> - 代理公司查询</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../style/style.css" rel="stylesheet" type="text/css">
<style>
body {
	background-color:#FFFFFF;
}
</style>
</HEAD>

<BODY>
<script>
function CheckAll(form)  {
  for (var i=0;i<form.elements.length;i++)    {
    var e = form.elements[i];
    if (e.name != 'chkall')       e.checked = form.chkall.checked; 
   }
  }
</script>
<%
if fla13="0" and session("redboy_id")<>"1" then
%>
<br><center><img src="../images/note.gif" align="absmiddle">&nbsp;<font color="#FF0000">你不具备此权限，请与管理员联系！</font></center>
<%  
  response.end
end if

'取得搜索关键字  
nowkeyword=request("keyword") 
%>
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
<form name="form1">
<!--  <input type="hidden" name="form" value="<%=request("form")%>">
  <input type="hidden" name="field" value="<%=request("field")%>">
  <input type="hidden" name="field2" value="<%=request("field2")%>">
  <input type="hidden" name="span1" value="<%=request("span1")%>"> -->
  <tr> 
<!--    <td width="50" height="21"></td> -->
	<td align="right">
	  搜索：
	  <input type="text" name="keyword" size="20" value="<%=nowkeyword%>">
	  <input type="submit" value=" 查询 " class="button">&nbsp;
	</td>
  </tr>
</form>  
</table>
<%
  if nowkeyword<>"" then
  	sql="select * from agent where company like '%"&nowkeyword&"%' order by company ASC"
	else
		sql="select * from agent order by company ASC"
  end if
%>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#C4D8ED">
<tr>
<td><img src="../images/r_1.gif" alt="" /></td>
<td width="100%" background="../images/r_0.gif">
  <table cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td>&nbsp;代理公司查询</td>
	  <td align="right">&nbsp;</td>
    </tr>
  </table>
</td>
<td><img src="../images/r_2.gif" alt="" /></td>
</tr>

<tr>
<td></td>
<td>
<!--startprint-->
<table align="center" cellpadding="4" cellspacing="1" class="toptable grid" border="1">
<form name="form2" action="produit_del.asp">
  <input type="hidden" name="form" value="<%=request("form")%>">
  <input type="hidden" name="keyword" value="<%=nowkeyword%>">
  <tr align="center">
	<td class="category" width="120" height="30">代理公司</td>
	<td class="category" width="200" height="30">公司全称</td>
	<td class="category" width="200" height="30">银行名称</td>
	<td class="category" width="200" height="30">银行账号</td>
	<td class="category" width="150" height="30">电话</td>
	<td class="category" width="150" height="30">传真</td>	
	<!--<td class="category" width="250" height="30">描述</td>-->
	<%if fla14="1" or session("redboy_id")="1" then%>
    <td class="category" width="60">修改</td>
	<%end if%>
  </tr>
  <%
  set rs_agent =server.createobject("ADODB.RecordSet")	
  rs_agent.open sql,conn,1,3
  if not rs_agent.eof then
  do while rs_agent.eof=false
  %>
  <tr align="center">
	<td align="center" height="30"><%=rs_agent("company")%></td>
	<td align="center" height="30"><%=rs_agent("fullname")%></td>
	<td align="center" height="30"><%=rs_agent("bankname")%></td>
	<td align="center" height="30"><%=rs_agent("bankaccount")%></td>
	<td align="center" height="30"><%=rs_agent("tel")%></td>
	<td align="center" height="30"><%=rs_agent("fax")%></td>	
  <!--<td align="center"><%=rs_agent("description")%></td>-->	  
	<%if fla14="1" or session("redboy_id")="1" then%>
    <td align="center">
    	<a href="change_agent.asp?form=<%=request("form")%>&company=<%=rs_agent("company")%>&desc=<%=rs_agent("description")%>&keyword=<%=nowkeyword%>"><img src="../images/res.gif" border="0" hspace="2" align="absmiddle">修改</a></td>
	<%end if%>
  </tr>
  <%
  	'end if
    rs_agent.movenext
  loop
  else
  %>
  <tr align="center" onMouseOver="this.className='highlight'" onMouseOut="this.className=''">
    <td colspan="12" height="25" align="center" style="color:red"><b>没有找到记录</b></td>
  </tr>
  <%
  end if
  %>
  <%
  if rs_agent.recordcount>0 then 
  %> 
</table></td></tr>
<%end if%> 
</form>   
</table>
<!--endprint-->
</td>
<td></td>
</tr>

</table>

</body>
</html>