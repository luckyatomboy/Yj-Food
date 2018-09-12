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
<title><%=dianming%> - 维护主数据</title>
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
if fla11="0" and session("redboy_id")<>"1" then
%>
<br><center><img src="../images/note.gif" align="absmiddle">&nbsp;<font color="#FF0000">你不具备此权限，请与管理员联系！</font></center>
<%  
  response.end
end if
%>
<%if request("hid1")="" then%> 
<script language="javascript">
function query()
{
	window.location.href="query_customer.asp"
}
function add()
{
	window.location.href="huiyuan_add.asp"
}
function query_vendor()
{
	window.location.href="query_vendor.asp"
}
function add_vendor()
{
	window.location.href="add_vendor.asp"
}
function query_material()
{
	window.location.href="query_material.asp"
}
function add_material()
{
	window.location.href="add_material.asp"
}
function query_license()
{
	window.location.href="query_license.asp"
}
function add_license()
{
	window.location.href="add_license.asp"
}
function query_shipment()
{
	window.location.href="query_shipment.asp"
}
function add_shipment()
{
	window.location.href="add_shipment.asp"
}
function query_jiesuan()
{
	window.location.href="query_jiesuan.asp"
}
function add_jiesuan()
{
	window.location.href="add_jiesuan.asp"
}
function query_hongkong_shipment()
{
	window.location.href="query_hongkong_shipment.asp"
}
function add_hongkong_shipment()
{
	window.location.href="add_hongkong_shipment.asp"
}
</script>
<form name="form1">
<!-- ----------------维护客户主数据------------- -->
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#C4D8ED">
<tr>
<td><img src="../images/r_1.gif" alt="" /></td>
<td width="100%" background="../images/r_0.gif">
  <table cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td>&nbsp;客户管理</td>
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
  <tr>
    <td width="25%" height="30" align="right">
    </td>
    <td width="75%" class="category">
		  <input type="button" value=" 添加客户 " onClick="return add()">
		</td>
  </tr>
  <tr>
  	<td></td>
		<td>
		  <input type="button" value=" 客户查询 " onClick="return query()">		
		</td>        	
	</tr>
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

<table cellpadding=0 cellspacing=0 width="98%" align=center><tr><td height="5"></td></tr></table>
<!-- ----------------维护供应商主数据------------- -->
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#C4D8ED">
<tr>
<td><img src="../images/r_1.gif" alt="" /></td>
<td width="100%" background="../images/r_0.gif">
  <table cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td>&nbsp;供应商管理</td>
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
  <tr>
    <td width="25%" height="30" align="right">
    </td>
    <td width="75%" class="category">
		  <input type="button" value=" 添加供应商" onClick="return add_vendor()">
		</td>
  </tr>
  <tr>
  	<td></td>
		<td>
		  <input type="button" value=" 供应商查询" onClick="return query_vendor()">		
		</td>        	
	</tr>
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

<table cellpadding=0 cellspacing=0 width="98%" align=center><tr><td height="5"></td></tr></table>
<!-- ----------------维护品名主数据------------- -->
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#C4D8ED">
<tr>
<td><img src="../images/r_1.gif" alt="" /></td>
<td width="100%" background="../images/r_0.gif">
  <table cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td>&nbsp;品名管理</td>
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
  <tr>
    <td width="25%" height="30" align="right">
    </td>
    <td width="75%" class="category">
		  <input type="button" value=" 添加品名" onClick="return add_material()">
		</td>
  </tr>
  <tr>
  	<td></td>
		<td>
		  <input type="button" value=" 品名查询" onClick="return query_material()">		
		</td>        	
	</tr>
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

<table cellpadding=0 cellspacing=0 width="98%" align=center><tr><td height="5"></td></tr></table>
<!-- ----------------维护自动证/动检证主数据------------- -->
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#C4D8ED">
<tr>
<td><img src="../images/r_1.gif" alt="" /></td>
<td width="100%" background="../images/r_0.gif">
  <table cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td>&nbsp;配证管理</td>
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
  <tr>
    <td width="25%" height="30" align="right">
    </td>
    <td width="75%" class="category">
		  <input type="button" value=" 录入自动证/动检证" onClick="return add_license()">
		</td>
  </tr>
  <tr>
  	<td></td>
		<td>
		  <input type="button" value=" 自动证/动检证查询" onClick="return query_license()">		
		</td>        	
	</tr>
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

<table cellpadding=0 cellspacing=0 width="98%" align=center><tr><td height="5"></td></tr></table>
<!-- ----------------维护船期表数据------------- -->
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#C4D8ED">
<tr>
<td><img src="../images/r_1.gif" alt="" /></td>
<td width="100%" background="../images/r_0.gif">
  <table cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td>&nbsp;船期表管理</td>
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
  <tr>
    <td width="25%" height="30" align="right">
    </td>
    <td width="75%" class="category">
		  <input type="button" value=" 录入船期表" onClick="return add_shipment()">
		</td>
  </tr>
  <tr>
  	<td></td>
		<td>
		  <input type="button" value=" 船期表查询" onClick="return query_shipment()">		
		</td>        	
	</tr>
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

<table cellpadding=0 cellspacing=0 width="98%" align=center><tr><td height="5"></td></tr></table>
<!-- ----------------维护结算单------------- -->
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#C4D8ED">
<tr>
<td><img src="../images/r_1.gif" alt="" /></td>
<td width="100%" background="../images/r_0.gif">
  <table cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td>&nbsp;结算单管理</td>
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
  <tr>
    <td width="25%" height="30" align="right">
    </td>
    <td width="75%" class="category">
		  <input type="button" value=" 录入结算单" onClick="return add_jiesuan()">
		</td>
  </tr>
  <tr>
  	<td></td>
		<td>
		  <input type="button" value=" 结算单查询" onClick="return query_jiesuan()">		
		</td>        	
	</tr>
</table>
</td>
<td></td>
</tr>

<table cellpadding=0 cellspacing=0 width="98%" align=center><tr><td height="5"></td></tr></table>
<!-- ----------------维护香港船期表------------- -->
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#C4D8ED">
<tr>
<td><img src="../images/r_1.gif" alt="" /></td>
<td width="100%" background="../images/r_0.gif">
  <table cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td>&nbsp;香港船期表管理</td>
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
  <tr>
    <td width="25%" height="30" align="right">
    </td>
    <td width="75%" class="category">
		  <input type="button" value=" 录入香港船期表" onClick="return add_hongkong_shipment()">
		</td>
  </tr>
  <tr>
  	<td></td>
		<td>
		  <input type="button" value=" 香港船期表查询" onClick="return query_hongkong_shipment()">		
		</td>        	
	</tr>
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
nowqq=request("qq")
nowemail=request("email")
nowid_zu=request("id_zu")
nowusername=request("username")
nowxinbie=request("xinbie")
nowtel=request("tel")
nowaddress=request("address")
nowsfz=request("sfz")
nowjieshao=request("jieshao")
nowcard=request("card")
nowlogin=request("login")
nowstartdate=request("startdate")
nowshenri1=request("shenri1")
nowshenri2=request("shenri2")
nowshenri3=request("shenri3")
nowyinyan=request("yinyan")
nowshenri=nowshenri1&"-"&nowshenri2&"-"&nowshenri3
nowenddate=cdate(nowstartdate)+365
nowbeizhu=request("beizhu")
sql="select * from huiyuan where card='"&nowcard&"'"
set rs=conn.execute(sql)
if rs.eof=false then
%>
<script language="javascript">
alert("您输入的会员卡号已经存在，请重新输入！")
window.history.go(-1)
</script> 
<%
  response.end
end if

if nowjieshao="" then
  nowjieshao=0
else
  sql="update huiyuan set jifen=jifen+"&jieshaojifen&" where id="&nowjieshao
  conn.execute(sql)
end if

sql="insert into huiyuan(username,xinbie,tel,address,sfz,jieshao,card,login,startdate,shenri,enddate,beizhu,yinyan,qq,email,id_zu) values('"&nowusername&"','"&nowxinbie&"','"&nowtel&"','"&nowaddress&"','"&nowsfz&"',"&nowjieshao&",'"&nowcard&"','"&nowlogin&"',#"&nowstartdate&"#,#"&nowshenri&"#,#"&nowenddate&"#,'"&nowbeizhu&"','"&nowyinyan&"','"&nowqq&"','"&nowemail&"',"&nowid_zu&")"
conn.execute(sql)
%>
<script language="javascript">
alert("会员添加成功！")
window.location.href="huiyuan.asp"
</script> 
<%
end if
%>
</body>
</html>