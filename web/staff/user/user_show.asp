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
<title><%=dianming%> - 会员详细资料</title>
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
if fla40="0" and session("redboy_id")<>"1" then
%>
<br><center><img src="../images/note.gif" align="absmiddle">&nbsp;<font color="#FF0000">你不具备此权限，请与管理员联系！</font></center>
<%  
  response.end
end if
%>
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
%>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#C4D8ED">
<tr>
<td><img src="../images/r_1.gif" alt="" /></td>
<td width="100%" background="../images/r_0.gif">
  <table cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td>&nbsp;员工详细资料</td>
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
        <td height="30" align="right">员工编号：</td>
        <td class="category"><%=rs("bianhao")%></td>
      </tr>
	  <tr>
        <td height="30" align="right">员工姓名：</td>
        <td class="category"><%=rs("username")%></td>
      </tr>
      <tr>
        <td align="right" height="30">职务：</td>
        <td class="category"><%=rs("position")%></td>
      </tr>	  	    	  
      <tr>
        <td align="right" height="30">员工性别：</td>
        <td class="category"><%=rs("xinbie")%></td>
      </tr>
      <tr>
        <td align="right" height="30">联系电话：</td>
        <td class="category"><%=rs("tel")%></td>
      </tr>
	  <tr>
        <td align="right" height="30">MSN：</td>
        <td class="category"><%=rs("msn")%></td>
      </tr>
	  <tr>
        <td align="right" height="30">Email：</td>
        <td class="category"><%=rs("email")%></td>
      </tr>
      <tr>
        <td align="right" height="30">家庭住址：</td>
        <td class="category"><%=rs("address")%></td>
      </tr>
      <tr>
        <td align="right" height="30" valign="top">员工权限：</td>
        <td class="category">
		<table cellpadding="3" cellspacing="0" width="100%" border="0">
		  <tr><td colspan="4" class="category">船期表管理</td></tr>  
		  <tr>
		    <td><input type="checkbox" name="quanxian1" value="1" disabled="disabled" <%if nowfla1="1" then%>checked="checked"<%end if%>> 新建合同</td>
				<td><input type="checkbox" name="quanxian2" value="1" disabled="disabled" <%if nowfla2="1" then%>checked="checked"<%end if%>> 配证，付汇</td>
				<td><input type="checkbox" name="quanxian3" value="1" disabled="disabled" <%if nowfla3="1" then%>checked="checked"<%end if%>> 报关</td>
				<td><input type="checkbox" name="quanxian4" value="1" disabled="disabled" <%if nowfla4="1" then%>checked="checked"<%end if%>> 送货</td>
		  </tr>	
		  <tr>
		    <td><input type="checkbox" name="quanxian21" value="1" disabled="disabled" <%if nowfla21="1" then%>checked="checked"<%end if%>> 自己香港船期</td>
				<td><input type="checkbox" name="quanxian22" value="1" disabled="disabled" <%if nowfla22="1" then%>checked="checked"<%end if%>> 全部香港船期</td>
		  </tr>	 		  
		  <tr><td colspan="4" class="category">客户管理</td></tr>
		  <tr>
		    <td><input type="checkbox" name="quanxian5" value="1" disabled="disabled" <%if nowfla5="1" then%>checked="checked"<%end if%>> 创建客户</td>
		    <td><input type="checkbox" name="quanxian6" value="1" disabled="disabled" <%if nowfla6="1" then%>checked="checked"<%end if%>> 修改客户</td>
				<td><input type="checkbox" name="quanxian7" value="1" disabled="disabled" <%if nowfla7="1" then%>checked="checked"<%end if%>> 删除客户</td>
				<td><input type="checkbox" name="quanxian8" value="1" disabled="disabled" <%if nowfla8="1" then%>checked="checked"<%end if%>> 查询客户</td>
		  </tr>
		  <tr><td colspan="4" class="category">供应商管理</td></tr>
		  <tr>
		    <td><input type="checkbox" name="quanxian9" value="1" disabled="disabled" <%if nowfla9="1" then%>checked="checked"<%end if%>> 创建供应商</td>
		    <td><input type="checkbox" name="quanxian10" value="1" disabled="disabled" <%if nowfla10="1" then%>checked="checked"<%end if%>> 修改供应商</td>
				<td><input type="checkbox" name="quanxian11" value="1" disabled="disabled" <%if nowfla11="1" then%>checked="checked"<%end if%>> 删除供应商</td>
				<td><input type="checkbox" name="quanxian12" value="1" disabled="disabled" <%if nowfla12="1" then%>checked="checked"<%end if%>> 查询供应商</td>
		  </tr>
		  <tr><td colspan="4" class="category">品名管理</td></tr>
		  <tr>
		    <td><input type="checkbox" name="quanxian13" value="1" disabled="disabled" <%if nowfla13="1" then%>checked="checked"<%end if%>> 创建品名</td>
		    <td><input type="checkbox" name="quanxian14" value="1" disabled="disabled" <%if nowfla14="1" then%>checked="checked"<%end if%>> 修改品名</td>
				<td><input type="checkbox" name="quanxian15" value="1" disabled="disabled" <%if nowfla15="1" then%>checked="checked"<%end if%>> 删除品名</td>
				<td><input type="checkbox" name="quanxian16" value="1" disabled="disabled" <%if nowfla16="1" then%>checked="checked"<%end if%>> 查询品名</td>
		  </tr>
		  <tr><td colspan="4" class="category">配证管理</td></tr>
		  <tr>
		    <td><input type="checkbox" name="quanxian17" value="1" disabled="disabled" <%if nowfla17="1" then%>checked="checked"<%end if%>> 录入许可证</td>
		    <td><input type="checkbox" name="quanxian18" value="1" disabled="disabled" <%if nowfla18="1" then%>checked="checked"<%end if%>> 修改许可证</td>
				<td><input type="checkbox" name="quanxian19" value="1" disabled="disabled" <%if nowfla19="1" then%>checked="checked"<%end if%>> 删除许可证</td>
				<td><input type="checkbox" name="quanxian20" value="1" disabled="disabled" <%if nowfla20="1" then%>checked="checked"<%end if%>> 查询许可证</td>
		  </tr>
		  <tr><td colspan="4" class="category">员工管理</td></tr>
		  <tr>
		    <td><input type="checkbox" name="quanxian23" value="1" disabled="disabled" <%if nowfla23="1" then%>checked="checked"<%end if%>> 添加员工资料</td>
		    <td><input type="checkbox" name="quanxian24" value="1" disabled="disabled" <%if nowfla24="1" then%>checked="checked"<%end if%>> 修改员工资料</td>
				<td><input type="checkbox" name="quanxian25" value="1" disabled="disabled" <%if nowfla25="1" then%>checked="checked"<%end if%>> 删除员工资料</td>
				<td><input type="checkbox" name="quanxian26" value="1" disabled="disabled" <%if nowfla26="1" then%>checked="checked"<%end if%>> 查询员工资料</td>
		  </tr>				  
		</table>		
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
</body>
</html>