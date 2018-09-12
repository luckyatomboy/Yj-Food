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
<title><%=dianming%> - 许可证查询</title>
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
nowcompany=request("company")
nowlicensetype=request("licensetype")
nowyear=request("year")
nowkeyword=request("keyword") 
%>
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
<form name="form2">
  <input type="hidden" name="form" value="<%=request("form")%>">
  <input type="hidden" name="field" value="<%=request("field")%>">
  <input type="hidden" name="field2" value="<%=request("field2")%>">
  <input type="hidden" name="span1" value="<%=request("span1")%>">
  <tr> 
<!--  <td width="700" height="21" align="right"><font size=4><b>查询许可证</b></font></td> -->
	<td align="right">
	  搜索：
	  <%
	  sql="select distinct company from license order by company"
	  set rs=conn.execute(sql)
	  %>
	  <select name="company" onChange="form2.submit()">
	  	<option value="">所有公司</option>
	  <%
	  	do while rs.eof=false
	  %>
	  		<option value="<%=rs("company")%>"<%if trim(cstr(rs("company")))=nowcompany then%> selected="selected"<%end if%>><%=rs("company")%></option>
	  <%
	  		rs.movenext
	  	loop
	  %>
		</select>
		
	  <select name="licensetype" onChange="form2.submit()">
	  		<option value="">所有类型</option>
	  		<option value="自动证"<%if nowlicensetype="自动证" then%> selected="selected"<%end if%>>自动证</option>
	  		<option value="动检证"<%if nowlicensetype="动检证" then%> selected="selected"<%end if%>>动检证</option>
		</select>
		
	  <%
	  sql="select distinct year from license order by year"
	  set rs=conn.execute(sql)
	  %>
	  <select name="year" onChange="form2.submit()">
	  	<option value="">所有年份</option>
	  <%
	  	do while rs.eof=false
	  %>
	  		<option value="<%=rs("year")%>"<%if trim(cstr(rs("year")))=nowyear then%> selected="selected"<%end if%>><%=rs("year")%></option>
	  <%
	  		rs.movenext
	  	loop
	  %>
		</select>
	  <input type="text" name="keyword" size="20" value="<%=nowkeyword%>">
	  <input type="submit" value=" 查询 " class="button">&nbsp;
	</td>
  </tr>
</form>  
</table>
<%
  sql="select * from license where 1=1"
  if nowcompany<>"" then
	sql=sql&" and company='"&nowcompany&"'"
  end if  
  if nowlicensetype<>"" then
	sql=sql&" and licensetype='"&nowlicensetype&"'"
  end if
  if nowyear<>"" then
	sql=sql&" and year='"&nowyear&"'"
  end if  
  
  if request("order1")<>"" then
    sql=sql&" order by company "&request("order1")
  elseif request("order2")<>"" then
    sql=sql&" order by licensetype "&request("order2")
  elseif request("order3")<>"" then
    sql=sql&" order by license "&request("order3") 
  elseif request("order4")<>"" then
    sql=sql&" order by year "&request("order4") 
  elseif request("order5")<>"" then
    sql=sql&" order by quantity "&request("order5") 
  elseif request("order6")<>"" then
    sql=sql&" order by remain "&request("order6")
  elseif request("order7")<>"" then
    sql=sql&" order by country "&request("order7")
  elseif request("order8")<>"" then
    sql=sql&" order by material "&request("order8")
  elseif request("order9")<>"" then
    sql=sql&" order by validfrom "&request("order9")
  elseif request("order10")<>"" then
    sql=sql&" order by validto "&request("order10")
  end if
  
%>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#C4D8ED">
<tr>
<td><img src="../images/r_1.gif" alt="" /></td>
<td width="100%" background="../images/r_0.gif">
  <table cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td>&nbsp;自动证/动检证查询</td>
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
<form name="form1" action="produit_del.asp">
	<input type="hidden" name="queryform" value="<%=request("queryform")%>">
  <input type="hidden" name="form" value="<%=request("form")%>">
  <input type="hidden" name="field" value="<%=request("field")%>">
  <input type="hidden" name="field2" value="<%=request("field2")%>">
  <input type="hidden" name="company" value="<%=nowcompany%>">
  <input type="hidden" name="licensetype" value="<%=nowlicensetype%>">
  <input type="hidden" name="license" value="<%=nowlicense%>">
  <input type="hidden" name="keyword" value="<%=nowkeyword%>">
  <input type="hidden" name="order1" value="<%=request("order1")%>">
  <input type="hidden" name="order2" value="<%=request("order2")%>">
  <input type="hidden" name="order3" value="<%=request("order3")%>">
  <input type="hidden" name="order4" value="<%=request("order4")%>">
  <input type="hidden" name="order5" value="<%=request("order5")%>">
  <input type="hidden" name="order6" value="<%=request("order6")%>">
  <tr align="center">
	<td class="category" width="100" height="30">
		<a href="?order1=<%if request("order1")="asc" then%>desc<%else%>asc<%end if%>&form=<%=request("form")%>&company=<%=nowcompany%>&licensetype=<%=nowlicensetype%>&license=<%=nowlicense%>" class="title">公司名称<%if request("order1")="asc" then%><img src="../images/up2.gif" border="0" hspace="2" align="absmiddle"><%else%><img src="../images/down2.gif" border="0" hspace="2" align="absmiddle"><%end if%></a>	
	</td>
	<td class="category" width="80" height="30">
		<a href="?order2=<%if request("order2")="asc" then%>desc<%else%>asc<%end if%>&form=<%=request("form")%>&company=<%=nowcompany%>&licensetype=<%=nowlicensetype%>&license=<%=nowlicense%>" class="title">类型<%if request("order2")="asc" then%><img src="../images/up2.gif" border="0" hspace="2" align="absmiddle"><%else%><img src="../images/down2.gif" border="0" hspace="2" align="absmiddle"><%end if%></a>	
	</td>
	<td class="category" width="160" height="30">
	  <a href="?order3=<%if request("order3")="asc" then%>desc<%else%>asc<%end if%>&form=<%=request("form")%>&company=<%=nowcompany%>&licensetype=<%=nowlicensetype%>&license=<%=nowlicense%>" class="title">许可证号<%if request("order3")="asc" then%><img src="../images/up2.gif" border="0" hspace="2" align="absmiddle"><%else%><img src="../images/down2.gif" border="0" hspace="2" align="absmiddle"><%end if%></a>	
	</td>
	<td class="category" width="80" height="30">
		<a href="?order4=<%if request("order4")="asc" then%>desc<%else%>asc<%end if%>&form=<%=request("form")%>&company=<%=nowcompany%>&licensetype=<%=nowlicensetype%>&license=<%=nowlicense%>" class="title">年份<%if request("order4")="asc" then%><img src="../images/up2.gif" border="0" hspace="2" align="absmiddle"><%else%><img src="../images/down2.gif" border="0" hspace="2" align="absmiddle"><%end if%></a>	
	</td>
	<td class="category" width="100" height="30">
		<a href="?order7=<%if request("order7")="asc" then%>desc<%else%>asc<%end if%>&form=<%=request("form")%>&company=<%=nowcompany%>&licensetype=<%=nowlicensetype%>&license=<%=nowlicense%>" class="title">国别<%if request("order7")="asc" then%><img src="../images/up2.gif" border="0" hspace="2" align="absmiddle"><%else%><img src="../images/down2.gif" border="0" hspace="2" align="absmiddle"><%end if%></a>	
	</td>
	<td class="category" width="160" height="30">
		<a href="?order8=<%if request("order8")="asc" then%>desc<%else%>asc<%end if%>&form=<%=request("form")%>&company=<%=nowcompany%>&licensetype=<%=nowlicensetype%>&license=<%=nowlicense%>" class="title">品名<%if request("order8")="asc" then%><img src="../images/up2.gif" border="0" hspace="2" align="absmiddle"><%else%><img src="../images/down2.gif" border="0" hspace="2" align="absmiddle"><%end if%></a>	
	</td>
	<td class="category" width="150" height="30">
		<a href="?order5=<%if request("order5")="asc" then%>desc<%else%>asc<%end if%>&form=<%=request("form")%>&company=<%=nowcompany%>&licensetype=<%=nowlicensetype%>&license=<%=nowlicense%>" class="title">数量<%if request("order5")="asc" then%><img src="../images/up2.gif" border="0" hspace="2" align="absmiddle"><%else%><img src="../images/down2.gif" border="0" hspace="2" align="absmiddle"><%end if%></a>	
	</td>
	<td class="category" width="150" height="30">
		<a href="?order6=<%if request("order6")="asc" then%>desc<%else%>asc<%end if%>&form=<%=request("form")%>&company=<%=nowcompany%>&licensetype=<%=nowlicensetype%>&license=<%=nowlicense%>" class="title">剩余<%if request("order6")="asc" then%><img src="../images/up2.gif" border="0" hspace="2" align="absmiddle"><%else%><img src="../images/down2.gif" border="0" hspace="2" align="absmiddle"><%end if%></a>	
  </td>
	<td class="category" width="100" height="30">
		<a href="?order9=<%if request("order9")="asc" then%>desc<%else%>asc<%end if%>&form=<%=request("form")%>&company=<%=nowcompany%>&licensetype=<%=nowlicensetype%>&license=<%=nowlicense%>" class="title">起始日<%if request("order9")="asc" then%><img src="../images/up2.gif" border="0" hspace="2" align="absmiddle"><%else%><img src="../images/down2.gif" border="0" hspace="2" align="absmiddle"><%end if%></a>	
  </td>
	<td class="category" width="100" height="30">
		<a href="?order10=<%if request("order10")="asc" then%>desc<%else%>asc<%end if%>&form=<%=request("form")%>&company=<%=nowcompany%>&licensetype=<%=nowlicensetype%>&license=<%=nowlicense%>" class="title">终止日<%if request("order10")="asc" then%><img src="../images/up2.gif" border="0" hspace="2" align="absmiddle"><%else%><img src="../images/down2.gif" border="0" hspace="2" align="absmiddle"><%end if%></a>	
  </td>
	<%if fla14="1" or session("redboy_id")="1" then%>
    <td class="category">修改</td>
	<%end if%>
  </tr>
  <%
  set rs_license =server.createobject("ADODB.RecordSet")	
  rs_license.open sql,conn,1,3
  if not rs_license.eof then
  do while rs_license.eof=false
  %>
  <tr onMouseOver="this.className='highlight'" onMouseOut="this.className=''" onDblClick="window.opener.document.<%=request("queryform")%>.<%=request("field")%>.value='<%=rs_license("license")%>';<%if request("field2")<>"" then%>window.opener.document.<%=request("queryform")%>.<%=request("field2")%>.value='<%=rs_license("company")%>';<%end if%>window.close();">
	<td align="center" height="30"><%=rs_license("company")%></td>
  <td align="center"><%=rs_license("licensetype")%></td>	  
  <td align="center"><%=rs_license("license")%></td>
  <td align="center"><%=rs_license("year")%></td>
  <td align="center"><%=rs_license("country")%></td>
  <td align="center"><%=rs_license("material")%></td>
  <td align="center"><%=rs_license("quantity")%></td>
  <td align="center"><%=rs_license("remain")%></td>
  <td align="center"><%=rs_license("validfrom")%></td>
  <td align="center"><%=rs_license("validto")%></td>
	<%if fla14="1" or session("redboy_id")="1" then%>
    <td align="center">
    	<a href="change_license.asp?form=<%=request("form")%>&company=<%=rs_license("company")%>&licensetype=<%=rs_license("licensetype")%>&license=<%=rs_license("license")%>&keyword=<%=nowkeyword%>"><img src="../images/res.gif" border="0" hspace="2" align="absmiddle">修改</a></td>
	<%end if%>
  </tr>
  </tr>
  <%
  	'end if
    rs_license.movenext
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
  if rs_license.recordcount>0 then 
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