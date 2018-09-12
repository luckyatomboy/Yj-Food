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
if fla1="0" and fla2="0" and fla3="0" and fla4="0" then
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
sql="select * from shipment where shipmentnum="&request("shipment")
set rs=conn.execute(sql)
%>
<tr>
<!--
	<td width="5%" height="21">&nbsp;<img src="../images/print.jpg" align="absmiddle" style="cursor:hand;" onClick="javascript:var win=window.open('../produit/print_buy.asp?bianhao=1000124','详细信息','width=853,height=470,top=176,left=161,toolbar=no,location=no,directories=no,status=no,menubar=no,resizable=no,scrollbars=yes'); win.focus()"></td>
-->
	<td width="5%" height="21">&nbsp;<img src="../images/print.jpg" align="absmiddle" style="cursor:hand;" onClick="javascript:var win=window.open('../produit/print_shipment.asp?shipmentnum=<%=rs("shipmentnum")%>','详细信息','width=853,height=470,top=176,left=161,toolbar=no,location=no,directories=no,status=no,menubar=no,resizable=no,scrollbars=yes'); win.focus()"></td>
	<td align="right">&nbsp;</td>
</tr>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#C4D8ED">
<tr>
<td><img src="../images/r_1.gif" alt="" /></td>
<td width="100%" background="../images/r_0.gif">
  <table cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td>&nbsp;修改船期表资料  ---  <%=rs("shipmentnum")%></td>
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
        <td width="20%" align="right" height="30">类型：</td>
        <td width="80%" class="category">
					<%
					sql="select * from trantype"
					set rs_trantype=conn.execute(sql)
					%>
					<select name="trantype" <%if fla1="0" then%>disabled<%end if%>>
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
	    	<td align="right" height="30">客户：</td>
        <td class="category">
					<%
					sql="select * from customer"
					set rs_customer=conn.execute(sql)
					%>
					<select name="customer" <%if fla1="0" then%>disabled<%end if%>>
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
					<select name="vendor" <%if fla1="0" then%>disabled<%end if%>>
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
	    	<td align="right" height="30">合同号：</td>
        <td class="category">
		  		<input name="contract" value="<%=rs("contract")%>" style="width:150px" maxlength="20" <%if fla1="0" then%>disabled<%end if%>>
				</td>
      </tr>     
      <tr>	  
	    	<td align="right" height="30">厂号：</td>
        <td class="category">
					<input name="plant" style="width:100px" value="<%=rs("plant")%>" <%if fla1="0" then%>disabled<%end if%>>
					&nbsp;&nbsp;&nbsp;国别
					<%
					sql="select * from country"
					set rs_country=conn.execute(sql)
					%>
					<select name="country" <%if fla1="0" then%>disabled<%end if%>>
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
		  		<input name="incoterm" style="width:150px" value="<%=rs("incoterm")%>" <%if fla1="0" then%>disabled<%end if%>>					
				</td>
      </tr>       
      <tr>	  
	    	<td align="right" height="30">品名一：</td>
        <td class="category">
					<%
					sql="select * from material"
					set rs_mat=conn.execute(sql)
					%>
					<select name="material" <%if fla1="0" then%>disabled<%end if%>>
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
		  		<input name="spec" style="width:100px" value="<%=rs("spec")%>" <%if fla1="0" then%>disabled<%end if%>>
		  		&nbsp;&nbsp;&nbsp;单价
		  		<input name="price" style="width:100px"  value="<%=rs("price")%>" onKeyPress="javascript:CheckNum();" onKeyUp="this.value=this.value.replace(/[^\d.]/g,'')" <%if fla1="0" then%>disabled<%end if%>>&nbsp;/公斤
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
		  		&nbsp;&nbsp;&nbsp;规格
		  		<input name="spec2" style="width:100px" value="<%=rs("spec2")%>" <%if fla1="0" then%>disabled<%end if%>>
		  		&nbsp;&nbsp;&nbsp;单价
		  		<input name="price2" style="width:100px"  value="<%=rs("price2")%>" onKeyPress="javascript:CheckNum();" onKeyUp="this.value=this.value.replace(/[^\d.]/g,'')" <%if fla1="0" then%>disabled<%end if%>>&nbsp;/公斤
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
		  		&nbsp;&nbsp;&nbsp;规格
		  		<input name="spec3" style="width:100px" value="<%=rs("spec3")%>" <%if fla1="0" then%>disabled<%end if%>>
		  		&nbsp;&nbsp;&nbsp;单价
		  		<input name="price3" style="width:100px"  value="<%=rs("price3")%>" onKeyPress="javascript:CheckNum();" onKeyUp="this.value=this.value.replace(/[^\d.]/g,'')" <%if fla1="0" then%>disabled<%end if%>>&nbsp;/公斤
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
		  		&nbsp;&nbsp;&nbsp;规格
		  		<input name="spec4" style="width:100px" value="<%=rs("spec4")%>" <%if fla1="0" then%>disabled<%end if%>>
		  		&nbsp;&nbsp;&nbsp;单价
		  		<input name="price4" style="width:100px"  value="<%=rs("price4")%>" onKeyPress="javascript:CheckNum();" onKeyUp="this.value=this.value.replace(/[^\d.]/g,'')" <%if fla1="0" then%>disabled<%end if%>>&nbsp;/公斤
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
		  		&nbsp;&nbsp;&nbsp;规格
		  		<input name="spec5" style="width:100px" value="<%=rs("spec5")%>" <%if fla1="0" then%>disabled<%end if%>>
		  		&nbsp;&nbsp;&nbsp;单价
		  		<input name="price5" style="width:100px"  value="<%=rs("price5")%>" onKeyPress="javascript:CheckNum();" onKeyUp="this.value=this.value.replace(/[^\d.]/g,'')" <%if fla1="0" then%>disabled<%end if%>>&nbsp;/公斤
				</td>
      </tr>      
      <tr>	  
	    	<td align="right" height="30">动检证：</td>
        <td class="category">
		  		<input name="dongjian"  value="<%=rs("dongjian")%>" readonly <%if fla2="1" then%>onClick="JavaScript:window.open('../huiyuan/query_license.asp?queryform=form1&licensetype=动检证&field=dongjian&field2=dongjiancom','','directorys=no,toolbar=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=1200,height=470,top=100,left=20');"<%end if%> style="cursor:hand;width:120px" value="单击选择动检许可证">
		  		<input name="dongjiancom"  value="<%=rs("dongjiancom")%>" readonly >
				</td>
      </tr>
      <tr>	  
	    	<td align="right" height="30">自动证：</td>
        <td class="category">
		  		<input name="zidong"  value="<%=rs("zidong")%>" readonly <%if fla2="1" then%>onClick="JavaScript:window.open('../huiyuan/query_license.asp?queryform=form1&licensetype=自动证&field=zidong&field2=zidongcom','','directorys=no,toolbar=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=1200,height=470,top=100,left=20');"<%end if%> style="cursor:hand;width:120px" value="单击选择自动许可证">
		  		<input name="zidongcom"  value="<%=rs("zidongcom")%>" readonly >
				</td>
      </tr>
      <tr>	  
	    	<td align="right" height="30">预计装船：</td>
        <td class="category">
		  		<input name="planship" style="width:100px" value="<%=rs("planship")%>" <%if fla2="0" then%>disabled<%end if%>>
				</td>
      </tr>
      <tr>	  
	    	<td align="right" height="30">装船期：</td>
        <td class="category">
		  		<input name="shipdate" readonly style="width:80px" value="<%=rs("shipdate")%>">
		  		<img src="../images/date.gif" align="absmiddle" style="cursor:pointer;" <%if fla2="1" then%>onClick="JavaScript:window.open('../day.asp?form=form1&field=shipdate&oldDate='+shipdate.value,'','directorys=no,toolbar=no,status=no,menubar=no,scrollbars=no,resizable=no,width=250,height=170,top=150,left=590');"<%end if%>>
		  		&nbsp;&nbsp;&nbsp;&nbsp;到港期
		  		<input name="boarddate" readonly style="width:80px" value="<%=rs("boarddate")%>">
		  		<img src="../images/date.gif" align="absmiddle" style="cursor:pointer;" <%if fla2="1" then%>onClick="JavaScript:window.open('../day.asp?form=form1&field=boarddate&oldDate='+boarddate.value,'','directorys=no,toolbar=no,status=no,menubar=no,scrollbars=no,resizable=no,width=250,height=170,top=150,left=590');"<%end if%>>
				</td>
      </tr> 
      <tr>	  
	    	<td align="right" height="30">箱号：</td>
        <td class="category">
		  		<input name="case" style="width:120px" maxlength="15" value="<%=rs("case")%>" <%if fla2="0" then%>disabled<%end if%>>
		  		&nbsp;&nbsp;&nbsp;箱数
		  		<input name="casenumber" style="width:80px" maxlength="5"  value="<%=rs("casenumber")%>" onKeyPress="javascript:CheckNum();"  onKeyUp="this.value=this.value.replace(/[^\d.]/g,'')" <%if fla2="0" then%>disabled<%end if%>>
		  		&nbsp;&nbsp;&nbsp;提单号
		  		<input name="ladnumber" style="width:150px" maxlength="20" value="<%=rs("ladnumber")%>" <%if fla2="0" then%>disabled<%end if%>>
		  		&nbsp;&nbsp;&nbsp;船名
		  		<input name="shipname" style="width:180px" maxlength="20" value="<%=rs("shipname")%>" <%if fla2="0" then%>disabled<%end if%>>
				</td>
      </tr>
      <tr>	  
	    	<td align="right" height="30">卫生证：</td>
        <td class="category">
		  		<input name="weishengzheng" style="width:100px" maxlength="15" value="<%=rs("weishengzheng")%>" <%if fla2="0" then%>disabled<%end if%>>
				</td>
      </tr>
      <tr>	  
	    	<td align="right" height="30">交单日期：</td>
        <td class="category">
		  		<input name="deliverydate" readonly style="width:80px" value="<%=rs("deliverydate")%>">
		  		<img src="../images/date.gif" align="absmiddle" style="cursor:pointer;" <%if fla2="1" then%>onClick="JavaScript:window.open('../day.asp?form=form1&field=deliverydate&oldDate='+deliverydate.value,'','directorys=no,toolbar=no,status=no,menubar=no,scrollbars=no,resizable=no,width=250,height=170,top=150,left=590');"<%end if%>>
				</td>
      </tr> 
      <tr>	  
	    	<td align="right" height="30">核销单号：</td>
        <td class="category">
		  		<input name="canceldoc" style="width:100px" maxlength="10" value="<%=rs("canceldoc")%>" <%if fla2="0" then%>disabled<%end if%>>
		  		&nbsp;&nbsp;&nbsp;报关单号
		  		<input name="applycustom" style="width:100px" maxlength="10" value="<%=rs("applycustom")%>" <%if fla2="0" then%>disabled<%end if%>>
				</td>
      </tr>
      <tr>	  
	    	<td align="right" height="30">付款日期：</td>
        <td class="category">
		  		<input name="paydate" readonly style="width:80px" value="<%=rs("paydate")%>">
		  		<img src="../images/date.gif" align="absmiddle" style="cursor:pointer;" <%if fla2="1" then%>onClick="JavaScript:window.open('../day.asp?form=form1&field=paydate&oldDate='+paydate.value,'','directorys=no,toolbar=no,status=no,menubar=no,scrollbars=no,resizable=no,width=250,height=170,top=150,left=590');"<%end if%>>
		  		&nbsp;&nbsp;&nbsp;付款金额
		  		<input name="payment" style="width:100px" maxlength="15" value="<%=rs("payment")%>" onKeyPress="javascript:CheckNum();" onKeyUp="this.value=this.value.replace(/[^\d.]/g,'')" <%if fla2="0" then%>disabled<%end if%>>
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
				&nbsp;&nbsp;&nbsp;订金收到日期
				<input name="downpaymentdate" readonly style="width:80px" value="<%=rs("downpaymentreceiptdate")%>">	
				<img src="../images/date.gif" align="absmiddle" style="cursor:pointer;" onClick="JavaScript:window.open('../day.asp?form=form1&field=downpaymentdate&oldDate='+downpaymentdate.value,'','directorys=no,toolbar=no,status=no,menubar=no,scrollbars=no,resizable=no,width=250,height=170,top=150,left=590');">					
				</td>
      </tr> 
      <tr>	  
	    	<td align="right" height="30">净重：</td>
        <td class="category">
		  		<input name="netweight" style="width:100px" maxlength="15"  value="<%=rs("netweight")%>" onKeyPress="javascript:CheckNum();" onKeyUp="this.value=this.value.replace(/[^\d.]/g,'')" <%if fla3="0" then%>disabled<%end if%>>
		  		&nbsp;&nbsp;&nbsp;关税
		  		<input name="tariff" style="width:100px" maxlength="15"  value="<%=rs("tariff")%>" onKeyPress="javascript:CheckNum();" onKeyUp="this.value=this.value.replace(/[^\d.]/g,'')" <%if fla3="0" then%>disabled<%end if%>>
		  		&nbsp;&nbsp;&nbsp;增值税
		  		<input name="vat" style="width:100px" maxlength="15"  value="<%=rs("vat")%>" onKeyPress="javascript:CheckNum();" onKeyUp="this.value=this.value.replace(/[^\d.]/g,'')" <%if fla3="0" then%>disabled<%end if%>>
		  		&nbsp;&nbsp;&nbsp;保证金
		  		<input name="warranty" style="width:100px" maxlength="15" value="<%=rs("warranty")%>" onKeyPress="javascript:CheckNum();" onKeyUp="this.value=this.value.replace(/[^\d.]/g,'')" <%if fla3="0" then%>disabled<%end if%>>
				</td>
      </tr>
      <tr>	  
	    	<td align="right" height="30">送货日期：</td>
        <td class="category">
		  		<input name="cargodate" readonly style="width:80px" value="<%=rs("cargodate")%>">
		  		<img src="../images/date.gif" align="absmiddle" style="cursor:pointer;" <%if fla4="1" then%>onClick="JavaScript:window.open('../day.asp?form=form1&field=cargodate&oldDate='+cargodate.value,'','directorys=no,toolbar=no,status=no,menubar=no,scrollbars=no,resizable=no,width=250,height=170,top=150,left=590');"<%end if%>>
		  		&nbsp;&nbsp;&nbsp;送货方向
		  		<input name="cargodir" style="width:150px" value="<%=rs("cargodir")%>" <%if fla4="0" then%>disabled<%end if%>>
				</td>
      </tr> 
      <tr>
        <td align="right" height="30">索赔事宜：</td>
        <td class="category"><textarea name="claim" cols="70" rows="3" value="<%=rs("claim")%>" <%if fla4="0" then%>disabled<%end if%>></textarea></td>
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
nowcountry=request("country")
nowunit="公斤"
nowmaterial=request("material")
nowspec=request("spec")
nowprice=request("price")
if request("material2")<>"" then
	nowmaterial2=request("material2")
	nowspec2=request("spec2")
	nowprice2=request("price2")
else
	nowmaterial2=""
	nowspec2=""
	nowprice2=0		
end if
if request("material3")<>"" then
	nowmaterial3=request("material3")
	nowspec3=request("spec3")
	nowprice3=request("price3")
else
	nowmaterial3=""
	nowspec3=""
	nowprice3=0		
end if
if request("material4")<>"" then
	nowmaterial4=request("material4")
	nowspec4=request("spec4")
	nowprice4=request("price4")
else
	nowmaterial4=""
	nowspec4=""
	nowprice4=0		
end if
if request("material5")<>"" then
	nowmaterial5=request("material5")
	nowspec5=request("spec5")
	nowprice5=request("price5")
else
	nowmaterial5=""
	nowspec5=""
	nowprice5=0		
end if
nowincoterm=request("incoterm")
nowdongjiancom=request("dongjiancom")
nowdongjian=request("dongjian")
nowzidongcom=request("zidongcom")
nowzidong=request("zidong")
nowplanship=request("planship")
nowplant=request("plant")
if request("shipdate")<>"" then
	nowshipdate=request("shipdate")
end if
if request("boarddate")<>"" then
	nowboarddate=request("boarddate")
end if
nowcasenumber=request("casenumber")
nowcase=request("case")
nowweishengzheng=request("weishengzheng")
if request("deliverydate")<>"" then
	nowdeliverydate=request("deliverydate")
end if
nowladnumber=request("ladnumber")
nowshipname=request("shipname")
nownetweight=request("netweight")
nowtariff=request("tariff")
nowvat=request("vat")
nowwarranty=request("warranty")
nowclaim=request("claim")
nowapplycustom=request("applycustom")
if request("paydate")<>"" then
	nowpaydate=request("paydate")
end if
nowpayment=request("payment")
nowcurrency=request("currency")
nowmemo=request("memo")
nowstatus=request("status")
nowinvoicestatus=request("invoicestatus")
if request("cargodate")<>"" then
	nowcargodate=request("cargodate")
end if
nowcargodir=request("cargodir")
nowcanceldoc=request("canceldoc")

set rs=server.createobject("ADODB.RecordSet")
sql="select * from shipment where shipmentnum="&request("shipment")
rs.open sql,conn,1,3
if fla1="1" then
	rs("trantype")=nowtrantype
	rs("customer")=nowcustomer
	rs("vendor")=nowvendor
	rs("contract")=nowcontract
	rs("material")=nowmaterial
	rs("country")=nowcountry
	rs("spec")=nowspec
	rs("price")=nowprice
	rs("material2")=nowmaterial2
	rs("spec2")=nowspec2
	rs("price2")=nowprice2
	rs("material3")=nowmaterial3
	rs("spec3")=nowspec3
	rs("price3")=nowprice3
	rs("material4")=nowmaterial4
	rs("spec4")=nowspec4
	rs("price4")=nowprice4
	rs("material5")=nowmaterial5
	rs("spec5")=nowspec5
	rs("price5")=nowprice5	
	rs("incoterm")=nowincoterm
end if
if fla2="1" then
	rs("dongjian")=nowdongjian
	rs("dongjiancom")=nowdongjiancom
	rs("zidong")=nowzidong
	rs("zidongcom")=nowzidongcom
	rs("planship")=nowplanship
	rs("plant")=nowplant
	if nowshipdate<>"" then
		rs("shipdate")=nowshipdate
	end if
	if nowboarddate<>"" then
		rs("boarddate")=nowboarddate
	end if
	rs("case")=nowcase
	rs("casenumber")=nowcasenumber
	rs("trancurrency")=nowcurrency
end if
rs("status")=nowstatus
rs("invoicestatus")=nowinvoicestatus
rs("changedate")=now()
rs("changer")=session("redboy_username")
rs.update
rs.close

%>
<script language="javascript">
alert("船期表资料修改成功！")
window.location.href="query_shipment.asp?form=<%=request("form")%>&keyword=<%=nowkeyword%>"
</script> 
<%
end if
%>
</body>
</html>