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
<title><%=dianming%> - 船期表</title>
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
if fla1="0" then
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
	nowspec=request("spec")
	nowprice=request("price")
else
	nowmaterial=""
	nowspec=""
	nowprice=0	
end if
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
if request("dongjian")="单击选择动检许可证" then
	nowdongjian=""
else
	nowdongjian=request("dongjian")
end if
nowzidongcom=request("zidongcom")
if request("zidong")="单击选择自动许可证" then
	nowzidong=""
else
	nowzidong=request("zidong")
end if
nowplanship=request("planship")
nowplant=request("plant")
nowshipdate=request("shipdate")
nowboarddate=request("boarddate")
nowcasenumber=request("casenumber")
nowcase=request("case")
nowweishengzheng=request("weishengzheng")
nowdeliverydate=request("deliverydate")
nowladnumber=request("ladnumber")
nowshipname=request("shipname")
nownetweight=request("netweight")
nowtariff=request("tariff")
nowvat=request("vat")
nowwarranty=request("warranty")
nowclaim=request("claim")
nowapplycustom=request("applycustom")
nowpaydate=request("paydate")
nowpayment=request("payment")
nowcurrency=request("currency")
nowmemo=request("memo")
nowcargodate=request("cargodate")
nowcargodir=request("cargodir")
nowcanceldoc=request("canceldoc")

if request("trantype")="代理" then
	sql="select top 1 * from shipment where shipmentnum like '1%' order by shipmentnum desc"
else
	sql="select top 1 * from shipment where shipmentnum like '2%' order by shipmentnum desc"
end if
set rs_count=conn.execute(sql)

if rs_count.bof and rs_count.eof then
	if request("trantype")="代理" then
		nowshipment="10000001"
	else
		nowshipment="20000001"
	end if
else
	rs_count.movefirst
	nowshipment=rs_count("shipmentnum") + 1
end if	

<!--sql="insert into shipment(trantype,customer,vendor,contract,material,country,spec,price,unit,incoterm,createdate,creator) values('"&nowtrantype&"','"&nowcustomer&"',"&nowvendor&",'"&nowcontract&"','"&nowmaterial&"','"&nowcountry&"','"&nowspec&"',"&nowprice&",'"&nowunit&"','"&nowincoterm&"',#"&now()&"#,'"&session("redboy_username")&"')"-->
sql="insert into shipment(shipmentnum,trantype,status,invoicestatus,customer,vendor,contract,country,material,spec,price,material2,spec2,price2,material3,spec3,price3,material4,spec4,price4,material5,spec5,price5,unit,incoterm,dongjiancom,dongjian,zidongcom,zidong,planship,plant,shipdate,boarddate,createdate,creator) values("&nowshipment&",'"&nowtrantype&"','"&nowstatus&"','"&nowinvoicestatus&"','"&nowcustomer&"','"&nowvendor&"','"&nowcontract&"','"&nowcountry&"','"&nowmaterial&"','"&nowspec&"',"&nowprice&",'"&nowmaterial2&"','"&nowspec2&"',"&nowprice2&",'"&nowmaterial3&"','"&nowspec3&"',"&nowprice3&",'"&nowmaterial4&"','"&nowspec4&"',"&nowprice4&",'"&nowmaterial5&"','"&nowspec5&"',"&nowprice5&",'"&nowunit&"','"&nowincoterm&"','"&nowdongjiancom&"','"&nowdongjian&"','"&nowzidongcom&"','"&nowzidong&"','"&nowplanship&"','"&nowplant&"',#"&nowshipdate&"#,#"&nowboarddate&"#,#"&now()&"#,'"&session("redboy_username")&"')"
<!--sql="insert into shipment(shipmentnum,trantype,status,invoicestatus,customer,vendor,contract,country,material,spec,price,material2,spec2,price2,material3,spec3,price3,material4,spec4,price4,material5,spec5,price5,unit,incoterm,dongjiancom,dongjian,zidongcom,zidong,planship,plant,createdate,creator) values("&nowshipment&",'"&nowtrantype&"','"&nowstatus&"','"&nowinvoicestatus&"','"&nowcustomer&"','"&nowvendor&"','"&nowcontract&"','"&nowcountry&"','"&nowmaterial&"','"&nowspec&"',"&nowprice&",'"&nowmaterial2&"','"&nowspec2&"',"&nowprice2&",'"&nowmaterial3&"','"&nowspec3&"',"&nowprice3&",'"&nowmaterial4&"','"&nowspec4&"',"&nowprice4&",'"&nowmaterial5&"','"&nowspec5&"',"&nowprice5&",'"&nowunit&"','"&nowincoterm&"','"&nowdongjiancom&"','"&nowdongjian&"','"&nowzidongcom&"','"&nowzidong&"','"&nowplanship&"','"&nowplant&"',#"&now()&"#,'"&session("redboy_username")&"')"-->
conn.execute(sql)
%>
<script language="javascript">
//alert(&nowshipment&)
alert("船期表录入成功！")
window.location.href="shipment.asp"
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
}
</script>

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
        <td width="80%" class="category">
					<%
					sql="select * from trantype"
					set rs_trantype=conn.execute(sql)
					%>
					<select name="trantype">
						<%do while rs_trantype.eof=false%>
						<option value="<%=rs_trantype("trantype")%>"><%=rs_trantype("trantype")%></option>
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
						<option value="<%=rs_status("status")%>"><%=rs_status("status")%></option>
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
						<option value="<%=rs_invoicestatus("status")%>"><%=rs_invoicestatus("status")%></option>
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
		  		&nbsp;&nbsp;&nbsp;规格
		  		<input name="spec" style="width:100px">
		  		&nbsp;&nbsp;&nbsp;单价
		  		<input name="price" style="width:100px" value=0 onKeyPress="javascript:CheckNum();" onKeyUp="this.value=this.value.replace(/[^\d.]/g,'')">&nbsp;/公斤
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
		  		&nbsp;&nbsp;&nbsp;规格
		  		<input name="spec2" style="width:100px">
		  		&nbsp;&nbsp;&nbsp;单价
		  		<input name="price2" style="width:100px" value=0 onKeyPress="javascript:CheckNum();" onKeyUp="this.value=this.value.replace(/[^\d.]/g,'')">&nbsp;/公斤
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
		  		&nbsp;&nbsp;&nbsp;规格
		  		<input name="spec3" style="width:100px">
		  		&nbsp;&nbsp;&nbsp;单价
		  		<input name="price3" style="width:100px" value=0 onKeyPress="javascript:CheckNum();" onKeyUp="this.value=this.value.replace(/[^\d.]/g,'')">&nbsp;/公斤
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
		  		&nbsp;&nbsp;&nbsp;规格
		  		<input name="spec4" style="width:100px">
		  		&nbsp;&nbsp;&nbsp;单价
		  		<input name="price4" style="width:100px" value=0 onKeyPress="javascript:CheckNum();" onKeyUp="this.value=this.value.replace(/[^\d.]/g,'')">&nbsp;/公斤
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
		  		&nbsp;&nbsp;&nbsp;规格
		  		<input name="spec5" style="width:100px">
		  		&nbsp;&nbsp;&nbsp;单价
		  		<input name="price5" style="width:100px" value=0 onKeyPress="javascript:CheckNum();" onKeyUp="this.value=this.value.replace(/[^\d.]/g,'')">&nbsp;/公斤
				</td>
      </tr>       
      <tr>	  
	    	<td align="right" height="30">动检证：</td>
        <td class="category">
		  		<input name="dongjian" readonly onClick="JavaScript:window.open('../huiyuan/query_license.asp?queryform=form1&licensetype=动检证&field=dongjian&field2=dongjiancom','','directorys=no,toolbar=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=1200,height=470,top=100,left=20');" style="cursor:hand;width:120px" value="单击选择动检许可证">
		  		<input name="dongjiancom" readonly >
				</td>
      </tr>
      <tr>	  
	    	<td align="right" height="30">自动证：</td>
        <td class="category">
		  		<input name="zidong" readonly onClick="JavaScript:window.open('../huiyuan/query_license.asp?queryform=form1&licensetype=自动证&field=zidong&field2=zidongcom','','directorys=no,toolbar=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=1200,height=470,top=100,left=20');" style="cursor:hand;width:120px" value="单击选择自动许可证">
		  		<input name="zidongcom" readonly >
				</td>
      </tr>
      <tr>	  
	    	<td align="right" height="30">预计装船：</td>
        <td class="category">
		  		<input name="planship" style="width:100px">
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
		  		<input name="casenumber" style="width:80px" maxlength="5" value=0 onKeyPress="javascript:CheckNum();"  onKeyUp="this.value=this.value.replace(/[^\d.]/g,'')">
		  		&nbsp;&nbsp;&nbsp;提单号
		  		<input name="ladnumber" style="width:150px" maxlength="20">
		  		&nbsp;&nbsp;&nbsp;船名
		  		<input name="shipname" style="width:180px" maxlength="20">
				</td>
      </tr>
      <tr>	  
	    	<td align="right" height="30">卫生证：</td>
        <td class="category">
		  		<input name="weishengzheng" style="width:100px" maxlength="15">
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
	    	<td align="right" height="30">核销单号：</td>
        <td class="category">
		  		<input name="canceldoc" style="width:100px" maxlength="10">
		  		&nbsp;&nbsp;&nbsp;报关单号
		  		<input name="applycustom" style="width:100px" maxlength="10">
				</td>
      </tr>
      <tr>	  
	    	<td align="right" height="30">付款日期：</td>
        <td class="category">
		  		<input name="paydate" readonly style="width:80px">
		  		<img src="../images/date.gif" align="absmiddle" style="cursor:pointer;" onClick="JavaScript:window.open('../day.asp?form=form1&field=paydate&oldDate='+paydate.value,'','directorys=no,toolbar=no,status=no,menubar=no,scrollbars=no,resizable=no,width=250,height=170,top=150,left=590');">
		  		&nbsp;&nbsp;&nbsp;付款金额
		  		<input name="payment" style="width:100px" maxlength="15" value=0 onKeyPress="javascript:CheckNum();" onKeyUp="this.value=this.value.replace(/[^\d.]/g,'')">
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
				&nbsp;&nbsp;&nbsp;订金收到日期
				<input name="downpaymentdate" readonly style="width:80px">	
				<img src="../images/date.gif" align="absmiddle" style="cursor:pointer;" onClick="JavaScript:window.open('../day.asp?form=form1&field=downpaymentdate&oldDate='+downpaymentdate.value,'','directorys=no,toolbar=no,status=no,menubar=no,scrollbars=no,resizable=no,width=250,height=170,top=150,left=590');">
				</td>
      </tr> 
      <tr>	  
	    	<td align="right" height="30">净重：</td>
        <td class="category">
		  		<input name="netweight" style="width:100px" maxlength="15" value=0 onKeyPress="javascript:CheckNum();" onKeyUp="this.value=this.value.replace(/[^\d.]/g,'')">
		  		&nbsp;&nbsp;&nbsp;关税
		  		<input name="tariff" style="width:100px" maxlength="15" value=0 onKeyPress="javascript:CheckNum();" onKeyUp="this.value=this.value.replace(/[^\d.]/g,'')">
		  		&nbsp;&nbsp;&nbsp;增值税
		  		<input name="vat" style="width:100px" maxlength="15" value=0 onKeyPress="javascript:CheckNum();" onKeyUp="this.value=this.value.replace(/[^\d.]/g,'')">
		  		&nbsp;&nbsp;&nbsp;保证金
		  		<input name="warranty" style="width:100px" maxlength="15" value=0 onKeyPress="javascript:CheckNum();" onKeyUp="this.value=this.value.replace(/[^\d.]/g,'')">
				</td>
      </tr>
      <tr>	  
	    	<td align="right" height="30">送货日期：</td>
        <td class="category">
		  		<input name="cargodate" readonly style="width:80px">
		  		<img src="../images/date.gif" align="absmiddle" style="cursor:pointer;" onClick="JavaScript:window.open('../day.asp?form=form1&field=cargodate&oldDate='+cargodate.value,'','directorys=no,toolbar=no,status=no,menubar=no,scrollbars=no,resizable=no,width=250,height=170,top=150,left=590');">
		  		&nbsp;&nbsp;&nbsp;送货方向
		  		<input name="cargodir" style="width:150px">
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