
<!--#include file="Conn.asp"-->
<%
MailId=Request("MailId")

conn.execute "DELETE FROM Tbl_Mailbox WHERE MailId="&MailId

set conn=nothing
%>

<form name="frmback" method="post" action="AdminMail.asp">
<input type="hidden" name="mepage" value="<%=Request("mepage")%>">
</form>
<script language="javascript">
	document.frmback.submit();
</script>