<%'option explicit%>
<%
'强制浏览器重新访问服务器下载页面，而不是从缓存读取页面
Response.Buffer = True
Response.Expires = -1
Response.ExpiresAbsolute = Now() - 1
Response.Expires = 0
Response.CacheControl = "no-cache"
'%>
<!-- #include file="conn.asp" -->
<!-- #include file="inc/md5.asp" -->
<%
sql="select * from config"
set rs_config=conn.execute(sql)
dianming=rs_config("dianming")
if request("action")="" then
%>
<HTML>
<HEAD>
<TITLE><%=dianming%> - 系统登陆</TITLE>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
            <SCRIPT language=JavaScript type=text/JavaScript>
				nereidFadeObjects = new Object();
				nereidFadeTimers = new Object();
				function nereidFade(object, destOp, rate, delta){
				if (!document.all)
				return
					if (object != "[object]"){ 
						setTimeout("nereidFade("+object+","+destOp+","+rate+","+delta+")",0);
						return;
					}
					clearTimeout(nereidFadeTimers[object.sourceIndex]);
					diff = destOp-object.filters.alpha.opacity;
					direction = 1;
					if (object.filters.alpha.opacity > destOp){
						direction = -1;
					}
					delta=Math.min(direction*diff,delta);
					object.filters.alpha.opacity+=direction*delta;
					if (object.filters.alpha.opacity != destOp){
						nereidFadeObjects[object.sourceIndex]=object;
						nereidFadeTimers[object.sourceIndex]=setTimeout("nereidFade(nereidFadeObjects["+object.sourceIndex+"],"+destOp+","+rate+","+delta+")",rate);
					}
				}
				</SCRIPT>
<STYLE>
body {font-family: "宋体";font-size: 12px;text-decoration: none;}
td {font-size: 12px;color: #666666;text-decoration: none;line-height: 18px;font-family: "宋体";}
.S1{
font-family: "宋体"; 
font-weight: bold; 
color: #ffffff; 
font-size:16px;
text-decoration: none}
</STYLE>
</head>
<body bgcolor="#CDE6FA" leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="100%" height="100%" border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
<td align="center" valign="middle">
<table width="646" height="425" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td colspan="3">
			<img src="images/login_01.gif" width="646" height="114" alt="仓库管理软件"></td>
	</tr>

	<tr>
		<td>
			<img src="images/login_02.gif" width="88" height="311" alt=""></td>
	  <td width="476" height="311" valign="top" background="images/login_03.gif"><br>
		         <FORM ACTION="index.asp?action=login" METHOD="post" name="loginform">
		      <table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		<td colspan="3" align=center>
			景泰泽通通讯铺进销存管理系统
	</tr>
          <tr>
            <td width="87" height="30" align="right"></td>
            <td valign="middle">
			  <select name="class">
				<option value="1">管理员登陆</option>
			    <option value="0">供应商登陆</option>
			  </select>
			</td>
            </tr>
		  <tr>
            <td width="87" height="30" align="right">登录名：</td>
            <td valign="middle"><input type="text" name="username" tabindex="1" style="width:160px;"></td>
            </tr>
          <tr>
            <td height="30" align="right">密　码：</td>
            <td><INPUT name="password"  type="password" tabindex="2" style="width:160px;"></td>
          </tr>
          <tr>
            <td height="30" align="right">验证码：</td>
            <td height="30"><input type=text name="verifycode" maxLength=6 size="6" tabindex="3" class="textbox">
              <font color=red><-请在验证码框输入</font> <IMG style="cursor:hand;" src="inc/verifycode.asp?n=<%=Timer%>" onClick="this.src=this.src;" align="absmiddle">&nbsp;</td>
          </tr>
          <tr>
            <td height="50" colspan="2" align="center"><input onMouseOver=nereidFade(this,100,10,5)  style="FILTER:alpha(opacity=50)" onMouseOut=nereidFade(this,50,10,5) src="images/dl.gif"  type="image" tabindex="5" name="enter" border="0" onClick="return checkform()">
            </td>
            </tr>
          <tr>
            <td colspan="2"></td>
          </tr>
        </table>
		</form><hr size=1 color='#efefef' width='80%' align='left'>Copyright &copy 2008.08.08 Powered By <a href="http://www.qiyejinxiaocun.com" target="_blank">销售型企业进销存管理系统WEB版</a><br>
		专业开发、定制、销售企业进销存、网络办公、客户管理系统。QQ:1024009630</td>
		<td>
			<img src="images/login_04.gif" width="82" height="311" alt=""></td>
	</tr>
</table>
</td></tr></table>
<script language=javascript>
<!--
function document.onreadystatechange()
{  var app=navigator.appName;
  var verstr=navigator.appVersion;
  if(app.indexOf('Netscape') != -1) {
    alert('友情提示：\n    您使用的是Netscape浏览器，可能会导致无法使用后台的部分功能。建议您使用 IE6.0 或以上版本。');
  } else if(app.indexOf('Microsoft') != -1) {
    if (verstr.indexOf('MSIE 3.0')!=-1 || verstr.indexOf('MSIE 4.0') != -1 || verstr.indexOf('MSIE 5.0') != -1 || verstr.indexOf('MSIE 5.1') != -1)
      alert('友情提示：\n    您的浏览器版本太低，可能会导致无法使用后台的部分功能。建议您使用 IE6.0 或以上版本。');
  }
  document.loginform.username.focus();
}
function checkform() {
  if(loginform.username.value == '') {
    alert('请输入管理账号！');
    loginform.username.focus();
    return false;
  }
  if(loginform.password.value == '') {
    alert('请输入密码！');
    loginform.password.focus();
    return false;
  }
  if (loginform.verifycode.value == '') {
    alert ('请输入验证码！');
    loginform.verifycode.focus();
    return false;
  }
}
//-->
</script>
</html>
<%
else
nowclass=request.form("class")
nowusername=request.form("username")
nowpassword=request.form("password")
if Trim(Request.Form("Verifycode"))<>Trim(Session("Verifycode")) then 
%>
<script language=javascript>
alert('您输入的后台管理认证码不对，请重新输入！')
window.history.go(-1)
</script>
<%
  response.end
end if
if nowclass="1" then
  sql="select * from login where (username='"&nowusername&"' and password='"&md5(nowpassword)&"') or (bianhao='"&nowusername&"' and password='"&md5(nowpassword)&"')"
else
  sql="select * from gys where company='"&nowusername&"' and password='"&md5(nowpassword)&"'"
end if
set rs=conn.execute(sql)
if rs.eof then
%>
<script language=javascript>
alert('登录名称或密码错误！')
window.history.go(-1)
</script>
<%
  response.end
end if
if nowclass="1" then
set rs_zu=conn.execute("select * from zu_login where id="&rs("id_zu"))
if rs_zu.eof=false then
  session("redboy_zu")=rs_zu("zu")
else
  session("redboy_zu")=""
end if
session("redboy_username")=rs("username")
session("redboy_id")=rs("id")
Session("ManageName")=rs("username")
Session("ManagePwd")=rs("password")
Session("ManageLevel")="3"
Session("EmpId") = rs("id")
Session("EmpName") = rs("UserName")

set rs_zu1=conn.execute("select * from zu_login where id="&rs("id_zu"))
if not rs_zu1.eof then
Session("DeptName") = rs_zu1("zu")
end if
set rs_zu1=nothing

response.redirect "main.asp"
else
session("gys_username")=rs("company")
session("gys_id")=rs("id")
response.redirect "gys_main.asp"
end if
end if
%>