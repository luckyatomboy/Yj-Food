<%
if session("redboy_username")="" then
%>
<script language="javascript">
top.location.href="../index.asp"
</script>
<%  
  response.end
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
<!-- #include file="../inc/md5.asp" -->
<html>
<head>
<title><%=dianming%> - 添加员工</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../style/style.css" rel="stylesheet" type="text/css">
<style>
body {
	background-color:#FFFFFF;
}
</style>
<script>
function CheckAll(form)  {
  for (var i=0;i<form.elements.length;i++)    {
    var e = form.elements[i];
    if (e.name != 'chkall')       e.checked = form.chkall.checked; 
   }
  }
</script>
</HEAD>

<BODY>
<%
if fla23="0" and session("redboy_id")<>"1" then
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
if (document.form1.username.value==""||document.form1.bianhao.value=="")
{
alert("有*号的必须填写！");
return false;
}
if (document.form1.password.value!=document.form1.confirm.value)
{
alert("两次密码输入不一致！");
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
      <td>&nbsp;添加员工资料(带*号的为必填项)</td>
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
        <td width="20%" height="30" align="right">员工编号：</td>
        <td class="category"><input type="text" name="bianhao" style="width:200px">
          &nbsp;<font color="#ff0000">*</font> <font color="#666666">(不能有相同的编号)</font>
		  		编号和姓名都能登陆
				</td>
      </tr>
	  <tr>
        <td height="30" align="right">员工姓名：</td>
        <td class="category"><input type="text" name="username" style="width:200px">
          &nbsp;<font color="#ff0000">*</font> <font color="#666666">(不能有同名的员工)</font></td>
      </tr>
      <tr>
        <td align="right" height="30">密码：</td>
        <td class="category"><input type="password" name="password" style="width:200px">
        &nbsp;<font color="#ff0000">*</font></td>
      </tr> 	 
      <tr>
        <td align="right" height="30">确认密码：</td>
        <td class="category"><input type="password" name="confirm" style="width:200px">
        &nbsp;<font color="#ff0000">*</font></td>
      </tr> 	      
      <tr>
        <td align="right" height="30">职务：</td>
        <td class="category"><input type="text" name="position" style="width:200px"></td>
      </tr> 	        
      <tr>
        <td align="right" height="30">员工性别：</td>
        <td class="category">
        	<input type="radio" name="xinbie" value="女">女
        	<input type="radio" name="xinbie" value="男">男
        </td>
      </tr>
      <tr>
        <td align="right" height="30">联系电话：</td>
        <td class="category"><input type="text" name="tel" style="width:200px"></td>
      </tr>
	  <tr>
        <td align="right" height="30">MSN：</td>
        <td class="category"><input type="text" name="msn" style="width:200px"></td>
      </tr>
	  <tr>
        <td align="right" height="30">Email：</td>
        <td class="category"><input type="text" name="email" style="width:200px"></td>
      </tr>
      <tr>
        <td align="right" height="30">家庭住址：</td>
        <td class="category"><input type="text" name="address" style="width:300px"></td>
      </tr>
      <tr>
        <td align="right" height="30" valign="top">员工权限：</td>
        <td class="category">
		<table cellpadding="3" cellspacing="0" width="100%" border="0">
		  <tr>
		    <td align="right">
			  <input name="chkall" type="checkbox" id="chkall" value="select" onClick="CheckAll(this.form)" style="border:0"> 全选
		      &nbsp;
			  <input type="reset" value=" 恢复默认 " class="button">&nbsp;
			</td>
	      </tr>
		</table>
		<table cellpadding="3" cellspacing="0" width="100%" border="0">
		  <tr><td colspan="4" class="category">船期表管理</td></tr>  
		  <tr>
		    <td><input type="checkbox" name="quanxian1" value="1"> 新建合同</td>
				<td><input type="checkbox" name="quanxian2" value="1"> 配证，付汇</td>
				<td><input type="checkbox" name="quanxian3" value="1"> 报关</td>
				<td><input type="checkbox" name="quanxian4" value="1"> 送货</td>
		  </tr>	
		  <tr>
		  	<td><input type="checkbox" name="quanxian21" value="1"> 自己香港船期</td>
		  	<td><input type="checkbox" name="quanxian22" value="1"> 全部香港船期</td>
		  </tr>
		  <tr><td colspan="4" class="category">客户管理</td></tr>
		  <tr>
		    <td><input type="checkbox" name="quanxian5" value="1"> 创建客户</td>
		    <td><input type="checkbox" name="quanxian6" value="1"> 修改客户</td>
				<td><input type="checkbox" name="quanxian7" value="1"> 删除客户</td>
				<td><input type="checkbox" name="quanxian8" value="1"> 查询客户</td>
		  </tr>
		  <tr><td colspan="4" class="category">供应商管理</td></tr>
		  <tr>
		    <td><input type="checkbox" name="quanxian9" value="1"> 创建供应商</td>
		    <td><input type="checkbox" name="quanxian10" value="1"> 修改供应商</td>
				<td><input type="checkbox" name="quanxian11" value="1"> 删除供应商</td>
				<td><input type="checkbox" name="quanxian12" value="1"> 查询供应商</td>
		  </tr>
		  <tr><td colspan="4" class="category">品名管理</td></tr>
		  <tr>
		    <td><input type="checkbox" name="quanxian13" value="1"> 创建品名</td>
		    <td><input type="checkbox" name="quanxian14" value="1"> 修改品名</td>
				<td><input type="checkbox" name="quanxian15" value="1"> 删除品名</td>
				<td><input type="checkbox" name="quanxian16" value="1"> 查询品名</td>
		  </tr>
		  <tr><td colspan="4" class="category">配证管理</td></tr>
		  <tr>
		    <td><input type="checkbox" name="quanxian17" value="1"> 录入许可证</td>
		    <td><input type="checkbox" name="quanxian18" value="1"> 修改许可证</td>
				<td><input type="checkbox" name="quanxian19" value="1"> 删除许可证</td>
				<td><input type="checkbox" name="quanxian20" value="1"> 查询许可证</td>
		  </tr>
		  <tr><td colspan="4" class="category">员工管理</td></tr>
		  <tr>
		    <td><input type="checkbox" name="quanxian23" value="1"> 添加员工资料</td>
		    <td><input type="checkbox" name="quanxian24" value="1"> 修改员工资料</td>
				<td><input type="checkbox" name="quanxian25" value="1"> 删除员工资料</td>
				<td><input type="checkbox" name="quanxian26" value="1"> 查询员工资料</td>
		  </tr>		  
		</table>		
		</td>
      </tr>	
      <tr>
	    <td height="30">&nbsp;</td>
        <td class="category">
		  <input type="submit" value=" 确认修改 " onClick="return check()" class="button">&nbsp;&nbsp;&nbsp;&nbsp;
		  <input type="hidden" name="hid1" value="ok">
		  <input type="hidden" name="id" value="<%=request("id")%>">
		  <input type="reset" value=" 重置 " class="button">
		  <input type="button" value=" 放弃修改返回 " onClick="window.history.go(-1)" class="button">
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
nowbianhao=request("bianhao")
nowmsn=request("msn")
nowemail=request("email")
nowid_zu=request("id_zu")
nowusername=request("username")
nowpassword=request("password")
nowposition=request("position")
nowxinbie=request("xinbie")
nowtel=request("tel")
nowaddress=request("address")
nowquanxian=""
if request("quanxian1")="1" then
  nowquanxian=nowquanxian&"1"
else
  nowquanxian=nowquanxian&"0"
end if
for x=2 to 26
  if request("quanxian"&x)="1" then
    nowquanxian=nowquanxian&",1"
  else
    nowquanxian=nowquanxian&",0"
  end if
next

sql="select * from login where bianhao='"&nowbianhao&"' and id<>"&session("redboy_id")
set rs=conn.execute(sql)
if rs.eof=false then
%>
<script language="javascript">
alert("您输入的编号已经存在,请重新输入！")
window.history.go(-1)
</script> 
<%
  response.end
end if

sql="select * from login where username='"&nowusername&"' and id<>"&session("redboy_id")
set rs=conn.execute(sql)
if rs.eof=false then
%>
<script language="javascript">
alert("您输入的姓名已经存在，如果有同名员工，请加以区分！")
window.history.go(-1)
</script> 
<%
  response.end
end if

sql="insert into login(bianhao,username,password,quanxian,position,xinbie,tel,address,msn,email) values('"&nowbianhao&"','"&nowusername&"','"&md5(nowpassword)&"','"&nowquanxian&"','"&nowposition&"','"&nowxinbie&"','"&nowtel&"','"&nowaddress&"','"&nowmsn&"','"&nowemail&"')"
conn.execute(sql)
%>
<script language="javascript">
alert("添加员工资料成功！")
window.location.href="user.asp"
</script> 
<%
end if
%>
</body>
</html>