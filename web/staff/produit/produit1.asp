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
<title><%=dianming%> - 库存管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../style/style.css" rel="stylesheet" type="text/css">
<style>
body {
	background-color:#FFFFFF;
}
</style>
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
if fla13="0" and session("redboy_id")<>"1" then
%>
<br><center><img src="../images/note.gif" align="absmiddle">&nbsp;<font color="#FF0000">你不具备此权限，请与管理员联系！</font></center>
<%  
  response.end
end if

'取得当前页码
currentpage=request("page")
'response.write currentpage
'response.end
if currentpage<1 or currentpage="" then
  currentpage="1"
end if

'取得搜索关键字  
nowku=request("ku")
nowbigclass=request("bigclass")
nowsmallclass=request("smallclass")
if nowbigclass="" then nowsmallclass=""
nowkeyword=request("keyword") 
%>
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
<form name="form2">
  <input type="hidden" name="form" value="<%=request("form")%>">
  <input type="hidden" name="field" value="<%=request("field")%>">
  <input type="hidden" name="field2" value="<%=request("field2")%>">
  <input type="hidden" name="span1" value="<%=request("span1")%>">
  <tr> 
    <td width="50" height="21">&nbsp;<img src="../images/print.jpg" align="absmiddle" style="cursor:hand;" onClick="preview();"></td>
	<td width="*" align="right">
	  搜索：
    <%
	if session("redboy_id")=1 then
	  sql="select * from ku order by id"
	  set rs_ku=conn.execute(sql)
	else
	  sql="select * from ku where instr(login,'"&session("redboy_id")&",')>0 order by id"
	  set rs_ku=conn.execute(sql)
	  if rs_ku.eof then
	    nowku="0"
	  elseif request("ku")="" then
	    nowku=rs_ku("id")
	  end if	  
	end if  
	%>
	  <select name="ku" onChange="form2.submit()">
	<%if session("redboy_id")=1 then%> 
        <option value="">所有仓库</option>
	<%elseif rs_ku.eof then%>
	    <option value="0">没有你管理的仓库</option>	
	<%end if%>
    <%
	do while rs_ku.eof=false
	%>
        <option value="<%=rs_ku("id")%>"<%if trim(cstr(rs_ku("id")))=nowku then%> selected="selected"<%end if%>><%=rs_ku("ku")%></option>
        <%
	  rs_ku.movenext
	loop
	%>
      </select>	  
    <%
	sql="select * from bigclass order by id"
	set rs_bigclass=conn.execute(sql)
	%>
	  <select name="bigclass" onChange="form2.submit()">
        <option value="">所有大类</option>
        <%
	do while rs_bigclass.eof=false
	%>
        <option value="<%=rs_bigclass("id")%>"<%if trim(cstr(rs_bigclass("id")))=nowbigclass then%> selected="selected"<%end if%>><%=rs_bigclass("bigclass")%></option>
        <%
	  rs_bigclass.movenext
	loop
	%>
      </select>
    <%
	if nowbigclass="" then
	  nowbigclass2=0
	else
	  nowbigclass2=nowbigclass 
	end if
	sql="select * from smallclass where id_bigclass="&nowbigclass2&" order by id"
	set rs_smallclass=conn.execute(sql)
	%>
	  <select name="smallclass" onChange="form2.submit()">
        <option value="">所有小类</option>
        <%
	do while rs_smallclass.eof=false
	%>
        <option value="<%=rs_smallclass("id")%>"<%if trim(cstr(rs_smallclass("id")))=nowsmallclass then%> selected="selected"<%end if%>><%=rs_smallclass("smallclass")%></option>
        <%
	  rs_smallclass.movenext
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
  sql="select * from produit where 1=1"
  if nowkeyword<>"" then
	sql=sql&" and (title like '%"&nowkeyword&"%' or huohao like '%"&nowkeyword&"%')"
  end if
  if nowku<>"" then
	sql=sql&" and id_ku="&nowku
  end if  
  if nowbigclass<>"" then
	sql=sql&" and id_bigclass="&nowbigclass
  end if
  if nowsmallclass<>"" then
	sql=sql&" and id_smallclass="&nowsmallclass
  end if  
  
  if request("order1")<>"" then
    sql=sql&" order by photo "&request("order1")
  elseif request("order2")<>"" then
    sql=sql&" order by huohao "&request("order2")
  elseif request("order3")<>"" then
    sql=sql&" order by title "&request("order3") 
  elseif request("order4")<>"" then
    sql=sql&" order by guige "&request("order4") 
  elseif request("order5")<>"" then
    sql=sql&" order by danwei "&request("order5") 
  elseif request("order6")<>"" then
    sql=sql&" order by shulian "&request("order6")
  elseif request("order7")<>"" then
    sql=sql&" order by price2 "&request("order7")
  elseif request("order8")<>"" then
    sql=sql&" order by price "&request("order8")		        
  else
    sql=sql&" order by id desc"  
  end if
  
set count_buy = server.createobject("ADODB.RecordSet")	
count_buy.open sql,conn,1,3
nowprice2=0
do while count_buy.eof=false
  nowprice2=nowprice2+count_buy("shulian")*count_buy("price2")	
  count_buy.movenext
loop
%>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#C4D8ED">
<tr>
<td><img src="../images/r_1.gif" alt="" /></td>
<td width="100%" background="../images/r_0.gif">
  <table cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td>&nbsp;</td>
	  <td align="right">总库存金额：<b><%=formatnumber(nowprice2,3)%></b> 元&nbsp;</td>
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
	<%if showpic="yes" then%>
	<td class="category" width="70">
	  <a href="?order1=<%if request("order1")="asc" then%>desc<%else%>asc<%end if%>&form=<%=request("form")%>&field=<%=request("field")%>&field2=<%=request("field2")%>&page=<%=currentpage%>&keyword=<%=nowkeyword%>&ku=<%=nowku%>&bigclass=<%=nowbigclass%>&smallclass=<%=nowsmallclass%>" class="title">图片<%if request("order1")="asc" then%><img src="../images/up2.gif" border="0" hspace="2" align="absmiddle"><%else%><img src="../images/down2.gif" border="0" hspace="2" align="absmiddle"><%end if%></a>	
	</td>
	<%end if%>
	<td class="category" height="30">
	  <a href="?order2=<%if request("order2")="asc" then%>desc<%else%>asc<%end if%>&form=<%=request("form")%>&field=<%=request("field")%>&field2=<%=request("field2")%>&page=<%=currentpage%>&keyword=<%=nowkeyword%>&ku=<%=nowku%>&bigclass=<%=nowbigclass%>&smallclass=<%=nowsmallclass%>" class="title">货号<%if request("order2")="asc" then%><img src="../images/up2.gif" border="0" hspace="2" align="absmiddle"><%else%><img src="../images/down2.gif" border="0" hspace="2" align="absmiddle"><%end if%></a>	
	</td>
	<td class="category">
	  <a href="?order3=<%if request("order3")="asc" then%>desc<%else%>asc<%end if%>&form=<%=request("form")%>&field=<%=request("field")%>&field2=<%=request("field2")%>&page=<%=currentpage%>&keyword=<%=nowkeyword%>&ku=<%=nowku%>&bigclass=<%=nowbigclass%>&smallclass=<%=nowsmallclass%>" class="title">产品名称<%if request("order3")="asc" then%><img src="../images/up2.gif" border="0" hspace="2" align="absmiddle"><%else%><img src="../images/down2.gif" border="0" hspace="2" align="absmiddle"><%end if%></a>	
	</td>
	<td class="category">
	  <a href="?order4=<%if request("order4")="asc" then%>desc<%else%>asc<%end if%>&form=<%=request("form")%>&field=<%=request("field")%>&field2=<%=request("field2")%>&page=<%=currentpage%>&keyword=<%=nowkeyword%>&ku=<%=nowku%>&bigclass=<%=nowbigclass%>&smallclass=<%=nowsmallclass%>" class="title">规格<%if request("order4")="asc" then%><img src="../images/up2.gif" border="0" hspace="2" align="absmiddle"><%else%><img src="../images/down2.gif" border="0" hspace="2" align="absmiddle"><%end if%></a>		
	</td>
	<td class="category">
	  <a href="?order5=<%if request("order5")="asc" then%>desc<%else%>asc<%end if%>&form=<%=request("form")%>&field=<%=request("field")%>&field2=<%=request("field2")%>&page=<%=currentpage%>&keyword=<%=nowkeyword%>&ku=<%=nowku%>&bigclass=<%=nowbigclass%>&smallclass=<%=nowsmallclass%>" class="title">单位<%if request("order5")="asc" then%><img src="../images/up2.gif" border="0" hspace="2" align="absmiddle"><%else%><img src="../images/down2.gif" border="0" hspace="2" align="absmiddle"><%end if%></a>		
	</td>	
	<td class="category">	  
	  <a href="?order6=<%if request("order6")="asc" then%>desc<%else%>asc<%end if%>&form=<%=request("form")%>&field=<%=request("field")%>&field2=<%=request("field2")%>&page=<%=currentpage%>&keyword=<%=nowkeyword%>&ku=<%=nowku%>&bigclass=<%=nowbigclass%>&smallclass=<%=nowsmallclass%>" class="title">库存数量<%if request("order6")="asc" then%><img src="../images/up2.gif" border="0" hspace="2" align="absmiddle"><%else%><img src="../images/down2.gif" border="0" hspace="2" align="absmiddle"><%end if%></a>
	  </td>
	<td class="category">
	  <a href="?order7=<%if request("order7")="asc" then%>desc<%else%>asc<%end if%>&form=<%=request("form")%>&field=<%=request("field")%>&field2=<%=request("field2")%>&page=<%=currentpage%>&keyword=<%=nowkeyword%>&ku=<%=nowku%>&bigclass=<%=nowbigclass%>&smallclass=<%=nowsmallclass%>" class="title">进货单价<%if request("order7")="asc" then%><img src="../images/up2.gif" border="0" hspace="2" align="absmiddle"><%else%><img src="../images/down2.gif" border="0" hspace="2" align="absmiddle"><%end if%></a>
	</td>
	<td class="category">
	  <a href="?order8=<%if request("order8")="asc" then%>desc<%else%>asc<%end if%>&form=<%=request("form")%>&field=<%=request("field")%>&field2=<%=request("field2")%>&page=<%=currentpage%>&keyword=<%=nowkeyword%>&ku=<%=nowku%>&bigclass=<%=nowbigclass%>&smallclass=<%=nowsmallclass%>" class="title">建议卖价<%if request("order8")="asc" then%><img src="../images/up2.gif" border="0" hspace="2" align="absmiddle"><%else%><img src="../images/down2.gif" border="0" hspace="2" align="absmiddle"><%end if%></a>	
	</td>
  </tr>
  <%
  set rs_produit =server.createobject("ADODB.RecordSet")	
  rs_produit.open sql,conn,1,3
  if not rs_produit.eof then
  rs_produit.pagesize=maxrecord
  rs_produit.absolutepage=currentpage
  y=""
  for currentrec=1 to rs_produit.pagesize
    if rs_produit.eof then
      exit for
    end if
  
    if request("form")<>"" then
          sql="select * from produit where huohao='"&rs_produit("huohao")&"'"
	      set rs_shulian=conn.execute(sql)
	      nowshulian=0
		  nowtext=""
	      do while rs_shulian.eof=false
   	        nowshulian=nowshulian+rs_shulian("shulian")
			sql="select * from ku where id="&rs_shulian("id_ku")
			set rs_ku=conn.execute(sql)
		    nowtext=nowtext+rs_ku("ku")&"("&rs_shulian("shulian")&")，"
	        rs_shulian.movenext
	      loop	  
	end if
	'listy=split(y,"-|-")
	'nowshow=true
	'for z=0 to UBound(listy)-1
	'  if listy(z)=rs_produit("huohao") then
	'    nowshow=false
	'	exit for
	'  end if
	'next
    'if nowshow then
	'  y=y&rs_produit("huohao")&"-|-"
  %>
  <tr onMouseOver="this.className='highlight'" onMouseOut="this.className=''" <%if request("form")<>"" then%>onDblClick="window.opener.document.<%=request("form")%>.<%=request("field")%>.value='<%=rs_produit("huohao")%>';<%if request("field2")<>"" then%>window.opener.document.<%=request("form")%>.<%=request("field2")%>.value='<%=rs_produit("price2")%>';<%end if%><%if request("span1")<>"" then%>window.opener.document.all.<%=request("span1")%>.innerHTML='目前所有仓库数量：<%=nowshulian%>，<%=left(nowtext,len(nowtext)-1)%>';<%end if%>window.close();"<%else%>onDblClick="javascript:var win=window.open('produit_show.asp?id=<%=rs_produit("id")%>','产品详细信息','width=895,height=503,top=142,left=115,toolbar=no,location=no,directories=no,status=no,menubar=no,resizable=no,scrollbars=yes'); win.focus()"<%end if%>>
	<%if showpic="yes" then%><td align="center"><%if rs_produit("photo")<>"" then%><a href="../upload/<%=rs_produit("photo")%>" target="_blank"><img src="../upload/<%=rs_produit("photo")%>" border="0" width="60"></a><%else%>无图<%end if%></td><%end if%>
	<td align="center" height="25"><%=rs_produit("huohao")%></td>
    <td align="center"><%=rs_produit("title")%></td>	  
	<td align="center"><%=rs_produit("guige")%></td>
	<td align="center">
	  <%if rs_produit.eof=false then%><%=rs_produit("danwei")%><%end if%></td>
	<td align="center">
	  <%
	  sql="select * from ku where id="&rs_produit("id_ku")
	  set rs_ku=conn.execute(sql)
	  sql="select * from produit where huohao='"&rs_produit("huohao")&"'"
	  set rs_shulian=conn.execute(sql)
	  nowshulian=0
	  do while rs_shulian.eof=false
	    nowshulian=nowshulian+rs_shulian("shulian")
	    rs_shulian.movenext
	  loop
      nowshulian7=nowshulian
	  'if request("ku")<>"" then
	  '  nowshulian=rs_produit("shulian")	
	  'end if
	  %>
	  <b><%if nowshulian7<rs_produit("baojin") then%><font color="#ff0000"><%=nowshulian%></font><%else%><%=nowshulian%><%end if%></b>，<%=rs_ku("ku")%>【<%=rs_produit("shulian")%>】</td>	
    <td align="center"><%=formatnumber(rs_produit("price2"),3)%></td>
	<td align="center"><%=formatnumber(rs_produit("price"),3)%></td>
  </tr>
  <%
  	'end if
    rs_produit.movenext
  next
  else
  %>
  <tr align="center" onMouseOver="this.className='highlight'" onMouseOut="this.className=''">
    <td colspan="12" height="25" align="center" style="color:red"><b>没有找到记录</b></td>
  </tr>
  <%
  end if
  %>
  
  
  
  <%
  if rs_produit.recordcount>0 then 
  %> 
  <tr>
    <td colspan="12" height="30" class="category">
	<table cellpadding=0 cellspacing=0 width="100%">
	<tr>
	<td width="20%" align="left" style="color:#FF0000;">&nbsp;<%if request("form")<>"" then%>双击选择产品<%else%>双击查看产品详细信息<%end if%></td>  
	<td width="80%" align="right">
	&nbsp;&nbsp;
      <%=rs_produit.recordcount%>&nbsp;条信息&nbsp; 共&nbsp;<%=rs_produit.pagecount%>&nbsp;页&nbsp;
  <%
  nowstart=currentpage-3
  if nowstart<1 then
    nowstart=1
  end if
  nowend=currentpage+3
  if nowend>rs_produit.pagecount then
    nowend=rs_produit.pagecount
  end if
  response.write "&nbsp;<a href='?form="&request("form")&"&field="&request("field")&"&field2="&request("field2")&"&span1="&request("span1")&"&keyword="&nowkeyword&"&ku="&nowku&"&bigclass="&nowbigclass&"&smallclass="&nowsmallclass&"&page=1&order1="&request("order1")&"&order2="&request("order2")&"&order3="&request("order3")&"&order4="&request("order4")&"&order5="&request("order5")&"&order6="&request("order6")&"&order7="&request("order7")&"&order8="&request("order8")&"&order9="&request("order9")&"&order10="&request("order10")&"&order11="&request("order11")&"&order12="&request("order12")&"&order13="&request("order13")&"&order14="&request("order14")&"&order15="&request("order15")&"' class='page'>最前页</a>&nbsp;"
  for ipage=nowstart to nowend
    if cstr(ipage)=cstr(currentpage) then
      response.write "&nbsp;<span style='font-weight:bold;color:#5858E6'>" & ipage &"</span>&nbsp;"
    else
      response.write "&nbsp;[&nbsp;<a href='?form="&request("form")&"&field="&request("field")&"&field2="&request("field2")&"&span1="&request("span1")&"&keyword="&nowkeyword&"&ku="&nowku&"&bigclass="&nowbigclass&"&smallclass="&nowsmallclass&"&page="&ipage&"&order1="&request("order1")&"&order2="&request("order2")&"&order3="&request("order3")&"&order4="&request("order4")&"&order5="&request("order5")&"&order6="&request("order6")&"&order7="&request("order7")&"&order8="&request("order8")&"&order9="&request("order9")&"&order10="&request("order10")&"&order11="&request("order11")&"&order12="&request("order12")&"&order13="&request("order13")&"&order14="&request("order14")&"&order15="&request("order15")&"' class='page'>" & ipage &"</a>&nbsp;]&nbsp;"
    end if
  next
  response.write "&nbsp;<a href='?form="&request("form")&"&field="&request("field")&"&field2="&request("field2")&"&span1="&request("span1")&"&keyword="&nowkeyword&"&ku="&nowku&"&bigclass="&nowbigclass&"&smallclass="&nowsmallclass&"&page="&rs_produit.pagecount&"&order1="&request("order1")&"&order2="&request("order2")&"&order3="&request("order3")&"&order4="&request("order4")&"&order5="&request("order5")&"&order6="&request("order6")&"&order7="&request("order7")&"&order8="&request("order8")&"&order9="&request("order9")&"&order10="&request("order10")&"&order11="&request("order11")&"&order12="&request("order12")&"&order13="&request("order13")&"&order14="&request("order14")&"&order15="&request("order15")&"' class='page'>最后页</a>&nbsp;"
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