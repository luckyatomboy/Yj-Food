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
<script language="javascript">
function query_customer()
{
	window.location.href="query_customer.asp"
}
function add_customer()
{
	window.location.href="add_customer.asp"
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
		  <input type="button" value=" 添加客户 " onClick="return add_customer()">
		</td>
  </tr>
  <tr>
  	<td></td>
		<td>
		  <input type="button" value=" 客户查询 " onClick="return query_customer()">		
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

</form>

</body>
</html>