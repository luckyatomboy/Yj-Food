<%
if session("redboy_username")="" then
  response.Redirect "login.asp"
end if
%>
<!-- #include file="conn.asp" -->
<!-- #include file="const.asp" -->

<html>
<head>
<title>库存报警</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="style/style.css" rel="stylesheet" type="text/css">
<style>
body {
	background-color:#FFFFFF;
}
</style>
</HEAD>

<BODY>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#C4D8ED">
<tr>
<td><img src="images/r_1.gif" alt="" /></td>
<td width="100%" background="images/r_0.gif">
  <table cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td>&nbsp;库存报警</td>
	  <td align="right">&nbsp;</td>
    </tr>
  </table>
</td>
<td><img src="images/r_2.gif" alt="" /></td>
</tr>
<tr>
<td></td>
<td>
<table align="center" cellpadding="4" cellspacing="1" class="toptable grid" border="1" width="100%">
      <tr align="center">
	    <td class="category" height="30">品名</td>
		<td class="category">货号</td>
		<td class="category">库存数量</td>
      </tr>
<%
sql="select * from produit"
set rs_produit=conn.execute(sql)
nowbaojin=""
do while rs_produit.eof=false
	  sql="select * from produit where huohao='"&rs_produit("huohao")&"'"
	  set rs_shulian=conn.execute(sql)
	  nowshulian=0
	  do while rs_shulian.eof=false
	    nowshulian=nowshulian+rs_shulian("shulian")
	    rs_shulian.movenext
	  loop
	  sql="select * from ku where id="&rs_produit("id_ku")
	  set rs_ku=conn.execute(sql)
	  if nowshulian<rs_produit("baojin") then
	  nowbaojin=nowbaojin&"ok"
	  %>
	  <tr onMouseOver="this.className='highlight'" onMouseOut="this.className=''">
	    <td align=center height=25><%=rs_produit("title")%></td>
		<td align=center><%=rs_produit("huohao")%></td>
		<td align=center>共<font color=#ff0000><%=nowshulian%></font> | <%=rs_ku("ku")%>(<%=rs_produit("shulian")%>)</td>
	  </tr>
	  <%
	  end if
      rs_produit.movenext	   
loop
%>  
<%if nowbaojin="" then%> 
      <tr onMouseOver="this.className='highlight'" onMouseOut="this.className=''">
	    <td align=center height=25 colspan="3" style="color:#ff0000">没有产品报警</td>
	  </tr>
<%end if%>	  
</table>	
</td>
<td></td>
</tr>
<tr>
<td><img src="images/r_4.gif" alt="" /></td>
<td></td>
<td><img src="images/r_3.gif" alt="" /></td>
</tr>
</table>
</body>
</html>