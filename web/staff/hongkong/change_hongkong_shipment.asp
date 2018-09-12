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
<title><%=dianming%> - 修改船期表</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../style/style.css" rel="stylesheet" type="text/css">
<style>
body {
	background-color:#FFFFFF;
}
</style>
<script>form1.profit.focus()</script>  
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
<%
if fla21="0" and fla22="0" then
%>
<br><center><img src="../images/note.gif" align="absmiddle">&nbsp;<font color="#FF0000">你不具备此权限，请与管理员联系！</font></center>
<%  
  response.end
end if
%>

<%if request("hid1")="" then%>
<script language="javascript">
function isNumberString (InString,RefString)
{
if(InString.length==0) return (false);
for (Count=0; Count < InString.length; Count++)  {
	TempChar= InString.substring (Count, Count+1);
	if (RefString.indexOf (TempChar, 0)==-1)  
	return (false);
}
return (true);
}

function check()
{
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
if (isNumberString(document.form1.case1.value,"1234567890")!=1)
{
alert("品名一件数无效!");
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
if (isNumberString(document.form1.case2.value,"1234567890")!=1)
{
alert("品名二件数无效!");
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
if (isNumberString(document.form1.case3.value,"1234567890")!=1)
{
alert("品名三件数无效!");
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
if (isNumberString(document.form1.case4.value,"1234567890")!=1)
{
alert("品名四件数无效!");
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
if (isNumberString(document.form1.case5.value,"1234567890")!=1)
{
alert("品名五件数无效!");
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
sql="select * from shipment where shipmentnum="&request("shipment")
set rs=conn.execute(sql)
%>
<tr>
<!--
	<td width="5%" height="21">&nbsp;<img src="../images/print.jpg" align="absmiddle" style="cursor:hand;" onClick="javascript:var win=window.open('../produit/print_buy.asp?bianhao=1000124','详细信息','width=853,height=470,top=176,left=161,toolbar=no,location=no,directories=no,status=no,menubar=no,resizable=no,scrollbars=yes'); win.focus()"></td>
-->
	<td width="5%" height="21">&nbsp;<img src="../images/print.jpg" align="absmiddle" style="cursor:hand;" onClick="javascript:var win=window.open('print_shipment.asp?shipmentnum=<%=rs("shipmentnum")%>','详细信息','width=853,height=470,top=176,left=161,toolbar=no,location=no,directories=no,status=no,menubar=no,resizable=no,scrollbars=yes'); win.focus()"></td>
	<td align="right">&nbsp;</td>
</tr>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#C4D8ED">
<tr>
<td><img src="../images/r_1.gif" alt="" /></td>
<td width="100%" background="../images/r_0.gif">
  <table cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td>&nbsp;修改香港船期表资料  ---  <%=rs("shipmentnum")%></td>
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
  		<input type="hidden" name="keyword" value="<%=request("keyword")%>">
  		<input type="hidden" name="shipment" value="<%=request("shipment")%>">
      <tr>
        <td width="10%" align="right" height="30">类型：</td>
        <td width="90%" class="category">
					<%
					sql="select * from trantype"
					set rs_trantype=conn.execute(sql)
					%>
					<select name="trantype">
						<%do while rs_trantype.eof=false%>
						<option value="<%=rs_trantype("trantype")%>" <%if rs_trantype("trantype")=rs("trantype") then%>selected="selected"<%end if%>><%=rs_trantype("trantype")%></option>
						<%
							rs_trantype.movenext
							loop
						%>
					</select>
					&nbsp;&nbsp;&nbsp;&nbsp;状态
					<%
					sql="select * from status"
					set rs_status=conn.execute(sql)
					%>
					<select name="status">
						<%do while rs_status.eof=false%>
						<option value="<%=rs_status("status")%>" <%if rs_status("status")=rs("status") then%>selected="selected"<%end if%>><%=rs_status("status")%></option>
						<%
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
						<option value="<%=rs_invoicestatus("status")%>" <%if rs_invoicestatus("status")=rs("invoicestatus") then%>selected="selected"<%end if%>><%=rs_invoicestatus("status")%></option>
						<%
							rs_invoicestatus.movenext
							loop
						%>
					</select>							
			  </td>
			</tr>
      <tr>
        <td width="10%" align="right" height="30">销售员：</td>
        <td width="90%" class="category" readonly >
					<%
					sql="select * from sales"
					set rs_sales=conn.execute(sql)
					%>
					<select name="sales">
						<%do while rs_sales.eof=false%>
							<option value="<%=rs_sales("name")%>"<%if rs_sales("name")=rs("sales") then%>selected="selected"<%end if%>><%=rs_sales("name")%></option>
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
						<option value="">请选择</option>
						<%do while rs_agent.eof=false%>
						<option value="<%=rs_agent("company")%>"<%if rs_agent("company")=rs("agent") then%>selected="selected"<%end if%>><%=rs_agent("company")%></option>
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
						<option value="">请选择</option>
						<%do while rs_delivery.eof=false%>
						<option value="<%=rs_delivery("delivery")%>"<%if rs_delivery("delivery")=rs("delivery") then%>selected="selected"<%end if%>><%=rs_delivery("delivery")%></option>
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
							<option value="<%=rs_customer("customername")%>" <%if rs_customer("customername")=rs("customer") then%>selected="selected"<%end if%>><%=rs_customer("customername")%></option>
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
							<option value="<%=rs_vendor("vendorname")%>" <%if rs_vendor("vendorname")=rs("vendor") then%>selected="selected"<%end if%>><%=rs_vendor("vendorname")%></option>
						<%
							rs_vendor.movenext
							loop
						%>
					</select>
				</td>
      </tr>
      <tr>	  
	    	<td align="right" height="30">原始合同号：</td>
        <td class="category">
		  		<input name="contract" value="<%=rs("contract")%>" style="width:120px" maxlength="20">
<!--20100117add-->  		
		  		&nbsp;&nbsp;&nbsp;客户合同号
		  		<input name="custcontract" value="<%=rs("custcontract")%>" style="width:120px" maxlength="20">
<!---->		  		
				</td>
      </tr>     
      <tr>	  
	    	<td align="right" height="30">厂号：</td>
        <td class="category">
					<input name="plant" style="width:100px" value="<%=rs("plant")%>">
					&nbsp;&nbsp;&nbsp;国别
					<%
					sql="select * from country"
					set rs_country=conn.execute(sql)
					%>
					<select name="country">
						<%
							do while rs_country.eof=false
						%>
							<option value="<%=rs_country("country")%>" <%if rs_country("country")=rs("country") then%>selected="selected"<%end if%>><%=rs_country("country")%></option>
						<%
							rs_country.movenext
							loop
						%>
					</select>
		  		&nbsp;&nbsp;&nbsp;付款方式
		  		<input name="incoterm" style="width:150px" value="<%=rs("incoterm")%>">					
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
							<option value="<%=rs_mat("materialname")%>" <%if rs_mat("materialname")=rs("material") then%>selected="selected"<%end if%>><%=rs_mat("materialname")%></option>
						<%
							rs_mat.movenext
							loop
						%>
					</select>		  		
<!--
					&nbsp;&nbsp;&nbsp;小厂号
					<input name="plant1" style="width:100px" value="<%=rs("plant1")%>">					
		  		&nbsp;&nbsp;&nbsp;规格
		  		<input name="spec" style="width:100px" value="<%=rs("spec")%>">
-->
					&nbsp;&nbsp;&nbsp;规格/厂号
					<input name="memo1" style="width:120px" value="<%=rs("memo1")%>">	  		
		  		&nbsp;&nbsp;&nbsp;采购价格
		  		<input name="price" style="width:80px"  value="<%=rs("price")%>" onKeyPress="javascript:CheckNum();">&nbsp;/公斤
		  		&nbsp;&nbsp;&nbsp;销售价格
		  		<input name="salesprice1" style="width:80px" value="<%=rs("salesprice1")%>" onKeyPress="javascript:CheckNum();">
		  		&nbsp;&nbsp;&nbsp;件数
		  		<input name="case1" style="width:60px" value="<%=rs("case1")%>" onKeyPress="javascript:CheckNum();">		  		
		  		&nbsp;&nbsp;&nbsp;合同重量
		  		<input name="contractweight1" style="width:80px" value="<%=rs("contractweight1")%>" onKeyPress="javascript:CheckNum();">
		  		&nbsp;&nbsp;&nbsp;实际重量
		  		<input name="actualweight1" style="width:80px" value="<%=rs("actualweight1")%>" onKeyPress="javascript:CheckNum();">				  		
				</td>
      </tr>
      <tr>	  
	    	<td align="right" height="30">品名二：</td>
        <td class="category">
					<%
					sql="select * from material"
					set rs_mat2=conn.execute(sql)
					%>
					<select name="material2" <%if fla1="0" then%>disabled<%end if%>>
						<option value="">请选择品名</option>
						<%
							do while rs_mat2.eof=false
						%>
							<option value="<%=rs_mat2("materialname")%>" <%if rs_mat2("materialname")=rs("material2") then%>selected="selected"<%end if%>><%=rs_mat2("materialname")%></option>
						<%
							rs_mat2.movenext
							loop
						%>
					</select>		  		
<!--										
					&nbsp;&nbsp;&nbsp;小厂号
					<input name="plant2" style="width:100px" value="<%=rs("plant2")%>">						
		  		&nbsp;&nbsp;&nbsp;规格
		  		<input name="spec2" style="width:100px" value="<%=rs("spec2")%>">
-->
					&nbsp;&nbsp;&nbsp;规格/厂号
					<input name="memo2" style="width:120px" value="<%=rs("memo2")%>">	  			  		
		  		&nbsp;&nbsp;&nbsp;采购价格
		  		<input name="price2" style="width:80px"  value="<%=rs("price2")%>" onKeyPress="javascript:CheckNum();">&nbsp;/公斤
		  		&nbsp;&nbsp;&nbsp;销售价格
		  		<input name="salesprice2" style="width:80px" value="<%=rs("salesprice2")%>" onKeyPress="javascript:CheckNum();">
		  		&nbsp;&nbsp;&nbsp;件数
		  		<input name="case2" style="width:60px" value="<%=rs("case2")%>" onKeyPress="javascript:CheckNum();">			  		
		  		&nbsp;&nbsp;&nbsp;合同重量
		  		<input name="contractweight2" style="width:80px" value="<%=rs("contractweight2")%>" onKeyPress="javascript:CheckNum();">
		  		&nbsp;&nbsp;&nbsp;实际重量
		  		<input name="actualweight2" style="width:80px" value="<%=rs("actualweight2")%>" onKeyPress="javascript:CheckNum();">			  		
				</td>
      </tr>    
      <tr>	  
	    	<td align="right" height="30">品名三：</td>
        <td class="category">
					<%
					sql="select * from material"
					set rs_mat3=conn.execute(sql)
					%>
					<select name="material3" <%if fla1="0" then%>disabled<%end if%>>
						<option value="">请选择品名</option>
						<%
							do while rs_mat3.eof=false
						%>
							<option value="<%=rs_mat3("materialname")%>" <%if rs_mat3("materialname")=rs("material3") then%>selected="selected"<%end if%>><%=rs_mat3("materialname")%></option>
						<%
							rs_mat3.movenext
							loop
						%>
					</select>		  		
<!--									
					&nbsp;&nbsp;&nbsp;小厂号
					<input name="plant3" style="width:100px" value="<%=rs("plant3")%>">						
		  		&nbsp;&nbsp;&nbsp;规格
		  		<input name="spec3" style="width:100px" value="<%=rs("spec3")%>">
-->
					&nbsp;&nbsp;&nbsp;规格/厂号
					<input name="memo3" style="width:120px" value="<%=rs("memo3")%>">
		  		&nbsp;&nbsp;&nbsp;采购价格
		  		<input name="price3" style="width:80px"  value="<%=rs("price3")%>" onKeyPress="javascript:CheckNum();">&nbsp;/公斤
		  		&nbsp;&nbsp;&nbsp;销售价格
		  		<input name="salesprice3" style="width:80px" value="<%=rs("salesprice3")%>" onKeyPress="javascript:CheckNum();">
		  		&nbsp;&nbsp;&nbsp;件数
		  		<input name="case3" style="width:60px" value="<%=rs("case3")%>" onKeyPress="javascript:CheckNum();">			  		
		  		&nbsp;&nbsp;&nbsp;合同重量
		  		<input name="contractweight3" style="width:80px" value="<%=rs("contractweight3")%>" onKeyPress="javascript:CheckNum();">
		  		&nbsp;&nbsp;&nbsp;实际重量
		  		<input name="actualweight3" style="width:80px" value="<%=rs("actualweight3")%>" onKeyPress="javascript:CheckNum();">			  		
				</td>
      </tr>        
      <tr>	  
	    	<td align="right" height="30">品名四：</td>
        <td class="category">
					<%
					sql="select * from material"
					set rs_mat4=conn.execute(sql)
					%>
					<select name="material4" <%if fla1="0" then%>disabled<%end if%>>
						<option value="">请选择品名</option>
						<%
							do while rs_mat4.eof=false
						%>
							<option value="<%=rs_mat4("materialname")%>" <%if rs_mat4("materialname")=rs("material4") then%>selected="selected"<%end if%>><%=rs_mat4("materialname")%></option>
						<%
							rs_mat4.movenext
							loop
						%>
					</select>		  		
<!--					
					&nbsp;&nbsp;&nbsp;小厂号
					<input name="plant4" style="width:100px" value="<%=rs("plant4")%>">						
		  		&nbsp;&nbsp;&nbsp;规格
		  		<input name="spec4" style="width:100px" value="<%=rs("spec4")%>">
-->
					&nbsp;&nbsp;&nbsp;规格/厂号
					<input name="memo4" style="width:120px" value="<%=rs("memo4")%>">	  			  		
		  		&nbsp;&nbsp;&nbsp;采购价格
		  		<input name="price4" style="width:80px"  value="<%=rs("price4")%>" onKeyPress="javascript:CheckNum();">&nbsp;/公斤
		  		&nbsp;&nbsp;&nbsp;销售价格
		  		<input name="salesprice4" style="width:80px" value="<%=rs("salesprice4")%>" onKeyPress="javascript:CheckNum();">
		  		&nbsp;&nbsp;&nbsp;件数
		  		<input name="case4" style="width:60px" value="<%=rs("case4")%>" onKeyPress="javascript:CheckNum();">			  		
		  		&nbsp;&nbsp;&nbsp;合同重量
		  		<input name="contractweight4" style="width:80px" value="<%=rs("contractweight4")%>" onKeyPress="javascript:CheckNum();">
		  		&nbsp;&nbsp;&nbsp;实际重量
		  		<input name="actualweight4" style="width:80px" value="<%=rs("actualweight4")%>" onKeyPress="javascript:CheckNum();">			  		
				</td>
      </tr>      
      <tr>	  
	    	<td align="right" height="30">品名五：</td>
        <td class="category">
					<%
					sql="select * from material"
					set rs_mat5=conn.execute(sql)
					%>
					<select name="material5" <%if fla1="0" then%>disabled<%end if%>>
						<option value="">请选择品名</option>
						<%
							do while rs_mat5.eof=false
						%>
							<option value="<%=rs_mat5("materialname")%>" <%if rs_mat5("materialname")=rs("material5") then%>selected="selected"<%end if%>><%=rs_mat5("materialname")%></option>
						<%
							rs_mat5.movenext
							loop
						%>
					</select>		  		
<!--					
					&nbsp;&nbsp;&nbsp;小厂号
					<input name="plant5" style="width:100px" value="<%=rs("plant5")%>">						
		  		&nbsp;&nbsp;&nbsp;规格
		  		<input name="spec5" style="width:100px" value="<%=rs("spec5")%>">
-->
					&nbsp;&nbsp;&nbsp;规格/厂号
					<input name="memo5" style="width:120px" value="<%=rs("memo5")%>">	  			  		
		  		&nbsp;&nbsp;&nbsp;采购价格
		  		<input name="price5" style="width:80px"  value="<%=rs("price5")%>" onKeyPress="javascript:CheckNum();">&nbsp;/公斤
		  		&nbsp;&nbsp;&nbsp;销售价格
		  		<input name="salesprice5" style="width:80px" value="<%=rs("salesprice5")%>" onKeyPress="javascript:CheckNum();">
		  		&nbsp;&nbsp;&nbsp;件数
		  		<input name="case5" style="width:60px" value="<%=rs("case5")%>" onKeyPress="javascript:CheckNum();">			  		
		  		&nbsp;&nbsp;&nbsp;合同重量
		  		<input name="contractweight5" style="width:80px" value="<%=rs("contractweight5")%>" onKeyPress="javascript:CheckNum();">
		  		&nbsp;&nbsp;&nbsp;实际重量
		  		<input name="actualweight5" style="width:80px" value="<%=rs("actualweight5")%>" onKeyPress="javascript:CheckNum();">			  		
				</td>
      </tr>      
      <tr>	  
	    	<td align="right" height="30">预计装船：</td>
        <td class="category">
		  		<input name="planship" style="width:100px" value="<%=rs("planship")%>">
					&nbsp;&nbsp;&nbsp;目的港
					<input name="destination" style="width:100px" value="<%=rs("destination")%>">
<!--		
					&nbsp;&nbsp;&nbsp;合同重量
					<input name="contractweight" style="width:100px" maxlength="15" value="<%=rs("contractweight")%>">				
-->			  		
				</td>
      </tr>
      <tr>	  
	    	<td align="right" height="30">装船期：</td>
        <td class="category">
		  		<input name="shipdate" readonly style="width:80px" value="<%=rs("shipdate")%>">
		  		<img src="../images/date.gif" align="absmiddle" style="cursor:pointer;" onClick="JavaScript:window.open('../day.asp?form=form1&field=shipdate&oldDate='+shipdate.value,'','directorys=no,toolbar=no,status=no,menubar=no,scrollbars=no,resizable=no,width=250,height=170,top=150,left=590');">
		  		&nbsp;&nbsp;&nbsp;&nbsp;到港期
		  		<input name="boarddate" readonly style="width:80px" value="<%=rs("boarddate")%>">
		  		<img src="../images/date.gif" align="absmiddle" style="cursor:pointer;" onClick="JavaScript:window.open('../day.asp?form=form1&field=boarddate&oldDate='+boarddate.value,'','directorys=no,toolbar=no,status=no,menubar=no,scrollbars=no,resizable=no,width=250,height=170,top=150,left=590');">
				</td>
      </tr> 
      <tr>	  
	    	<td align="right" height="30">箱号：</td>
        <td class="category">
		  		<input name="case" style="width:120px" maxlength="15" value="<%=rs("case")%>">
		  		&nbsp;&nbsp;&nbsp;总件数
		  		<input name="casenumber" style="width:80px" maxlength="5"  value="<%=rs("casenumber")%>" readonly >
		  		&nbsp;&nbsp;&nbsp;总重量
		  		<input name="netweight" style="width:100px" maxlength="15" value="<%=rs("netweight")%>" readonly >
				</td>
      </tr>
      <tr>	  
	    	<td align="right" height="30">提单号：</td>
        <td class="category">
		  		<input name="ladnumber" style="width:150px" maxlength="20" value="<%=rs("ladnumber")%>">
		  		&nbsp;&nbsp;&nbsp;船名
		  		<input name="shipname" style="width:180px" maxlength="20" value="<%=rs("shipname")%>">
		  		&nbsp;&nbsp;&nbsp;卫生证
		  		<input name="weishengzheng" style="width:120px" maxlength="15" value="<%=rs("weishengzheng")%>">		  		
				</td>
      </tr>  
      <tr>	  
	    	<td align="right" height="30">动检证：</td>
        <td class="category">
		  		<input name="dongjian" style="width:120px" maxlength="15" value="<%=rs("dongjian")%>">
		  		&nbsp;&nbsp;&nbsp;动检公司
		  		<input name="dongjiancom" style="width:100px" maxlength="10" value="<%=rs("dongjiancom")%>"> 		
		  		&nbsp;&nbsp;&nbsp;自动证
		  		<input name="zidong" style="width:120px" maxlength="15" value="<%=rs("zidong")%>">
		  		&nbsp;&nbsp;&nbsp;自动公司
		  		<input name="zidongcom" style="width:100px" maxlength="10" value="<%=rs("zidongcom")%>"> 			  		
				</td>
      </tr>                  
      <tr>	  
	    	<td align="right" height="30">付款日期：</td>
        <td class="category">
		  		<input name="paydate" readonly style="width:80px" value="<%=rs("paydate")%>">
		  		<img src="../images/date.gif" align="absmiddle" style="cursor:pointer;" onClick="JavaScript:window.open('../day.asp?form=form1&field=paydate&oldDate='+paydate.value,'','directorys=no,toolbar=no,status=no,menubar=no,scrollbars=no,resizable=no,width=250,height=170,top=150,left=590');">
		  		&nbsp;&nbsp;&nbsp;付款金额
		  		<input name="payment" style="width:100px" maxlength="15" value="<%=rs("payment")%>" onKeyPress="javascript:CheckNum();">
		  		&nbsp;&nbsp;&nbsp;币种
					<%
					sql="select * from trancurrency"
					set rs_currency=conn.execute(sql)
					%>
					<select name="currency">
						<%
							do while rs_currency.eof=false
						%>
							<option value="<%=rs_currency("currency")%>" <%if rs_currency("currency")=rs("trancurrency") then%>selected="selected"<%end if%>><%=rs_currency("currency")%></option>
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
		  		<input name="deliverydate" readonly style="width:80px" value="<%=rs("deliverydate")%>">
		  		<img src="../images/date.gif" align="absmiddle" style="cursor:pointer;" onClick="JavaScript:window.open('../day.asp?form=form1&field=deliverydate&oldDate='+deliverydate.value,'','directorys=no,toolbar=no,status=no,menubar=no,scrollbars=no,resizable=no,width=250,height=170,top=150,left=590');">
				</td>
      </tr>       
      <tr>	  
	    	<td align="right" height="30">汇率：</td>
        <td class="category">
		  		<input name="exchange" style="width:100px" maxlength="15" value="<%=rs("exchange")%>" onKeyPress="javascript:CheckNum();">
		  		&nbsp;&nbsp;&nbsp;银行费用
		  		<input name="bankfare" style="width:100px" maxlength="15" value="<%=rs("bankfare")%>" onKeyPress="javascript:CheckNum();">
		  		&nbsp;&nbsp;&nbsp;船公司费用
		  		<input name="agentfare" style="width:100px" maxlength="15" value="<%=rs("agentfare")%>" onKeyPress="javascript:CheckNum();">
		  		&nbsp;&nbsp;&nbsp;佣金
		  		<input name="Commission" style="width:100px" maxlength="15" value="<%=rs("commission")%>" onKeyPress="javascript:CheckNum();">		  		
				</td>
      </tr>
<!-- 
      <tr>	  
	    	<td align="right" height="30">销售价格：</td>
        <td class="category">
		  		<input name="listprice" style="width:100px" maxlength="15" value="<%=rs("listprice")%>" onKeyPress="javascript:CheckNum();">
		  		&nbsp;&nbsp;&nbsp;实际成本
		  		<input name="actcost" style="width:100px" maxlength="15" value="<%=rs("actcost")%>">
		  		&nbsp;&nbsp;&nbsp;实际收入
		  		<input name="actrevenue" style="width:100px" maxlength="15" readonly value="<%=rs("actrevenue")%>">
				</td>
      </tr>
-->
      <tr>	  
	    	<td align="right" height="30">实际成本：</td>
        <td class="category">
		  		<input name="actcost" style="width:100px" maxlength="15" value="<%=rs("actcost")%>">
		  		&nbsp;&nbsp;&nbsp;实际收入
		  		<input name="actrevenue" style="width:100px" maxlength="15" readonly value="<%=rs("actrevenue")%>">
				</td>
      </tr>      
      <tr>	  
	    	<td align="right" height="30">预估利润：</td>
        <td class="category">
		  		<input name="planprofit" style="width:100px" maxlength="15" readonly value="<%=rs("planprofit")%>">
		  		&nbsp;&nbsp;&nbsp;实际利润
		  		<input name="actprofit" style="width:100px" maxlength="15" readonly value="<%=rs("actprofit")%>">
				</td>
      </tr>            
      <tr>
        <td align="right" height="30">索赔事宜：</td>
        <td class="category"><textarea name="claim" cols="70" rows="3" value="<%=rs("claim")%>"></textarea></td>
      </tr>	 
      <tr>
	    <td height="30">&nbsp;</td>
        <td class="category">
		  <input type="submit" value=" 确认修改 " onClick="return check()" class="button">
		  <input type="hidden" name="hid1" value="ok">
		  <input type="reset" value=" 放弃修改返回 " onClick="window.history.go(-1)" class="button">
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
</form>
<%
else
nowkeyword=request("keyword")
nowtrantype=request("trantype")
nowcustomer=request("customer")
nowvendor=request("vendor")
nowcontract=request("contract")
nowcustcontract=request("custcontract")
nowcountry=request("country")
nowunit="公斤"
nowmaterial=request("material")
nowprice=request("price")
nowmemo1=request("memo1")	
nowsalesprice1=request("salesprice1")
nowcase1=request("case1")
nowcontractweight1=request("contractweight1")
nowactualweight1=request("actualweight1")
if request("material2")<>"" then
	nowmaterial2=request("material2")
	nowprice2=request("price2")
	nowmemo2=request("memo2")		
	nowsalesprice2=request("salesprice2")
	nowcase2=request("case2")
	nowcontractweight2=request("contractweight2")
	nowactualweight2=request("actualweight2")		
else
	nowmaterial2=""
	nowprice2=0		
	nowmemo2=""
	nowsalesprice2=0
	nowcase2=0
	nowcontractweight2=0
	nowactualweight2=0	
end if
if request("material3")<>"" then
	nowmaterial3=request("material3")
	nowprice3=request("price3")
	nowmemo3=request("memo3")	
	nowsalesprice3=request("salesprice3")
	nowcase3=request("case3")
	nowcontractweight3=request("contractweight3")
	nowactualweight3=request("actualweight3")		
else
	nowmaterial3=""
	nowprice3=0		
	nowmemo3=""
	nowsalesprice3=0
	nowcase3=0
	nowcontractweight3=0
	nowactualweight3=0	
end if
if request("material4")<>"" then
	nowmaterial4=request("material4")
	nowprice4=request("price4")
	nowmemo4=request("memo4")	
	nowsalesprice4=request("salesprice4")
	nowcase4=request("case4")
	nowcontractweight4=request("contractweight4")
	nowactualweight4=request("actualweight4")		
else
	nowmaterial4=""
	nowprice4=0		
	nowmemo4=""
	nowsalesprice4=0
	nowcase4=0
	nowcontractweight4=0
	nowactualweight4=0	
end if
if request("material5")<>"" then
	nowmaterial5=request("material5")
	nowprice5=request("price5")
	nowmemo5=request("memo5")	
	nowsalesprice5=request("salesprice5")
	nowcase5=request("case5")
	nowcontractweight5=request("contractweight5")
	nowactualweight5=request("actualweight5")		
else
	nowmaterial5=""
	nowprice5=0		
	nowmemo5=""
	nowsalesprice5=0
	nowcase5=0
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
<!--nowcasenumber=request("casenumber")-->
nowcasenumber=cint(nowcase1)+cint(nowcase2)+cint(nowcase3)+cint(nowcase4)+cint(nowcase5)
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
nownetweight=csng(nowactualweight1)+csng(nowactualweight2)+csng(nowactualweight3)+csng(nowactualweight4)+csng(nowactualweight5)
nowclaim=request("claim")
nowapplycustom=request("applycustom")
nowpaydate=request("paydate")
nowpayment=request("payment")
nowcurrency=request("currency")
nowmemo=request("memo")
nowstatus=request("status")
nowinvoicestatus=request("invoicestatus")
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

set rs=server.createobject("ADODB.RecordSet")
sql="select * from shipment where shipmentnum="&request("shipment")
rs.open sql,conn,1,3
rs("trantype")=nowtrantype
rs("customer")=nowcustomer
rs("vendor")=nowvendor
rs("contract")=nowcontract
rs("custcontract")=nowcustcontract
rs("material")=nowmaterial
rs("country")=nowcountry
rs("price")=nowprice
rs("memo1")=nowmemo1
rs("salesprice1")=nowsalesprice1
rs("case1")=nowcase1
rs("contractweight1")=nowcontractweight1
rs("actualweight1")=nowactualweight1
rs("material2")=nowmaterial2
rs("price2")=nowprice2
rs("memo2")=nowmemo2
rs("salesprice2")=nowsalesprice2
rs("case2")=nowcase2
rs("contractweight2")=nowcontractweight2
rs("actualweight2")=nowactualweight2
rs("material3")=nowmaterial3
rs("price3")=nowprice3
rs("memo3")=nowmemo3
rs("salesprice3")=nowsalesprice3
rs("case3")=nowcase3
rs("contractweight3")=nowcontractweight3
rs("actualweight3")=nowactualweight3
rs("material4")=nowmaterial4
rs("price4")=nowprice4
rs("memo4")=nowmemo4
rs("salesprice4")=nowsalesprice4
rs("case4")=nowcase4
rs("contractweight4")=nowcontractweight4
rs("actualweight4")=nowactualweight4
rs("material5")=nowmaterial5
rs("price5")=nowprice5	
rs("memo5")=nowmemo5
rs("salesprice5")=nowsalesprice5
rs("case5")=nowcase5
rs("contractweight5")=nowcontractweight5
rs("actualweight5")=nowactualweight5
rs("incoterm")=nowincoterm
rs("planship")=nowplanship
rs("destination")=nowdestination
<!--rs("contractweight")=nowcontractweight-->
rs("plant")=nowplant
if nowshipdate<>"" then
	rs("shipdate")=nowshipdate
end if
if nowboarddate<>"" then
	rs("boarddate")=nowboarddate
end if
rs("case")=nowcase
rs("casenumber")=nowcasenumber
rs("ladnumber")=nowladnumber
rs("shipname")=nowshipname
rs("weishengzheng")=nowweisheng
rs("dongjian")=nowdongjian
rs("dongjiancom")=nowdongjiancom
rs("zidong")=nowzidong
rs("zidongcom")=nowzidongcom
rs("paydate")=nowpaydate
rs("payment")=nowpayment
rs("deliverydate")=nowdeliverydate
rs("trancurrency")=nowcurrency
rs("status")=nowstatus
rs("invoicestatus")=nowinvoicestatus
rs("netweight")=nownetweight
rs("sales")=nowsales
rs("agent")=nowagent
rs("delivery")=nowdelivery
rs("exchange")=nowexchange
rs("bankfare")=nowbankfare
rs("agentfare")=nowagentfare
rs("commission")=nowcommission
<!--rs("listprice")=nowlistprice-->
rs("actcost")=nowactcost
rs("actrevenue")=nowactrevenue
rs("planprofit")=nowplanprofit
rs("actprofit")=nowactprofit
rs("changedate")=now()
rs("changer")=session("redboy_username")
rs.update
rs.close

%>
<script language="javascript">
alert("船期表资料修改成功！")
window.location.href="query_hongkong_shipment.asp?form=<%=request("form")%>&keyword=<%=nowkeyword%>"
</script> 
<%
end if
%>
</body>
</html>