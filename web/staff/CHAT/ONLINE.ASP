<!--#include file="reload.asp" -->
<html>
<head>
<title>Untitled Document</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="refresh" content="10">
<style type="text/css">
<!--
body {
	font-size: 12px;
}
a {
	font-size: 13px;
	color: #000000;
}
a:visited {
	text-decoration: underline;
}
a:hover {
	text-decoration: none;
}
-->
</style>
</head>

<body bgcolor="#FDD69F">
<div align="center">在线人数列表<br>
  <br>
  <table width="93" height="54" border="0" cellpadding="0" cellspacing="0">
    <tr> 
      <td colspan="2"><a href=# onClick=javascript:parent.say.document.say.towho.value="大家">大家</a></td>
    </tr>
  <% 
UserList=application("UserList")
for i=1 to UBound(UserList)
length=len(userlist(i))-1
sx=right(userlist(i),1)
if sx=0 then
%>
    <tr> 
      <td width="26%" height="20" valign="top"><img src=images/boy.gif></td>
      <td width="74%" valign="baseline"><%response.write "<a href=# onClick=javascript:parent.say.document.say.towho.value='"&left(userlist(i),length)&"'><font color=green>"&left(userlist(i),length)&"</font></a><br>"%></td>
    </tr>
<%else%>
    <tr> 
      <td width="26%" height="20" valign="top"><img src=images/girl.gif></td>
      <td width="74%" valign="baseline"><%response.write "<a href=# onClick=javascript:parent.say.document.say.towho.value='"&left(userlist(i),length)&"'><font color=red>"&left(userlist(i),length)&"</font></a><br>"%></td>
    </tr>
<%end if
next%>
  </table>
  <br>
  <br>
</div>
</body>
</html>
