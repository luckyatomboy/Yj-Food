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
<title><%=dianming%> - 帐务查询</title>
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
if fla71="0" and session("redboy_id")<>"1" then
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
nowstartdate=request("startdate") 
if nowstartdate="" then
  nowstartdate=date()-30
end if
nowenddate=request("enddate") 
if nowenddate="" then
  nowenddate=date()
end if  
nowtype=request("type")
nowbigclass=request("bigclass")
nowsmallclass=request("smallclass")
if nowbigclass="" then nowsmallclass=""
%>
<table width="100%" border="0" cellpadding="0" cellspacing="0" align="center">
<form name="form2">
  <tr> 
    <td width="50" height="21">&nbsp;<img src="../images/print.jpg" align="absmiddle" style="cursor:hand;" onClick="preview();"></td>
	<td width="*" align="right">
	  <select name="type" onChange="form2.submit()">
	    <option value="">所有类型</option>
        <option value="0"<%if nowtype="0" then%> selected="selected"<%end if%>>收入</option>
        <option value="1"<%if nowtype="1" then%> selected="selected"<%end if%>>支出</option>
      </select>  
    <%
	if nowtype="" then
	  sql="select * from money_bigclass order by type,id"
	else
	  sql="select * from money_bigclass where type="&nowtype&" order by id"
	end if
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
	sql="select * from money_smallclass where id_bigclass="&nowbigclass2&" order by id"
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
	  开始日期：
      <input name="startdate" value="<%=nowstartdate%>" readonly style="width:100px">
	  <img src="../images/date.gif" align="absmiddle" style="cursor:pointer;" onClick="JavaScript:window.open('day.asp?form=form2&field=startdate&oldDate='+startdate.value,'','directorys=no,toolbar=no,status=no,menubar=no,scrollbars=no,resizable=no,width=250,height=170,top=150,left=590');">
	  结束日期：
      <input name="enddate" value="<%=nowenddate%>" readonly style="width:100px">
	  <img src="../images/date.gif" align="absmiddle" style="cursor:pointer;" onClick="JavaScript:window.open('day.asp?form=form2&field=enddate&oldDate='+enddate.value,'','directorys=no,toolbar=no,status=no,menubar=no,scrollbars=no,resizable=no,width=250,height=170,top=150,left=740');">
	  <input type="submit" value=" 查询 " class="button">&nbsp;
	</td>
  </tr>
</form>  
</table>
<%
  sql="select * from redboy_money where 1=1"
  if nowtype<>"" then
	sql=sql&" and type="&nowtype
  end if  
  if nowbigclass<>"" then
	sql=sql&" and id_bigclass="&nowbigclass
  end if
  if nowsmallclass<>"" then
	sql=sql&" and id_smallclass="&nowsmallclass
  end if
  if nowstartdate<>"" then
    sql=sql&" and selldate-#"&nowstartdate&"#>=0"
  end if  
  if nowenddate<>"" then
    sql=sql&" and selldate-#"&nowenddate&"#<=0"
  end if  
  
  if request("order1")<>"" then
    sql=sql&" order by type "&request("order1")
  elseif request("order2")<>"" then
    sql=sql&" order by id_bigclass "&request("order2")
  elseif request("order3")<>"" then
    sql=sql&" order by id_smallclass "&request("order3") 
  elseif request("order4")<>"" then
    sql=sql&" order by login "&request("order4") 
  elseif request("order5")<>"" then
    sql=sql&" order by selldate "&request("order5") 
  elseif request("order6")<>"" then
    sql=sql&" order by type,price "&request("order6") 
  elseif request("order7")<>"" then
    sql=sql&" order by type desc,price "&request("order7")	       
  else
    sql=sql&" order by id desc"  
  end if
  
set count_buy = server.createobject("ADODB.RecordSet")	
count_buy.open sql,conn,1,3
nowprice1=0
nowprice2=0
do while count_buy.eof=false
  if count_buy("type")=0 then
    nowprice1=nowprice1+count_buy("price")
  else
    nowprice2=nowprice2+count_buy("price")
  end if
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
	  <td align="right">收入合计：<b><%=formatnumber(nowprice1,3)%></b> 元, 支出合计：<b><%=formatnumber(nowprice2,3)%></b> 元&nbsp;</td>
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
<form name="form1" action="money_del.asp">
  <input type="hidden" name="page" value="<%=currentpage%>">
  <input type="hidden" name="type" value="<%=nowtype%>">
  <input type="hidden" name="bigclass" value="<%=nowbigclass%>">
  <input type="hidden" name="smallclass" value="<%=nowsmallclass%>">
  <input type="hidden" name="startdate" value="<%=nowstartdate%>">
  <input type="hidden" name="enddate" value="<%=nowenddate%>">
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
  <input type="hidden" name="order12" value="<%=request("order12")%>">
  <input type="hidden" name="order13" value="<%=request("order13")%>">
  <input type="hidden" name="order14" value="<%=request("order14")%>">
  <input type="hidden" name="order15" value="<%=request("order15")%>">
  <tr align="center">    
	<td class="category">
	  <a href="?order1=<%if request("order1")="asc" then%>desc<%else%>asc<%end if%>&page=<%=currentpage%>&type=<%=nowtype%>&bigclass=<%=nowbigclass%>&smallclass=<%=nowsmallclass%>&startdate=<%=nowstartdate%>&enddate=<%=nowenddate%>" class="title">类型<%if request("order1")="asc" then%><img src="../images/up2.gif" border="0" hspace="2" align="absmiddle"><%else%><img src="../images/down2.gif" border="0" hspace="2" align="absmiddle"><%end if%></a>	
	</td>
	<td class="category" height="30">
	  <a href="?order2=<%if request("order2")="asc" then%>desc<%else%>asc<%end if%>&page=<%=currentpage%>&type=<%=nowtype%>&bigclass=<%=nowbigclass%>&smallclass=<%=nowsmallclass%>&startdate=<%=nowstartdate%>&enddate=<%=nowenddate%>" class="title">大类<%if request("order2")="asc" then%><img src="../images/up2.gif" border="0" hspace="2" align="absmiddle"><%else%><img src="../images/down2.gif" border="0" hspace="2" align="absmiddle"><%end if%></a>	
	</td>
	<td class="category">
	  <a href="?order3=<%if request("order3")="asc" then%>desc<%else%>asc<%end if%>&page=<%=currentpage%>&type=<%=nowtype%>&bigclass=<%=nowbigclass%>&smallclass=<%=nowsmallclass%>&startdate=<%=nowstartdate%>&enddate=<%=nowenddate%>" class="title">小类<%if request("order3")="asc" then%><img src="../images/up2.gif" border="0" hspace="2" align="absmiddle"><%else%><img src="../images/down2.gif" border="0" hspace="2" align="absmiddle"><%end if%></a>	
	</td>
	<td class="category">
	  <a href="?order4=<%if request("order4")="asc" then%>desc<%else%>asc<%end if%>&page=<%=currentpage%>&type=<%=nowtype%>&bigclass=<%=nowbigclass%>&smallclass=<%=nowsmallclass%>&startdate=<%=nowstartdate%>&enddate=<%=nowenddate%>" class="title">经办人<%if request("order4")="asc" then%><img src="../images/up2.gif" border="0" hspace="2" align="absmiddle"><%else%><img src="../images/down2.gif" border="0" hspace="2" align="absmiddle"><%end if%></a>		
	</td>
	<td class="category">
	  <a href="?order5=<%if request("order5")="asc" then%>desc<%else%>asc<%end if%>&page=<%=currentpage%>&type=<%=nowtype%>&bigclass=<%=nowbigclass%>&smallclass=<%=nowsmallclass%>&startdate=<%=nowstartdate%>&enddate=<%=nowenddate%>" class="title">时间<%if request("order5")="asc" then%><img src="../images/up2.gif" border="0" hspace="2" align="absmiddle"><%else%><img src="../images/down2.gif" border="0" hspace="2" align="absmiddle"><%end if%></a>		
	</td>	
	<td class="category">	  
	  <a href="?order6=<%if request("order6")="asc" then%>desc<%else%>asc<%end if%>&page=<%=currentpage%>&type=<%=nowtype%>&bigclass=<%=nowbigclass%>&smallclass=<%=nowsmallclass%>&startdate=<%=nowstartdate%>&enddate=<%=nowenddate%>" class="title">收入<%if request("order6")="asc" then%><img src="../images/up2.gif" border="0" hspace="2" align="absmiddle"><%else%><img src="../images/down2.gif" border="0" hspace="2" align="absmiddle"><%end if%></a>
	</td>
	<td class="category">	  
	  <a href="?order7=<%if request("order7")="asc" then%>desc<%else%>asc<%end if%>&page=<%=currentpage%>&type=<%=nowtype%>&bigclass=<%=nowbigclass%>&smallclass=<%=nowsmallclass%>&startdate=<%=nowstartdate%>&enddate=<%=nowenddate%>" class="title">支出<%if request("order7")="asc" then%><img src="../images/up2.gif" border="0" hspace="2" align="absmiddle"><%else%><img src="../images/down2.gif" border="0" hspace="2" align="absmiddle"><%end if%></a>
	</td>
	<%if fla72="1" or session("redboy_id")="1" then%>
    <td class="category">修改</td>
	<%end if%>
	<%if fla73="1" or session("redboy_id")="1" then%>
    <td class="category">删除</td>
	<%end if%>
  </tr>
  <%
  set rs_money =server.createobject("ADODB.RecordSet")	
  rs_money.open sql,conn,1,3
  if not rs_money.eof then
  rs_money.pagesize=maxrecord
  rs_money.absolutepage=currentpage
  for currentrec=1 to rs_money.pagesize
    if rs_money.eof then
      exit for
    end if
  %>
  <tr onMouseOver="this.className='highlight'" onMouseOut="this.className=''" onDblClick="javascript:var win=window.open('money_show.asp?id=<%=rs_money("id")%>','帐务详细信息','width=853,height=470,top=176,left=161,toolbar=no,location=no,directories=no,status=no,menubar=no,resizable=no,scrollbars=yes'); win.focus()">
	<td align="center"><%if rs_money("type")=0 then%>收入<%else%>支出<%end if%></td>
	<td align="center" height="25">
	  <%
	  sql="select * from money_bigclass where id="&rs_money("id_bigclass")
	  set rs_bigclass=conn.execute(sql)
	  %>
	  <%if rs_bigclass.eof=false then%><%=rs_bigclass("bigclass")%><%else%>&nbsp;<%end if%>	
	</td>
    <td align="center">
	  <%
	  sql="select * from money_smallclass where id="&rs_money("id_smallclass")
	  set rs_smallclass=conn.execute(sql)
	  %>
	  <%if rs_smallclass.eof=false then%><%=rs_smallclass("smallclass")%><%else%>&nbsp;<%end if%>
	</td>
	<td align="center">
	  <%
	  sql="select * from login where id="&rs_money("id_login")
	  set rs_login=conn.execute(sql)
	  %>
	  <%if rs_login.eof then%><%=rs_money("login")%><%else%><%=rs_login("username")%><%end if%>	
	</td>	
    <td align="center"><%=rs_money("selldate")%></td>
	<td align="center"><%if rs_money("type")=0 then%><%=formatnumber(rs_money("price"),3)%><%else%>&nbsp;<%end if%></td>
	<td align="center"><%if rs_money("type")=1 then%><%=formatnumber(rs_money("price"),3)%><%else%>&nbsp;<%end if%></td>
	<%if fla72="1" or session("redboy_id")="1" then%>
    <td align="center"><a href="money_modi.asp?id=<%=rs_money("id")%>&page=<%=currentpage%>&type=<%=nowtype%>&bigclass=<%=nowbigclass%>&smallclass=<%=nowsmallclass%>&startdate=<%=nowstartdate%>&enddate=<%=nowenddate%>&order1=<%=request("order1")%>&order2=<%=request("order2")%>&order3=<%=request("order3")%>&order4=<%=request("order4")%>&order5=<%=request("order5")%>&order6=<%=request("order6")%>&order7=<%=request("order7")%>&order8=<%=request("order8")%>&order9=<%=request("order9")%>&order10=<%=request("order10")%>&order11=<%=request("order11")%>&order12=<%=request("order12")%>&order13=<%=request("order13")%>&order14=<%=request("order14")%>&order15=<%=request("order15")%>"><img src="../images/res.gif" border="0" hspace="2" align="absmiddle">修改</a></td>
	<%end if%>
	<%if fla73="1" or session("redboy_id")="1" then%>
    <td align="center"><input type="checkbox" name="ID" value="<%=rs_money("id")%>" style="border:0"></td>
	<%end if%>
  </tr>
  <%
  	'end if
    rs_money.movenext
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
  if rs_money.recordcount>0 then 
  %> 
  <tr>
    <td colspan="12" height="30" class="category">
	<table cellpadding=0 cellspacing=0 width="100%">
	<tr>
	<td width="20%" align="left" style="color:#FF0000;">&nbsp;双击查看详细信息</td>  
	<td width="80%" align="right">
	&nbsp;&nbsp;
      <%=rs_money.recordcount%>&nbsp;条信息&nbsp; 共&nbsp;<%=rs_money.pagecount%>&nbsp;页&nbsp;
  <%
  nowstart=currentpage-3
  if nowstart<1 then
    nowstart=1
  end if
  nowend=currentpage+3
  if nowend>rs_money.pagecount then
    nowend=rs_money.pagecount
  end if
  response.write "&nbsp;<a href='?startdate="&request("startdate")&"&enddate="&nowenddate&"&type="&nowtype&"&bigclass="&nowbigclass&"&smallclass="&nowsmallclass&"&page=1&order1="&request("order1")&"&order2="&request("order2")&"&order3="&request("order3")&"&order4="&request("order4")&"&order5="&request("order5")&"&order6="&request("order6")&"&order7="&request("order7")&"&order8="&request("order8")&"&order9="&request("order9")&"&order10="&request("order10")&"&order11="&request("order11")&"&order12="&request("order12")&"&order13="&request("order13")&"&order14="&request("order14")&"&order15="&request("order15")&"' class='page'>最前页</a>&nbsp;"
  for ipage=nowstart to nowend
    if cstr(ipage)=cstr(currentpage) then
      response.write "&nbsp;<span style='font-weight:bold;color:#5858E6'>" & ipage &"</span>&nbsp;"
    else
      response.write "&nbsp;[&nbsp;<a href='?startdate="&request("startdate")&"&enddate="&nowenddate&"&type="&nowtype&"&bigclass="&nowbigclass&"&smallclass="&nowsmallclass&"&page="&ipage&"&order1="&request("order1")&"&order2="&request("order2")&"&order3="&request("order3")&"&order4="&request("order4")&"&order5="&request("order5")&"&order6="&request("order6")&"&order7="&request("order7")&"&order8="&request("order8")&"&order9="&request("order9")&"&order10="&request("order10")&"&order11="&request("order11")&"&order12="&request("order12")&"&order13="&request("order13")&"&order14="&request("order14")&"&order15="&request("order15")&"' class='page'>" & ipage &"</a>&nbsp;]&nbsp;"
    end if
  next
  response.write "&nbsp;<a href='?startdate="&request("startdate")&"&enddate="&nowenddate&"&type="&nowtype&"&bigclass="&nowbigclass&"&smallclass="&nowsmallclass&"&page="&rs_money.pagecount&"&order1="&request("order1")&"&order2="&request("order2")&"&order3="&request("order3")&"&order4="&request("order4")&"&order5="&request("order5")&"&order6="&request("order6")&"&order7="&request("order7")&"&order8="&request("order8")&"&order9="&request("order9")&"&order10="&request("order10")&"&order11="&request("order11")&"&order12="&request("order12")&"&order13="&request("order13")&"&order14="&request("order14")&"&order15="&request("order15")&"' class='page'>最后页</a>&nbsp;"
%>
    <%if fla73="1" or session("redboy_id")="1" then%>
	<input name="chkall" type="checkbox" id="chkall" value="select" onClick="CheckAll(this.form)" style="border:0"> 全选
	<input type="submit" value="删 除" class="button" onClick="return confirm('确定要删除所选择的记录吗？')">
	<%end if%>
  </td>
  </tr></table></td></tr>
<%end if%> 
</form>   
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