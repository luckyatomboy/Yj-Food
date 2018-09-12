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
<title><%=dianming%> - 香港船期表</title>
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
<!--if fla1="0" and session("redboy_id")<>"1" then-->
if fla21="0" and fla22="0" then
%>
<br><center><img src="../images/note.gif" align="absmiddle">&nbsp;<font color="#FF0000">你不具备此权限，请与管理员联系！</font></center>
<%  
  response.end
end if
%>

<%
if request("hid1")="ok" then
sql="select * from shipment where contract='"&request("contract")&"'"
set rs=conn.execute(sql)
if rs.eof=false then
%>
<script language="javascript">
alert("您输入的合同号已经存在，请重新输入！")
window.history.go(-1)
</script> 
<%
  response.end
end if
nowtrantype=request("trantype")
nowstatus=request("status")
nowinvoicestatus=request("invoicestatus")
nowcustomer=request("customer")
nowvendor=request("vendor")
nowcontract=request("contract")
nowcountry=request("country")
nowunit="公斤"
if request("material")<>"" then
	nowmaterial=request("material")
<!--
	nowplant1=request("plant1")
	nowspec=request("spec")
-->
	nowmemo1=request("memo1")	
	nowprice=request("price")
	nowsalesprice1=request("salesprice1")
	nowcontractweight1=request("contractweight1")
	nowactualweight1=request("actualweight1")
else
	nowmaterial=""
<!--
	nowplant1=""
	nowspec=""
-->
	nowmemo1=""	
	nowprice=0	
	nowsalesprice1=0
	nowcontractweight1=0
	nowactualweight1=0
end if
if request("material2")<>"" then
	nowmaterial2=request("material2")
	nowmemo2=request("memo2")	
	nowprice2=request("price2")
	nowsalesprice2=request("salesprice2")
	nowcontractweight2=request("contractweight2")
	nowactualweight2=request("actualweight2")	
else
	nowmaterial2=""
	nowmemo2=""
	nowprice2=0	
	nowsalesprice2=0
	nowcontractweight2=0
	nowactualweight2=0
end if
if request("material3")<>"" then
	nowmaterial3=request("material3")
	nowmemo3=request("memo3")	
	nowprice3=request("price3")
	nowsalesprice3=request("salesprice3")
	nowcontractweight3=request("contractweight3")
	nowactualweight3=request("actualweight3")	
else
	nowmaterial3=""
	nowmemo3=""
	nowprice3=0		
	nowsalesprice3=0
	nowcontractweight3=0
	nowactualweight3=0
end if
if request("material4")<>"" then
	nowmaterial4=request("material4")
	nowmemo4=request("memo4")	
	nowprice4=request("price4")
	nowsalesprice4=request("salesprice4")
	nowcontractweight4=request("contractweight4")
	nowactualweight4=request("actualweight4")	
else
	nowmaterial4=""
	nowmemo4=""
	nowprice4=0		
	nowsalesprice4=0
	nowcontractweight4=0
	nowactualweight4=0
end if
if request("material5")<>"" then
	nowmaterial5=request("material5")
	nowmemo5=request("memo5")	
	nowprice5=request("price5")
	nowsalesprice5=request("salesprice5")
	nowcontractweight5=request("contractweight5")
	nowactualweight5=request("actualweight5")	
else
	nowmaterial5=""
	nowmemo5=""	
	nowprice5=0		
	nowsalesprice5=0
	nowcontractweight5=0
	nowactualweight5=0
end if
nowincoterm=request("incoterm")
nowplanship=request("planship")
nowdestination=request("destination")
<!--nowcontractweight=request("contractweight")-->
nowplant=request("plant")
nowshipdate=request("shipdate")
nowboarddate=request("boarddate")
nowcasenumber=request("casenumber")
nowcase=request("case")
nowdeliverydate=request("deliverydate")
nowladnumber=request("ladnumber")
nowshipname=request("shipname")
nowweisheng=request("weishengzheng")
nowdongjian=request("dongjian")
nowdongjiancom=request("dongjiancom")
nowzidong=request("zidong")
nowzidongcom=request("zidongcom")
<!--nownetweight=request("netweight")-->
nowclaim=request("claim")
nowapplycustom=request("applycustom")
nowpaydate=request("paydate")
nowpayment=request("payment")
nowcurrency=request("currency")
nowmemo=request("memo")
nowsales=request("sales")
nowagent=request("agent")
nowdelivery=request("delivery")
nowexchange=request("exchange")
nowbankfare=request("bankfare")
nowagentfare=request("agentfare")
nowcommission=request("commission")
<!--nowlistprice=request("listprice")-->
nowactcost=request("actcost")
<!--
nowactrevenue=nowlistprice*nownetweight*nowexchange+nowbankfare+nowagentfare+nowcommission
nowplanprofit=(nowlistprice-nowprice)*nowcontractweight*nowexchange
-->
nowactrevenue=(nowsalesprice1*nowactualweight1+nowsalesprice2*nowactualweight2+nowsalesprice3*nowactualweight3+nowsalesprice4*nowactualweight4+nowsalesprice5*nowactualweight5)*nowexchange+nowbankfare+nowagentfare+nowcommission
nowplanprofit=((nowsalesprice1-nowprice)*nowcontractweight1+(nowsalesprice2-nowprice2)*nowcontractweight2+(nowsalesprice3-nowprice3)*nowcontractweight3+(nowsalesprice4-nowprice4)*nowcontractweight4+(nowsalesprice5-nowprice5)*nowcontractweight5)*nowexchange
nowactprofit=nowactrevenue-nowactcost

sql="select top 1 * from shipment where shipmentnum like '3%' order by shipmentnum desc"
set rs_count=conn.execute(sql)

if rs_count.bof and rs_count.eof then
	nowshipment="30000001"
else
	rs_count.movefirst
	nowshipment=rs_count("shipmentnum") + 1
end if	

<!--sql="insert into shipment(trantype,customer,vendor,contract,material,country,spec,price,unit,incoterm,createdate,creator) values('"&nowtrantype&"','"&nowcustomer&"',"&nowvendor&",'"&nowcontract&"','"&nowmaterial&"','"&nowcountry&"','"&nowspec&"',"&nowprice&",'"&nowunit&"','"&nowincoterm&"',#"&now()&"#,'"&session("redboy_username")&"')"-->
<!--sql="insert into shipment(shipmentnum,trantype,status,invoicestatus,sales,agent,delivery,customer,vendor,contract,country,material,plant1,spec,price,material2,plant2,spec2,price2,material3,plant3,spec3,price3,material4,plant4,spec4,price4,material5,plant5,spec5,price5,unit,incoterm,planship,plant,shipdate,boarddate,case,casenumber,ladnumber,shipname,netweight,paydate,payment,trancurrency,deliverydate,exchange,bankfare,agentfare,commission,listprice,actcost,actrevenue,planprofit,actprofit,createdate,creator) values("&nowshipment&",'"&nowtrantype&"','"&nowstatus&"','"&nowinvoicestatus&"','"&nowsales&"','"&nowagent&"','"&nowdelivery&"','"&nowcustomer&"','"&nowvendor&"','"&nowcontract&"','"&nowcountry&"','"&nowmaterial&"','"&nowplant1&"','"&nowspec&"',"&nowprice&",'"&nowmaterial2&"','"&nowplant2&"','"&nowspec2&"',"&nowprice2&",'"&nowmaterial3&"','"&nowplant3&"','"&nowspec3&"',"&nowprice3&",'"&nowmaterial4&"','"&nowplant4&"','"&nowspec4&"',"&nowprice4&",'"&nowmaterial5&"','"&nowplant5&"','"&nowspec5&"',"&nowprice5&",'"&nowunit&"','"&nowincoterm&"','"&nowplanship&"','"&nowplant&"','"&nowshipdate&"','"&nowboarddate&"','"&nowcase&"',"&nowcasenumber&",'"&nowladnumber&"','"&nowshipname&"',"&nownetweight&",'"&nowpaydate&"',"&nowpayment&",'"&nowcurrency&"','"&nowdeliverydate&"',"&nowexchange&","&nowbankfare&","&nowagentfare&","&nowcommission&","&nowlistprice&","&nowactcost&","&nowactrevenue&","&nowplanprofit&","&nowactprofit&",#"&now()&"#,'"&session("redboy_username")&"')"-->
sql="insert into shipment(shipmentnum,trantype,status,invoicestatus,sales,agent,delivery,customer,vendor,contract,country,material,price,memo1,salesprice1,contractweight1,actualweight1,material2,price2,memo2,salesprice2,contractweight2,actualweight2,material3,price3,memo3,salesprice3,contractweight3,actualweight3,material4,price4,memo4,salesprice4,contractweight4,actualweight4,material5,price5,memo5,salesprice5,contractweight5,actualweight5,unit,incoterm,planship,destination,plant,shipdate,boarddate,case,casenumber,ladnumber,shipname,weishengzheng,dongjian,dongjiancom,zidong,zidongcom,paydate,payment,trancurrency,deliverydate,exchange,bankfare,agentfare,commission,actcost,actrevenue,planprofit,actprofit,createdate,creator) values("&nowshipment&",'"&nowtrantype&"','"&nowstatus&"','"&nowinvoicestatus&"','"&nowsales&"','"&nowagent&"','"&nowdelivery&"','"&nowcustomer&"','"&nowvendor&"','"&nowcontract&"','"&nowcountry&"','"&nowmaterial&"',"&nowprice&",'"&nowmemo1&"',"&nowsalesprice1&","&nowcontractweight1&","&nowactualweight1&",'"&nowmaterial2&"',"&nowprice2&",'"&nowmemo2&"',"&nowsalesprice2&","&nowcontractweight2&","&nowactualweight2&",'"&nowmaterial3&"',"&nowprice3&",'"&nowmemo3&"',"&nowsalesprice3&","&nowcontractweight3&","&nowactualweight3&",'"&nowmaterial4&"',"&nowprice4&",'"&nowmemo4&"',"&nowsalesprice4&","&nowcontractweight4&","&nowactualweight4&",'"&nowmaterial5&"',"&nowprice5&",'"&nowmemo5&"',"&nowsalesprice5&","&nowcontractweight5&","&nowactualweight5&",'"&nowunit&"','"&nowincoterm&"','"&nowplanship&"','"&nowdestination&"','"&nowplant&"','"&nowshipdate&"','"&nowboarddate&"','"&nowcase&"',"&nowcasenumber&",'"&nowladnumber&"','"&nowshipname&"','"&nowweisheng&"','"&nowdongjian&"','"&nowdongjiancom&"','"&nowzidong&"','"&nowzidongcom&"','"&nowpaydate&"',"&nowpayment&",'"&nowcurrency&"','"&nowdeliverydate&"',"&nowexchange&","&nowbankfare&","&nowagentfare&","&nowcommission&","&nowactcost&","&nowactrevenue&","&nowplanprofit&","&nowactprofit&",#"&now()&"#,'"&session("redboy_username")&"')"
conn.execute(sql)
%>
<script language="javascript">
//alert(&nowshipment&)
alert("船期表录入成功！")
window.location.href="hongkong.asp"
</script>
<%
else
%>
<script language="javascript">
function check1(){
<!-- 检查合同号 -->
if (document.form1.contract.value=="")
{
alert("请输入合同号！");
return false;
}
<!-- 检查自动证 -->
<!-- 检查自动证 -->
if (isNumberString(document.form1.price.value,"1234567890.")!=1)
{
alert("品名一采购价格无效!");
return false;
}
if (isNumberString(document.form1.salesprice1.value,"1234567890.")!=1)
{
alert("品名一销售价格无效!");
return false;
}
if (isNumberString(document.form1.contractweight1.value,"1234567890.")!=1)
{
alert("品名一合同重量无效!");
return false;
}
if (isNumberString(document.form1.actualweight1.value,"1234567890.")!=1)
{
alert("品名一实际重量无效!");
return false;
}
if (isNumberString(document.form1.price2.value,"1234567890.")!=1)
{
alert("品名二采购价格无效!");
return false;
}
if (isNumberString(document.form1.salesprice2.value,"1234567890.")!=1)
{
alert("品名二销售价格无效!");
return false;
}
if (isNumberString(document.form1.contractweight2.value,"1234567890.")!=1)
{
alert("品名二合同重量无效!");
return false;
}
if (isNumberString(document.form1.actualweight2.value,"1234567890.")!=1)
{
alert("品名二实际重量无效!");
return false;
}
if (isNumberString(document.form1.price3.value,"1234567890.")!=1)
{
alert("品名三采购价格无效!");
return false;
}
if (isNumberString(document.form1.salesprice3.value,"1234567890.")!=1)
{
alert("品名三销售价格无效!");
return false;
}
if (isNumberString(document.form1.contractweight3.value,"1234567890.")!=1)
{
alert("品名三合同重量无效!");
return false;
}
if (isNumberString(document.form1.actualweight3.value,"1234567890.")!=1)
{
alert("品名三实际重量无效!");
return false;
}
if (isNumberString(document.form1.price4.value,"1234567890.")!=1)
{
alert("品名四采购价格无效!");
return false;
}
if (isNumberString(document.form1.salesprice4.value,"1234567890.")!=1)
{
alert("品名四销售价格无效!");
return false;
}
if (isNumberString(document.form1.contractweight4.value,"1234567890.")!=1)
{
alert("品名四合同重量无效!");
return false;
}
if (isNumberString(document.form1.actualweight4.value,"1234567890.")!=1)
{
alert("品名四实际重量无效!");
return false;
}
if (isNumberString(document.form1.price5.value,"1234567890.")!=1)
{
alert("品名五采购价格无效!");
return false;
}
if (isNumberString(document.form1.salesprice5.value,"1234567890.")!=1)
{
alert("品名五销售价格无效!");
return false;
}
if (isNumberString(document.form1.contractweight5.value,"1234567890.")!=1)
{
alert("品名五合同重量无效!");
return false;
}
if (isNumberString(document.form1.actualweight5.value,"1234567890.")!=1)
{
alert("品名五实际重量无效!");
return false;
}
if (isNumberString(document.form1.casenumber.value,"1234567890.")!=1)
{
alert("箱数无效!");
return false;
}
/*
if (isNumberString(document.form1.contractweight.value,"1234567890.")!=1)
{
alert("合同重量无效!");
return false;
}
if (isNumberString(document.form1.netweight.value,"1234567890.")!=1)
{
alert("净重无效!");
return false;
}
*/
if (isNumberString(document.form1.payment.value,"1234567890.")!=1)
{
alert("付款金额无效!");
return false;
}
if (isNumberString(document.form1.exchange.value,"1234567890.")!=1)
{
alert("汇率无效!");
return false;
}
if (isNumberString(document.form1.bankfare.value,"1234567890.")!=1)
{
alert("银行费用无效!");
return false;
}
if (isNumberString(document.form1.agentfare.value,"1234567890.")!=1)
{
alert("船公司费用无效!");
return false;
}
if (isNumberString(document.form1.commission.value,"1234567890.")!=1)
{
alert("佣金无效!");
return false;
}
/*
if (isNumberString(document.form1.listprice.value,"1234567890.")!=1)
{
alert("销售价格无效!");
return false;
}
*/
if (isNumberString(document.form1.actcost.value,"1234567890.")!=1)
{
alert("实际成本无效!");
return false;
}
}
</script>
<%
if request("hid2")="ok" then
sql="select * from shipment where shipmentnum="&request("reference")
end if
set rs_reference=conn.execute(sql)
%>
<!--<table align="center" cellpadding="4" cellspacing="1" class="toptable grid" border="1">-->
	<form name="form2">
		<tr>
			<td width="5%" height="21">
				<input type="submit" class="button" name="copy" value="复制新船期表">
				<input type="hidden" name="hid2" value="ok">
			</td>
			<td width="20%">
				<input name="reference" style="width:100px">
			</td>
			<td align="right">&nbsp;</td>
		</tr>		
	</form>
<!--</table>
-->
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#C4D8ED">
<tr>
<td><img src="../images/r_1.gif" alt="" /></td>
<td width="100%" background="../images/r_0.gif">
  <table cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td>&nbsp;船期表 </td>
	  <td align="right">&nbsp;</td>
    </tr>
  </table>
</td>
<td><img src="../images/r_2.gif" alt="" /></td>
</tr>
<tr>
<td></td>
<td>
<table align="center" cellpadding="4" cellspacing="1" class="toptable grid" border="1">
	  <form name="form1">
      <tr>
        <td width="20%" align="right" height="30">类型：</td>
        <td width="80%" class="category" readonly >
					<%
					sql="select * from trantype"
					set rs_trantype=conn.execute(sql)
					%>
					<select name="trantype">
						<option value="自营">自营</option>
					</select>
					&nbsp;&nbsp;&nbsp;&nbsp;状态
					<%	
					sql="select * from status"
					set rs_status=conn.execute(sql)
					%>
					<select name="status">
						<%do while rs_status.eof=false%>
						<%if request("hid2")="ok" then%>
						<option value="<%=rs_status("status")%>" <%if rs_status("status")=rs_reference("status") then%>selected="selected"<%end if%>><%=rs_status("status")%></option>
						<%else%>
						<option value="<%=rs_status("status")%>"><%=rs_status("status")%></option>
						<%
							end if
							rs_status.movenext
							loop
						%>
					</select>
					&nbsp;&nbsp;&nbsp;&nbsp;结算单状态
					<%
					sql="select * from invoicestatus"
					set rs_invoicestatus=conn.execute(sql)
					%>
					<select name="invoicestatus">
						<%do while rs_invoicestatus.eof=false%>
						<%if request("hid2")="ok" then%>
							<option value="<%=rs_invoicestatus("status")%>" <%if rs_invoicestatus("status")=rs_reference("invoicestatus") then%>selected="selected"<%end if%>><%=rs_invoicestatus("status")%></option>
						<%else%>
						<option value="<%=rs_invoicestatus("status")%>"><%=rs_invoicestatus("status")%></option>
						<%
							end if
							rs_invoicestatus.movenext
							loop
						%>
					</select>							
			  </td>
			</tr>
      <tr>
        <td width="20%" align="right" height="30">销售员：</td>
        <td width="80%" class="category" readonly >
					<%
					sql="select * from sales"
					set rs_sales=conn.execute(sql)
					%>
					<select name="sales">
						<%do while rs_sales.eof=false%>
							<option value="<%=rs_sales("name")%>"><%=rs_sales("name")%></option>
						<%
							rs_sales.movenext
							loop
						%>						
					</select>
					&nbsp;&nbsp;&nbsp;&nbsp;代理公司
					<%
					sql="select * from agent"
					set rs_agent=conn.execute(sql)
					%>
					<select name="agent">
						<option value="">请选择代理公司</option>
						<%do while rs_agent.eof=false%>
						<option value="<%=rs_agent("company")%>"><%=rs_agent("company")%></option>
						<%
							rs_agent.movenext
							loop
						%>
					</select>			
					&nbsp;&nbsp;&nbsp;&nbsp;货运公司
					<%
					sql="select * from delivery"
					set rs_delivery=conn.execute(sql)
					%>
					<select name="delivery">
						<option value="">请选择货运公司</option>
						<%do while rs_delivery.eof=false%>
						<option value="<%=rs_delivery("delivery")%>"><%=rs_delivery("delivery")%></option>
						<%
							rs_delivery.movenext
							loop
						%>
					</select>								
			  </td>
			</tr>			
      <tr>	  
	    	<td align="right" height="30">客户：</td>
        <td class="category">
					<%
					sql="select * from customer"
					set rs_customer=conn.execute(sql)
					%>
					<select name="customer">
						<%
							do while rs_customer.eof=false
						%>
							<option value="<%=rs_customer("customername")%>"><%=rs_customer("customername")%></option>
						<%
							rs_customer.movenext
							loop
						%>
					</select>
					&nbsp;&nbsp;&nbsp;供应商
					<%
					sql="select * from vendor"
					set rs_vendor=conn.execute(sql)
					%>
					<select name="vendor">
						<%
							do while rs_vendor.eof=false
						%>
							<option value="<%=rs_vendor("vendorname")%>"><%=rs_vendor("vendorname")%></option>
						<%
							rs_vendor.movenext
							loop
						%>
					</select>
				</td>
      </tr>
      <tr>	  
	    	<td align="right" height="30">合同号：</td>
        <td class="category">
		  		<input name="contract" value="<%=contract%>" style="width:150px" maxlength="20">
				</td>
      </tr>     
      <tr>	  
	    	<td align="right" height="30">厂号：</td>
        <td class="category">
					<input name="plant" style="width:100px">
					&nbsp;&nbsp;&nbsp;国别
					<%
					sql="select * from country"
					set rs_country=conn.execute(sql)
					%>
					<select name="country">
						<%
							do while rs_country.eof=false
						%>
							<option value="<%=rs_country("country")%>"><%=rs_country("country")%></option>
						<%
							rs_country.movenext
							loop
						%>
					</select>
		  		&nbsp;&nbsp;&nbsp;付款方式
		  		<input name="incoterm" style="width:150px">					
				</td>
      </tr>       
      <tr>	  
	    	<td align="right" height="30">品名一：</td>
        <td class="category">
					<%
					sql="select * from material"
					set rs_mat=conn.execute(sql)
					%>
					<select name="material">
						<option value="">请选择品名</option>
						<%
							do while rs_mat.eof=false
						%>
							<option value="<%=rs_mat("materialname")%>"><%=rs_mat("materialname")%></option>
						<%
							rs_mat.movenext
							loop
						%>
					</select>	      
<!--					
					&nbsp;&nbsp;&nbsp;小厂号
					<input name="plant1" style="width:100px">
		  		&nbsp;&nbsp;&nbsp;规格
		  		<input name="spec" style="width:100px">
-->
					&nbsp;&nbsp;&nbsp;备注
					<input name="memo1" style="width:120px">		  		
		  		&nbsp;&nbsp;&nbsp;采购价格
		  		<input name="price" style="width:80px" value=0 onKeyPress="javascript:CheckNum();">&nbsp;/公斤  
		  		&nbsp;&nbsp;&nbsp;销售价格
		  		<input name="salesprice1" style="width:80px" value=0 onKeyPress="javascript:CheckNum();">
		  		&nbsp;&nbsp;&nbsp;合同重量
		  		<input name="contractweight1" style="width:80px" value=0 onKeyPress="javascript:CheckNum();">
		  		&nbsp;&nbsp;&nbsp;实际重量
		  		<input name="actualweight1" style="width:80px" value=0 onKeyPress="javascript:CheckNum();">				  						  				
				</td>
      </tr>
      <tr>	  
	    	<td align="right" height="30">品名二：</td>
        <td class="category">
					<%
					sql="select * from material"
					set rs_mat2=conn.execute(sql)
					%>
					<select name="material2">
						<option value="">请选择品名</option>
						<%
							do while rs_mat2.eof=false
						%>
							<option value="<%=rs_mat2("materialname")%>"><%=rs_mat2("materialname")%></option>
						<%
							rs_mat2.movenext
							loop
						%>
					</select>	           	
<!--					
					&nbsp;&nbsp;&nbsp;小厂号
					<input name="plant2" style="width:100px">					
		  		&nbsp;&nbsp;&nbsp;规格
		  		<input name="spec2" style="width:100px">
-->
					&nbsp;&nbsp;&nbsp;备注
					<input name="memo2" style="width:120px">			  		
		  		&nbsp;&nbsp;&nbsp;采购价格
		  		<input name="price2" style="width:80px" value=0 onKeyPress="javascript:CheckNum();">&nbsp;/公斤
		  		&nbsp;&nbsp;&nbsp;销售价格
		  		<input name="salesprice2" style="width:80px" value=0 onKeyPress="javascript:CheckNum();">
		  		&nbsp;&nbsp;&nbsp;合同重量
		  		<input name="contractweight2" style="width:80px" value=0 onKeyPress="javascript:CheckNum();">
		  		&nbsp;&nbsp;&nbsp;实际重量
		  		<input name="actualweight2" style="width:80px" value=0 onKeyPress="javascript:CheckNum();">				  		
				</td>
      </tr>
      <tr>	  
	    	<td align="right" height="30">品名三：</td>
        <td class="category">
					<%
					sql="select * from material"
					set rs_mat3=conn.execute(sql)
					%>
					<select name="material3">
						<option value="">请选择品名</option>
						<%
							do while rs_mat3.eof=false
						%>
							<option value="<%=rs_mat3("materialname")%>"><%=rs_mat3("materialname")%></option>
						<%
							rs_mat3.movenext
							loop
						%>
					</select>	           	
<!--					
					&nbsp;&nbsp;&nbsp;小厂号
					<input name="plant3" style="width:100px">					
		  		&nbsp;&nbsp;&nbsp;规格
		  		<input name="spec3" style="width:100px">
-->
					&nbsp;&nbsp;&nbsp;备注
					<input name="memo3" style="width:120px">			  		
		  		&nbsp;&nbsp;&nbsp;采购价格
		  		<input name="price3" style="width:80px" value=0 onKeyPress="javascript:CheckNum();">&nbsp;/公斤
		  		&nbsp;&nbsp;&nbsp;销售价格
		  		<input name="salesprice3" style="width:80px" value=0 onKeyPress="javascript:CheckNum();">
		  		&nbsp;&nbsp;&nbsp;合同重量
		  		<input name="contractweight3" style="width:80px" value=0 onKeyPress="javascript:CheckNum();">
		  		&nbsp;&nbsp;&nbsp;实际重量
		  		<input name="actualweight3" style="width:80px" value=0 onKeyPress="javascript:CheckNum();">				  		
				</td>
      </tr>      
      <tr>	  
	    	<td align="right" height="30">品名四：</td>
        <td class="category">
					<%
					sql="select * from material"
					set rs_mat4=conn.execute(sql)
					%>
					<select name="material4">
						<option value="">请选择品名</option>
						<%
							do while rs_mat4.eof=false
						%>
							<option value="<%=rs_mat4("materialname")%>"><%=rs_mat4("materialname")%></option>
						<%
							rs_mat4.movenext
							loop
						%>
					</select>	           	
<!--					
					&nbsp;&nbsp;&nbsp;小厂号
					<input name="plant4" style="width:100px">					
		  		&nbsp;&nbsp;&nbsp;规格
		  		<input name="spec4" style="width:100px">
-->
					&nbsp;&nbsp;&nbsp;备注
					<input name="memo4" style="width:120px">			  		
		  		&nbsp;&nbsp;&nbsp;采购价格
		  		<input name="price4" style="width:80px" value=0 onKeyPress="javascript:CheckNum();">&nbsp;/公斤
		  		&nbsp;&nbsp;&nbsp;销售价格
		  		<input name="salesprice4" style="width:80px" value=0 onKeyPress="javascript:CheckNum();">
		  		&nbsp;&nbsp;&nbsp;合同重量
		  		<input name="contractweight4" style="width:80px" value=0 onKeyPress="javascript:CheckNum();">
		  		&nbsp;&nbsp;&nbsp;实际重量
		  		<input name="actualweight4" style="width:80px" value=0 onKeyPress="javascript:CheckNum();">				  		
				</td>
      </tr>     
      <tr>	  
	    	<td align="right" height="30">品名五：</td>
        <td class="category">
					<%
					sql="select * from material"
					set rs_mat5=conn.execute(sql)
					%>
					<select name="material5">
						<option value="">请选择品名</option>
						<%
							do while rs_mat5.eof=false
						%>
							<option value="<%=rs_mat5("materialname")%>"><%=rs_mat5("materialname")%></option>
						<%
							rs_mat5.movenext
							loop
						%>
					</select>	          
<!--					 	
					&nbsp;&nbsp;&nbsp;小厂号
					<input name="plant5" style="width:100px">					
		  		&nbsp;&nbsp;&nbsp;规格
		  		<input name="spec5" style="width:100px">
-->
					&nbsp;&nbsp;&nbsp;备注
					<input name="memo5" style="width:120px">			  		
		  		&nbsp;&nbsp;&nbsp;采购价格
		  		<input name="price5" style="width:80px" value=0 onKeyPress="javascript:CheckNum();">&nbsp;/公斤
		  		&nbsp;&nbsp;&nbsp;销售价格
		  		<input name="salesprice5" style="width:80px" value=0 onKeyPress="javascript:CheckNum();">
		  		&nbsp;&nbsp;&nbsp;合同重量
		  		<input name="contractweight5" style="width:80px" value=0 onKeyPress="javascript:CheckNum();">
		  		&nbsp;&nbsp;&nbsp;实际重量
		  		<input name="actualweight5" style="width:80px" value=0 onKeyPress="javascript:CheckNum();">				  		
				</td>
      </tr>       
      <tr>	  
	    	<td align="right" height="30">预计装船：</td>
        <td class="category">
		  		<input name="planship" style="width:100px">
					&nbsp;&nbsp;&nbsp;目的港
					<input name="destination" style="width:100px">					
<!--					
					&nbsp;&nbsp;&nbsp;合同重量
					<input name="contractweight" style="width:100px" maxlength="15" value=0 onKeyPress="javascript:CheckNum();">
-->					
				</td>
      </tr>
      <tr>	  
	    	<td align="right" height="30">装船期：</td>
        <td class="category">
		  		<input name="shipdate" readonly style="width:80px">
		  		<img src="../images/date.gif" align="absmiddle" style="cursor:pointer;" onClick="JavaScript:window.open('../day.asp?form=form1&field=shipdate&oldDate='+shipdate.value,'','directorys=no,toolbar=no,status=no,menubar=no,scrollbars=no,resizable=no,width=250,height=170,top=150,left=590');">
		  		&nbsp;&nbsp;&nbsp;&nbsp;到港期
		  		<input name="boarddate" readonly style="width:80px">
		  		<img src="../images/date.gif" align="absmiddle" style="cursor:pointer;" onClick="JavaScript:window.open('../day.asp?form=form1&field=boarddate&oldDate='+boarddate.value,'','directorys=no,toolbar=no,status=no,menubar=no,scrollbars=no,resizable=no,width=250,height=170,top=150,left=590');">
				</td>
      </tr> 
      <tr>	  
	    	<td align="right" height="30">箱号：</td>
        <td class="category">
		  		<input name="case" style="width:120px" maxlength="15">
		  		&nbsp;&nbsp;&nbsp;箱数
		  		<input name="casenumber" style="width:80px" maxlength="5" value=0 onKeyPress="javascript:CheckNum();">		
<!--		  		
		  		&nbsp;&nbsp;&nbsp;净重
		  		<input name="netweight" style="width:100px" maxlength="15" value=0 onKeyPress="javascript:CheckNum();">
-->
				</td>
      </tr>
      <tr>	  
	    	<td align="right" height="30">提单号：</td>
        <td class="category">
		  		<input name="ladnumber" style="width:150px" maxlength="20">
		  		&nbsp;&nbsp;&nbsp;船名
		  		<input name="shipname" style="width:180px" maxlength="20"> 		
		  		&nbsp;&nbsp;&nbsp;卫生证
		  		<input name="weishengzheng" style="width:120px" maxlength="15">
				</td>
      </tr>     
      <tr>	  
	    	<td align="right" height="30">动检证：</td>
        <td class="category">
		  		<input name="dongjian" style="width:120px" maxlength="15">
		  		&nbsp;&nbsp;&nbsp;动检公司
		  		<input name="dongjiancom" style="width:100px" maxlength="10"> 		
		  		&nbsp;&nbsp;&nbsp;自动证
		  		<input name="zidong" style="width:120px" maxlength="15">
		  		&nbsp;&nbsp;&nbsp;自动公司
		  		<input name="zidongcom" style="width:100px" maxlength="10"> 			  		
				</td>
      </tr>        
      <tr>	  
	    	<td align="right" height="30">付款日期：</td>
        <td class="category">
		  		<input name="paydate" readonly style="width:80px">
		  		<img src="../images/date.gif" align="absmiddle" style="cursor:pointer;" onClick="JavaScript:window.open('../day.asp?form=form1&field=paydate&oldDate='+paydate.value,'','directorys=no,toolbar=no,status=no,menubar=no,scrollbars=no,resizable=no,width=250,height=170,top=150,left=590');">
		  		&nbsp;&nbsp;&nbsp;付款金额
		  		<input name="payment" style="width:100px" maxlength="15" value=0 onKeyPress="javascript:CheckNum();">
		  		&nbsp;&nbsp;&nbsp;币种
					<%
					sql="select * from trancurrency"
					set rs_currency=conn.execute(sql)
					%>
					<select name="currency">
						<%
							do while rs_currency.eof=false
						%>
							<option value="<%=rs_currency("currency")%>"><%=rs_currency("currency")%></option>
						<%
							rs_currency.movenext
							loop
						%>
					</select>
				</td>
      </tr> 
      <tr>	  
	    	<td align="right" height="30">交单日期：</td>
        <td class="category">
		  		<input name="deliverydate" readonly style="width:80px">
		  		<img src="../images/date.gif" align="absmiddle" style="cursor:pointer;" onClick="JavaScript:window.open('../day.asp?form=form1&field=deliverydate&oldDate='+deliverydate.value,'','directorys=no,toolbar=no,status=no,menubar=no,scrollbars=no,resizable=no,width=250,height=170,top=150,left=590');">
				</td>
      </tr>       
      <tr>	  
	    	<td align="right" height="30">汇率：</td>
        <td class="category">
		  		<input name="exchange" style="width:100px" maxlength="15" value=0 onKeyPress="javascript:CheckNum();">
		  		&nbsp;&nbsp;&nbsp;银行费用
		  		<input name="bankfare" style="width:100px" maxlength="15" value=0 onKeyPress="javascript:CheckNum();">
		  		&nbsp;&nbsp;&nbsp;船公司费用
		  		<input name="agentfare" style="width:100px" maxlength="15" value=0 onKeyPress="javascript:CheckNum();">
		  		&nbsp;&nbsp;&nbsp;佣金
		  		<input name="Commission" style="width:100px" maxlength="15" value=0 onKeyPress="javascript:CheckNum();">		  		
				</td>
      </tr>    
<!--      
      <tr>	  
	    	<td align="right" height="30">销售价格：</td>
        <td class="category">
		  		<input name="listprice" style="width:100px" maxlength="15" value=0 onKeyPress="javascript:CheckNum();">
		  		&nbsp;&nbsp;&nbsp;实际成本
		  		<input name="actcost" style="width:100px" maxlength="15" value=0 onKeyPress="javascript:CheckNum();">
		  		&nbsp;&nbsp;&nbsp;实际收入
		  		<input name="actrevenue" style="width:100px" maxlength="15" value=0 readonly >
				</td>
      </tr>
-->           
      <tr>	  
	    	<td align="right" height="30">实际成本：</td>
        <td class="category">
		  		<input name="actcost" style="width:100px" maxlength="15" value=0 onKeyPress="javascript:CheckNum();">
		  		&nbsp;&nbsp;&nbsp;实际收入
		  		<input name="actrevenue" style="width:100px" maxlength="15" value=0 readonly >
				</td>
      </tr>   
      <tr>	  
	    	<td align="right" height="30">预估利润：</td>
        <td class="category">
		  		<input name="planprofit" style="width:100px" maxlength="15" value=0 readonly >
		  		&nbsp;&nbsp;&nbsp;实际利润
		  		<input name="actprofit" style="width:100px" maxlength="15" value=0 readonly >
				</td>
      </tr>      
      <tr>
        <td align="right" height="30">备注：</td>
        <td class="category"><textarea name="claim" cols="70" rows="3"></textarea></td>
      </tr>	 
      <tr>
	    <td height="30">&nbsp;</td>
        <td class="category">
		  <input type="submit" value=" 确认录入 " onClick="return check1()" class="button">
		  <input type="hidden" name="hid1" value="ok">
		  <input type="reset" value=" 重新填写 " class="button">
		  </td>
      </tr>
	  </form>
</table>
</td>
<td></td>
</tr>
<tr>
<td><img src="../images/r_4.gif" alt="" /></td>
<td></td>
<td><img src="../images/r_3.gif" alt="" /></td>
</tr>
</table>
<%end if%>
</body>
</html>