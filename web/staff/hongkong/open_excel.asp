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
<title><%=dianming%> - 船期表管理</title>
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
if currentpage<"1" then
  currentpage="1"
end if

'取得搜索关键字  
nowcustomer=request("customer")
nowsales=request("sales")
nowkeyword=request("keyword") 
%>

<%
	if fla22="0" then
		sql="select * from shipment where shipmentnum like '3%' and creator='"&session("redboy_username")&"'"
	else
  	sql="select * from shipment where shipmentnum like '3%'"
  end if
  if nowsales<>"" then
  	sql=sql&" and sales='"&nowsales&"'"
  end if
  if nowcustomer<>"" then
  	sql=sql&" and customer='"&nowcustomer&"'"
  end if  
  if nowkeyword<>"" then
  	sql=sql&" and shipmentnum="&nowkeyword
  end if
  
  if request("order1")<>"" then
    sql=sql&" order by shipmentnum "&request("order1")
  elseif request("order2")<>"" then
    sql=sql&" order by sales "&request("order2")    
  elseif request("order3")<>"" then
    sql=sql&" order by status "&request("order3")
  elseif request("order4")<>"" then
    sql=sql&" order by customer "&request("order4") 
  elseif request("order5")<>"" then
    sql=sql&" order by vendor "&request("order5") 
  elseif request("order6")<>"" then
    sql=sql&" order by contract "&request("order6") 
  elseif request("order7")<>"" then
    sql=sql&" order by material "&request("order7")
  elseif request("order8")<>"" then
    sql=sql&" order by country "&request("order8")
  elseif request("order9")<>"" then
    sql=sql&" order by plant "&request("order9")     
  elseif request("order10")<>"" then
    sql=sql&" order by boarddate "&request("order10")
  elseif request("order11")<>"" then
    sql=sql&" order by deliverydate "&request("order11") 
  elseif request("order12")<>"" then
    sql=sql&" order by case "&request("order12")
  else
  	sql=sql&" order by shipmentnum asc"    
  end if

%>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#C4D8ED">

<!--startprint-->
<table align="center" cellpadding="4" cellspacing="1" class="toptable grid" border="1">
<form name="form1">
  <input type="hidden" name="form" value="<%=request("form")%>">
  <input type="hidden" name="field" value="<%=request("field")%>">
  <input type="hidden" name="field2" value="<%=request("field2")%>">
  <input type="hidden" name="customer" value="<%=nowcustomer%>">
  <input type="hidden" name="sales" value="<%=nowsales%>">
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
  <tr align="center">    
	<td class="category" width="60" height="30">序号</td>
	<td class="category" width="60" height="30">状态</td>	
	<td class="category" width="60" height="30">结算单状态</td>	
	<td class="category" width="60" height="30">类型</td>	
	<td class="category" width="60" height="30">销售员</td>	
	<td class="category" width="60" height="30">代理公司</td>
	<td class="category" width="60" height="30">货运公司</td>	
	<td class="category" width="100" height="30">客户名称</td>
	<td class="category" width="100" height="30">供应商名称</td>
	<td class="category" width="100" height="30">原始合同号</td>
	<td class="category" width="100" height="30">客户合同号</td>	
	<td class="category" width="60" height="30">厂号</td>	
	<td class="category" width="80" height="30">国家</td>		
	<td class="category" width="80" height="30">付款方式</td>	
	<td class="category" width="80" height="30">品名一</td>
	<td class="category" width="80" height="30">采购价格一</td>
	<td class="category" width="100" height="30">备注一</td>		
	<td class="category" width="80" height="30">销售价格一</td>
	<td class="category" width="60" height="30">件数一</td>
	<td class="category" width="80" height="30">合同重量一</td>
	<td class="category" width="80" height="30">实际重量一</td>
	<td class="category" width="80" height="30">品名二</td>
	<td class="category" width="80" height="30">采购价格二</td>
	<td class="category" width="100" height="30">备注二</td>		
	<td class="category" width="80" height="30">销售价格二</td>
	<td class="category" width="60" height="30">件数二</td>
	<td class="category" width="80" height="30">合同重量二</td>
	<td class="category" width="80" height="30">实际重量二</td>	
	<td class="category" width="80" height="30">品名三</td>
	<td class="category" width="80" height="30">采购价格三</td>
	<td class="category" width="100" height="30">备注三</td>		
	<td class="category" width="80" height="30">销售价格三</td>
	<td class="category" width="60" height="30">件数三</td>
	<td class="category" width="80" height="30">合同重量三</td>
	<td class="category" width="80" height="30">实际重量三</td>	
	<td class="category" width="80" height="30">品名四</td>
	<td class="category" width="80" height="30">采购价格四</td>
	<td class="category" width="100" height="30">备注四</td>	
	<td class="category" width="80" height="30">销售价格四</td>
	<td class="category" width="60" height="30">件数四</td>
	<td class="category" width="80" height="30">合同重量四</td>
	<td class="category" width="80" height="30">实际重量四</td>		
	<td class="category" width="80" height="30">品名五</td>
	<td class="category" width="80" height="30">采购价格五</td>
	<td class="category" width="100" height="30">备注五</td>		
	<td class="category" width="80" height="30">销售价格五</td>
	<td class="category" width="60" height="30">件数五</td>
	<td class="category" width="80" height="30">合同重量五</td>
	<td class="category" width="80" height="30">实际重量五</td>	
	<td class="category" width="60" height="30">单位</td>
	<td class="category" width="80" height="30">动检证公司</td>  
	<td class="category" width="80" height="30">动检证</td> 
	<td class="category" width="80" height="30">自动证公司</td>  
	<td class="category" width="80" height="30">自动证</td>      
	<td class="category" width="80" height="30">预计装船期</td>  
	<td class="category" width="80" height="30">目的港</td>  
	<td class="category" width="80" height="30">装船期</td>  
	<td class="category" width="80" height="30">到港期</td>
	<td class="category" width="80" height="30">箱号</td>  	
	<td class="category" width="80" height="30">总件数</td>  
	<td class="category" width="80" height="30">总重量</td>
	<td class="category" width="80" height="30">卫生证</td>  
	<td class="category" width="80" height="30">提单号</td>
	<td class="category" width="80" height="30">船名</td>    
	<td class="category" width="80" height="30">付款日期</td>	
	<td class="category" width="80" height="30">付款金额</td>	
	<td class="category" width="60" height="30">币种</td>	
	<td class="category" width="80" height="30">交单日期</td>	
	<td class="category" width="80" height="30">汇率</td>   
	<td class="category" width="80" height="30">银行费用</td>	
	<td class="category" width="80" height="30">船公司费用</td>	
	<td class="category" width="80" height="30">佣金</td>		
<!--	<td class="category" width="60" height="30">销售价格</td>-->
	<td class="category" width="80" height="30">实际成本</td>	
	<td class="category" width="80" height="30">实际收入</td>	
	<td class="category" width="80" height="30">预估利润</td>	
	<td class="category" width="80" height="30">实际利润</td>	
  </tr>
  <%
  set rs_shipment =server.createobject("ADODB.RecordSet")	
  rs_shipment.open sql,conn,1,3
  'response.write sql
  if not rs_shipment.eof then
  rs_shipment.pagesize=999999
  rs_shipment.absolutepage=currentpage
  do while rs_shipment.eof=false
  %>
	<tr>
	<td align="center" height="30"><%=rs_shipment("shipmentnum")%></td>
  <td align="center"><%=rs_shipment("status")%></td>
  <td align="center"><%=rs_shipment("invoicestatus")%></td>  
  <td align="center"><%=rs_shipment("trantype")%></td>    
  <td align="center"><%=rs_shipment("sales")%></td>	  
  <td align="center"><%=rs_shipment("agent")%></td>	  
  <td align="center"><%=rs_shipment("delivery")%></td>	    
  <td align="center"><%=rs_shipment("customer")%></td>
  <td align="center"><%=rs_shipment("vendor")%></td>
  <td align="center"><%=rs_shipment("contract")%></td>
  <td align="center"><%=rs_shipment("custcontract")%></td>
  <td align="center"><%=rs_shipment("plant")%></td>	    
  <td align="center"><%=rs_shipment("country")%></td>	    
  <td align="center"><%=rs_shipment("incoterm")%></td>
  <td align="center"><%=rs_shipment("material")%></td>
  <td align="center"><%=formatnumber(rs_shipment("price"),3)%></td>	    
  <td align="center"><%=rs_shipment("memo1")%></td>
  <td align="center"><%=formatnumber(rs_shipment("salesprice1"),3)%></td>	  
  <td align="center"><%=formatnumber(rs_shipment("case1"),0)%></td>	 
  <td align="center"><%=formatnumber(rs_shipment("contractweight1"),3)%></td>	  
  <td align="center"><%=formatnumber(rs_shipment("actualweight1"),3)%></td>	  
  <td align="center"><%=rs_shipment("material2")%></td>
  <td align="center"><%=formatnumber(rs_shipment("price2"),3)%></td>	    
  <td align="center"><%=rs_shipment("memo2")%></td>  
  <td align="center"><%=formatnumber(rs_shipment("salesprice2"),3)%></td>	  
  <td align="center"><%=formatnumber(rs_shipment("case2"),0)%></td>	 
  <td align="center"><%=formatnumber(rs_shipment("contractweight2"),3)%></td>	  
  <td align="center"><%=formatnumber(rs_shipment("actualweight2"),3)%></td>	  
  <td align="center"><%=rs_shipment("material3")%></td>
  <td align="center"><%=formatnumber(rs_shipment("price3"),3)%></td>	    
  <td align="center"><%=rs_shipment("memo3")%></td>  
  <td align="center"><%=formatnumber(rs_shipment("salesprice3"),3)%></td>	  
  <td align="center"><%=formatnumber(rs_shipment("case3"),0)%></td>	 
  <td align="center"><%=formatnumber(rs_shipment("contractweight3"),3)%></td>	  
  <td align="center"><%=formatnumber(rs_shipment("actualweight3"),3)%></td>	  
  <td align="center"><%=rs_shipment("material4")%></td>
  <td align="center"><%=formatnumber(rs_shipment("price4"),3)%></td>	    
  <td align="center"><%=rs_shipment("memo4")%></td>  
  <td align="center"><%=formatnumber(rs_shipment("salesprice4"),3)%></td>	  
  <td align="center"><%=formatnumber(rs_shipment("case4"),0)%></td>	 
  <td align="center"><%=formatnumber(rs_shipment("contractweight4"),3)%></td>	  
  <td align="center"><%=formatnumber(rs_shipment("actualweight4"),3)%></td>	  
  <td align="center"><%=rs_shipment("material5")%></td>
  <td align="center"><%=formatnumber(rs_shipment("price5"),3)%></td>	    
  <td align="center"><%=rs_shipment("memo5")%></td>  
  <td align="center"><%=formatnumber(rs_shipment("salesprice5"),3)%></td>	  
  <td align="center"><%=formatnumber(rs_shipment("case5"),0)%></td>	 
  <td align="center"><%=formatnumber(rs_shipment("contractweight5"),3)%></td>	  
  <td align="center"><%=formatnumber(rs_shipment("actualweight5"),3)%></td>	  
  <td align="center"><%=rs_shipment("unit")%></td>
  <td align="center"><%=rs_shipment("dongjiancom")%></td>
  <td align="center"><%=rs_shipment("dongjian")%></td>  
  <td align="center"><%=rs_shipment("zidongcom")%></td>  
  <td align="center"><%=rs_shipment("zidong")%></td>  
  <td align="center"><%=rs_shipment("planship")%></td>  
  <td align="center"><%=rs_shipment("destination")%></td>  
  <td align="center"><%=rs_shipment("shipdate")%></td>    
  <td align="center"><%=rs_shipment("boarddate")%></td>
  <td align="center"><%=rs_shipment("case")%></td>  
  <td align="center"><%=rs_shipment("casenumber")%></td>  
  <td align="center"><%=formatnumber(rs_shipment("netweight"),3)%></td>
  <td align="center"><%=rs_shipment("weishengzheng")%></td>  
  <td align="center"><%=rs_shipment("ladnumber")%></td>
  <td align="center"><%=rs_shipment("shipname")%></td>    
  <td align="center"><%=rs_shipment("paydate")%></td>  
  <td align="center"><%=formatnumber(rs_shipment("payment"),3)%></td>  
  <td align="center"><%=rs_shipment("trancurrency")%></td>  
  <td align="center"><%=rs_shipment("deliverydate")%></td>  
  <td align="center"><%=formatnumber(rs_shipment("exchange"),3)%></td>
  <td align="center"><%=formatnumber(rs_shipment("bankfare"),3)%></td>  
  <td align="center"><%=formatnumber(rs_shipment("agentfare"),3)%></td>  
  <td align="center"><%=formatnumber(rs_shipment("commission"),3)%></td>  
<!--  <td align="center"><%=formatnumber(rs_shipment("listprice"),3)%></td>-->  
  <td align="center"><%=formatnumber(rs_shipment("actcost"),3)%></td>  
  <td align="center"><%=formatnumber(rs_shipment("actrevenue"),3)%></td>  
  <td align="center"><%=formatnumber(rs_shipment("planprofit"),3)%></td>  
  <td align="center"><%=formatnumber(rs_shipment("actprofit"),3)%></td>  

  </tr>
  <%
  	'end if
    rs_shipment.movenext
  loop
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