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
<title><%=dianming%> - 公司退货统计</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../style/style.css" rel="stylesheet" type="text/css">
<style>
body {
	background-color:#FFFFFF;
}
</style>
<script language="javascript">
function collapse(img, objName)
{
	var obj;
	obj = document.getElementById(objName);
	if (img.src.indexOf('open') != -1)
	{
		img.src = img.src.replace('open', 'close');
		obj.style.display = 'none';
	}
	else
	{
		img.src = img.src.replace('close', 'open');
		obj.style.display = '';
	}
}
</script>

<script language=javascript>
function preview() { 
bdhtml=window.document.body.innerHTML; 
sprnstr="<!--startprint-->"; 
eprnstr="<!--endprint-->"; 
prnhtml=bdhtml.substr(bdhtml.indexOf(sprnstr)+17); 
prnhtml=prnhtml.substring(0,prnhtml.indexOf(eprnstr)); 
window.document.body.innerHTML=prnhtml; 
window.print(); 
window.document.body.innerHTML=bdhtml; 
         }
</script>
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
if fla31="0" and session("redboy_id")<>"1" then
%>
<br><center><img src="../images/note.gif" align="absmiddle">&nbsp;<font color="#FF0000">你不具备此权限，请与管理员联系！</font></center>
<%  
  response.end
end if

if request("isok")<>"" then
  conn.execute("update sell set isok="&request("isok")&" where id="&request("id"))
end if

'取得当前页码
currentpage=request("page")
'response.write currentpage
'response.end
if currentpage<1 or currentpage="" then
  currentpage="1"
end if

'取得搜索关键字  
nowstartdate=request("startdate") 
if nowstartdate="" then
  nowstartdate=date()-30
end if
nowenddate=request("enddate") 
if nowenddate="" then
  nowenddate=date()
end if
nowkeyword=request("keyword") 
%>
<table width="100%" border="0" cellpadding="0" cellspacing="2" align="center">
<form name="form2">
  <tr> 
    <td width="5%" height="21">&nbsp;<img src="../images/print.jpg" align="absmiddle" style="cursor:hand;" onClick="preview();window.close()"></td>
	<td width="95%" align="right">
	  开始日期：
      <input name="startdate" value="<%=nowstartdate%>" readonly style="width:100px">
	  <img src="../images/date.gif" align="absmiddle" style="cursor:pointer;" onClick="JavaScript:window.open('day.asp?form=form2&field=startdate&oldDate='+startdate.value,'','directorys=no,toolbar=no,status=no,menubar=no,scrollbars=no,resizable=no,width=250,height=170,top=150,left=590');">
	  结束日期：
      <input name="enddate" value="<%=nowenddate%>" readonly style="width:100px">
	  <img src="../images/date.gif" align="absmiddle" style="cursor:pointer;" onClick="JavaScript:window.open('day.asp?form=form2&field=enddate&oldDate='+enddate.value,'','directorys=no,toolbar=no,status=no,menubar=no,scrollbars=no,resizable=no,width=250,height=170,top=150,left=740');">
	  <input type="text" name="keyword" size="20" value="<%=nowkeyword%>">
	  <input type="hidden" name="hid" value="ok">
	  <input type="submit" value=" 查询 " class="button">&nbsp;
	</td>
  </tr>
</form>  
</table>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#C4D8ED">
<tr>
<td><img src="../images/r_1.gif" alt="" /></td>
<td width="100%" background="../images/r_0.gif">
  <table cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td>&nbsp;公司退货统计 <a href="excel_tui.asp?page=<%=currentpage%>&startdate=<%=nowstartdate%>&enddate=<%=nowenddate%>&ku=<%=nowku%>&keyword=<%=nowkeyword%>&order1=<%=request("order1")%>&order2=<%=request("order2")%>&order3=<%=request("order3")%>&order4=<%=request("order4")%>&order5=<%=request("order5")%>&order6=<%=request("order6")%>&order7=<%=request("order7")%>&order8=<%=request("order8")%>&order9=<%=request("order9")%>&order10=<%=request("order10")%>&order11=<%=request("order11")%>&order12=<%=request("order12")%>&order13=<%=request("order13")%>&order14=<%=request("order14")%>&order15=<%=request("order15")%>" target="_blank"><img src="../images/excel.jpg" border="0" align="absmiddle" alt="导出Excel表格"></a>
      	<a href="excel_tuiall.asp?page=<%=currentpage%>&startdate=<%=nowstartdate%>&enddate=<%=nowenddate%>&ku=<%=nowku%>&keyword=<%=nowkeyword%>&order1=<%=request("order1")%>&order2=<%=request("order2")%>&order3=<%=request("order3")%>&order4=<%=request("order4")%>&order5=<%=request("order5")%>&order6=<%=request("order6")%>&order7=<%=request("order7")%>&order8=<%=request("order8")%>&order9=<%=request("order9")%>&order10=<%=request("order10")%>&order11=<%=request("order11")%>&order12=<%=request("order12")%>&order13=<%=request("order13")%>&order14=<%=request("order14")%>&order15=<%=request("order15")%>" target="_blank"><img src="../images/excel.jpg" border="0" align="absmiddle" alt="导出Excel表格(明细)"></a>
      	</td>

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
  <tr align="center">
    <td class="category" width="10">&nbsp;</td>
    <td class="category" height="30">
	  <a href="?order1=<%if request("order1")="asc" then%>desc<%else%>asc<%end if%>&page=<%=currentpage%>&startdate=<%=nowstartdate%>&enddate=<%=nowenddate%>&keyword=<%=nowkeyword%>" class="title">编号<%if request("order1")="asc" then%><img src="../images/up2.gif" border="0" hspace="2" align="absmiddle"><%else%><img src="../images/down2.gif" border="0" hspace="2" align="absmiddle"><%end if%></a>	
	</td>
	<td class="category">
	  <a href="?order4=<%if request("order4")="asc" then%>desc<%else%>asc<%end if%>&page=<%=currentpage%>&startdate=<%=nowstartdate%>&enddate=<%=nowenddate%>&keyword=<%=nowkeyword%>" class="title">入库时间<%if request("order4")="asc" then%><img src="../images/up2.gif" border="0" hspace="2" align="absmiddle"><%else%><img src="../images/down2.gif" border="0" hspace="2" align="absmiddle"><%end if%></a>
    </td>
	<td class="category">
	  <a href="?order5=<%if request("order5")="asc" then%>desc<%else%>asc<%end if%>&page=<%=currentpage%>&startdate=<%=nowstartdate%>&enddate=<%=nowenddate%>&keyword=<%=nowkeyword%>" class="title">经办人<%if request("order5")="asc" then%><img src="../images/up2.gif" border="0" hspace="2" align="absmiddle"><%else%><img src="../images/down2.gif" border="0" hspace="2" align="absmiddle"><%end if%></a>
	</td>
	<td class="category"><a href="?order6=<%if request("order6")="asc" then%>desc<%else%>asc<%end if%>&page=<%=currentpage%>&startdate=<%=nowstartdate%>&enddate=<%=nowenddate%>&keyword=<%=nowkeyword%>" class="title">供应商<%if request("order6")="asc" then%><img src="../images/up2.gif" border="0" hspace="2" align="absmiddle"><%else%><img src="../images/down2.gif" border="0" hspace="2" align="absmiddle"><%end if%></a></td>
	<td class="category">
	  <a href="?order7=<%if request("order7")="asc" then%>desc<%else%>asc<%end if%>&page=<%=currentpage%>&startdate=<%=nowstartdate%>&enddate=<%=nowenddate%>&keyword=<%=nowkeyword%>" class="title">数量<%if request("order7")="asc" then%><img src="../images/up2.gif" border="0" hspace="2" align="absmiddle"><%else%><img src="../images/down2.gif" border="0" hspace="2" align="absmiddle"><%end if%></a>
	</td>
	<td class="category">
	  <a href="?order9=<%if request("order9")="asc" then%>desc<%else%>asc<%end if%>&page=<%=currentpage%>&startdate=<%=nowstartdate%>&enddate=<%=nowenddate%>&keyword=<%=nowkeyword%>" class="title">金额<%if request("order9")="asc" then%><img src="../images/up2.gif" border="0" hspace="2" align="absmiddle"><%else%><img src="../images/down2.gif" border="0" hspace="2" align="absmiddle"><%end if%></a>
	</td>
  </tr>
  <%
  set rs_buy =server.createobject("ADODB.RecordSet")
  sql="select * from sell where type=2 and zu and isok"
  if nowstartdate<>"" then
    sql=sql&" and selldate-#"&nowstartdate&"#>=0"
  end if  
  if nowenddate<>"" then
    sql=sql&" and selldate-#"&nowenddate&"#<=0"
  end if  
  if nowkeyword<>"" then
    sql=sql&" and (bianhao like '%"&nowkeyword&"%' or id_gys in (select id from gys where company like '%"&nowkeyword&"%') or id_login in (select id from login where username like '%"&nowkeyword&"%'))"
  end if

  if request("order1")<>"" then
    sql=sql&" order by bianhao "&request("order1")
  elseif request("order2")<>"" then
    sql=sql&" order by huohao "&request("order2")
  elseif request("order3")<>"" then
    sql=sql&" order by title "&request("order3") 
  elseif request("order4")<>"" then
    sql=sql&" order by selldate "&request("order4") 
  elseif request("order5")<>"" then
    sql=sql&" order by id_login "&request("order5") 
  elseif request("order6")<>"" then
    sql=sql&" order by id_gys "&request("order6")
  elseif request("order7")<>"" then
    sql=sql&" order by shulian "&request("order7")
  elseif request("order8")<>"" then
    sql=sql&" order by price "&request("order8")
  elseif request("order9")<>"" then
    sql=sql&" order by price "&request("order9")
  elseif request("order10")<>"" then
    sql=sql&" order by id_gys "&request("order10")		        
  else
    sql=sql&" order by id desc"  
  end if
	
  rs_buy.open sql,conn,1,3
  if not rs_buy.eof then
  rs_buy.pagesize=maxrecord
  rs_buy.absolutepage=currentpage
  for currentrec=1 to rs_buy.pagesize
    if rs_buy.eof then
      exit for
    end if
  %>
  <tr onMouseOver="this.className='highlight'" onMouseOut="this.className=''" onDblClick="javascript:var win=window.open('../produit/print_tui.asp?bianhao=<%=rs_buy("bianhao")%>','详细信息','width=853,height=470,top=176,left=161,toolbar=no,location=no,directories=no,status=no,menubar=no,resizable=no,scrollbars=yes'); win.focus()">
    <td align="center"><img src="../images/folder_close.gif" style="cursor:hand" onClick="collapse(this, 'buy<%=rs_buy("id")%>')" /></td>
	<td align="center" height="25"><%=rs_buy("bianhao")%></td>
	<td align="center"><%=rs_buy("selldate")%></td>
	<td align="center">
	  <%
	  sql="select * from login where id="&rs_buy("id_login")
	  set rs_login=conn.execute(sql)
	  %>
	  <%if rs_login.eof then%><%=rs_buy("login")%><%else%><%=rs_login("username")%> (<%=rs_login("bianhao")%>)<%end if%>
	</td>
	<td align="center">
	<%
	  sql="select * from gys where id="&rs_buy("id_gys")
	  set rs_gys=conn.execute(sql)
	  %>
	  <%if rs_gys.eof then%><%=rs_buy("gys")%><%else%><%=rs_gys("company")%><%end if%>	
	</td>
	<td align="center"><%=rs_buy("shulian")%></td>
	<td align="center"><%=formatnumber(rs_buy("price"),3)%></td>
  </tr>
  <%
    set rs_buy2=conn.execute("select * from sell where type=2 and zu=false and bianhao='"&rs_buy("bianhao")&"'")
  %>
  <tr id="buy<%=rs_buy("id")%>" style="display:none;">
    <td colspan="16" class="category">
	  <table align="center" cellpadding="4" cellspacing="1" class="grid" border="1" width="100%">
		<tr align="center">
		  <%if showpic="yes" then%><td width="70">图片</td><%end if%>
		  <td height="30">货号</td>
		  <td>产品名称</td>
		  <td>出货仓库</td>
		  <td>数量</td>
		  <td>退货价</td>
		  <td>金额</td>
		</tr>	  
	    <%
		do while rs_buy2.eof=false
		sql="select * from produit where id="&rs_buy2("id_produit")
		set rs_produit=conn.execute(sql)		
		%>
	    <tr>
		  <%if showpic="yes" then%><td align="center"><%if rs_produit.eof then%><%if rs_buy2("photo")<>"" then%><a href="../upload/<%=rs_buy2("photo")%>" target="_blank"><img src="../upload/<%=rs_buy2("photo")%>" border="0" width="60"></a><%else%>无图<%end if%><%else%><%if rs_produit("photo")<>"" then%><a href="../upload/<%=rs_produit("photo")%>" target="_blank"><img src="../upload/<%=rs_produit("photo")%>" border="0" width="60"></a><%else%>无图<%end if%><%end if%></td><%end if%>
		  <td align="center"><%if rs_produit.eof then%><%=rs_buy2("huohao")%><%else%><%=rs_produit("huohao")%><%end if%></td>
		  <td align="center"><%if rs_produit.eof then%><%=rs_buy2("title")%><%else%><%=rs_produit("title")%><%end if%></td>
		  <td align="center"><%=rs_buy2("ku")%></td>
		  <td align="center"><%=rs_buy2("shulian")%></td>
		  <td align="center"><%=formatnumber(rs_buy2("price"),3)%></td>
		  <td align="center"><%=formatnumber(rs_buy2("shulian")*rs_buy2("price"),3)%></td>	  
		</tr>
		<%
		rs_buy2.movenext
		loop
		%>
	  </table>
	</td>
  </tr>
  <%	
    rs_buy.movenext
  next
  else
  %>
  <tr align="center" onMouseOver="this.className='highlight'" onMouseOut="this.className=''">
    <td colspan="16" height="25" align="center" style="color:red"><b>没有找到记录</b></td>
  </tr>
  <%
  end if
  %>
  
  
  
  <%
  if rs_buy.recordcount>0 then 
  %> 
  <tr>
    <td colspan="16" height="30" class="category">
	<table cellpadding=0 cellspacing=0 width="100%">
	<tr>
	<td width="20%" align="left" style="color:#FF0000;">&nbsp;双击查看打印单</td>  
	<td width="80%" align="right">
	&nbsp;&nbsp;
      <%=rs_buy.recordcount%>&nbsp;条信息&nbsp; 共&nbsp;<%=rs_buy.pagecount%>&nbsp;页&nbsp;
  <%
  nowstart=currentpage-3
  if nowstart<1 then
    nowstart=1
  end if
  nowend=currentpage+3
  if nowend>rs_buy.pagecount then
    nowend=rs_buy.pagecount
  end if
  response.write "&nbsp;<a href='?startdate="&nowstartdate&"&enddate="&nowenddate&"&keyword="&nowkeyword&"&page=1&order1="&request("order1")&"&order2="&request("order2")&"&order3="&request("order3")&"&order4="&request("order4")&"&order5="&request("order5")&"&order6="&request("order6")&"&order7="&request("order7")&"&order8="&request("order8")&"&order9="&request("order9")&"&order10="&request("order10")&"&order11="&request("order11")&"&order12="&request("order12")&"&order13="&request("order13")&"&order14="&request("order14")&"&order15="&request("order15")&"' class='page'>最前页</a>&nbsp;"
  for ipage=nowstart to nowend
    if cstr(ipage)=cstr(currentpage) then
      response.write "&nbsp;<span style='font-weight:bold;color:#5858E6'>" & ipage &"</span>&nbsp;"
    else
      response.write "&nbsp;[&nbsp;<a href='?startdate="&nowstartdate&"&enddate="&nowenddate&"&keyword="&nowkeyword&"&page="&ipage&"&order1="&request("order1")&"&order2="&request("order2")&"&order3="&request("order3")&"&order4="&request("order4")&"&order5="&request("order5")&"&order6="&request("order6")&"&order7="&request("order7")&"&order8="&request("order8")&"&order9="&request("order9")&"&order10="&request("order10")&"&order11="&request("order11")&"&order12="&request("order12")&"&order13="&request("order13")&"&order14="&request("order14")&"&order15="&request("order15")&"' class='page'>" & ipage &"</a>&nbsp;]&nbsp;"
    end if
  next
  response.write "&nbsp;<a href='?startdate="&nowstartdate&"&enddate="&nowenddate&"&keyword="&nowkeyword&"&page="&rs_buy.pagecount&"&order1="&request("order1")&"&order2="&request("order2")&"&order3="&request("order3")&"&order4="&request("order4")&"&order5="&request("order5")&"&order6="&request("order6")&"&order7="&request("order7")&"&order8="&request("order8")&"&order9="&request("order9")&"&order10="&request("order10")&"&order11="&request("order11")&"&order12="&request("order12")&"&order13="&request("order13")&"&order14="&request("order14")&"&order15="&request("order15")&"' class='page'>最后页</a>&nbsp;"
%>
  </td>
  </tr></table></td></tr>
<%end if%> 
</table>
<!--endprint-->
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