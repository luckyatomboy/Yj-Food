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
<title><%=dianming%> - 录入自动证/动检证</title>
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
function isNumberString (InString,RefString)
{
if(InString.length==0) return (false);
for (Count=0; Count < InString.length; Count++)  {
	TempChar= InString.substring (Count, Count+1);
	if (RefString.indexOf (TempChar, 0)==-1)  
	return (false);
}
return (true);
}

function check()
{
if (isNumberString(document.form1.quantity.value,"1234567890.")!=1)
{
alert("数量无效!");
return false;
}
if (isNumberString(document.form1.year.value,"1234567890")!=1)
{
alert("年份无效!");
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
      <td>&nbsp;录入自动证/动检证(带*号的为必填项)</td>
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
        <td width="25%" height="30" align="right">公司名称：</td>
        <td width="75%" class="category">
					<%
					sql="select * from vendor order by vendorname"
					set rs=conn.execute(sql)
					%>
					<select name="company">
						<%
							do while rs.eof=false
						%>
							<option value="<%=rs("vendorname")%>"><%=rs("vendorname")%></option>
						<%
							rs.movenext
							loop
						%>
					</select>
        	&nbsp;<font color="#ff0000">*</font></td>
      </tr>
      <tr>
        <td align="right">类别：</td>
        <td class="category">
					<select name="licensetype">
							<option value="自动证">自动证</option>
							<option value="动检证">动检证</option>
					</select>
        	&nbsp;<font color="#ff0000">*</font></td>
      </tr>      
      <tr>
        <td align="right" height="30">号码：</td>
        <td class="category"><input type="text" name="license" style="width:200px">&nbsp;<font color="#ff0000">*</font></td>
      </tr> 	  
      <tr>
        <td align="right" height="30">年份：</td>
        <td class="category"><input type="text" name="year" style="width:50px" maxlength="4"></td>
      </tr>	 
      <tr>
        <td align="right" height="30">国别：</td>
        <td class="category">
					<%
					sql="select * from country order by country"
					set rs_country=conn.execute(sql)
					%>
					<select name="country">
						<%
							do while rs_country.eof=false
						%>
							<option value="<%=rs_country("country")%>"><%=rs_country("country")%></option>
						<%
							rs_country.movenext
							loop
						%>
					</select>
        </td>
      </tr>	 
      <tr>
        <td align="right" height="30">品名：</td>
        <td class="category">
					<%
					sql="select * from material"
					set rs_mat=conn.execute(sql)
					%>
					<select name="material">
						<%
							do while rs_mat.eof=false
						%>
							<option value="<%=rs_mat("materialname")%>"><%=rs_mat("materialname")%></option>
						<%
							rs_mat.movenext
							loop
						%>
					</select>
        </td>
      </tr>	 
      <tr>
        <td align="right" height="30">数量：</td>
        <td class="category"><input type="text" name="quantity" style="width:100px">&nbsp;&nbsp;吨</td>
      </tr>	  
      <tr>	  
	    	<td align="right" height="30">有效期起始日：</td>
        <td class="category">
		  		<input name="validfrom" value="<%=validfrom%>" readonly style="width:80px">
		  		<img src="../images/date.gif" align="absmiddle" style="cursor:pointer;" onClick="JavaScript:window.open('day.asp?form=form1&field=validfrom&oldDate='+validfrom.value,'','directorys=no,toolbar=no,status=no,menubar=no,scrollbars=no,resizable=no,width=250,height=170,top=150,left=590');">
				</td>
      </tr>      
      <tr>	  
	    	<td align="right" height="30">有效期终止日：</td>
        <td class="category">
		  		<input name="validto" value="<%=validto%>" readonly style="width:80px">
		  		<img src="../images/date.gif" align="absmiddle" style="cursor:pointer;" onClick="JavaScript:window.open('day.asp?form=form1&field=validto&oldDate='+validto.value,'','directorys=no,toolbar=no,status=no,menubar=no,scrollbars=no,resizable=no,width=250,height=170,top=150,left=590');">
				</td>
      </tr>   
      <tr>
	    <td height="30">&nbsp;</td>
        <td class="category">
		  <input type="submit" value=" 确认录入 " onClick="return check()" class="button">&nbsp;&nbsp;&nbsp;&nbsp;
		  <input type="hidden" name="hid1" value="ok">
		  <input type="reset" value=" 重新填写 " class="button">		</td>
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
nowlicensetype=request("licensetype")
nowlicense=request("license")
nowyear=request("year")
nowcountry=request("country")
nowmaterial=request("material")
nowquantity=request("quantity")
nowvalidfrom=request("validfrom")
nowvalidto=request("validto")

sql="select * from license where company='"&nowcompany&"' and licensetype='"&nowlicensetype&"' and license='"&nowlicense&"'"
set rs=conn.execute(sql)
if rs.eof=false then
%>
<script language="javascript">
alert("您输入的许可证已经存在，请重新输入！")
window.history.go(-1)
</script> 
<%
  response.end
end if

sql="insert into license(company,licensetype,license,year,country,material,quantity,remain,validfrom,validto) values('"&nowcompany&"','"&nowlicensetype&"','"&nowlicense&"','"&nowyear&"','"&nowcountry&"','"&nowmaterial&"',"&nowquantity&","&nowquantity&",#"&nowvalidfrom&"#,#"&nowvalidto&"#)"
conn.execute(sql)
%>
<script language="javascript">
alert("录入成功！")
window.location.href="huiyuan.asp"
</script> 
<%
end if
%>
</body>
</html>