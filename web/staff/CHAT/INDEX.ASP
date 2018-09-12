<%
Employee_Name=Session("ManageName")
%>
<!--#include file="../conn2.asp"-->
<!-- #include file="../const.asp" --> 
<%
if fla93="0" and session("redboy_id")<>"1" then
%>
<br><center><img src="../images/note.gif" align="absmiddle">&nbsp;<font color="#FF0000">你不具备此权限，请与管理员联系！</font></center>
<%  
  response.end
set conn=nothing
end if
%>
<html>
<head>
<title>oa</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<style TYPE="text/css">
BODY{FONT-SIZE: 9pt}
TD{FONT-SIZE: 9pt}
.tbljm{BORDER-BOTTOM: #000000 1px solid; BORDER-LEFT: #000000 1px solid; BORDER-RIGHT: #000000 1px solid; BORDER-TOP: #000000 1px solid;color:#000000;}
</style>
<script language="Javascript">
function openWin() 
{winst="Status=yes,scrollbars=yes,resizable=yes,width="+(screen.availWidth-10)+",height="+(screen.availHeight-50)+",top=0,left=0";
 window.open('about:blank','7923sdfsdfs',winst);
} 
function form_onsubmit(obj)
{ var no=0,psd="1234567890";
  if(obj.username.value==""){alert("请输入你的昵称!\n");  obj.username.focus(); return false;}
  if(obj.username.value.indexOf(" ")>-1 ||obj.username.value.indexOf("'")>-1 || obj.username.value.indexOf("\"")>-1){alert("你的昵称含有非法字符!\n");  obj.username.focus(); return false;}
  openWin();
  return true;
}
</script>
<link href="../style/style.css" rel="stylesheet" type="text/css">
<style>
body {
	background-color:#FFFFFF;
}
</style>
</head>

<body bgcolor="#ffffff" text="#000000" valign="center" onload="javascript:document.form1.ok.blur()"  background="../gbook/im/bg1.gif" topmargin="0" leftmargin="0">
<center>
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#C4D8ED">
<tr>
<td><img src="../images/r_1.gif" alt="" /></td>
<td width="100%" background="../images/r_0.gif">
  <table cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td>&nbsp;在线会议</td>
	  <td align="right">&nbsp;</td>
    
    </tr>
  </table>
  </table>
	
	<TABLE border=0 width="67%">
  <TBODY> 
  <TR>
      <TD valign=center align="middle" style="FONT-SIZE: 10.5pt" height="30"> </TD>
    </TR></TBODY></TABLE></center>
<table border="0"  style="border: 1px solid #003366" cellspacing="0" cellpadding="0" align="center" background="images/main_bg.gif" height="355">
  <tr>
    <td width="538" height="25" bgcolor="#FFFFFF"> 
 
    </td>
  </tr>
  <tr>
    <td height="330" width="538"> 
      <form name="form1" method="post" action="check.asp" onSubmit="return form_onsubmit(this)" target="7923sdfsdfs">
              
        <table width="531" border="0" cellspacing="0" cellpadding="0" background="images/greystrip.gif">
          <tr> 
            <td height="35" width="224"> 
              <div align="center"> 
                   
            </div>
          </td>
            <td height="35" width="161"> 
              <p align="right">与会者姓名：&nbsp;
          </td>
            <td height="35" width="145"> 
 <select size="1" name="username"> 
                      <option value="<%=Employee_Name%>" selected><%=Employee_Name%></option>
                      &nbsp; </select>  
                   
          </td>
        </tr>
        <tr> 
            <td height="40" width="224"> 
              <div align="center">
                &nbsp;<BR><br>  
                <br></div>
          </td>
            <td height="40" width="161"> 
              　
          </td>
            <td height="40" width="145"> 
                <input type="submit" name="ok" value="登 陆" class=tbljm>&nbsp; 
          </td>
        </tr>
      </table>
    </form></td>
  </tr>
</table>
</body>
</html>
