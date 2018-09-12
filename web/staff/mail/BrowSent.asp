<!--#include file="Conn.asp"-->
<HTML>
<HEAD>
<TITLE>电机厂Market--阅读邮件</TITLE>
<META http-equiv="Content-Type" content="text/html; charset=gb2312">
<LINK href="css/main.css" type="text/css" rel="stylesheet"><LINK href="style.css" type=text/css rel=stylesheet>

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
	<table width="100%" align=center border="0" cellspacing="0" cellpadding="0" class="tableBorder">
	  <tr> 
		<td>
		<table border="0" cellpadding="0" cellspacing="0" width="100%">
		  <tr bgcolor=ffffff> 
			<th height=25 ><strong>读邮件</strong></th>
		  </tr>
		</table>
		</td>
	  </tr>
	</table>
<!---->
<%
MailId=Request("MailId")
Set Rs = conn.execute("SELECT * FROM Tbl_Mailbox WHERE MailId="&MailId)
%>
<table border="0" width="100%">
  <tr>
	<td width="13"></td>
	<td>
	<table cellspacing=0 cellpadding=0 border=0 width=580>
	  <tr>
		<td nowrap width=70 height="23">发件人：</td>
		<td width=500><%=Rs("DeptName")%> <%=Rs("EmpName")%></td>
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