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
<title><%=dianming%> - 修改备注</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../style/style.css" rel="stylesheet" type="text/css">
<style>
body {
	background-color:#FFFFFF;
}
</style>
</HEAD>

<BODY>
<%if request("hid")="" then%> 
<%
sql="select * from kcpd where id="&request("id")
set rs=conn.execute(sql)
%>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#C4D8ED">
<tr>
<td><img src="../images/r_1.gif" alt="" /></td>
<td width="100%" background="../images/r_0.gif">
  <table cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td>&nbsp;修改备注(带*号的为必填项)</td>
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
	  <form name="form2">
	  <input type="hidden" name="id" value="<%=request("id")%>">      
      <tr>
        <td align="right" height="30">备注：</td>
        <td class="category">
          <textarea name="beizhu" cols="60" rows="3"><%=rs("beizhu")%></textarea>
        </td>
      </tr>		  	    
      <tr>
	    <td height="30">&nbsp;</td>
        <td class="category">
		  <input type="submit" value=" 确认修改 " class="button">&nbsp;&nbsp;&nbsp;&nbsp;
		  <input type="reset" value=" 重新填写 " class="button">
		  <input type="hidden" name="hid" value="ok">
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
<%
else
nowbeizhu=request("beizhu")
set rs=server.createobject("ADODB.RecordSet")
sql="select * from kcpd where id="&request("id")
rs.open sql,conn,1,3
rs("beizhu")=nowbeizhu
rs.update
rs.close
%>
<script language="javascript">
alert("备注修改成功！")
window.opener.location.reload();
window.close();
</script> 
<%
end if
%>
</body>
</html>