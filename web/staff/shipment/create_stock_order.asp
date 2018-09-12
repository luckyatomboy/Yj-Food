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
<title><%=dianming%> - 入库单</title>
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
if fla27="0" then
%>
<br><center><img src="../images/note.gif" align="absmiddle">&nbsp;<font color="#FF0000">你不具备此权限，请与管理员联系！</font></center>
<%  
  response.end
end if
%>

<%
if request("hid1")="ok" then
nowstatus=request("status")
nowrefshipment=request("refshipment")
nowrefitem=request("refitem")
nowcontract=request("contract")
nowcountry=request("country")
if request("material")<>"" then
	nowmaterial=request("material")
	nowspec=request("spec")
	nowprice=request("price")
else
	nowmaterial=""
	nowspec=""
	nowprice=0	
end if
nowplant=request("plant")
'nowcasenumber=request("casenumber")
nowcase=request("case")
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
nowcategory="A"
if request("stockdate")<>"" then
	nowstockdate=request("stockdate")
else
	nowstockdate=date()
end if
nowcustomer=request("customer")
nowstorage=request("coldstorage")
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
'nowduedate=request("duedate")
nowamount=0

sql="select top 1 * from stockdocument where stockcategory='A' order by stocknumber desc"

set rs_count=conn.execute(sql)

if rs_count.bof and rs_count.eof then
	nowstocknumber="10000001"
else
	rs_count.movefirst
	nowstocknumber=rs_count("stocknumber") + 1
end if	

sql="insert into stockdocument(stocknumber,stockcategory,stockstatus,material,country,case,quantity,weight,plant,contract,stockdate,spec,customer,coldstorage,stockqty,remainqty,reason,productdate,warrantyperiod,price,stockamount,refshipment,refitem,createdate,creator,trancurrency)"
sql=sql&" values("&nowstocknumber&",'"&nowcategory&"','"&nowstatus&"','"&nowmaterial&"','"&nowcountry&"','"&nowcase&"',"&nowquantity&","&nowweight&",'"&nowplant&"','"&nowcontract&"',#"&nowstockdate&"#,'"&nowspec&"','"&nowcustomer&"','"&nowstorage&"',"&nowquantity&","&nowremainqty&",'"&nowreason&"',#"&nowproductdate&"#,'"&nowwarranty&"',"&nowprice&","&nowamount&",'"&nowrefshipment&"','"&nowrefitem&"',#"&now()&"#,'"&session("redboy_username")&"','"&nowcurrency&"')"
conn.execute(sql)
%>
<script language="javascript">
//alert(&nowshipment&)
alert("入库单录入成功！")
window.location.href="shipment.asp"
</script>

<%
else
%>
<script language="javascript">
function check1(){
<!-- 检查品名 -->
if (document.form1.material.value=="")
{
alert("请输入品名！");
return false;
}

}
</script>

<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#C4D8ED">
<tr>
<td><img src="../images/r_1.gif" alt="" /></td>
<td width="100%" background="../images/r_0.gif">
  <table cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td>&nbsp;入库单 </td>
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
        <td width="20%" align="right" height="30">状态：</td>
        <td width="80%" class="category">
					<%
					sql="select * from stockstatus where category='A'"
					set rs_status=conn.execute(sql)
					%>
					<select name="status">
						<%do while rs_status.eof=false%>
						<option value="<%=rs_status("status")%>"><%=rs_status("description")%></option>
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
					<input name="refshipment" readonly style="width:100px" value="单击选择船期" onClick="JavaScript:window.open('query_shipment.asp?queryform=form1&field=refshipment&field2=old_refitem&field3=plant','','directorys=no,toolbar=no,status=no,menubar=no,scrollbars=yes,resizable=yes,width=1200,height=470,top=100,left=20');">
					
					&nbsp;&nbsp;&nbsp;项目			
					
					<select name="refitem">
					<% 
					   sql="select * from shipment where shipmentnum=10000003"
					   set rs_shipment=conn.execute(sql)
					%>
						<option value="refitem"><%=request("refitem")%></option>
						<% if rs_shipment("material2")<>"" then %>
						<option value="<%=rs_shipment("material2")%>"><%=rs_shipment("material2")%></option>
						<% end if %>
						<% if rs_shipment("material3")<>"" then %>
						<option value="<%=rs_shipment("material3")%>"><%=rs_shipment("material3")%></option>
						<% end if %>
						<% if rs_shipment("material4")<>"" then %>
						<option value="<%=rs_shipment("material4")%>"><%=rs_shipment("material4")%></option>
						<% end if %>
						<% if rs_shipment("material5")<>"" then %>
						<option value="<%=rs_shipment("material5")%>"><%=rs_shipment("material5")%></option>
						<% end if %>					
					</select>				
					
					<!--<input name="refitem" style="width:100px">-->
				</td>
      </tr>
      <tr>	  
	    	<td align="right" height="30">入库日期：</td>
        <td class="category">
				<input name="stockdate" readonly style="width:80px">
		  		<img src="../images/date.gif" align="absmiddle" style="cursor:pointer;" onClick="JavaScript:window.open('../day.asp?form=form1&field=stockdate&oldDate='+stockdate.value,'','directorys=no,toolbar=no,status=no,menubar=no,scrollbars=no,resizable=no,width=250,height=170,top=150,left=590');">
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
				&nbsp;&nbsp;&nbsp;合同号	
				<input name="contract" value="<%=contract%>" style="width:150px" maxlength="20">
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
							<option value="<%=rs_mat("materialname")%>"><%=rs_mat("materialname")%></option>
						<%
							rs_mat.movenext
							loop
						%>
					</select>	           	
		  		&nbsp;&nbsp;&nbsp;规格
		  		<input name="spec" style="width:100px">
		  		&nbsp;&nbsp;&nbsp;单价
		  		<input name="price" style="width:100px" value=0 onKeyPress="javascript:CheckNum();" onKeyUp="this.value=this.value.replace(/[^\d.]/g,'')">&nbsp;/吨
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
	    	<td align="right" height="30">箱号：</td>
        <td class="category">
		  		<input name="case" style="width:120px" maxlength="15" <% if nowcase<>"" then%>value="<%=nowcase%>"<%end if%>>
		  		&nbsp;&nbsp;&nbsp;箱数
		  		<input name="quantity" style="width:80px" maxlength="5"  <% if nowquantity<>"" then%>value="<%=nowquantity%>"<%end if%> onKeyPress="javascript:CheckNum();"  onKeyUp="this.value=this.value.replace(/[^\d.]/g,'')">
		  		&nbsp;&nbsp;&nbsp;重量
		  		<input name="weight" style="width:150px" maxlength="20" <% if nowweight<>"" then%>value="<%=nowweight%>"<%end if%>>
				</td>
      </tr>	  
      <tr>	  
	    	<td align="right" height="30">冷库名称：</td>
        <td class="category">
		  		<input name="coldstorage" style="width:100px">
				&nbsp;&nbsp;&nbsp;货主
		  		<input name="customer" style="width:100px">
				</td>
      </tr>
      <tr>	  
	    	<td align="right" height="30">入库数量：</td>
        <td class="category">
		  		<input name="stockqty" style="width:100px">
				&nbsp;&nbsp;&nbsp;入库原因
		  		<input name="reason" style="width:100px">				
				&nbsp;&nbsp;&nbsp;剩余数量
		  		<input name="remainqty" style="width:100px" readonly >				
				</td>
      </tr>
      <tr>	  
	    	<td align="right" height="30">生产日期：</td>
        <td class="category">
		  		<input name="productdate" readonly style="width:80px">
		  		<img src="../images/date.gif" align="absmiddle" style="cursor:pointer;" onClick="JavaScript:window.open('../day.asp?form=form1&field=productdate&oldDate='+productdate.value,'','directorys=no,toolbar=no,status=no,menubar=no,scrollbars=no,resizable=no,width=250,height=170,top=150,left=590');">
		  		&nbsp;&nbsp;&nbsp;&nbsp;保质期
				<input name="warranty" style="width:100px">
				</td>
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