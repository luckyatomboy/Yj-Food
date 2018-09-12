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
if fla17="0" and session("redboy_id")<>"1" then
%>
<br><center><img src="../images/note.gif" align="absmiddle">&nbsp;<font color="#FF0000">你不具备此权限，请与管理员联系！</font></center>
<%  
  response.end
end if
%>

<%
if request("hid1")="ok" then
orderid=request("orderid")
batch=request("batch")
nowid_login=request("id_login")
set rs_login=conn.execute("select * from login where id="&nowid_login)
nowid_gys=request("id_gys")
nowgys=""
set rs_gys=conn.execute("select * from gys where id="&nowid_gys)
if rs_gys.eof=false then nowgys=rs_gys("company")
nowhuiyuan=request("huiyuan")
if nowhuiyuan="" then
  nowhuiyuan=0
end if
set rs_bianhao=conn.execute("select * from sell order by id desc")
if rs_bianhao.eof then
  nowbianhao=1000001
else
  nowbianhao=1000001+rs_bianhao("id")
end if


totalshulian=0
totalprice=0
totalprice2=0
for x=1 to maxproduit
nowku=request("ku"&x)
set rs_ku=conn.execute("select * from ku where id="&nowku)
nowhuohao=request("huohao"&x)
nowshulian=request("shulian"&x)
nowprice=request("price"&x)
if nowprice="" then
  nowprice=0
end if
if nowhuohao<>"单击选择产品" and nowshulian<>"" then
set rs_produit=conn.execute("select * from produit where huohao='"&nowhuohao&"'")
set rs=server.createobject("ADODB.RecordSet")
sql="select * from produit where huohao='"&nowhuohao&"' and id_ku="&nowku
rs.open sql,conn,1,3
if rs.eof then
%>
<script language="javascript">
alert("<%=rs_ku("ku")%> 中没有产品 <%=rs_produit("title")%>！")
window.history.go(-1)
</script> 
<%
  response.end
  exit for
elseif rs("shulian")-nowshulian<0 then
%>
<script language="javascript">
alert("<%=rs_ku("ku")%> 中 <%=rs_produit("title")%> 库存不足！")
window.history.go(-1)
</script> 
<%
  response.end
  exit for 
end if
end if
next


totalshulian=0
totalprice=0
totalprice2=0
for x=1 to maxproduit
nowku=request("ku"&x)
set rs_ku=conn.execute("select * from ku where id="&nowku)
nowhuohao=request("huohao"&x)
nowshulian=request("shulian"&x)
nowprice=request("price"&x)
if nowprice="" then
  nowprice=0
end if
if nowhuohao<>"单击选择产品" and nowshulian<>"" then
set rs_produit=conn.execute("select * from produit where huohao='"&nowhuohao&"'")
set rs=server.createobject("ADODB.RecordSet")
sql="select * from produit where huohao='"&nowhuohao&"' and id_ku="&nowku
rs.open sql,conn,1,3
rs("shulian")=rs("shulian")-nowshulian 
rs.update
rs.close
sql="select bigclass from bigclass where id="&rs_produit("id_bigclass")
set rs_bigclass=conn.execute(sql)
sql="select smallclass from smallclass where id="&rs_produit("id_smallclass")
set rs_smallclass=conn.execute(sql)
if rs_smallclass.eof then
  smallclass=""
else
  smallclass=rs_smallclass(0)
end if
totalshulian=totalshulian+nowshulian
totalprice=totalprice+nowprice*nowshulian
totalprice2=totalprice2+rs_produit("price2")*nowshulian
orderid=request("orderid")
batch=request("batch")
sql="insert into sell(batch,orderid,id_produit,bigclass,smallclass,title,huohao,id_ku,ku,shulian,guige,id_login,login,type,selldate,price,price2,id_huiyuan,photo,bianhao,id_gys,gys) values('"&batch&"','"&orderid&"',"&rs_produit("id")&",'"&rs_bigclass(0)&"','"&smallclass&"','"&rs_produit("title")&"','"&nowhuohao&"',"&rs_ku("id")&",'"&rs_ku("ku")&"',"&nowshulian&",'"&rs_produit("guige")&"',"&nowid_login&",'"&rs_login("username")&"',0,#"&date()&"#,"&nowprice&","&rs_produit("price2")&","&nowhuiyuan&",'"&rs_produit("photo")&"','"&nowbianhao&"',"&nowid_gys&",'"&nowgys&"')"
conn.execute(sql)
end if
next
if nowhuiyuan<>0 then
  conn.execute("update huiyuan set jifen=jifen+"&totalprice&" where id="&nowhuiyuan)
end if
orderid=request("orderid")
batch=request("batch")
sql="insert into sell(batch,orderid,shulian,id_login,login,type,selldate,price,price2,id_huiyuan,bianhao,zu,id_gys,gys) values('"&batch&"','"&orderid&"',"&totalshulian&","&nowid_login&",'"&rs_login("username")&"',0,#"&date()&"#,"&totalprice&","&totalprice2&","&nowhuiyuan&",'"&nowbianhao&"',true,"&nowid_gys&",'"&nowgys&"')"
conn.execute(sql)
%>
<script language="javascript">
alert("产品销售成功！")
</script>
<%if dayin2="yes" then%> 
<script language="javascript">
window.open('print_sell.asp?bianhao=<%=nowbianhao%>','打印','width=853,height=470,top=176,left=161,toolbar=no,location=no,directories=no,status=no,menubar=no,resizable=no,scrollbars=yes');
</script>
<%end if%>
<%
end if
%>
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

function check1()
{
if (document.form1.huohao1.value=="单击选择产品")
{
alert("还没有选择产品！");
return false;
}
if (document.form1.shulian1.value=="")
{
alert("请输入数量！");
return false;
}
}
</script>

<script language="javascript">
function chg(objName, objName2, zekou)
{
	var obj;
	obj = document.getElementById(objName);
	obj2 = document.getElementById(objName2);
	temp = obj2.value*zekou
	//obj.value = temp.toFixed(2)
	obj.value = Math.round(temp*100)/100
}
</script>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#C4D8ED">
<form name="form2">
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
	  <form name="form1" method="post">
	  	<input type="hidden" name="djgs" value="<%=request("djgs")%>">
	  	<input type="hidden" name="zdgs" value="<%=request("zdgs")%>">
      <tr>
        <td width="20%" align="right" height="30">代码：</td>
        <td width="80%" class="category">
					<select name="code">
						<option value="1">代理</option>
						<option value="2">自营</option>
					</select>
			  </td>
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
							<option value="<%=rs_customer("customerid")%>"><%=rs_customer("customername")%></option>
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
							<option value="<%=rs_vendor("vendorid")%>"><%=rs_vendor("vendorname")%></option>
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
	    	<td align="right" height="30">品名：</td>
        <td class="category">
					<%
					sql="select * from material"
					set rs_mat=conn.execute(sql)
					%>
					<select name="material">
						<%
							do while rs_mat.eof=false
						%>
							<option value="<%=rs_mat("materialname")%>"><%=rs_mat("materialname")%></option>
						<%
							rs_mat.movenext
							loop
						%>
					</select>
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
				</td>
      </tr>       
      <tr>	  
	    	<td align="right" height="30">厂号：</td>
        <td class="category">
		  		<input name="plant" value="<%=plant%>" style="width:100px">
		  		&nbsp;&nbsp;&nbsp;规格
		  		<input name="spec" value="<%=spec%>" style="width:100px">
		  		&nbsp;&nbsp;&nbsp;单价
		  		<input name="price" value="<%=price%>" style="width:100px" onKeyPress="javascript:CheckNum();">&nbsp;/公斤
		  		&nbsp;&nbsp;&nbsp;付款方式
		  		<input name="term" value="<%=term%>" style="width:150px">
				</td>
      </tr>
      <tr>	  
	    	<td align="right" height="30">动检证：</td>
        <td class="category">
		  		<input name="dongjian" readonly onClick="JavaScript:window.open('query_license.asp?form=form1&field=dongjian&field2=djgs','','directorys=no,toolbar=no,status=no,menubar=no,scrollbars=yes,resizable=no,width=853,height=470,top=176,left=161');" style="width:120px" value="单击选择动检许可证">
		  		<%if djgs<>"" then%>&nbsp;&nbsp;djgs<%end if%>
				</td>
      </tr>
      <tr>	  
	    	<td align="right" height="30">自动证：</td>
        <td class="category">
		  		<input name="zidong" value="<%=zidong%>" style="width:300px">
				</td>
      </tr>
      <tr>	  
	    	<td align="right" height="30">预计装船：</td>
        <td class="category">
		  		<input name="expect" value="<%=expect%>" style="width:100px">
				</td>
      </tr>
      <tr>	  
	    	<td align="right" height="30">装船期：</td>
        <td class="category">
		  		<input name="shipdate" value="<%=shipdate%>" readonly style="width:80px">
		  		<img src="../images/date.gif" align="absmiddle" style="cursor:pointer;" onClick="JavaScript:window.open('day.asp?form=form2&field=shipdate&oldDate='+shipdate.value,'','directorys=no,toolbar=no,status=no,menubar=no,scrollbars=no,resizable=no,width=250,height=170,top=150,left=590');">
				</td>
      </tr> 
      <tr>
	    <td height="30">&nbsp;</td>
        <td class="category">
		  <input type="submit" value=" 确认销售 " onClick="return check1()" disabled class="button">
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
</form>
</table>
</body>
</html>