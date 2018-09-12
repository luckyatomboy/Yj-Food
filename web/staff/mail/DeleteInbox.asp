<!--#include file="Conn.asp"-->
<%
MailId=Request("MailId")

Set Rs=conn.execute("SELECT DeleteEmpIds,DeleteEmpNames FROM Tbl_Mailbox WHERE MailId="&MailId)
DeleteEmpIds=Rs("DeleteEmpIds")
DeleteEmpNames=Rs("DeleteEmpNames")
If DeleteEmpIds<>"" Then
	DeleteEmpIds=DeleteEmpIds & "," & session("EmpId")
	DeleteEmpNames=DeleteEmpNames & "," & session("EmpName")
Else
	DeleteEmpIds=session("EmpId")
	DeleteEmpNames=session("EmpName")
End If
conn.execute "UPDATE Tbl_Mailbox SET DeleteEmpIds='"&DeleteEmpIds&"',DeleteEmpNames='"&DeleteEmpNames&"' WHERE MailId="&MailId
set rs=nothing
set conn=nothing
%>

<form name="frmback" method="post" action="Inbox.asp">
<input type="hidden" name="mepage" value="<%=Request("mepage")%>">
</form>
<script language="javascript">
	document.frmback.submit();
</script>