<!--#include file="Conn.asp"-->
<%
MailId=Request("MailId")
conn.execute "UPDATE Tbl_Mailbox SET DeleteFlag='1' WHERE MailId="&MailId
set conn=nothing
%>

<form name="frmback" method="post" action="Sent.asp">
<input type="hidden" name="mepage" value="<%=Request("mepage")%>">
</form>
<script language="javascript">
	document.frmback.submit();
</script>