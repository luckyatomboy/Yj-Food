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
<title><%=dianming%> - 修改入库单</title>
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
<%
if fla32="0" then
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
if (isNumberString(document.form2.quantity.value,"1234567890.")!=1)
{
alert("数量无效!");
return false;
}
if (isNumberString(document.form2.year.value,"1234567890")!=1)
{
alert("年份无效!");
return false;
}
}
</script>
<%
sql="select * from stockdocument where stocknumber='"&request("stocknumber")&"'"
set rs=conn.execute(sql)
%>
<!--
<tr>

	<td width="5%" height="21">&nbsp;<img src="../images/print.jpg" align="absmiddle" style="cursor:hand;" onClick="javascript:var win=window.open('../produit/print_buy.asp?bianhao=1000124','详细信息','width=853,height=470,top=176,left=161,toolbar=no,location=no,directories=no,status=no,menubar=no,resizable=no,scrollbars=yes'); win.focus()"></td>

	<td width="5%" height="21">&nbsp;<img src="../images/print.jpg" align="absmiddle" style="cursor:hand;" onClick="javascript:var win=window.open('../produit/print_shipment.asp?shipmentnum=<%=rs("stocknumber")%>','详细信息','width=853,height=470,top=176,left=161,toolbar=no,location=no,directories=no,status=no,menubar=no,resizable=no,scrollbars=yes'); win.focus()"></td>
	<td align="right">&nbsp;</td>
</tr>
-->
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#C4D8ED">
<tr>
<td><img src="../images/r_1.gif" alt="" /></td>
<td width="100%" background="../images/r_0.gif">
  <table cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td>&nbsp;修改入库单资料  ---  <%=rs("stocknumber")%></td>
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
  		<input type="hidden" name="stocknumber" value="<%=request("stocknumber")%>">
      <tr>
        <td width="20%" align="right" height="30">状态：</td>
        <td width="80%" class="category">
					<%
					sql="select * from stockstatus where category='A'"
					set rs_status=conn.execute(sql)
					%>
					<select name="status">
						<%do while rs_status.eof=false%>
						<option value="<%=rs_status("status")%>" <%if rs_status("status")=rs("stockstatus") then%>selected="selected"<%end if%>><%=rs_status("description")%></option>
						<%
							rs_status.movenext
							loop
						%>
					</select>				
			  </td>
			</tr>			
      <tr>	  
	    	<td align="right" height="30">参考船期表：</td>
        <td class="category">
					<input name="refshipment" style="width:100px" value="<%=rs("refshipment")%>" onClick="JavaScript:window.open('query_shipment.asp?queryform=form1&field=refshipment&field2=refitem&field3=plant','','directorys=no,toolbar=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=1200,height=470,top=100,left=20');">
					&nbsp;&nbsp;&nbsp;项目
					<input name="refitem" style="width:100px" value="<%=rs("refitem")%>">
				</td>
      </tr>
      <tr>	  
	    	<td align="right" height="30">入库日期：</td>
        <td class="category">
				<input name="stockdate" readonly style="width:80px" value="<%=rs("stockdate")%>">
		  		<img src="../images/date.gif" align="absmiddle" style="cursor:pointer;" onClick="JavaScript:window.open('../day.asp?form=form1&field=stockdate&oldDate='+stockdate.value,'','directorys=no,toolbar=no,status=no,menubar=no,scrollbars=no,resizable=no,width=250,height=170,top=150,left=590');">
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
				&nbsp;&nbsp;&nbsp;合同号	
				<input name="contract" value="<%=rs("contract")%>" style="width:150px" maxlength="20">
				</td>
      </tr>       
      <tr>	  
	    	<td align="right" height="30">品名：</td>
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
		  		&nbsp;&nbsp;&nbsp;规格
		  		<input name="spec" style="width:100px" value="<%=rs("spec")%>">
		  		&nbsp;&nbsp;&nbsp;单价
		  		<input name="price" style="width:100px" value="<%=rs("price")%>" onKeyPress="javascript:CheckNum();" onKeyUp="this.value=this.value.replace(/[^\d.]/g,'')">&nbsp;/吨
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
	    	<td align="right" height="30">箱号：</td>
        <td class="category">
		  		<input name="case" style="width:120px" maxlength="15" value="<%=rs("case")%>">
		  		&nbsp;&nbsp;&nbsp;箱数
		  		<input name="quantity" style="width:80px" maxlength="5" value="<%=rs("quantity")%>"  onKeyPress="javascript:CheckNum();"  onKeyUp="this.value=this.value.replace(/[^\d.]/g,'')">
		  		&nbsp;&nbsp;&nbsp;重量
		  		<input name="weight" style="width:150px" maxlength="20" value="<%=rs("weight")%>">
				</td>
      </tr>	  
      <tr>	  
	    	<td align="right" height="30">冷库名称：</td>
        <td class="category">
		  		<input name="coldstorage" style="width:100px" value="<%=rs("coldstorage")%>">
				&nbsp;&nbsp;&nbsp;货主
		  		<input name="customer" style="width:100px" value="<%=rs("customer")%>">
				</td>
      </tr>
      <tr>	  
	    	<td align="right" height="30">入库数量：</td>
        <td class="category">
		  		<input name="stockqty" style="width:100px" value="<%=rs("stockqty")%>">
				&nbsp;&nbsp;&nbsp;入库原因
		  		<input name="reason" style="width:100px" value="<%=rs("reason")%>">				
				&nbsp;&nbsp;&nbsp;剩余数量
		  		<input name="remainqty" style="width:100px" readonly value="<%=rs("remainqty")%>">				
				</td>
      </tr>
      <tr>	  
	    	<td align="right" height="30">生产日期：</td>
        <td class="category">
		  		<input name="productdate" readonly style="width:80px" value="<%=rs("productdate")%>">
		  		<img src="../images/date.gif" align="absmiddle" style="cursor:pointer;" onClick="JavaScript:window.open('../day.asp?form=form1&field=productdate&oldDate='+productdate.value,'','directorys=no,toolbar=no,status=no,menubar=no,scrollbars=no,resizable=no,width=250,height=170,top=150,left=590');">
		  		&nbsp;&nbsp;&nbsp;&nbsp;保质期
				<input name="warranty" style="width:100px" value="<%=rs("warrantyperiod")%>">
				</td>
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
nowstatus=request("status")
nowrefshipment=request("refshipment")
nowrefitem=request("refitem")
nowcontract=request("contract")
nowcountry=request("country")
if request("material")<>"" then
	nowmaterial=request("material")
	nowspec=request("spec")
else
	nowmaterial=""
	nowspec=""
end if
nowplant=request("plant")
nowcase=request("case")
if request("price")<>"" then
	nowprice=request("price")
else
	nowprice=0
end if
if request("weight")<>"" then
	nowweight=request("weight")
else
	nowweight=0
end if
if request("quantity")<>"" then
	nowquantity=request("quantity")
else
	nowquantity=0
end if
nowwarranty=request("warranty")
nowcurrency=request("currency")
if request("stockdate")<>"" then
	nowstockdate=request("stockdate")
else
	nowstockdate=date()
end if
nowcustomer=request("customer")
nowcoldstorage=request("coldstorage")
if request("stockqty")<>"" then
	nowstockqty=request("stockqty")
else
	nowstockqty=0
end if
nowremainqty=nowstockqty
nowreason=request("reason")
if request("productdate")<>"" then
	nowproductdate=request("productdate")
else
	nowproductdate=date()
end if


set rs=server.createobject("ADODB.RecordSet")
sql="select * from stockdocument where stocknumber='"&request("stocknumber")&"'"
rs.open sql,conn,1,3

rs("stockstatus")=nowstatus
rs("refshipment")=nowrefshipment
rs("refitem")=nowrefitem
rs("contract")=nowcontract
rs("country")=nowcountry	
rs("material")=nowmaterial
rs("spec")=nowspec
rs("price")=nowprice
rs("plant")=nowplant
rs("case")=nowcase	
rs("weight")=nowweight
rs("quantity")=nowquantity	
if nowstockdate<>"" then
	rs("stockdate")=nowstockdate
end if
if nowproductdate<>"" then
	rs("productdate")=nowproductdate
end if
rs("customer")=nowcustomer
rs("coldstorage")=nowcoldstorage
rs("stockqty")=nowstockqty
rs("reason")=nowreason	
rs("trancurrency")=nowcurrency
rs("warrantyperiod")=nowwarranty

rs("changedate")=now()
rs("changer")=session("redboy_username")
rs.update
rs.close

%>
<script language="javascript">
alert("入库单资料修改成功！")
window.location.href="query_stock_order.asp?form=<%=request("form")%>&keyword=<%=nowkeyword%>"
</script> 
<%
end if
%>
</body>
</html>