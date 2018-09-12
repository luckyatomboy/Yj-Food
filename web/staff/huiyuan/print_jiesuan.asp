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
<title><%=dianming%> - 打印</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../style2.css" rel="stylesheet" type="text/css">
<script language=javascript>
function preview() { 
bdhtml=window.document.body.innerHTML; 
sprnstr="<!--startprint-->"; 
eprnstr="<!--endprint-->"; 
prnhtml=bdhtml.substr(bdhtml.indexOf(sprnstr)+17); 
prnhtml=prnhtml.substring(0,prnhtml.indexOf(eprnstr)); 
window.document.body.innerHTML=prnhtml; 
window.print(); 
window.document.body.innerHTML=bdhtml; 
         }
</script>
</HEAD>

<BODY>

<table width="98%" border="0" cellpadding="0" cellspacing="2" align="center">
  <tr> 
    <td height="21" align="center"><img src="../images/print.jpg" align="absmiddle" style="cursor:hand;" onClick="preview();window.close()"></td>
  </tr>
</table>
<!--startprint-->
<table width="98%" border="0" cellpadding="0" cellspacing="2" align="center">
  <tr> 
    <td height="21" align="center"><h1>上海新尚实国际贸易有限公司</h1></td>
  </tr>
  <tr> 
    <td height="16" align="center">SHANGHAI NEW SOURCE INTERNATIONAL TRADING CO.,LTD</td>
  </tr>
  <tr> 
    <td height="16" align="center">地址：中国上海市黄浦区中山南路1088号1506室</td>
  </tr>  
  <tr> 
    <td height="16" align="center">Add: RM1506 NO.1088 South Zhong Shan Road Shanghai,China</td>
  </tr>    
  <tr> 
    <td height="16" align="center">邮编：200010                            Post Code:   200010</td>
  </tr>     
  <tr> 
    <td height="16" align="center">电话：（86-21）6367-3330           Direct Dial:  (86-21)  6367-3330</td>
  </tr>    
  <tr> 
    <td height="16" align="center">传真：（86-21）6367-3303            Facsmile:    (86-21)  6367-3303</td>
  </tr>    
</table>
<!--endprint-->
</body>
</html>