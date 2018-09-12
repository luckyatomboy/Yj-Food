<%@language="VBscript"%>
<%Response.Expires=0%>
<!--#include file="../include/checkadmin.asp"-->
<!--#include file="../include/conn.asp"-->
<%
id=request.form("id")
if id="" or isnull(id) then id=0
conn.execute "delete from tbl_news where id in ("&id&")"
%>
<form name="frmback" method="post" action="list_news.asp">
<input type="hidden" name="intPage" value="<%=request.form("intPage")%>">
<input type="hidden" name="keyword" value="<%=request.form("keyword")%>">
<input type="hidden" name="days" value="<%=request.form("days")%>">
<input type="hidden" name="columnid" value="<%=request.form("columnid")%>">
</form>
<script language="javascript">
	document.frmback.submit();
</script>