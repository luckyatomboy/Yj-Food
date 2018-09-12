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
<%
nowfilename=replace(replace(replace(now,":","")," ",""),"/","")
Response.Buffer = True 
Response.ContentType = "application/vnd.ms-excel" 
Response.AddHeader "content-disposition", "inline; filename = "&nowfilename&".xls"
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
    sql=sql&" order by shulian*price2 "&request("order8")
  elseif request("order9")<>"" then
    sql=sql&" order by tiji "&request("order9")		        
  else
    sql=sql&" order by id desc"  
  end if
  

%>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#C4D8ED">

<!--startprint-->
<table align="center" cellpadding="4" cellspacing="1" class="toptable grid" border="1">
<form name="form1" action="produit_del.asp">
  <input type="hidden" name="form" value="<%=request("form")%>">
  <input type="hidden" name="field" value="<%=request("field")%>">
  <input type="hidden" name="field2" value="<%=request("field2")%>">
  <input type="hidden" name="ku" value="<%=nowku%>">
  <input type="hidden" name="bigclass" value="<%=nowbigclass%>">
  <input type="hidden" name="smallclass" value="<%=nowsmallclass%>">
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
  <input type="hidden" name="order12" value="<%=request("order12")%>">
  <input type="hidden" name="order13" value="<%=request("order13")%>">
  <input type="hidden" name="order14" value="<%=request("order14")%>">
  <input type="hidden" name="order15" value="<%=request("order15")%>">
  <tr align="center">    
	<td class="category" height="30">
	  货号
	</td>
	<td class="category">
	  产品名称
	</td>
	<td class="category">
	  规格	
	</td>

	<td class="category">
	  单位		
	</td>	
	<td class="category">	  
	  库存数量
	  </td>
	<%if session("redboy_id")="1" then%>  
	<td class="category">
	  进货单价
	</td>
	<td class="category">
	  金额
	</td>
	<%end if%>
  </tr>
  <%
  set rs_produit =server.createobject("ADODB.RecordSet")	
  rs_produit.open sql,conn,1,3
  'response.write sql
  if not rs_produit.eof then
  rs_produit.pagesize=999999
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
		    nowtext=nowtext+rs_ku("ku")&"("&formatnumber(rs_shulian("shulian"),3)&")，"
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
  <tr onMouseOver="this.className='highlight'" onMouseOut="this.className=''" <%if request("form")<>"" then%>onDblClick="window.opener.document.<%=request.querystring("form")%>.<%=request.querystring("field")%>.value='<%=rs_produit("huohao")%>';window.opener.document.all.showshulian.innerHTML='目前所有仓库数量：<%=formatnumber(nowshulian,3)%>，<%=left(nowtext,len(nowtext)-1)%>';<%if request("field2")<>"" then%>window.opener.document.<%=request.querystring("form")%>.<%=request.querystring("field2")%>.value='<%=rs_produit("price")%>';<%end if%>window.close();"<%else%>onDblClick="javascript:var win=window.open('produit_show.asp?id=<%=rs_produit("id")%>','产品详细信息','width=853,height=470,top=176,left=161,toolbar=no,location=no,directories=no,status=no,menubar=no,resizable=no,scrollbars=yes'); win.focus()"<%end if%>>
	
	<td align="center" height="25"><%=rs_produit("huohao")%>&nbsp;</td>
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
	  <b><%if nowshulian7<rs_produit("baojin") then%><font color="#ff0000"><%=formatnumber(nowshulian,3)%></font><%else%><%=formatnumber(nowshulian,3)%><%end if%></b>，<%=rs_ku("ku")%>【<%=formatnumber(rs_produit("shulian"),3)%>】</td>	
	<%if session("redboy_id")="1" then%>  
    <td align="center"><%=formatnumber(rs_produit("price2"),3)%></td>
	<td align="center"><%=formatnumber(rs_produit("price2")*rs_produit("shulian"),3)%></td>
	<%end if%>

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
  
  
  
 
</table>
</body>
</html>