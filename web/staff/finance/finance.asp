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
<title><%=dianming%> - 财务管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../style/style.css" rel="stylesheet" type="text/css">
<style>
body {
	background-color:#FFFFFF;
}
</style>
</HEAD>

<BODY>
<br><center><img src="../images/note.gif" align="absmiddle">&nbsp;<font color="#FF0000">此功能尚未开放，敬请谅解</font></center>
<%  
  response.end
%>	
	
<script language="javascript">
function query_shipment()
{
	window.location.href="query_hongkong_shipment.asp"
}
function add_shipment()
{
	window.location.href="add_hongkong_shipment.asp"
}

</script>
<form name="form1">
<!-- ----------------维护船期表数据------------- -->
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#C4D8ED">
<tr>
<td><img src="../images/r_1.gif" alt="" /></td>
<td width="100%" background="../images/r_0.gif">
  <table cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td>&nbsp;财务管理</td>
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
		  <input type="button" value=" 创建香港船期表 " onClick="return add_shipment()">
		</td>
  </tr>
  <tr>
  	<td></td>
		<td>
		  <input type="button" value=" 香港船期表查询 " onClick="return query_shipment()">		
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