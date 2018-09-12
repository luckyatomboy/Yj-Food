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
if fla24="0" and session("redboy_id")<>"1" then
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
}
</script>
<%
sql="select * from login where id="&request("id")
set rs=conn.execute(sql)
nowquanxian=rs("quanxian")
nowfla=split(nowquanxian,",")
nowfla1=nowfla(0)
nowfla2=nowfla(1)
nowfla3=nowfla(2)
nowfla4=nowfla(3)
nowfla5=nowfla(4)
nowfla6=nowfla(5)
nowfla7=nowfla(6)
nowfla8=nowfla(7)
nowfla9=nowfla(8)
nowfla10=nowfla(9)
nowfla11=nowfla(10)
nowfla12=nowfla(11)
nowfla13=nowfla(12)
nowfla14=nowfla(13)
nowfla15=nowfla(14)
nowfla16=nowfla(15)
nowfla17=nowfla(16)
nowfla18=nowfla(17)
nowfla19=nowfla(18)
nowfla20=nowfla(19)
nowfla21=nowfla(20)
nowfla22=nowfla(21)
nowfla23=nowfla(22)
nowfla24=nowfla(23)
nowfla25=nowfla(24)
nowfla26=nowfla(25)
nowfla27=nowfla(26)
nowfla28=nowfla(27)
nowfla29=nowfla(28)
nowfla30=nowfla(29)
nowfla31=nowfla(30)
nowfla32=nowfla(31)
nowfla33=nowfla(32)
nowfla34=nowfla(33)
%>
<form name="form1">
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#C4D8ED">
<tr>
<td><img src="../images/r_1.gif" alt="" /></td>
<td width="100%" background="../images/r_0.gif">
  <table cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td>&nbsp;员工资料修改(带*号的为必填项)</td>
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
        <td class="category"><input type="text" name="bianhao" value="<%=rs("bianhao")%>" style="width:200px">
          &nbsp;<font color="#ff0000">*</font> <font color="#666666">(不能有相同的编号)</font>
		  		编号和姓名都能登陆
				</td>
      </tr>
	  <tr>
        <td height="30" align="right">员工姓名：</td>
        <td class="category"><input type="text" name="username" value="<%=rs("username")%>" style="width:200px">
          &nbsp;<font color="#ff0000">*</font> <font color="#666666">(不能有同名的员工)</font></td>
      </tr>
      <tr>
        <td align="right" height="30">密码：</td>
        <td class="category"><input type="text" name="password" style="width:200px">&nbsp;&nbsp;(不修改请留空)</td>
      </tr> 	  
      <tr>
        <td align="right" height="30">职务：</td>
        <td class="category"><input type="text" name="position" value="<%=rs("position")%>" style="width:200px"></td>
      </tr> 	      
      <tr>
        <td align="right" height="30">员工性别：</td>
        <td class="category"><input type="radio" name="xinbie" value="女"<%if rs("xinbie")="女" then%> checked="checked"<%end if%>>女 <input type="radio" name="xinbie" value="男"<%if rs("xinbie")="男" then%> checked="checked"<%end if%>>男</td>
      </tr>
      <tr>
        <td align="right" height="30">联系电话：</td>
        <td class="category"><input type="text" name="tel" style="width:200px" value="<%=rs("tel")%>"></td>
      </tr>
	  <tr>
        <td align="right" height="30">MSN：</td>
        <td class="category"><input type="text" name="msn" style="width:200px" value="<%=rs("qq")%>" onKeyUp="this.value=this.value.replace(/[^\d.]/g,'')"  onafterpaste="this.value=this.value.replace(/[^\d.]/g,'')"></td>
      </tr>
	  <tr>
        <td align="right" height="30">Email：</td>
        <td class="category"><input type="text" name="email" style="width:200px" value="<%=rs("email")%>"></td>
      </tr>
      <tr>
        <td align="right" height="30">家庭住址：</td>
        <td class="category"><input type="text" name="address" style="width:300px" value="<%=rs("address")%>"></td>
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
		    <td><input type="checkbox" name="quanxian1" value="1" <%if nowfla1="1" then%>checked="checked"<%end if%>> 新建合同</td>
				<td><input type="checkbox" name="quanxian2" value="1" <%if nowfla2="1" then%>checked="checked"<%end if%>> 配证，付汇</td>
				<td><input type="checkbox" name="quanxian3" value="1" <%if nowfla3="1" then%>checked="checked"<%end if%>> 报关</td>
				<td><input type="checkbox" name="quanxian4" value="1" <%if nowfla4="1" then%>checked="checked"<%end if%>> 送货</td>
		  </tr>	
		  <tr><td colspan="4" class="category">入库管理</td></tr>
		  <tr>
		    <td width="25%"><input type="checkbox" name="quanxian27" value="1" <%if nowfla27="1" then%>checked="checked"<%end if%>> 创建入库单</td>
		    <td width="25%"><input type="checkbox" name="quanxian28" value="1" <%if nowfla28="1" then%>checked="checked"<%end if%>> 修改入库单</td>
			<td width="25%"><input type="checkbox" name="quanxian29" value="1" <%if nowfla29="1" then%>checked="checked"<%end if%>> 删除入库单</td>
			<td width="25%"><input type="checkbox" name="quanxian30" value="1" <%if nowfla30="1" then%>checked="checked"<%end if%>> 查询入库单</td>
		  </tr>
		  <tr><td colspan="4" class="category">出库管理</td></tr>		  
		  <tr>
		    <td width="25%"><input type="checkbox" name="quanxian31" value="1" <%if nowfla31="1" then%>checked="checked"<%end if%>> 创建出库单</td>
		    <td width="25%"><input type="checkbox" name="quanxian32" value="1" <%if nowfla32="1" then%>checked="checked"<%end if%>> 修改出库单</td>
			<td width="25%"><input type="checkbox" name="quanxian33" value="1" <%if nowfla33="1" then%>checked="checked"<%end if%>> 删除出库单</td>
			<td width="25%"><input type="checkbox" name="quanxian34" value="1" <%if nowfla34="1" then%>checked="checked"<%end if%>> 查询出库单</td>
		  </tr>		  
		  <tr><td colspan="4" class="category">客户管理</td></tr>
		  <tr>
		    <td width="25%"><input type="checkbox" name="quanxian5" value="1" <%if nowfla5="1" then%>checked="checked"<%end if%>> 创建客户</td>
		    <td width="25%"><input type="checkbox" name="quanxian6" value="1" <%if nowfla6="1" then%>checked="checked"<%end if%>> 修改客户</td>
			<td width="25%"><input type="checkbox" name="quanxian7" value="1" <%if nowfla7="1" then%>checked="checked"<%end if%>> 删除客户</td>
			<td width="25%"><input type="checkbox" name="quanxian8" value="1" <%if nowfla8="1" then%>checked="checked"<%end if%>> 查询客户</td>
		  </tr>
		  <tr><td colspan="4" class="category">供应商管理</td></tr>
		  <tr>
		    <td width="25%"><input type="checkbox" name="quanxian9" value="1" <%if nowfla9="1" then%>checked="checked"<%end if%>> 创建供应商</td>
		    <td width="25%"><input type="checkbox" name="quanxian10" value="1" <%if nowfla10="1" then%>checked="checked"<%end if%>> 修改供应商</td>
			<td width="25%"><input type="checkbox" name="quanxian11" value="1" <%if nowfla11="1" then%>checked="checked"<%end if%>> 删除供应商</td>
			<td width="25%"><input type="checkbox" name="quanxian12" value="1" <%if nowfla12="1" then%>checked="checked"<%end if%>> 查询供应商</td>
		  </tr>
		  <tr><td colspan="4" class="category">品名管理</td></tr>
		  <tr>
		    <td width="25%"><input type="checkbox" name="quanxian13" value="1" <%if nowfla13="1" then%>checked="checked"<%end if%>> 创建品名</td>
		    <td width="25%"><input type="checkbox" name="quanxian14" value="1" <%if nowfla14="1" then%>checked="checked"<%end if%>> 修改品名</td>
			<td width="25%"><input type="checkbox" name="quanxian15" value="1" <%if nowfla15="1" then%>checked="checked"<%end if%>> 删除品名</td>
			<td width="25%"><input type="checkbox" name="quanxian16" value="1" <%if nowfla16="1" then%>checked="checked"<%end if%>> 查询品名</td>
		  </tr>
		  <tr><td colspan="4" class="category">配证管理</td></tr>
		  <tr>
		    <td width="25%"><input type="checkbox" name="quanxian17" value="1" <%if nowfla17="1" then%>checked="checked"<%end if%>> 录入许可证</td>
		    <td width="25%"><input type="checkbox" name="quanxian18" value="1" <%if nowfla18="1" then%>checked="checked"<%end if%>> 修改许可证</td>
			<td width="25%"><input type="checkbox" name="quanxian19" value="1" <%if nowfla19="1" then%>checked="checked"<%end if%>> 删除许可证</td>
			<td width="25%"><input type="checkbox" name="quanxian20" value="1" <%if nowfla20="1" then%>checked="checked"<%end if%>> 查询许可证</td>
		  </tr>
		  <tr><td colspan="4" class="category">员工管理</td></tr>
		  <tr>
		    <td><input type="checkbox" name="quanxian23" value="1" <%if nowfla23="1" then%>checked="checked"<%end if%>> 添加员工资料</td>
		    <td><input type="checkbox" name="quanxian24" value="1" <%if nowfla24="1" then%>checked="checked"<%end if%>> 修改员工资料</td>
				<td><input type="checkbox" name="quanxian25" value="1" <%if nowfla25="1" then%>checked="checked"<%end if%>> 删除员工资料</td>
				<td><input type="checkbox" name="quanxian26" value="1" <%if nowfla26="1" then%>checked="checked"<%end if%>> 查询员工资料</td>
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
for x=2 to 34
  if request("quanxian"&x)="1" then
    nowquanxian=nowquanxian&",1"
  else
    nowquanxian=nowquanxian&",0"
  end if
next

if nowpassword="" then
  sql="update login set username='"&nowusername&"',quanxian='"&nowquanxian&"',position='"&nowposition&"',xinbie='"&nowxinbie&"',tel='"&nowtel&"',address='"&nowaddress&"',msn='"&nowmsn&"',email='"&nowemail&"' where id="&request("id")
else
  sql="update login set username='"&nowusername&"',password='"&md5(nowpassword)&"',quanxian='"&nowquanxian&"',position='"&nowposition&"',xinbie='"&nowxinbie&"',tel='"&nowtel&"',address='"&nowaddress&"',msn='"&nowmsn&"',email='"&nowemail&"' where id="&request("id")
end if
conn.execute(sql)
%>
<script language="javascript">
alert("员工资料修改成功！")
window.location.href="user.asp"
</script> 
<%
end if
%>
</body>
</html>