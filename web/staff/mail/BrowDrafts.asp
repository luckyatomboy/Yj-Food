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
<table cellSpacing="0" cellPadding="0" width="100%" border="0">
  <tr>
	<td vAlign="bottom" bgColor="#f1f1f1" height="60">
	<table cellSpacing="0" cellPadding="0" width="100%" border="0">
	  <tr>
		<td align="middle">
		<table cellSpacing="0" cellPadding="0" width="98%" border="0">
		  <tr>
			<td width="36%" rowSpan="2"></td>
			<td height="27">&nbsp;</td>
		  </tr>
		  <tr>
			<td>&nbsp;</td>
		  </tr>
		</table>
		</td>
	  </tr>
	  <tr>
		<td>
		<table cellSpacing="0" cellPadding="0" width="162" background="images/tab04.gif" border="0">
		  <tr>
			<td vAlign="bottom" width="27"><IMG height="20" src="images/tab01.gif" width="27"></td>
			<td vAlign="bottom" align="middle"><font color="#ff6600"><b>阅读邮件</b></font></td>
			<td vAlign="bottom" width="27"><IMG height="20" src="images/tab03.gif" width="27"></td>
		  </tr>
		</table>
		</td>
	  </tr>
	</table>
	</td>
	<td width="1" bgColor="#ffffff" height="61" rowSpan="2"></td>
  </tr>
  <tr>
	<td bgColor="#cccccc" height="1"></td>
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
	  <tr>
		<td>
		
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