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
<title><%=dianming%> - 修改代理公司</title>
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

<%if request("hid1")="" then
sql="select * from agent where company='"&request("company")&"'"
set rs=conn.execute(sql)
%>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#C4D8ED">
<tr>
<td><img src="../images/r_1.gif" alt="" /></td>
<td width="100%" background="../images/r_0.gif">
  <table cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td>&nbsp;修改代理公司</td>
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
  		<input type="hidden" name="keyword" value="<%=request("keyword")%>">
  		<input type="hidden" name="company" value="<%=request("company")%>">
      <tr>
        <td align="right">代理公司：</td>
        <td class="category"><%=request("company")%>
        </td>
      </tr>     
      <tr>
        <td align="right">公司全称：</td>
        <td class="category">
        	<input type="text" name="fullname" style="width:200px" value=<%=rs("fullname")%>>
        </td>
      </tr>  
      <tr>
        <td align="right">银行名称：</td>
        <td class="category">
        	<input type="text" name="bank" style="width:200px" value=<%=rs("bankname")%>>
        </td>
      </tr>  
      <tr>
        <td align="right">银行账号：</td>
        <td class="category">
        	<input type="text" name="account" style="width:200px" value=<%=rs("bankaccount")%>>
        </td>
      </tr>     
      <tr>
        <td align="right">电话：</td>
        <td class="category">
        	<input type="text" name="tel" style="width:150px" value=<%=rs("tel")%>>
        </td>
      </tr>  
      <tr>
        <td align="right">传真：</td>
        <td class="category">
        	<input type="text" name="fax" style="width:150px" value=<%=rs("fax")%>>
        </td>
      </tr>                         
      <tr>
        <td align="right" height="30">备注：</td>
        <td class="category"><textarea name="beizhu" cols="70" rows="4"><%=rs("description")%></textarea></td>
      </tr>	  
      <tr>
        <td align="right" height="30">创建时间：</td>
        <td class="category"><%=rs("createdate")%>
      </tr>	  
      <tr>
        <td align="right" height="30">创建人：</td>
        <td class="category"><%=rs("creator")%>
      </tr>	   
      <tr>
        <td align="right" height="30">修改时间：</td>
        <td class="category"><%=rs("changedate")%>
      </tr>	  
      <tr>
        <td align="right" height="30">修改人：</td>
        <td class="category"><%=rs("changer")%>
      </tr>	            
      <tr>
	    <td height="30">&nbsp;</td>
        <td class="category">
		  <input type="submit" value=" 确认修改 " onClick="return check()" class="button">&nbsp;&nbsp;&nbsp;&nbsp;
		  <input type="hidden" name="hid1" value="ok">
			<input type="button" value=" 放弃修改返回 " onClick="window.history.go(-1)" class="button"> </td>
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
nowcompany=request("company")
nowfullname=request("fullname")
nowbank=request("bank")
nowaccount=request("account")
nowtel=request("tel")
nowfax=request("fax")
nowdes=request("beizhu")
nowkeyword=request("keyword")

set rs=server.createobject("ADODB.RecordSet")
sql="select * from agent where company='"&request("company")&"'"
rs.open sql,conn,1,3
rs("fullname")=nowfullname
rs("bankname")=nowbank
rs("bankaccount")=nowaccount
rs("tel")=nowtel
rs("fax")=nowfax
rs("description")=nowdes
rs("changedate")=now
rs("changer")=session("redboy_username")
rs.update
rs.close

%>
<script language="javascript">
alert("代理公司修改成功！")
window.location.href="query_agent.asp?form=<%=request("form")%>&keyword=<%=nowkeyword%>"
</script> 
<%
end if
%>
</body>
</html>