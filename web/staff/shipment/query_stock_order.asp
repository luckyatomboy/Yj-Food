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
<title><%=dianming%> - 查询</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../style/style.css" rel="stylesheet" type="text/css">
<style>
body {
	background-color:#FFFFFF;
}
</style>
</HEAD>

<BODY>
<%
if fla30="0" then
%>
<br><center><img src="../images/note.gif" align="absmiddle">&nbsp;<font color="#FF0000">你不具备此权限，请与管理员联系！</font></center>
<%  
  response.end
end if
%>
<%
'取得搜索关键字  
nowkeyword=request("keyword") 
nowfrom=request("datefrom")
nowto=request("dateto")
%>
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
<form name="form2">
  <input type="hidden" name="form" value="<%=request("form")%>">
  <input type="hidden" name="field" value="<%=request("field")%>">
  <input type="hidden" name="field2" value="<%=request("field2")%>">
  <input type="hidden" name="span1" value="<%=request("span1")%>">
  <tr> 
	<td align="right">
	  搜索：
		<input type="text" name="keyword" size="20" value="<%=nowkeyword%>">
	</td>
  </tr>
  <tr> 
	<td align="right">
	  入库日期：从
	  <input name="datefrom" style="width:80px" onClick="JavaScript:window.open('../day.asp?form=form2&field=datefrom&oldDate='+datefrom.value,'','directorys=no,toolbar=no,status=no,menubar=no,scrollbars=no,resizable=no,width=250,height=170,top=150,left=590');">
	  &nbsp;&nbsp;&nbsp;&nbsp;到
	  <input name="dateto" style="width:80px" onClick="JavaScript:window.open('../day.asp?form=form2&field=dateto&oldDate='+dateto.value,'','directorys=no,toolbar=no,status=no,menubar=no,scrollbars=no,resizable=no,width=250,height=170,top=150,left=590');">
	  <input type="submit" value=" 查询 " class="button">&nbsp;
	</td>
  </tr>  
</form>  
</table>
<%
  sql="select * from stockdocument where stockcategory='A'" <!--只取入库单
  if nowkeyword<>"" then
  	sql=sql&" and stocknumber='"&nowkeyword&"'"
  end if  

  if nowfrom<>"" and nowto="" then
	sql=sql&" and stockdate=#"&nowfrom&"#"
  elseif nowfrom="" and nowto<>"" then
	sql=sql&" and stockdate=#"&nowto&"#"
  elseif nowfrom<>"" and nowto<>"" then
	sql=sql&" and stockdate>=#"&nowfrom&"# and stockdate<=#"&nowto&"#"
  end if

	
  if request("order1")<>"" then
    sql=sql&" order by stocknumber "&request("order1")
  elseif request("order2")<>"" then
    sql=sql&" order by stockstatus "&request("order2")
  elseif request("order3")<>"" then
    sql=sql&" order by refshipment "&request("order3") 
  elseif request("order4")<>"" then
    sql=sql&" order by refitem "&request("order4") 
  elseif request("order5")<>"" then
    sql=sql&" order by contract "&request("order5") 
  elseif request("order6")<>"" then
    sql=sql&" order by material "&request("order6")
  elseif request("order7")<>"" then
    sql=sql&" order by country "&request("order7")
  elseif request("order8")<>"" then
    sql=sql&" order by plant "&request("order8")
  elseif request("order9")<>"" then
    sql=sql&" order by stockdate "&request("order9") 
  elseif request("order10")<>"" then
    sql=sql&" order by coldstorage "&request("order10") 
  elseif request("order11")<>"" then
    sql=sql&" order by productdate "&request("order11")
  end if
  
%>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#C4D8ED">
<tr>
<td><img src="../images/r_1.gif" alt="" /></td>
<td width="100%" background="../images/r_0.gif">
  <table cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td>&nbsp;入库单查询</td>
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
  <input type="hidden" name="field3" value="<%=request("field3")%>">  
  <input type="hidden" name="field4" value="<%=request("field4")%>">
  <input type="hidden" name="field5" value="<%=request("field5")%>"> 
  <input type="hidden" name="field6" value="<%=request("field6")%>">
  <input type="hidden" name="field7" value="<%=request("field7")%>"> 
  <input type="hidden" name="field8" value="<%=request("field8")%>">
  <input type="hidden" name="field9" value="<%=request("field9")%>"> 
  <input type="hidden" name="field10" value="<%=request("field10")%>">
  <input type="hidden" name="field11" value="<%=request("field11")%>"> 
  <input type="hidden" name="field12" value="<%=request("field12")%>">
  <input type="hidden" name="field13" value="<%=request("field13")%>"> 
  <input type="hidden" name="field14" value="<%=request("field14")%>">
  <input type="hidden" name="field15" value="<%=request("field15")%>"> 
  <input type="hidden" name="field16" value="<%=request("field16")%>">
  <input type="hidden" name="field17" value="<%=request("field17")%>"> 
  <input type="hidden" name="field18" value="<%=request("field18")%>">
  <input type="hidden" name="field19" value="<%=request("field19")%>"> 
  <input type="hidden" name="field20" value="<%=request("field20")%>">
  <input type="hidden" name="field21" value="<%=request("field21")%>">  
  <input type="hidden" name="keyword" value="<%=nowkeyword%>">
  <input type="hidden" name="order1" value="<%=request("order1")%>">
  <input type="hidden" name="order2" value="<%=request("order2")%>">
  <input type="hidden" name="order3" value="<%=request("order3")%>">
  <input type="hidden" name="order4" value="<%=request("order4")%>">
  <input type="hidden" name="order5" value="<%=request("order5")%>">
  <input type="hidden" name="order6" value="<%=request("order6")%>">
  <input type="hidden" name="order7" value="<%=request("order7")%>">
  <input type="hidden" name="order8" value="<%=request("order8")%>">
  <input type="hidden" name="order9" value="<%=request("order9")%>">
  <input type="hidden" name="order10" value="<%=request("order10")%>">
  <input type="hidden" name="order11" value="<%=request("order11")%>">
  <tr align="center">
	<td class="category" width="60" height="30">
		<a href="?order1=<%if request("order1")="asc" then%>desc<%else%>asc<%end if%>&form=<%=request("form")%>" class="title">序号<%if request("order1")="asc" then%><img src="../images/up2.gif" border="0" hspace="2" align="absmiddle"><%else%><img src="../images/down2.gif" border="0" hspace="2" align="absmiddle"><%end if%></a>	
	</td>
	<td class="category" width="80" height="30">
		<a href="?order2=<%if request("order2")="asc" then%>desc<%else%>asc<%end if%>&form=<%=request("form")%>" class="title">状态<%if request("order2")="asc" then%><img src="../images/up2.gif" border="0" hspace="2" align="absmiddle"><%else%><img src="../images/down2.gif" border="0" hspace="2" align="absmiddle"><%end if%></a>	
	</td>
	<td class="category" width="100" height="30">
	  <a href="?order3=<%if request("order3")="asc" then%>desc<%else%>asc<%end if%>&form=<%=request("form")%>" class="title">参考船期<%if request("order3")="asc" then%><img src="../images/up2.gif" border="0" hspace="2" align="absmiddle"><%else%><img src="../images/down2.gif" border="0" hspace="2" align="absmiddle"><%end if%></a>	
	</td>
	<td class="category" width="100" height="30">
		<a href="?order4=<%if request("order4")="asc" then%>desc<%else%>asc<%end if%>&form=<%=request("form")%>" class="title">参考项目<%if request("order4")="asc" then%><img src="../images/up2.gif" border="0" hspace="2" align="absmiddle"><%else%><img src="../images/down2.gif" border="0" hspace="2" align="absmiddle"><%end if%></a>	
	</td>
	<td class="category" width="120" height="30">
		<a href="?order5=<%if request("order5")="asc" then%>desc<%else%>asc<%end if%>&form=<%=request("form")%>" class="title">合同号<%if request("order5")="asc" then%><img src="../images/up2.gif" border="0" hspace="2" align="absmiddle"><%else%><img src="../images/down2.gif" border="0" hspace="2" align="absmiddle"><%end if%></a>	
	</td>
	<td class="category" width="80" height="30">
		<a href="?order6=<%if request("order6")="asc" then%>desc<%else%>asc<%end if%>&form=<%=request("form")%>" class="title">品名<%if request("order6")="asc" then%><img src="../images/up2.gif" border="0" hspace="2" align="absmiddle"><%else%><img src="../images/down2.gif" border="0" hspace="2" align="absmiddle"><%end if%></a>	
	</td>
	<td class="category" width="80" height="30">
		<a href="?order7=<%if request("order7")="asc" then%>desc<%else%>asc<%end if%>&form=<%=request("form")%>" class="title">国家<%if request("order7")="asc" then%><img src="../images/up2.gif" border="0" hspace="2" align="absmiddle"><%else%><img src="../images/down2.gif" border="0" hspace="2" align="absmiddle"><%end if%></a>	
	</td>
	<td class="category" width="80" height="30">
		<a href="?order8=<%if request("order8")="asc" then%>desc<%else%>asc<%end if%>&form=<%=request("form")%>" class="title">厂号<%if request("order8")="asc" then%><img src="../images/up2.gif" border="0" hspace="2" align="absmiddle"><%else%><img src="../images/down2.gif" border="0" hspace="2" align="absmiddle"><%end if%></a>	
	</td>
	<td class="category" width="80" height="30">
		<a href="?order9=<%if request("order9")="asc" then%>desc<%else%>asc<%end if%>&form=<%=request("form")%>" class="title">入库日期<%if request("order9")="asc" then%><img src="../images/up2.gif" border="0" hspace="2" align="absmiddle"><%else%><img src="../images/down2.gif" border="0" hspace="2" align="absmiddle"><%end if%></a>	
  </td>
	<td class="category" width="80" height="30">
		<a href="?order10=<%if request("order10")="asc" then%>desc<%else%>asc<%end if%>&form=<%=request("form")%>" class="title">冷库名称<%if request("order10")="asc" then%><img src="../images/up2.gif" border="0" hspace="2" align="absmiddle"><%else%><img src="../images/down2.gif" border="0" hspace="2" align="absmiddle"><%end if%></a>	
  </td>
	<td class="category" width="80" height="30">
		<a href="?order11=<%if request("order11")="asc" then%>desc<%else%>asc<%end if%>&form=<%=request("form")%>" class="title">生产日期<%if request("order11")="asc" then%><img src="../images/up2.gif" border="0" hspace="2" align="absmiddle"><%else%><img src="../images/down2.gif" border="0" hspace="2" align="absmiddle"><%end if%></a>	
  </td>
  <td class="category">修改</td>
  </tr>
  <%
  set rs_stock =server.createobject("ADODB.RecordSet")	
  rs_stock.open sql,conn,1,3
  if not rs_stock.eof then
  do while rs_stock.eof=false
  %>
  <tr align="center" onDblClick=dlbClickString>
<!--	<tr align="center" onDblClick="window.opener.document.<%=request("queryform")%>.<%=request("field")%>.value='<%=rs_stock("stocknumber")%>';window.opener.document.<%=request("queryform")%>.<%=request("field2")%>.value='<%=rs_stock("refshipment")%>';window.opener.document.<%=request("queryform")%>.<%=request("field3")%>.value='<%=rs_stock("refitem")%>';window.opener.document.<%=request("queryform")%>.<%=request("field4")%>.value='<%=rs_stock("stockdate")%>';window.opener.document.<%=request("queryform")%>.<%=request("field5")%>.value='<%=rs_stock("plant")%>';window.opener.document.<%=request("queryform")%>.<%=request("field6")%>.value='<%=rs_stock("contract")%>';window.opener.document.<%=request("queryform")%>.<%=request("field8")%>.value='<%=rs_stock("material")%>';window.opener.document.<%=request("queryform")%>.<%=request("field9")%>.value='<%=rs_stock("spec")%>';window.opener.document.<%=request("queryform")%>.<%=request("field10")%>.value='<%=rs_stock("price")%>';window.opener.document.<%=request("queryform")%>.<%=request("field11")%>.value='<%=rs_stock("trancurrency")%>';window.opener.document.<%=request("queryform")%>.<%=request("field12")%>.value='<%=rs_stock("case")%>';window.opener.document.<%=request("queryform")%>.<%=request("field13")%>.value='<%=rs_stock("quantity")%>';window.opener.document.<%=request("queryform")%>.<%=request("field14")%>.value='<%=rs_stock("weight")%>';window.opener.document.<%=request("queryform")%>.<%=request("field15")%>.value='<%=rs_stock("coldstorage")%>';window.opener.document.<%=request("queryform")%>.<%=request("field16")%>.value='<%=rs_stock("customer")%>';window.opener.document.<%=request("queryform")%>.<%=request("field17")%>.value='<%=rs_stock("stockqty")%>';window.opener.document.<%=request("queryform")%>.<%=request("field18")%>.value='<%=rs_stock("reason")%>';window.opener.document.<%=request("queryform")%>.<%=request("field19")%>.value='<%=rs_stock("remainqty")%>';window.opener.document.<%=request("queryform")%>.<%=request("field20")%>.value='<%=rs_stock("productdate")%>';window.opener.document.<%=request("queryform")%>.<%=request("field21")%>.value='<%=rs_stock("warrantyperiod")%>';window.close();">-->
	<tr align="center" onDblClick="window.opener.document.<%=request("queryform")%>.<%=request("field")%>.value='<%=rs_stock("stocknumber")%>';window.opener.document.<%=request("queryform")%>.<%=request("field2")%>.value='<%=rs_stock("refshipment")%>';window.opener.document.<%=request("queryform")%>.<%=request("field3")%>.value='<%=rs_stock("refitem")%>';window.opener.document.<%=request("queryform")%>.<%=request("field4")%>.value='<%=rs_stock("stockdate")%>';window.opener.document.<%=request("queryform")%>.<%=request("field5")%>.value='<%=rs_stock("plant")%>';window.opener.document.<%=request("queryform")%>.<%=request("field6")%>.value='<%=rs_stock("contract")%>';window.opener.document.<%=request("queryform")%>.<%=request("field7")%>.value='<%=rs_stock("material")%>';window.opener.document.<%=request("queryform")%>.<%=request("field8")%>.value='<%=rs_stock("spec")%>';window.opener.document.<%=request("queryform")%>.<%=request("field9")%>.value='<%=rs_stock("price")%>';window.opener.document.<%=request("queryform")%>.<%=request("field10")%>.value='<%=rs_stock("trancurrency")%>';window.opener.document.<%=request("queryform")%>.<%=request("field11")%>.value='<%=rs_stock("case")%>';window.opener.document.<%=request("queryform")%>.<%=request("field12")%>.value='<%=rs_stock("quantity")%>';window.opener.document.<%=request("queryform")%>.<%=request("field13")%>.value='<%=rs_stock("weight")%>';window.opener.document.<%=request("queryform")%>.<%=request("field14")%>.value='<%=rs_stock("coldstorage")%>';window.opener.document.<%=request("queryform")%>.<%=request("field15")%>.value='<%=rs_stock("customer")%>';window.opener.document.<%=request("queryform")%>.<%=request("field16")%>.value='<%=rs_stock("stockqty")%>';window.opener.document.<%=request("queryform")%>.<%=request("field17")%>.value='<%=rs_stock("reason")%>';window.opener.document.<%=request("queryform")%>.<%=request("field18")%>.value='<%=rs_stock("remainqty")%>';window.opener.document.<%=request("queryform")%>.<%=request("field19")%>.value='<%=rs_stock("productdate")%>';window.opener.document.<%=request("queryform")%>.<%=request("field20")%>.value='<%=rs_stock("warrantyperiod")%>';window.close();">
	  <td align="center" height="30"><%=rs_stock("stocknumber")%></td>	  
	  <td align="center">
		<%
			status_sql="select * from stockstatus where category='A' and status='"&rs_stock("stockstatus")&"'"
			set rs_status=conn.execute(status_sql)
		%>			
	  <%=rs_status("description")%></td>	  
  
	  <td align="center"><%=rs_stock("refshipment")%></td>
	  <td align="center"><%=rs_stock("refitem")%></td>
	  <td align="center"><%=rs_stock("contract")%></td>
	  <td align="center"><%=rs_stock("material")%></td>
	  <td align="center"><%=rs_stock("country")%></td>
	  <td align="center"><%=rs_stock("plant")%></td>
	  <td align="center"><%=rs_stock("stockdate")%></td>
	  <td align="center"><%=rs_stock("coldstorage")%></td>
	  <td align="center"><%=rs_stock("productdate")%></td>
	  <td align="center">
			<a href="change_stock_order.asp?form=<%=request("form")%>&stocknumber=<%=rs_stock("stocknumber")%>&keyword=<%=nowkeyword%>"><img src="../images/res.gif" border="0" hspace="2" align="absmiddle">修改</a>
	  </td>
  </tr>
  </tr>
  <%
  	'end if
    rs_stock.movenext
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
  if rs_stock.recordcount>0 then 
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