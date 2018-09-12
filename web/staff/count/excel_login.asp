<!-- #include file="../conn2.asp" -->
<!-- #include file="../const.asp" -->
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<html>
<head>
<title><%=dianming%> - 员工工资统计</title>

</HEAD>

<BODY>
	<% 
nowfilename=replace(replace(replace(now,":","")," ",""),"/","")
Response.Buffer = True 
Response.ContentType = "application/vnd.ms-excel" 
Response.AddHeader "content-disposition", "inline; filename = "&nowfilename&".xls"
%> 
<%  

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

<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#C4D8ED">

<!--startprint-->
<table align="center" cellpadding="4" cellspacing="1" class="toptable grid" border="1">
    <td class="category" height="30">员工编号</td>
	<td class="category">员工姓名</td>
    <td class="category">基本工资</td>
	<td class="category">销售提成</td>
    <td class="category">合计工资</td>
  </tr>
  <%
  sql="select * from login where 1=1"
  if nowkeyword<>"" then
    sql=sql&" and (username like '%"&nowkeyword&"%' or bianhao like '%"&nowkeyword&"%')"
  end if  
  sql=sql&" order by id"
  set rs_login=conn.execute(sql)
  do while rs_login.eof=false
  %>
  <tr onMouseOver="this.className='highlight'" onMouseOut="this.className=''">
    <td align="center" height="25"><%=rs_login("bianhao")%>&nbsp;</td>
	<td align="center"><%=rs_login("username")%></td>
    <td align="center"><%=rs_login("gongzi")/30*abs(cdate(nowenddate)-cdate(nowstartdate))%> 元</td>
    <td align="center">
		  <%
		    sql="select * from sell where zu=false and isok and id_login="&rs_login("id")&" and selldate>=#"&nowstartdate&"# and selldate<=#"&nowenddate&"#"
			set rs_sell=conn.execute(sql)
			nowtichen=0
			do while rs_sell.eof=false
			  sql="select * from produit where id="&rs_sell("id_produit")
			  set rs_produit=conn.execute(sql)
			  if rs_produit.eof=false then
			    if rs_produit("tichen_type")=0 then
				  nowtichen=nowtichen+(rs_produit("tichen")*rs_sell("price")*rs_sell("shulian")/100)
				else
			      nowtichen=nowtichen+rs_produit("tichen")*rs_sell("shulian")
				end if
			  end if
			  rs_sell.movenext
			loop		  		
		  %>
		  <%=formatnumber(nowtichen,3)%>&nbsp;元 	
	</td>
    <td align="center"><%=formatnumber(rs_login("gongzi")+nowtichen,3)%>&nbsp;元</td>	
  </tr>
  <%
    rs_login.movenext
  loop
  %>
</table>
<!--endprint-->
</td>
<td></td>
</tr>
<tr>

</table>
</body>
</html>