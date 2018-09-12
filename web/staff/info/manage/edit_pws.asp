<%@language="VBscript"%>
<%Response.Expires=0%>
<!--#include file="../include/checkadmin.asp"-->
<!--#include file="../include/conn.asp"-->
<%
if request.form("action")="edit_pws" then
	adminname=request.form("adminname")
	old_pass=request.form("old_pass")
	new_pass1=request.form("new_pass1")
	new_pass2=request.form("new_pass2")
	if adminname="" or isnull(adminname) then
		response.write("<script language='javascript'>alert('请输入用户名！');history.back();</script>")
		response.end
	end if
	if old_pass="" or isnull(old_pass) then
		response.write("<script language='javascript'>alert('旧密码不正确，请重新输入！');history.back();</script>")
		response.end
	end if
	if new_pass1="" or isnull(new_pass1) or new_pass1<>new_pass2 then
		response.write("<script language='javascript'>alert('新密码与确认密码不一致，请重新输入！');history.back();</script>")
		response.end
	end if
	set rs=conn.execute("select adminid,adminpass from tbl_admin where adminname='"&session("adminname")&"'")
	adminid=rs("adminid")
	adminpass=rs("adminpass")
	set rs=nothing
	if old_pass<>adminpass then
		response.write("<script language='javascript'>alert('旧密码不正确，请重新输入！');history.back();</script>")
		response.end
	end if
	conn.execute "update tbl_admin set adminname='"&adminname&"',adminpass='"&new_pass1&"' where adminid="&adminid
	response.write("<script language='javascript'>alert('密码修改成功！');history.back();</script>")
end if
%>
<style>
	td{font-size:13px;}
</style>
<script language="javascript">
	function doSubmit(){
		var obj=document.frmadd;

		if(obj.old_pass.value==""){
			alert("请输入旧密码！");
			obj.old_pass.focus();
			return false;
		}
		if(obj.new_pass1.value==""){
			alert("请输入新密码！");
			obj.new_pass1.focus();
			return false;
		}
		if(obj.new_pass2.value==""){
			alert("请输入确认密码！");
			obj.new_pass2.focus();
			return false;
		}
		if(obj.new_pass1.value!=obj.new_pass2.value){
			alert("新密码与确认密码不一致！");
			obj.new_pass1.focus();
			return false;
		}
	}
</script>
<table border="0" cellspacing="1" width="600" bgcolor="#D6DFF7">
  <form name="frmadd" method="post" onsubmit="javascript:return doSubmit();">
  <input type="hidden" name="action" value="edit_pws">
  <tr>
    <td height="23"><img src="images/spacer.gif" width="10" height="1"><font style="font-size:13px;" color="#215DC6"><b>更改密码</b></font></td>
  </tr>
  <tr>
    <td height="23" bgcolor="#FFFFFF">
	<br>
	<table align="center" border="0" width="66%">
	  <tr>
		<td height="26" width="80">用户名</td>
		<td><input type="text" name="adminname" style="width:180px;"></td>
	  </tr>
	  <tr>
		<td height="26" width="80">旧密码</td>
		<td><input type="password" name="old_pass" style="width:180px;"></td>
	  </tr>
	  <tr>
		<td height="26">新密码</td>
		<td><input type="password" name="new_pass1" style="width:180px;"></td>
	  </tr>
	  <tr>
		<td height="26">确认密码</td>
		<td><input type="password" name="new_pass2" style="width:180px;"></td>
	  </tr>
	</table>
	<br>
	</td>
  </tr>
  <tr>
    <td height="23" colspan="2" align="center">
	<input type="submit" name="btnSubmit" value="确定" style="width:60px;">
	<input type="reset" name="btnReset" value="取消" style="width:60px;">
	</td>
  </tr>
  </form>
</table>
