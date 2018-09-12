<!--#include file="Conn.asp"-->
<%
ShareEmpIds = Request.Form("toId")
ShareEmpNames = Request.Form("to")
subject = Request.Form("subject")
body = Request.Form("body")
Doc = Request.Form("Doc")

DeptId = session("DeptId")
DeptName = session("DeptName")
EmpId = session("EmpId")
EmpName = session("EmpName")

action = Request.Form("action")
if action="sent" then
	ShareFlag="1"
	conn.execute "INSERT INTO Tbl_Mailbox(DeptName,EmpId,EmpName,ShareFlag,ShareEmpIds,ShareEmpNames,Subject,Body,Doc) VALUES('"&DeptName&"',"&EmpId&",'"&EmpName&"','"&ShareFlag&"','"&ShareEmpIds&"','"&ShareEmpNames&"','"&Subject&"','"&Body&"','"&Doc&"')"
	''response.write "INSERT INTO Tbl_Mailbox(DeptName,EmpId,EmpName,ShareFlag,ShareEmpIds,ShareEmpNames,Subject,Body,Doc) VALUES('"&DeptName&"',"&EmpId&",'"&EmpName&"','"&ShareFlag&"','"&ShareEmpIds&"','"&ShareEmpNames&"','"&Subject&"','"&Body&"','"&Doc&"')"
	maintitle="发送成功"
elseif action="save" then
	ShareFlag="0"
	conn.execute "INSERT INTO Tbl_Mailbox(DeptName,EmpId,EmpName,ShareFlag,ShareEmpIds,ShareEmpNames,Subject,Body,Doc) VALUES('"&DeptName&"',"&EmpId&",'"&EmpName&"','"&ShareFlag&"','"&ShareEmpIds&"','"&ShareEmpNames&"','"&Subject&"','"&Body&"','"&Doc&"')"
	maintitle="保存成功"
elseif action="edit_save" then
	mailId = Request.Form("mailId")
	conn.execute "UPDATE Tbl_Mailbox SET DeptName='"&DeptName&"',EmpId="&EmpId&",EmpName='"&EmpName&"',Subject='"&Subject&"',Body='"&Body&"',Doc='"&Doc&"' WHERE mailId="&mailId
	maintitle="编辑成功"
elseif action="edit_sent" then
	mailId = Request.Form("mailId")
	conn.execute "UPDATE Tbl_Mailbox SET DeptName='"&DeptName&"',EmpId="&EmpId&",EmpName='"&EmpName&"',ShareFlag='1',Subject='"&Subject&"',Body='"&Body&"',Doc='"&Doc&"' WHERE mailId="&mailId
	maintitle="发送成功"
else
	response.end
end if
%>
<HTML>
<HEAD>
<TITLE>电机厂Market--信息提示</TITLE>
<META http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="../style/style.css" rel="stylesheet" type="text/css">
<style>
body {
	background-color:#FFFFFF;
}
</style>

</HEAD>



<script language="javascript">
function showImg()
{ 
	if(document.all.BodyBG){	
	BodyBG.style.top=document.body.offsetHeight-245;
	BodyBG.style.left=document.body.offsetWidth-279;
	BodyBG.style.visibility="visible";
	} 
}	
</script>
<!--menu-->
<!--menu-->
<table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#C4D8ED">
<tr>
<td><img src="../images/r_1.gif" alt="" /></td>
<td width="100%" background="../images/r_0.gif">
  <table cellpadding="0" cellspacing="0" width="100%">
    <tr>
      <td>&nbsp;提示</td>
	  <td align="right">&nbsp;</td>
    
    </tr>
  </table>
  </table>


<DIV id="BodyBG" style="Z-INDEX: -1; LEFT: 0px; VISIBILITY: hidden; WIDTH: 279px; POSITION: absolute; TOP: 120px; HEIGHT: 245px" name="LeftBG"><IMG height="245" src="Images/info.gif" width="279"></DIV>
<DIV id="divMain" style="OVERFLOW: auto; WIDTH: 100%" align="center" name="divMain">
<table cellSpacing="0" cellPadding="0" width="97%" border="0">
  <tbody>
  <tr>
	<td  colSpan="2" height="20"></td>
  </tr>
  <tr>
	<td><IMG height="24" src="images/icon_w.gif" width="24" align="absMiddle">&nbsp;<b><font class="text_px14" color="#ff6600"><span id="InfoTitle"><%=maintitle%></span></font></b></td>
	<td align="right"></td>
  </tr>
  <tr>
	<td colSpan="2" height="10"></td>
  </tr>
  <tr align="middle">
	<td colSpan="2" height="50">
	<table cellSpacing="0" cellPadding="0" width="100%" border="0">
	<tbody>
	  <tr>
		<td vAlign="top" align="right" width="245" rowSpan="3"><IMG src="images/ok.gif"></td>
		<td vAlign="top" align="left" width="18" rowSpan="3"><IMG src="images/sys_error_dotline.gif" width="12"></td>
		<td width="30" rowSpan="3"></td>
		<td vAlign="top" height="13"></td>
	  </tr>
	  <tr>
		<td vAlign="top" height="25">
		<table border="0" cellpadding="1" cellspacing="1" width="100%">
		  <tr>
			<td width="20" height="30"><img src="Images/star.gif"></td>
			<td><a href="New.asp">新邮件</a></td>
		  </tr>
		  <tr>
			<td height="30"><img src="Images/star.gif"></td>
			<td><a href="Sent.asp">发件箱</a></td>
		  </tr>
		  <tr>
			<td height="30"><img src="Images/star.gif"></td>
			<td><a href="Inbox.asp">收件箱</a></td>
		  </tr>
		</table>
		</td>
	  </tr>	  									
	  </tbody>
	</table>
	</td>
  </tr>
  </tbody>
</table>
<br>
</DIV>
</BODY>
</HTML>