<%response.expires=0%>
<!--#include file="conn.asp"-->
<!-- #include file="../const.asp" --> 
<%
if fla91="0" and session("redboy_id")<>"1" then
%>
<br><center><img src="../images/note.gif" align="absmiddle">&nbsp;<font color="#FF0000">你不具备此权限，请与管理员联系！</font></center>
<%  
  response.end
end if
%>
<%
set conn=dbconn("conn")
%>
<html>
<head>
<meta http-equiv="Content-Language" content="zh-cn">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title>企业通迅录查询</title>
<link href="../style/style.css" rel="stylesheet" type="text/css">
<style>
body {
	background-color:#FFFFFF;
}
</style>
</head>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#C4D8ED">
<tr>
<td><img src="../images/r_1.gif" alt="" /></td>
<td width="100%" background="../images/r_0.gif">
  <table cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td>&nbsp;在线通迅录</td>
	  <td align="right">　</td>
    
    </tr>
  </table>
  </table>

<body bgcolor="#ffffff" topmargin="5" leftmargin="5">
<br>
<p align="center"><b><font size="+1">企业通迅录查询</font></b></p>
<form method="POST" action="dispinfo2.asp?typenumber=3&lookstr=企业通迅录查询&page=1">
  <div align="center">
    <center>
    <table border="1" cellpadding="0" cellspacing="0" width="90%" bordercolorlight="#C0C0C0" bordercolordark="#FFFFFF">
      <tr>
        <td height="25" width="59" align="center">
          <p align="center"><input type="checkbox" name="C1" value="ON"></td>
        <td height="25" width="363">&nbsp;企业名称：<input type="text" name="T1" size="20" style="width: 296; height: 22" class="doc_txt"></td>
      </tr>
      <tr>
        <td height="25" width="59" align="center"><input type="checkbox" name="C2" value="ON"></td>
        <td height="25" width="363">&nbsp;姓&nbsp&nbsp&nbsp    名：<input type="text" name="T2" size="20" style="width: 296; height: 22" class="doc_txt"></td>
      </tr>
      <tr>
        <td height="25" width="59" align="center"><input type="checkbox" name="C3" value="ON"></td>
        <td height="25" width="363">&nbsp;企业名称：<input type="text" name="T3" size="20" style="width: 296; height: 22" class="doc_txt"></td>
      </tr>
      <tr>
        <td height="25" width="59" align="center"><input type="checkbox" name="C4" value="ON"></td>
        <td height="25" width="363">&nbsp;地&nbsp;&nbsp;&nbsp; 址：<input type="text" name="T4" size="20" style="width: 296; height: 22" class="doc_txt"></td>
      </tr>
      <tr>
        <td height="25" width="59" align="center"><input type="checkbox" name="C5" value="ON"></td>
        <td height="25" width="363">&nbsp;电&nbsp;&nbsp;&nbsp; 话：<input type="text" name="T5" size="20" style="width: 296; height: 22" class="doc_txt"></td>
      </tr>
      <tr>
        <td height="25" width="59" align="center"><input type="checkbox" name="C6" value="ON"></td>
        <td height="25" width="363">&nbsp;传&nbsp;&nbsp;&nbsp; 真：<input type="text" name="T6" size="20" style="width: 296; height: 22" class="doc_txt"></td>
      </tr>
      <tr>
        <td height="25" width="59" align="center"><input type="checkbox" name="C7" value="ON"></td>
        <td height="25" width="363">&nbsp;邮&nbsp;&nbsp;&nbsp; 编：<input type="text" name="T7" size="20" style="width: 296; height: 22" class="doc_txt"></td>
      </tr>
      <tr>
        <td height="25" width="59" align="center"><input type="checkbox" name="C8" value="ON"></td>
        <td height="25" width="363">&nbsp;省&nbsp;&nbsp;&nbsp; 份：<select size="1" name="D1">
		<option value="">请选择</option>
<%
	set rs=server.createobject("adodb.recordset")
	sql="select * from diqu"
	rs.open sql,conn,1
	do while not rs.eof	
		response.write("<option value="&chr(34)&trim(rs("diqu"))&chr(34)&">"&trim(rs("diqu"))&"</option>")
		rs.movenext
	loop
%>
          </select></td>
      </tr>
      <tr>
        <td height="25" width="59" align="center"><input type="checkbox" name="C9" value="ON"></td>
        <td height="25" width="363">&nbsp;类&nbsp;&nbsp;&nbsp; 别：<select size="1" name="D2">
		<option value="">请选择</option>
<%
	set rs=nothing
	set rs=server.createobject("adodb.recordset")
	sql="select * from fenlei"
	rs.open sql,conn,1
	do while not rs.eof	
		response.write("<option value="&chr(34)&trim(rs("leibie"))&chr(34)&">"&trim(rs("leibie"))&"</option>")
		rs.movenext
	loop
	conn.close
	set conn=nothing
	set rs=nothing
%>
          </select></td>
      </tr>
      
    </table>
    </center>
  </div>
  <p align="center"><input type="submit" value=" 查询 " name="submit"></p>
</form>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#C4D8ED">
<tr>
<td><img src="../images/r_1.gif" alt="" /></td>
<td width="100%" background="../images/r_0.gif">
  <table cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td>　</td>
	  <td align="right">　</td>
    
    </tr>
  </table>
  </table>


</body>

</html>
