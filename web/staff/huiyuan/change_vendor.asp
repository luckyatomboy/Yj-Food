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
<title><%=dianming%> - 修改供应商</title>
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
sql="select * from vendor where vendorid="&request("vendorid")
set rs=conn.execute(sql)
%>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#C4D8ED">
<tr>
<td><img src="../images/r_1.gif" alt="" /></td>
<td width="100%" background="../images/r_0.gif">
  <table cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td>&nbsp;修改供应商资料</td>
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
  		<input type="hidden" name="vendorid" value="<%=request("vendorid")%>">
      <tr>
        <td width="25%" height="30" align="right">供应商代码：</td>
        <td width="75%" class="category"><%=rs("vendorid")%>
        	</td>
      </tr>
      <tr>
        <td align="right">供应商名称：</td>
        <td class="category"><input type="text" name="vendorname" style="width:200px" value="<%=rs("vendorname")%>"> 
        	</td>
      </tr>      
      <tr>
        <td align="right" height="30">公司地址：</td>
        <td class="category"><input type="text" name="address" style="width:300px" value="<%=rs("address")%>"></td>
      </tr> 	  
      <tr>
        <td align="right" height="30">联系电话：</td>
        <td class="category"><input type="text" name="tel" style="width:200px" value="<%=rs("tel")%>"></td>
      </tr>	 
      <tr>
        <td align="right" height="30">传真：</td>
        <td class="category"><input type="text" name="fax" style="width:200px" value="<%=rs("fax")%>"></td>
      </tr>	       
	    <tr>
        <td align="right" height="30">Email：</td>
        <td class="category"><input type="text" name="email" style="width:200px" value="<%=rs("email")%>"></td>
      </tr> 
      <tr>
        <td align="right" height="30">联系人：</td>
        <td class="category"><input type="text" name="partner" style="width:200px" value="<%=rs("partner")%>"></td>
      </tr> 	   
      <tr>
        <td align="right" height="30">付款方式1：</td>
        <td class="category"><input type="text" name="term1" style="width:100px" value="<%=rs("term1")%>"></td>
      </tr> 	
      <tr>
        <td align="right" height="30">付款方式2：</td>
        <td class="category"><input type="text" name="term2" style="width:100px" value="<%=rs("term2")%>"></td>
      </tr> 	    
      <tr>
        <td align="right" height="30">备注：</td>
        <td class="category"><textarea name="beizhu" cols="70" rows="4"><%=rs("memo")%></textarea></td>
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
nowid=request("vendorid")
nowname=request("vendorname")
nowaddress=request("address")
nowtel=request("tel")
nowfax=request("fax")
nowemail=request("email")
nowpartner=request("partner")
nowdes=request("beizhu")
nowkeyword=request("keyword")

set rs=server.createobject("ADODB.RecordSet")
sql="select * from vendor where vendorid="&request("vendorid")
rs.open sql,conn,1,3
rs("vendorname")=nowname
rs("address")=nowaddress
rs("tel")=nowtel
rs("fax")=nowfax
rs("email")=nowemail
rs("partner")=nowpartner
rs("memo")=nowdes
rs("changedate")=now
rs("changer")=session("redboy_username")
rs.update
rs.close

%>
<script language="javascript">
alert("客户资料修改成功！")
window.location.href="query_vendor.asp?form=<%=request("form")%>&keyword=<%=nowkeyword%>"
</script> 
<%
end if
%>
</body>
</html>