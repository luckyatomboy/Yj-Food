<!--#include file="Conn.asp"-->
<HTML>
<HEAD>
<TITLE>电机厂Market--阅读邮件</TITLE>
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
      <td>&nbsp;查看邮件</td>
	  <td align="right">&nbsp;</td>
    
    </tr>
  </table>
  </table>
<!---->
<%
MailId=Request("MailId")
Set Rs = conn.execute("SELECT ReadEmpIds,ReadEmpNames,DeptName,EmpId,EmpName,Subject,Body,MailDate FROM Tbl_Mailbox WHERE MailId="&MailId)
If InStr(Rs("ReadEmpNames"),Session("EmpName"))<1 Then
	If Rs("ReadEmpIds")="," Then
		ReadEmpIds="," & Session("EmpId")
		ReadEmpNames="," & Session("EmpName")
	Else
		ReadEmpIds=Rs("ReadEmpIds") & "," & Session("EmpId")
		ReadEmpNames=Rs("ReadEmpNames") & "," & Session("EmpName")
	End If
	conn.execute "UPDATE Tbl_Mailbox SET ReadEmpIds='"&ReadEmpIds&"',ReadEmpNames='"&ReadEmpNames&"' WHERE MailId="&MailId
End If
%>
<table border="0" width="100%">
  <tr>
	<td width="13"></td>
	<td>
	<table cellspacing=0 cellpadding=0 border=0 width=580>
	  <tr>
		<td nowrap width=70 height="23">发件人：</td>
		<td width=500><%=Rs("DeptName")%> <%=Rs("EmpName")%>　　<a href="NewBack.asp?Emp=<%=Rs("EmpId")%>|<%=Rs("EmpName")%>&MailId=<%=MailId%>"><img border="0" src="Images/mail.back.gif"></a></td>
		<td width=10></td>
	  </tr>
	  <tr>
		<td nowrap width=70 height="23">发送：</td>
		<td><%=Rs("MailDate")%></td>
		<td width=10></td>
	  </tr>
	  <tr>
		<td nowrap height="23"><label for="subject">主题</label>：</td>
		<td><%=Rs("Subject")%></td>
		<td>&nbsp;</td>
	  </tr>
	  <tr>
		<td colspan="3">&nbsp;</td>
	  </tr>
	</table>
	<table cellpadding=0 cellspacing=0 border=0 width=580>
	  <tr>
		<td valign="top" height="200">
		<%=htmlshow(Rs("Body"))%>
		</td>
	  </tr>
	  <tr>
		<td></td>
	  </tr>
	</table>
	</td>
  </tr>
</table>
<!---->
</BODY>
</HTML>
<%
set rs=nothing
set conn=nothing
%>
<!--#include file="Public/IsHtml.asp"-->