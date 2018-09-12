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
<title><%=dianming%> - 添加会员</title>
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
if fla35="0" and session("redboy_id")<>"1" then
%>
<br><center><img src="../images/note.gif" align="absmiddle">&nbsp;<font color="#FF0000">你不具备此权限，请与管理员联系！</font></center>
<%  
  response.end
end if
%>
<%if request("hid1")="" then%> 
<script language="javascript">
function check()
{
if (document.form1.username.value==""||document.form1.card.value=="")
{
alert("有*号的必须填写！");
return false;
}
}
</script>
<form name="form1">
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#C4D8ED">
<tr>
<td><img src="../images/r_1.gif" alt="" /></td>
<td width="100%" background="../images/r_0.gif">
  <table cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td>&nbsp;会员管理</td>
	  <td align="right">&nbsp;</td>
    </tr>
  </table>
</td>
<!--<td><img src="../images/r_2.gif" alt="" /></td> -->
<!--	    <td height="30">&nbsp;</td> -->
        <td class="category">
		  <input type="submit" value=" 确认添加 " onClick="return check()" class="button">&nbsp;&nbsp;&nbsp;&nbsp;
		  <input type="hidden" name="hid1" value="ok">
		  <input type="reset" value=" 重新填写 " class="button">		</td>
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